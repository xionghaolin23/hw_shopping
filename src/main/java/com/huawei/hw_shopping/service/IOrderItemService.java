package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huawei.hw_shopping.model.OrderItem;

import java.util.List;

public interface IOrderItemService extends IService<OrderItem> {

    List<OrderItem> selectOrderIdList(String orderId);
}
