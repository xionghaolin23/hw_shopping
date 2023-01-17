package com.huawei.hw_shopping.model.vo;


import com.huawei.hw_shopping.model.Order;
import com.huawei.hw_shopping.model.OrderItem;
import lombok.Data;
import java.util.List;


@Data
public class OrderVO extends Order{
    //这个购物车对应的商品
    List<OrderItem> orderItems;

}
