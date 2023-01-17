package com.huawei.hw_shopping.model;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;


import java.io.Serializable;
import java.util.List;

/**
 * 商品类型实体
 */
@Data
@TableName("HW_SHOPPING_PRODUCT_TYPE")
@KeySequence(value = "HW_SHOPPING_PRODUCT_TYPE_SEQ", clazz = Integer.class)
public class ProductType implements Serializable {
    List<ProductType> childrenTypes;
    //一个手机 有很多种型号 一对多？
    //List<Product> productList;
    //外键 商品id
    @TableId(value = "CID", type = IdType.INPUT)
    private Integer cid; //goostypeId
    // 大类型id  添加父类商品无父类id  添加子类商品有父类id
    private String parentTypeId;
    //商品名称  手机 电脑.. 类型名称
    private String typeName;//typeName
    //商品排序 0 1 2 ...
    private Integer sort;
    //图片
    private String timage;
}
