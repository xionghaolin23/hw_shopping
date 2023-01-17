package com.huawei.hw_shopping.controller.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.huawei.hw_shopping.common.EncryptionUtil;
import com.huawei.hw_shopping.controller.common.BaseController;
import com.huawei.hw_shopping.model.User;
import com.huawei.hw_shopping.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.*;

/**
 * 后台用户控制器 后台用户增删改查
 */
@Controller
@RequestMapping("/adminUser")
public class AdminUserController extends BaseController {

    @Autowired
    IUserService userService;


    /**
     * @return 后台查看普通用户
     */
    @ResponseBody
    @RequestMapping("/selectUser")
    public String selectUser(Integer pageNum, Integer pageSize) {
        QueryWrapper<User> queryWrapper = new QueryWrapper();
        //查出字段is_sys=0的有几条记录
        queryWrapper.eq("is_sys", 0);
        Integer count = userService.count(queryWrapper);
        List<User> users = userService.selectUserPage(pageNum, pageSize);
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", count);
        obj.put("data", users);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");

    }

    /**
     * @return 后台查看管理员
     */
    @ResponseBody
    @RequestMapping("/selectAdminer")
    public String selectAdmin(Integer pageNum, Integer pageSize) {
        QueryWrapper<User> queryWrapper = new QueryWrapper();
        //查出字段is_sys=1的有几条记录
        queryWrapper.eq("is_sys", 1);
        Integer count = userService.count(queryWrapper);
        List<User> users = userService.selectAdminerPage(pageNum, pageSize);
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", count);
        obj.put("data", users);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }

    /**
     * @return 更新用户 管理员 前  点击按钮 查看信息  根据主键id查询
     */
    @RequestMapping("/selectById/id={id}")
    public String selectById(Model model, @PathVariable("id") Serializable id) {

        User user = userService.getById(id);
        model.addAttribute("user", user);
        //或者用户数据后  跳转到新的页面显示
        return "admin/views/user/user/updateUsers";
    }



    /**
     * @return 后台根据id修改用户信息、管理员
     * 修改逻辑 点击一个修改按钮  弹窗显示要修改的信息 点击修改弹出啊成功窗口
     */
    @ResponseBody
    @RequestMapping("/updateById")
    public Map<String, Object> updateById(HttpServletRequest request, User user) {
        Map<String, Object> map = new HashMap<>();
        //根据id查询出用户以前的密码
        User users = userService.getById(user.getUserId());
        String oldPassword = users.getPassword();
        //接收修改过来的密码
        String newPassword = request.getParameter("password");
        //对比  旧密码和新密码不相等的情况下 说明密码已经被改动
        if (!oldPassword.equals(newPassword)) {
            // 修改密码
            user.setPassword(EncryptionUtil.md5(newPassword, EncryptionUtil.SALT));
        }
        boolean result = userService.updateById(user);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }


    /**
     * @param
     * @return 批量删除普通用户、管理员
     */
    @ResponseBody
    @RequestMapping("/deleteByIdAll")
    //@RequestParam 此注解作用 传递参数名字不一样的时候用 前台 <a href=user/login?name='xhl'>
    //控制器中可以用@RequestParam(value = "name")String username) 意思是把超链接中name的值赋给username
    public Map<String, Object> deleteByIdAll(@RequestParam(value = "array[]") Collection<Serializable> listId) {
        Map<String, Object> map = new HashMap<>();
        //从前台List.html传过来的数组 遍历取出  删除 循环里面连接执行删除 速率慢
//        for (int i=0;i<listId.length;i++){
//             result = userService.removeById(listId[i]);
//        }
        //批量删除 mybatis-plus批量删除方法 传进来是一个集合 不是数组
        boolean result = userService.removeByIds(listId);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /**
     * @param id 后台根据id删除 普通用户、管理员
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteById/id={id}")
    public Map<String, Object> deleteById(@PathVariable("id") Serializable id) {
        Map<String, Object> map = new HashMap<>();
        System.out.println(id);
        boolean result = userService.removeById(id);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }


    /**
     * 统计用户
     * @return
     */
    @ResponseBody
    @RequestMapping("/userAccount")
    public List<User> userAccount() {
        List<User> users = userService.userAccount();
        HashMap<String, Object> map = new HashMap<>();
        if(users!=null){
            return users;
        }
       return null;
    }

    /**
     * 统计管理员
     * @return
     */
    @ResponseBody
    @RequestMapping("/AdminUSerAccount")
    public List<User> AdminUSerAccount() {
        List<User> users = userService.AdminUSerAccount();
        HashMap<String, Object> map = new HashMap<>();
        if(users!=null){
            return users;
        }
        return null;
    }
    /**
     * 后台搜索普通用户 管理员功能
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/serchUser/userId={userId}/userName={userName}/mobile={mobile}/gender={gender}")
    public String serchUser(@PathVariable("userId") String userId,
                            @PathVariable("userName") String userName,
                            @PathVariable("mobile") Long mobile,
                            @PathVariable("gender") String gender,User user) {
        user.setUserId(userId);
        user.setUserName(userName);
        user.setMobile(mobile);
        user.setGender(gender);
        List<User> users = userService.serchUser(user);
        JSONObject obj = new JSONObject();
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", 1000);
        obj.put("data", users);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");

    }

    /**
     * 后台搜索普通用户 管理员功能
     *
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping("/serchAdmin/userId={userId}/userName={userName}/mobile={mobile}/gender={gender}")
    public String serchAdmin(@PathVariable("userId") String userId,
                             @PathVariable("userName") String userName,
                             @PathVariable("mobile") Long mobile,
                             @PathVariable("gender") String gender,User user) {
        user.setUserId(userId);
        user.setUserName(userName);
        user.setMobile(mobile);
        user.setGender(gender);
        List<User> users = userService.serchAdmin(user);
        JSONObject obj = new JSONObject();
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", 1000);
        obj.put("data", users);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");

    }

    /**  后台修改人信息
     * @param user             未写完
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping("/basicInformation")
    public Map<String, Object> basicInformation(User user,
                                                HttpServletRequest request,
                                                MultipartFile pim
                                               ){
        Map<String, Object> map = new HashMap<>();
        System.out.println(user);
        String imgUrl = uploadFile("/upload/header/", pim);
        user.setHead(imgUrl);
        boolean save = userService.save(user);
        //根据id查询出用户以前的密码
        User users = userService.getById(user.getUserId());
        String oldPassword = users.getPassword();
        //接收修改过来的密码
        String newPassword = request.getParameter("password");
        //对比  旧密码和新密码不相等的情况下 说明密码已经被改动
        if (!oldPassword.equals(newPassword)) {
            // 修改密码
            user.setPassword(EncryptionUtil.md5(newPassword, EncryptionUtil.SALT));
        }
        boolean result = userService.updateById(user);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

}
