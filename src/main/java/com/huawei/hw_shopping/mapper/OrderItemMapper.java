package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.huawei.hw_shopping.model.OrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface OrderItemMapper extends BaseMapper<OrderItem> {

    List<OrderItem> selectOrderIdList(String orderId);
}
