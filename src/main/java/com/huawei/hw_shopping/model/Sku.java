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
 * sku实体
 */
@Data
@TableName("HW_SHOPPING_SKU")
@KeySequence(value = "HW_SHOPPING_SKU_SEQ", clazz = String.class)
public class Sku implements Serializable {

    //sku id
    @TableId(value = "SKU_ID", type = IdType.INPUT)
    private String skuId;
    //sku名称
    private String spuId;
    //spu name
    private String spuName;
    //sku市场价
    private Double skuColor;
    //sku商城价
    private Double skuVersion;
    //sku 服务
    private Double skuService;
    //sku图片路径
    private String skuPrice;
    //上架时间(sku添加时间)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date skuDate;
    //更新时间(sku添加时间)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    //sku是否热门	0:是 ；1：否
    private String isHot;
    //sku排序
    private Integer skuSort;
    //sku详细描述
    private String skuDesc;
    //sku状态	0：下架 ； 1： 上架
    private String skuFlag;
    //sku类型    id
    private Integer cid;
    //sku库存
    private Integer skuStock;
    //sku介绍
    private String skuDetails;
    //删除标记 0为未删除，1为已删除 默认0
    private Integer deleteFlag;



}
