package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.huawei.hw_shopping.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * MyBatis  SQL Mapper
 */
@Mapper
@Component
public interface UserMapper extends BaseMapper<User> {

     /**
      * @return 后台搜索普通用户
      */
     List<User> serchUser(User user);

     /**
      * @return 后台搜索管理员
      */
     List<User> serchAdmin(User user);

     /**
      * @return
      *
      * 后台查看普通用户  带分页
      */
     List<User> selectUserPage(int pageNum, int pageSize);

     /**
      * @return
      *
      * 后台查看管理员用户  带分页
      */

     List<User> selectAdminerPage(int pageNum, int pageSize);

     /**
      * @param user 注册方法
      * @return
      */
     //Boolean register(User user);
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

     /**  统计用户图表
      * @return
      */
     List<User> userAccount();

    /**  统计管理员图表
     * @return
     */
     List<User> AdminUSerAccount();

    boolean updatePwd(@Param("mobile") String mobile,@Param("password")String MD5Psssword);
}
