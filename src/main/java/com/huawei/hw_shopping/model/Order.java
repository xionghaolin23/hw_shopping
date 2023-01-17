package com.huawei.hw_shopping.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 订单实体
 */
@Data
@TableName("HW_SHOPPING_ORDER")
@KeySequence(value = "HW_SHOPPING_ORDER_SEQ", clazz = String.class)
public class Order implements Serializable {
    //订单ID
    @TableId(value = "ORDER_ID", type = IdType.INPUT)
    private String orderId;
    //订单编号
    private String orderNo;
    //用户id
    private String userId;
    //订单总价
    private Double totalPrice;
    //订单内容
    private String orderContent;
    //收货人
    private String userName;
    //收货人联系电话
    private String userPhone;
    //收货人地址
    private String userAddress;
    //物流
    private String logistics;
    //支付状态:0.未支付,1.支付成功,-1:支付失败
    private Integer payStatus;
    //支付类型：0.无 1.支付宝支付 2.微信支付
    private Integer payType;
    //支付时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date payTime;
    //订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功
    // 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭
    private Integer orderStatus;
    //删除标识字段(0-未删除 1-已删除)
    private Integer isDeleted;
    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    //更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    private List<OrderItem> orderItem;


}
