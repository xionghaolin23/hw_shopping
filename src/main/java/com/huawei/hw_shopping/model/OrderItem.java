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
 * 订单item实体
 */
@Data
@TableName("HW_SHOPPING_ORDER_ITEM")
@KeySequence(value = "HW_SHOPPING_ORDER_ITEM_SEQ", clazz = String.class)
public class OrderItem implements Serializable {
    //编号
    @TableId(value = "ORDER_ITEM_ID", type = IdType.INPUT)
    private String orderItemId;
    //订单id  外键
    private String orderId;
    //商品id
    private String pid;
    //商品名
    private String productName;
    //商品价格 单价
    private Double productPrice;
    //主图
    private String productCoverImg;
    //商品数量
    private Integer shopCount;
    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createUpdate;



}
