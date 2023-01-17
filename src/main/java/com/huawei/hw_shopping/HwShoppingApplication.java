package com.huawei.hw_shopping;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = {"com.huawei.hw_shopping.mapper"})
public class HwShoppingApplication {

    public static void main(String[] args) {

        SpringApplication.run(HwShoppingApplication.class, args);
    }

}
