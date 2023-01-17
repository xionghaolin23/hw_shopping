package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.huawei.hw_shopping.model.Carousel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component
public interface CarouselMapper extends BaseMapper<Carousel> {
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
