package com.huawei.hw_shopping.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 收获地址实体
 */
@Data
@TableName("HW_SHOPPING_ADDRESS")
@KeySequence(value = "HW_SHOPPING_ADDRESS_SEQ", clazz = String.class)

public class Address {
    @TableId(value = "ADDRESS_ID", type = IdType.INPUT)
    //id
    private String addressId;
    //userId 外键
    private String userId;
    //手机
    private String phone;
    //收货人
    private String userName;
    //地址
    private String address;
    //是否为默认地址 1是
    private Integer moren;
    //标记
    private String tag;
    //备注
    private String note;
}
