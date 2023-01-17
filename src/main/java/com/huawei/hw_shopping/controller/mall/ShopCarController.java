package com.huawei.hw_shopping.controller.mall;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.huawei.hw_shopping.common.Common;
import com.huawei.hw_shopping.controller.common.BaseController;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.ShopCart;
import com.huawei.hw_shopping.model.User;
import com.huawei.hw_shopping.model.vo.ShopCartVO;
import com.huawei.hw_shopping.service.IProductService;
import com.huawei.hw_shopping.service.IShopCartService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/shopCar")
public class ShopCarController extends BaseController {
    @Autowired
    IProductService productService;
    @Autowired
    IShopCartService shopCartService;
    private static final Logger logger = LoggerFactory.getLogger(ShopCarController.class);


    /**
     * 添加商品到购物车
     *
     * @param product
     * @param shopCart
     * @param session
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Map<String, Object> addCart(Product product, ShopCart shopCart, HttpSession session) {
        HashMap<String, Object> map = new HashMap<>();
        if (getUser() == null) {
            //跳到登录页
            map.put("success", false);
            map.put("errorInfo", "没有权限,请先登录");
            return map;
        }
        //第一次添加进购物车 先判断购物车有没有此商品
        //根据pid查出商品
        boolean result = false;
        String pid = product.getPid();
        ShopCart byId = shopCartService.selectShopPid(pid);
        if (byId == null) {
            //购物车无此商品
            //执行添加操作
            shopCart.setUserId(getUser().getUserId());
            shopCart.setPid(pid);
            shopCart.setShopCount(shopCart.getShopCount());
            shopCart.setPid(pid);
            shopCart.setIsDeleted(0);
            String time = Common.time();
            try {
                shopCart.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
                shopCart.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
            } catch (ParseException e) {
                logger.info("时间格式化错误{}", time);
                e.printStackTrace();
            }
            result = shopCartService.save(shopCart);
        } else {
            //购物车有此商品
            //只需要修改价格和数量便足够
            //更新操作
            //旧购物车 数量
            Integer oldShopCount = byId.getShopCount();
            //从前端新接收的数量  新
            Integer newShopCount = shopCart.getShopCount();
            QueryWrapper<ShopCart> queryWrapper = new QueryWrapper<>();
            //根据 pid  更新
            queryWrapper.eq("pid", byId.getPid());
            //只更新下面2个字段
            shopCart.setShopCount(oldShopCount + newShopCount);
            String time = Common.time();
            try {
                shopCart.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
            } catch (ParseException e) {
                logger.info("时间格式化错误{}", time);
                e.printStackTrace();
            }
            result = shopCartService.update(shopCart, queryWrapper);
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
     * 去购物车  购物车内容显示
     *
     * @param model
     * @param product
     * @return
     */
    @RequestMapping("/goShoppingCar")
    public String goShoppingCar(Model model, Product product) {
        //判断用户是否登录
        if (getUser() == null) {
            //跳到登录页
            return "users/user/login";
        }

        /**
         * 1:根据user_id查出有多少个pid（list）
         * 根据pid(list)查出对应的product(list)
         */
        //1:根据user_id查出有多少个pid（list）
        List<ShopCart> ShopCarPidList = shopCartService.selectShopUserId(getUser().getUserId());
        for (ShopCart shopCartVO : ShopCarPidList) {
            product = productService.byPidSelectShop(shopCartVO.getPid());
            shopCartVO.setProduct(product);
        }
        model.addAttribute("ShopCarPidList", ShopCarPidList);
        return "users/product/shopping-trolley";
    }

    /** 清空购物车
     * @param pidList
     * @return
     */
    @RequestMapping("/deleteAllShopCar")
    @ResponseBody
    public Map<String, Object> deleteAllShop(@RequestParam("pidList[]")
                                                         List<String> pidList) {
        HashMap<String, Object> map=new HashMap<>();
        boolean result=false;
        for (int i = 0; i < pidList.size(); i++) {
            System.out.println(pidList.get(i));
            result = shopCartService.deleteProduct(pidList.get(i));
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
     * 删除购物车商品  单个商品
     *
     * @param pid 商品id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Map<String, Object> deleProduct(@RequestParam(value = "pid", required = true) String pid) {
        HashMap<String, Object> map = new HashMap<>();
        boolean result = shopCartService.deleteProduct(pid);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

}
