package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.huawei.hw_shopping.model.Carousel;
import com.huawei.hw_shopping.model.Order;
import com.huawei.hw_shopping.model.vo.OrderVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface OrderMapper extends BaseMapper<Order> {

    List<Order> seletOrder(String userId);

    List<Order> selectAllOrder(Integer pageNum, Integer pageSize);

    Integer seletAllOrderCount();

    Order selectOrder(String out_trade_no);

    Order getOrderStatus(String oderid);

    Order getAllById(String s);

    /**  统计订单图表
     * @return
     */
    List<Order> totalOrder();

    List<Order> getWaitPayment(Integer payStatus);

    Order selectOrderNo(String orderNo);
}
