package com.huawei.hw_shopping.service.impl;

import com.huawei.hw_shopping.mapper.CarouselMapper;
import com.huawei.hw_shopping.model.Carousel;
import com.huawei.hw_shopping.service.ICarouselService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class CarouselServiceImplTest {
    @Autowired

    ICarouselService CarouselService;
    @Test
    public void testGetByID(){
        Carousel byId = CarouselService.getById("1");
        System.out.println(byId);
    }
}
