package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.huawei.hw_shopping.model.Spu;
import com.huawei.hw_shopping.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * MyBatis  SQL Mapper
 */
@Mapper
@Component
public interface SpuMapper extends BaseMapper<Spu> {


    List<Spu> selectAllSpuList(Integer pageNum, Integer pageSize);

    Integer selectAllCount();

    List<Spu> selectAllSpu();
}
