package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huawei.hw_shopping.model.Carousel;
import com.huawei.hw_shopping.model.Product;

import java.util.List;

public interface ICarouselService extends IService<Carousel> {
    /**
     * 后台首页配置  轮盘图配置  显示轮播图界面
     */
    List<Carousel> selectAll(Integer pageNum, Integer pageSize);

    /**
     * @return 轮播图总数
     */
    Integer selectAllCount();
    /**
     * 前台首页配置  轮盘图配置  显示轮播图界面
     */
    List<Carousel> selectCarousel();
}
