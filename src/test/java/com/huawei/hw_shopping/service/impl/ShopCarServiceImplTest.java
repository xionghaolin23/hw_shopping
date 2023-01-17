package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.huawei.hw_shopping.model.Carousel;
import com.huawei.hw_shopping.model.ShopCart;
import com.huawei.hw_shopping.service.ICarouselService;
import com.huawei.hw_shopping.service.IShopCartService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ShopCarServiceImplTest {
    @Autowired

    IShopCartService shopCartService;
    @Test
    public void testGetByID(ShopCart shopCart){
        QueryWrapper<ShopCart> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("pid",83);
        shopCart.setShopCount(3);
        boolean result = shopCartService.update(shopCart,queryWrapper);
        System.out.println(result);

    }
}
