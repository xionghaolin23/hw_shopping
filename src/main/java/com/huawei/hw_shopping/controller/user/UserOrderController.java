package com.huawei.hw_shopping.controller.user;

import com.huawei.hw_shopping.common.Common;
import com.huawei.hw_shopping.controller.common.BaseController;
import com.huawei.hw_shopping.model.Order;
import com.huawei.hw_shopping.model.OrderItem;
import com.huawei.hw_shopping.service.IOrderItemService;
import com.huawei.hw_shopping.service.IOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 用户订单控制器  前台
 */
@Controller
@RequestMapping("/userOrder")
public class UserOrderController extends BaseController {

    @Autowired
    IOrderService orderService;
    @Autowired
    IOrderItemService iOrderItemService;

    private static final Logger logger = LoggerFactory.getLogger(UserOrderController.class);

    /**
     * 订单详情
     *
     * @return
     */
    @RequestMapping("/waitPayment/{payStatus}")
    public String waitPayment(Model model, @PathVariable Integer payStatus) {
        if (getUser() == null) {
            //跳到登录页
            return "users/user/login";
        }
        List<Order> orderList = orderService.getWaitPayment(payStatus);
        List<OrderItem> orderItemList = null;
        for (Order order : orderList) {
            //OrderVO orderVO = new OrderVO();
            orderItemList = iOrderItemService.selectOrderIdList(order.getOrderId());
            //遍历添加  新语法
            List<OrderItem> orderItem = new ArrayList<>(orderItemList);
            order.setOrderItem(orderItem);
        }
        model.addAttribute("orderList", orderList);
        return "users/order/member-my-order";

    }

    /**
     * 查看订单
     *
     * @param model
     * @return
     */
    /*@RequestMapping("myOrder")
    public String myOrder(Model model) {
        if (getUser() == null) {
            //跳到登录页
            return "users/user/login";
        }
        List<Order> orderList = orderService.seletOrder(getUser().getUserId());
        //待支付
        List<Order> waitrderList = orderService.getWaitPayment();
        if (orderList.size() != 0) {
            List<OrderItem> orderItemList = null;
            for (Order order : orderList) {
                //OrderVO orderVO = new OrderVO();
                orderItemList = iOrderItemService.selectOrderIdList(order.getOrderId());
                //遍历添加  新语法
                List<OrderItem> orderItem = new ArrayList<>(orderItemList);
                order.setOrderItem(orderItem);
            }
            model.addAttribute("orderList", orderList);
            model.addAttribute("ListCount", waitrderList.size());
        }
        return "users/order/member-my-order";
    }*/

    /**
     * 删除订单
     *
     * @param oderid 订单id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, Object> deleProduct(@RequestParam(value = "oderid", required = true) String oderid) {
        HashMap<String, Object> map = new HashMap<>();
        boolean result = orderService.removeById(oderid);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /**
     * 确认收货
     *
     * @param oderid 订单id
     * @return
     */
    @RequestMapping("/confirmOrder")
    @ResponseBody
    public Map<String, Object> confirmOrder(@RequestParam(value = "oderid", required = true) String oderid) {
        HashMap<String, Object> map = new HashMap<>();
        Order orderById = orderService.getOrderStatus(oderid);
        orderById.setOrderStatus(3);
        boolean result = orderService.updateById(orderById);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }


    /**
     * 支付成功后跳转
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/paySuccess")
    public String paySuccess(HttpServletRequest request, HttpServletResponse response) {
        try {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
            //根据订单号查询出对应商品
            Order order = orderService.selectOrder(out_trade_no);
            order.setPayStatus(1);
            String time = Common.time();
            try {
                order.setPayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
            } catch (ParseException e) {
                logger.info("时间格式化错误{}", time);
                e.printStackTrace();
            }
            boolean b = orderService.updateById(order);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "redirect:/index.html";
    }


    /**
     * 退款成功后跳转
     *
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/payRefund")
    public String refund(HttpServletRequest request, HttpServletResponse response) {
        try {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
            //根据订单号查询出对应商品
            Order order = orderService.selectOrder(out_trade_no);
            order.setPayStatus(0);
            String time = Common.time();
            try {
                order.setPayTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
            } catch (ParseException e) {
                logger.info("时间格式化错误{}", time);
                e.printStackTrace();
            }
            boolean b = orderService.updateById(order);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return "redirect:/index.html";
    }
}