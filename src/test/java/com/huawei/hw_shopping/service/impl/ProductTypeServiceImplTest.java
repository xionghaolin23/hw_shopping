package com.huawei.hw_shopping.service.impl;

import com.huawei.hw_shopping.mapper.ProductMapper;
import com.huawei.hw_shopping.mapper.ProductTypeMapper;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.ProductType;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.List;

@SpringBootTest
public class ProductTypeServiceImplTest {
    @Autowired
    private ProductTypeMapper productTypeMapper;

    @Test
    public void testSelect() {
        List<ProductType> list = productTypeMapper.selectAll();
        for (ProductType o : list) {
            System.out.println(o);
        }

    }

}

