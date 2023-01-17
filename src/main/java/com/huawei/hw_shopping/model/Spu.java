package com.huawei.hw_shopping.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;


/**
 * spu实体
 */
@Data
@TableName("HW_SHOPPING_SPU")
@KeySequence(value = "HW_SHOPPING_SPU_SEQ", clazz = String.class)
public class Spu implements Serializable {

    //spu id
    @TableId(value = "SPU_ID", type = IdType.INPUT)
    private String spuId;
    //spu名称
    private String spuName;
    //spu 描述
    private String spuDesc;
    //默认sku id
    private String defaultSkuId;
    //sku图片路径
    private String spuPrice;
    //spu 消息
    private String spuMsg;
    //spu 图片
    private String spuImage;
    //删除标记
    private Integer deleteFlag;




}
