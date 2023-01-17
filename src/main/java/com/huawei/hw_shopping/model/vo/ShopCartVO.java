package com.huawei.hw_shopping.model.vo;

import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.ShopCart;
import lombok.Data;



@Data
public class ShopCartVO extends ShopCart {
    //这个购物车对应的商品
    private Product product;
    //商品数量
    private Integer shopCount;
}
