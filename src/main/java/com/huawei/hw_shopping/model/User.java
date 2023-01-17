package com.huawei.hw_shopping.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 用户实体
 */
@Data
@TableName("HW_SHOPPING_USER")
@KeySequence(value = "HW_SHOPPING_USER_SEQ", clazz = String.class)
public class User implements Serializable {
    //个人编号
    @TableId(value = "USER_ID", type = IdType.INPUT)
    private String userId;
    //用户名
    private String userName;
    //密码
    private String password;
    //真实姓名
    private String name;
    //邮箱
    private String email;
    //性别
    private String gender;
    //生日
    @JsonFormat(pattern = "yyyy-MM-dd")
    private java.sql.Date birthday;
    //是否是管理员
    private Integer isSys;
    //手机
    private Long mobile;
    //头像
    private String  head;
    //注册时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date registerTime;
    //访问量
    private Integer loginCount;
    //登录ip
    private String loginIp;
    //最后一次登录时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date loginLastTime;


}
