package com.huawei.hw_shopping.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.Page;
import com.huawei.hw_shopping.mapper.UserMapper;
import com.huawei.hw_shopping.model.User;
import com.huawei.hw_shopping.service.IUserService;
import org.apache.ibatis.annotations.Param;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@SpringBootTest
public class UserServiceImplTest {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    IUserService userService;
    @Test
    public void testSelectList() {
        List<User> users = userMapper.selectList(null);
        for (User user : users) {
            System.out.println(users);
        }

    }
    @Test
    public void TestUpdateById(){
        User user = new User();
        user.setUserId("8276");
        user.setUserName("lyh");
        user.setIsSys(0);
        int i = userMapper.updateById(user);
        System.out.println(i);
    }

    @Test
    public void TestSelectById(){
        User user = userMapper.selectById("8183");
        System.out.println(user);
    }

    @Test
    public void TestdeleteById(){
        //int i = userMapper.deleteById(8207);
        //System.out.println(i);
       User user = new User();
      //user.setUserId("8183");
//        user.setName("ddd");
//        QueryWrapper<User> userQueryWrapper = new QueryWrapper<>();
//        User user1 = userMapper.selectOne(userQueryWrapper);
//        userQueryWrapper.eq(user.getUserId(),8183);
//        userQueryWrapper.eq(user.getName(),"ddd");
        //String userId = user.getUserId();
        User user1 = userMapper.selectOne(new QueryWrapper<User>().
                eq("user_Id", 8183).
                eq("user_name","dd"));
        System.out.println(user1);

    }


    @Test
    public void testSelectForPage() {
        List<User> users = userService.selectUserPage(2, 2);
        for (User user : users) {
            System.out.println(user);
        }
    }

    @Test
    public void testFindByEmail() {
        User byEmail = userMapper.findByEmail("1445695649@qq.com");
        System.out.println(byEmail);
    }

   /* @Test
    public void testSerch() {
        User user = new User();
        user.setUserId("18");
        user.setUserName("dddd");
        user.setEmail("ddd@qq.com");
        user.setGender("女");
        List<User> users = userMapper.serchUser(user);
        System.out.println(users);
    }*/

    @Test
    public void testSelectOne() {

        QueryWrapper<User> queryWrapper=new QueryWrapper();

        queryWrapper.eq("user_id",18);
        User user1 = userMapper.selectOne(queryWrapper);
        System.out.println(user1);
    }
    @Test
    public void testSelectCount(Integer is_sys) {
        QueryWrapper<User> queryWrapper=new QueryWrapper();
        queryWrapper.eq("is_sys",0);
        queryWrapper.like(is_sys!=null,"is_sys",0);
        Integer i = userMapper.selectCount(queryWrapper);
        System.out.println(i);
    }

    @Test
    public void testDeleteBatchIds() {
        Collection<Serializable> list = new ArrayList<>();
        list.add(7);
        list.add(8);
        System.out.println(list);
        int i = userMapper.deleteBatchIds(list);
        System.out.println(i);
    }

}

