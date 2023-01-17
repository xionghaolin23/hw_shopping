package com.huawei.hw_shopping.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;


/**
 * sku 图片存放实体
 */
@Data
@TableName("HW_SHOPPING_SPU")
@KeySequence(value = "HW_SHOPPING_IMAGE_SEQ", clazz = String.class)
public class SkuImage implements Serializable {

    //spu id
    @TableId(value = "IMAGE_ID", type = IdType.INPUT)
    private String imageId;
    //sku id 外键
    private String skuId;
    //sku 主图片
    private String imageMain;
    //五张小图
    private String imageOne;
    private String imageTwo;
    private String imageThree;
    private String imageFour;
    private String imageFive;





}
