package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huawei.hw_shopping.model.Order;
import com.huawei.hw_shopping.model.vo.OrderVO;

import java.util.List;

public interface IOrderService extends IService<Order> {

    List<Order> seletOrder(String userId);

    List<Order> selectAllOrder(Integer pageNum, Integer pageSize);

    Integer seletAllOrderCount();

    /**     根据订单号查询  整个订单  修改状态为1
     * @param out_trade_no  订单号
     * @return
     */
    Order selectOrder(String out_trade_no);

    Order getOrderStatus(String oderid);

    Order getAllById(String s);

    /**  统计订单图表
     * @return
     */
    List<Order> totalOrder();

    /**
     * 待支付订单
     *
     * @return
     */
    List<Order> getWaitPayment(Integer payStatus);

    Order selectOrderNo(String orderNo);
}
