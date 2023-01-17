package com.huawei.hw_shopping.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
@TableName("HW_SHOPPING_CART")
@KeySequence(value = "HW_SHOPPING_CART_SEQ", clazz = String.class)
public class ShopCart {
    @TableId(value = "shop_cart_Id", type = IdType.INPUT)
    //购物车ID
    private String shopCartId;
    //用户
    private String userId;
    //商品ID
    private String pid;
    //商品数量
    private Integer shopCount;
    //是否删除 0未删除 1删除
    private Integer isDeleted;
    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    //修改时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private Product product;

}
