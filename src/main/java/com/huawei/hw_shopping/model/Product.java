package com.huawei.hw_shopping.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.huawei.hw_shopping.model.vo.ProductVO;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * 商品实体
 */
@Data
@TableName("HW_SHOPPING_PRODUCT")
@KeySequence(value = "HW_SHOPPING_PRODUCT_SEQ", clazz = String.class)
public class Product implements Serializable {

    //商品id
    @TableId(value = "PID", type = IdType.INPUT)
    private String pid;
    //商品名称
    private String pname;
    //商品市场价
    private Double marketPrice;
    //商品商城价
    private Double shopPrice;
    //商品图片路径
    private String pimage;
    //上架时间(商品添加事件)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date pdate;
    //更新时间(商品添加事件)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    //商品是否热门	0:是 ；1：否
    private String isHot;
    //商品排序
    private Integer pSort;
    //商品详细描述
    private String pdesc;
    //商品状态	0：下架 ； 1： 上架
    private String pflag;
    //商品类型    id
    private Integer cid;
    //商品介绍
    private String pdetails;
    //商品库存
    private Integer pstock;
    //消息
    private String pMsg;
    //版本
    private String pVersion;
    //颜色
    private String pColor;
    //标语
    private String pSolgan;
    //所在位置
    private String pBelong;
    //删除标记 0为未删除，1为已删除 默认0
    private Integer deleteFlag;
    //一个购物车可以有好多商品 一对多
    //List<Product> productList;

}
