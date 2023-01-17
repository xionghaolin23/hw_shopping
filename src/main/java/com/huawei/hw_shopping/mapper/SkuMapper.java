package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.huawei.hw_shopping.model.Sku;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * MyBatis  SQL Mapper
 */
@Mapper
@Component
public interface SkuMapper extends BaseMapper<Sku> {


    List<Sku> selectAllSku(Integer pageNum, Integer pageSize);

    Integer selectAllCount();
}
