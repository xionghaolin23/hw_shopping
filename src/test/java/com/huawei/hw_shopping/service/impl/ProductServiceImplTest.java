package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.Page;
import com.huawei.hw_shopping.mapper.ProductMapper;
import com.huawei.hw_shopping.mapper.UserMapper;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.User;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.List;

@SpringBootTest
public class ProductServiceImplTest {
    @Autowired
    private ProductMapper productMapper;

    @Test
    public void testInsert() {
        Product product = new Product();
        product.setPname("柯南");
        product.setMarketPrice(20.0);
        product.setShopPrice(10.0);
        product.setPdate(new Date());
        product.setIsHot("1");
        product.setPdesc("名侦探柯南");
        product.setPflag("dd");
        product.setCid(1);
        int insert = productMapper.insert(product);
        System.out.println(insert);
    }

}

