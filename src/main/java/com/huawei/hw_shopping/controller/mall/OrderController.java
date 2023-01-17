package com.huawei.hw_shopping.controller.mall;


import com.alibaba.fastjson.JSON;
import com.huawei.hw_shopping.common.Common;
import com.huawei.hw_shopping.controller.common.BaseController;
import com.huawei.hw_shopping.model.*;
import com.huawei.hw_shopping.model.vo.ShopCartVO;
import com.huawei.hw_shopping.service.*;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 订单控制器
 */
@Controller
public class OrderController extends BaseController {

    @Resource
    IOrderService orderService;
    @Resource
    IAddressService addressService;
    @Resource
    IProductService productService;
    @Resource
    IOrderItemService orderItemService;
    @Resource
    IShopCartService shopCartService;

    private static final Logger logger = LoggerFactory.getLogger(OrderController.class);


    /** 商品详细页面  去下单
     * @param pid
     * @param shopCount
     * @param model
     * @return
     */
    @GetMapping("/goOrder")
    public String goOrder(@RequestParam("pid") String pid,
                          @RequestParam("shopCount") Integer shopCount,
                          Model model) {
        if (getUser() == null) {
            //跳到登录页
            return "users/user/login";
        }
        ArrayList shopCountList = new ArrayList<>();
        ShopCartVO shopCartVOS = new ShopCartVO();
        //获得商品
        Product shopCart = productService.getById(pid);
        //设置商品和shopCount
        shopCartVOS.setProduct(shopCart);
        shopCartVOS.setShopCount(shopCount);
        shopCountList.add(shopCartVOS);
        List<Address> addressList = addressService.selectAddressListByUserId(getUser().getUserId());
        model.addAttribute("addressList", addressList);
        model.addAttribute("ShopCarPidList", shopCountList);
        return "users/order/nowConfirmCard";
    }


    /**
     * 购物车页面  立即结算
     * @param orderInfo 从前端传来的隐藏域表单值
     * @param model
     * @return
     */
    @RequestMapping("/nowOrder")
    public String nowOrder(String orderInfo, Model model) {
        if (getUser() == null) {
            //跳到登录页
            return "users/user/login";
        }
        ArrayList shopCountList = new ArrayList<>();
        //把前端传来的对象数组解析
        List<ShopCart> shopCarts = JSON.parseArray(orderInfo, ShopCart.class);
        for (ShopCart shopProduct : shopCarts) {
            ShopCartVO shopCartVOS = new ShopCartVO();
            //获得商品
            Product shopCart = productService.getById(shopProduct.getPid());
            //设置商品和shopCount
            shopCartVOS.setProduct(shopCart);
            shopCartVOS.setShopCount(shopProduct.getShopCount());
            shopCountList.add(shopCartVOS);
        }
        List<Address> addressList = addressService.selectAddressListByUserId(getUser().getUserId());
        model.addAttribute("addressList", addressList);
        model.addAttribute("ShopCarPidList", shopCountList);
        return "users/order/nowConfirmCard";
    }

    /**
     * 保存地址
     *
     * @param address
     * @return
     */
    @ResponseBody
    @RequestMapping("/savaAddress")
    public Address savaAddress(Address address) {
        //保存用户id
        address.setUserId(getUser().getUserId());
        if (address.getMoren() == 0) {
            address.setTag("默认地址");
        } else if (address.getMoren() == 1) {
            address.setTag("家");
        } else if (address.getMoren() == 2) {
            address.setTag("学校");
        } else {
            address.setTag("公司");
        }
        boolean save = addressService.save(address);
        return address;
    }

    @ResponseBody
    @RequestMapping("/deleteAddress")
    public Map<String, Object> deleteAddress(@RequestParam(value = "addressId", required = true) String addressId) {
        HashMap<String, Object> map = new HashMap<>();
        boolean result = addressService.removeById(addressId);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }


    /**
     * 提交订单
     *
     * @param allProduct
     * @param model
     * @return
     */
    @RequestMapping("/sumbitOrder")
    public String sumbitOrder(String allProduct, Order order,Model model) {
        if (getUser() == null) {
            //跳到登录页
            return "users/user/login";
        }
        // 设置order表
        //生成随机单号
        order.setOrderNo("1"+Common.getOrderRandom());
        //关联用户id
        order.setUserId(getUser().getUserId());
        //支付状态 提交订单而已 还未支付
        order.setPayStatus(0);
        //支付方式 等回调设置
        //支付时间 等回调设置
        //订单状态 待支付 0
        order.setOrderStatus(0);
        //是否删除 默认为0 未删除 
        //创建时间
        String time = Common.time();
        try {
            order.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
        } catch (ParseException e) {
            logger.info("时间格式化错误{}", time);
            e.printStackTrace();
        }
        //执行保存
        boolean save = orderService.save(order);
        System.out.println(order);
        //设置orderItem表
        ArrayList shopCountList = new ArrayList<>();
        //ArrayList<OrderItem> pids = new ArrayList<>();
        //把前端传来的对象数组解析  pid 和 shopCount
        List<OrderItem> orderItems = JSON.parseArray(allProduct, OrderItem.class);

        for (OrderItem orderItem : orderItems) {
            //删除购物车 下单过的商品
            Boolean result = shopCartService.deleteProduct(orderItem.getPid());
            //商品库存-1
            Product productById = productService.getById(orderItem.getPid());
            Integer oldStock = productById.getPstock();
            //原来得数量 减去下单得
            productById.setPstock(oldStock-orderItem.getShopCount());
            //执行更新
            boolean update = productService.updateById(productById);
            //创建OrderItem 对象
            OrderItem orderItemVOS = new OrderItem();
            // 设置属性
            orderItemVOS.setOrderId(order.getOrderId());
            orderItemVOS.setPid(orderItem.getPid());
            orderItemVOS.setProductPrice(orderItem.getProductPrice());
            orderItemVOS.setShopCount(orderItem.getShopCount());
            // orderItemVOS.setCreateUpdate(order.getCreateTime());
            //根据pid查找 productName productCoverImg
            System.out.println(orderItem.getPid());
            Product product = productService.byPidSelectPnameImg(orderItem.getPid());
            //赋值
            orderItemVOS.setProductName(product.getPname());
            orderItemVOS.setProductCoverImg(product.getPimage());
            //根据pid查询商品名 价格
            //执行批量增加
            boolean b = orderItemService.save(orderItemVOS);
            //添加到列表
            shopCountList.add(orderItemVOS);

        }
        model.addAttribute("order", order);
        model.addAttribute("ShopCarPidList", shopCountList);
        return "users/order/payment.html";
    }
}
