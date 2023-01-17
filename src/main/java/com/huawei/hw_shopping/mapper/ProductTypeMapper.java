package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.huawei.hw_shopping.model.ProductType;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ProductTypeMapper extends BaseMapper<ProductType> {

    /**
     * @param i 首页轮播图上面的div查询
     * @return
     */
    List<ProductType> selectTypesByParentId(int i);

    /**
     * @return 首页查询
     */
    List<ProductType> selectAll();
    /**
     * @return 首页轮播图上动画查询
     */
    List<ProductType> selectNav();
    /**
     * @return 商品详细页面头顶字段查询
     */
    ProductType selectDetails(Integer cid);
}
