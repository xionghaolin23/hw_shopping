package com.huawei.hw_shopping.controller.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huawei.hw_shopping.common.Common;
import com.huawei.hw_shopping.controller.mall.OrderController;
import com.huawei.hw_shopping.model.Order;
import com.huawei.hw_shopping.service.IOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台订单管理
 */
@Controller
@RequestMapping("/backOrder")
public class BackgroundOrderController {

    @Resource
    IOrderService orderService;
    private static final Logger logger = LoggerFactory.getLogger(BackgroundOrderController.class);
    /**
     * 后台查询所有订单
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/selectAllNotice")
    @ResponseBody
    public String selectAllNotice(Integer pageNum, Integer pageSize) {
        List<Order> notices = orderService.selectAllOrder(pageNum, pageSize);
        Integer seletAllOrderCount = orderService.seletAllOrderCount();
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", seletAllOrderCount);
        obj.put("data", notices);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }


    /**
     * 配货
     *
     * @param listId
     * @return
     */
    @RequestMapping("/distribution")
    @ResponseBody
    public Map<String, Object> distribution(@RequestParam(value = "array[]") List<String> listId) {
        Map<String, Object> map = new HashMap<>();
        boolean result = false;
        for (int i = 0; i < listId.size(); i++) {
            Order oderById = orderService.getAllById(listId.get(i));
            if (oderById.getPayStatus() == 0) {//未支付状态
                map.put("error", false);
                map.put("msg", "订单还未支付，请先支付");
                return map;
            }
            //配货 0待配货 1配货 2出库
            oderById.setOrderStatus(1);
            result = orderService.updateById(oderById);
        }
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }


    /**
     * 根据id回显  实际没作用 只是传递一个ID到另外一个页面
     *
     * @param order
     * @param orderId
     * @param model
     * @return
     */
    @RequestMapping("/selectOrderById/{arry}")
    public String selectOrderById(Order order, @PathVariable("arry") List<String> orderId, Model model) {
        Order oderById = null;
        for (int i = 0; i < orderId.size(); i++) {
            oderById = orderService.getAllById(orderId.get(i));
        }
        model.addAttribute("oderById", oderById);
        return "admin/views/order/addIogistics";
    }


    /**
     * 添加物流信息
     *
     * @param order
     * @return
     */
    @RequestMapping("/logistics")
    @ResponseBody
    public Map<String, Object> logistics(Order order) {
        Map<String, Object> map = new HashMap<>();
        Order oderById = orderService.getAllById(order.getOrderId());
        if (oderById.getOrderStatus() != 2) {
            //还没出库
            map.put("error", false);
            map.put("msg", "订单还没出库");
            return map;
        }
        //出库
        order.setLogistics(order.getLogistics());
        boolean result = orderService.updateById(order);

        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }


    /**
     * 出库
     *
     * @param listId
     * @return
     */
    @RequestMapping("/outbound")
    @ResponseBody
    public Map<String, Object> outbound(@RequestParam(value = "array[]") List<String> listId) {
        Map<String, Object> map = new HashMap<>();
        //先判断是否配货
        boolean result = false;
        for (int i = 0; i < listId.size(); i++) {
            Order oderById = orderService.getAllById(listId.get(i));
            //oderById.getPayStatus()==0&&
            if (oderById.getPayStatus() == 0 | oderById.getOrderStatus() == 0) { //需要先付款 和  配货过程
                map.put("error", false);
                map.put("msg", "订单还没完成配货");
                return map;
            }
            //出库
            oderById.setOrderStatus(2);
            result = orderService.updateById(oderById);
        }
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /**
     * 删除订单
     *
     * @param id
     * @return
     */
    @RequestMapping("/closeOrder/id={id}")
    @ResponseBody
    public Map<String, Object> closeOrder(@PathVariable("id") String id) {
        Map<String, Object> map = new HashMap<>();
        Order orderById = orderService.getAllById(id);
        if (orderById.getPayStatus() == 0) { //未支付
            map.put("error", false);
            map.put("msg", "未支付订单不可删除");
            return map;
        }
        boolean result = orderService.removeById(id);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }


    /**
     * 编辑回显
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/selectById/id={id}")
    public String selectById(Model model, @PathVariable("id") String id) {
        Order order = orderService.getAllById(id);
        model.addAttribute("order", order);
        //或者用户数据后  跳转到新的页面显示
        return "admin/views/order/updateOrder";
    }

    /**
     * 修改
     *
     * @param order
     * @return
     */
    @ResponseBody
    @RequestMapping("/updateById")
    public Map<String, Object> updateById(Order order) {
        Map<String, Object> map = new HashMap<>();
        String time = Common.time();
        try {
            order.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
        } catch (ParseException e) {
            logger.info("时间格式化错误{}", time);
            e.printStackTrace();
        }
        boolean result = orderService.updateById(order);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /**
     * 统计月订单销售额
     * @return
     */
    @ResponseBody
    @RequestMapping("/totalOrder")
    public List<Order> totalOrder() {
        List<Order> orders = orderService.totalOrder();
        HashMap<String, Object> map = new HashMap<>();
        if(orders!=null){
            return orders;
        }
        return null;
    }

}
