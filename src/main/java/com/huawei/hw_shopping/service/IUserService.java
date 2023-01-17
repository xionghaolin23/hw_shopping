package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.Page;
import com.huawei.hw_shopping.model.User;

import java.util.List;

public interface IUserService extends IService<User> {
    /**
     * @return
     *
     * 后台查看普通用户  带分页
     */

    List<User> selectUserPage(int pageNum, int pageSize);

    /**
     * @return
     * 后台查看管理员用户  带分页
     */
    List<User> selectAdminerPage(int pageNum, int pageSize);

    /**
     * @param user 注册方法
     * @return
     */
   // Boolean register(User user);

    /**
     * @param user 登录方法
     * @return
     */
    User login(User user);

    /**后台查询总访问量
     * @return
     */
    Integer loginNum();
    /**
     * @param email 忘记密码中判断邮件是否存在
     * @return
     */
    User findByEmail(String email);

    /**
     * @return 后台搜索普通用户
     */
    List<User> serchUser(User user);
    /**
     * @return 后台搜索管理员
     */
    List<User> serchAdmin(User user);


    List<User> userAccount();

    List<User> AdminUSerAccount();

    /**
     * @return 前台根据手机修改密码
     */
    boolean updatePwd(String mobile,String MD5Psssword);
}
