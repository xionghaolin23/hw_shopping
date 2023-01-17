package com.huawei.hw_shopping.controller.user;

import com.alibaba.fastjson.JSONObject;
import com.huawei.hw_shopping.common.EncryptionUtil;
import com.huawei.hw_shopping.common.Common;
import com.huawei.hw_shopping.model.User;
import com.huawei.hw_shopping.service.IUserService;
import com.zhenzi.sms.ZhenziSmsClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;


/**
 * 前台   用户控制器
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    IUserService userService;
    @Resource
    JavaMailSender mailSender;
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    /**
     * 登录方法
     *
     * @return 成功返回首页 失败返回登陆页面
     * static    静态  需要加html
     * templates 动态  不要加html
     */
    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request,
                        HttpSession session, Map<String, Object> map) {
        //登录页面输入密码  经过md5算法加密才和数据库比较
        String password = request.getParameter("password");
        user.setPassword(EncryptionUtil.md5(password, EncryptionUtil.SALT));
        User loginUser = userService.login(user);
        if (loginUser != null) {
            //登陆前先从数据库取出状态码 判断是0还是1
            Integer sys = loginUser.getIsSys();
            //获取登录次数 第一次注册后默认为0
            Integer loginCount = loginUser.getLoginCount();
            loginCount = loginCount + 1;
            loginUser.setLoginCount(loginCount);
            InetAddress address = null;
            String loginIp = null;
            Integer loginNum=null;
            try {
                address = InetAddress.getLocalHost();
                //获得本机IP
                loginIp = address.getHostAddress();
                loginUser.setLoginIp(loginIp);
                //设置最后一次登录时间
                String time = Common.time();
                loginUser.setLoginLastTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
                //更新
                boolean b = userService.updateById(loginUser);
                //查询后台用户登录得总访问量
                 loginNum = userService.loginNum();
            } catch (UnknownHostException e) {
                logger.info("登录ip写入错误{}", loginIp);
                e.printStackTrace();
            } catch (ParseException e) {
                logger.info("时间格式化错误");
                e.printStackTrace();
            }
            if (sys == 0) {
                //http://localhost:8081/shopping/index.html
                //前台首页
                session.setAttribute("loginUser", loginUser);
                return "redirect:/index.html";
            } else {
                //后台首页
                session.setAttribute("AdminUser", loginUser);
                session.setAttribute("loginNum", loginNum);
                // return "redirect:/views/admin/views/index.html";
                return "redirect:/adminLogin.html";
            }
        } else {
            //session.setAttribute("errorInfo", "用户名或密码错误");
            //return "redirect:/login.html";  数据传不出去
            map.put("errorInfo", "用户名或密码错误");
            //return "users/login";
            return "users/user/login";
        }

    }


    /**
     * 注册方法
     *
     * @param request
     * @param user
     * @return 获得密码后调用md5算法加密
     * csdn  没有用responsebody注解（也可以在controller上方用restcontroller注解），返回的是一个对象，不是json，导致无法解析，报的这个错误。
     * 加上ResponseBody 可以返回json
     */
    @ResponseBody
    @RequestMapping("/register")
    public Map<String, Object> register(HttpServletRequest request,
                                        User user) {
        //注册时间  1：简单方法  缺点：每次注册请求进来都会new一次date()；浪费内存
        //Date now = new Date();
        //user.setRegisterTime(now);
        //注册时间  2：使用localDate localTime  线程安全的时间处理类
        HashMap <String,Object> map= new HashMap();
        String time = Common.time();
        try {
            user.setRegisterTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
        } catch (ParseException e) {
            logger.info("时间格式化错误{}", time);
            e.printStackTrace();
        }
        //使用shiro 中的md5就行加密
        String password = request.getParameter("password");
        user.setPassword(EncryptionUtil.md5(password, EncryptionUtil.SALT));
        boolean result = userService.save(user);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /**
     * 退出登录
     */
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session){
        session.removeAttribute("loginUser");
        return "redirect:/index.html";
    }

    /**
     * 退出登录
     */
    @RequestMapping("/AdminloginOut")
    public String AdminloginOut(HttpSession session){
        session.removeAttribute("AdminUser");
        return "redirect:/index.html";
    }

    /**
     * 发送邮件
     *
     * @param session
     * @param email   前台传进来的eamil
     * @return
     */
    @ResponseBody
    @RequestMapping("/sendEmail")
    public Map<String, Object> sendEmail(String email, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        if (StringUtils.isEmpty(email)) {
            map.put("success", false);
            map.put("errorInfo", "邮箱不能为空");
            return map;
        }
        //验证邮件是否存在
        User userEmail = userService.findByEmail(email);
        if (StringUtils.isEmpty(userEmail)) {
            map.put("success", false);
            map.put("errorInfo", "账户中不存在此邮箱");
            return map;
        }
        //获得六位验证码
        String mailCOde = Common.getSixRandom();
        //发送邮件
        SimpleMailMessage message = new SimpleMailMessage();
        //发件人
        message.setFrom("xionghl23@foxmail.com");
        //收件人
        message.setTo(email);
        //主题
        message.setSubject("XMALL商城-用户找回密码");
        //正文内容
        message.setText("您本次的验证码是：" + mailCOde);
        //发送
        mailSender.send(message);
        System.out.println(mailCOde);
        //把验证码存进session
        session.setAttribute("mailCode", mailCOde);
        //session.setMaxInactiveInterval(3);
        //把userId存进去  帮用户修改一个默认密码
        session.setAttribute("userId", userEmail.getUserId());
        map.put("success", true);
        return map;
    }

    /**
     * @param yzm     判断邮件验证码
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkYzm")
    public Map<String, Object> check(String yzm, HttpSession session) {
        /*Object s = session.getAttribute("s");
        if (s == null) {
            //第一次进来
            session.setAttribute("s", s);
        } else {

            session.removeAttribute("s");
        }*/
        Map<String, Object> map = new HashMap<>();
        if (StringUtils.isEmpty(yzm)) {
            map.put("success", false);
            map.put("errorInfo", "验证码不能为空");
            return map;
        }
        //从session取出验证码
        String mailCode = (String) session.getAttribute("mailCode");
        //取到userId  通过userId更新用户密码
        String userId = (String) session.getAttribute("userId");
        if (mailCode == null) {
            //说明session中得mailCode为空 表示还没点击过发送验证码 也就是说session中没缓存得验证码
            map.put("success", false);
            map.put("errorInfo", "你还没有获取过验证码，请先获取验证码...");
            return map;
        }
        if (!mailCode.equals(yzm)) {
            map.put("success", false);
            map.put("errorInfo", "验证码错误");
            return map;
        }
        /**
         *
         * 重置前先把用户信息查出来
         * 取出密码
         * 给用户重置密码为123456
         * 执行sql语句更新
         */
        User user = userService.getById(userId);
        user.setPassword(EncryptionUtil.md5("123456", EncryptionUtil.SALT));
        userService.updateById(user);
        map.put("success", true);
        return map;
    }

    //短信平台相关参数
    private String apiUrl = "http://sms_developer.zhenzikj.com";
    private String appId = "102365";
    private String appSecret = "bc0a7782-34c1-43fb-97ca-67361f7c9429";

    /**
     *发送短信
     * @param request
     */
    @RequestMapping("/sendSms/{mobile}")
    @ResponseBody
    public Map<String, Object> sendSms(@PathVariable String mobile,HttpServletRequest request) {
        try {
            JSONObject json = null;
            //生成6位验证码
            String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
            //发送短信
            ZhenziSmsClient client = new ZhenziSmsClient(apiUrl, appId, appSecret);

            Map<String, Object> params = new HashMap<String, Object>();
            Map<String, Object> map = new HashMap<String, Object>();
            params.put("number", mobile);
            params.put("templateId", 483);
            String[] templateParams = new String[2];
            templateParams[0] = verifyCode;
            templateParams[1] = "1分钟";
            params.put("templateParams", templateParams);
            String result = client.send(params);
            //String result = "{\"code\":0}";//client.send(mobile, "您的验证码为:" + verifyCode + "，该码有效期为5分钟，该码只能使用一次!");
            json = JSONObject.parseObject(result);
            if (json.getIntValue("code") != 0) {//发送短信失败
                map.put("fail",false);
                return map;
            }
            //将验证码存到session中,同时存入创建时间
            //以json存放，这里使用的是阿里的fastjson
            HttpSession session = request.getSession();
            json = new JSONObject();
            json.put("mobile", mobile);
            json.put("verifyCode", verifyCode);
            json.put("createTime", System.currentTimeMillis());
            // 将认证码存入SESSION
            request.getSession().setAttribute("verifyCode", json);
            map.put("success",true);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
        }
       return null;
    }

    /** 修改密码
     * @param request
     * @return
     */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public Map<String, Object> updatePwd(HttpServletRequest request) {
        Map<String, Object> map = new HashMap();
        String mobile = request.getParameter("mobile");
        String verifyCode = request.getParameter("verifyCode");
        String password = request.getParameter("password");
        //加密
        String MD5Psssword = EncryptionUtil.md5(password, EncryptionUtil.SALT);
        JSONObject json = (JSONObject) request.getSession().getAttribute("verifyCode");
        if (json == null) {
            map.put("fail",false);
            map.put("msg","验证码错误");
            return map;
        }
        if (!json.getString("mobile").equals(mobile)) {
            map.put("fail",false);
            map.put("msg","手机号错误");
            return map;
        }
        if (!json.getString("verifyCode").equals(verifyCode)) {
            map.put("fail",false);
            map.put("msg","验证码错误");
            return map;
        }
        if ((System.currentTimeMillis() - json.getLong("createTime")) > 1000 * 60 * 5) {
            map.put("fail",false);
            map.put("msg","验证码已过期");
            return map;
        }
        //调用dao方法修改密码
        boolean b = userService.updatePwd(mobile,MD5Psssword);
        if (b) {
            map.put("success",true);
            map.put("msg","修改成功");
            return map;
        } else {
            map.put("fail",false);
            map.put("msg","修改失败");
            return map;
        }

    }

}



