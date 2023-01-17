package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huawei.hw_shopping.model.ProductType;

import java.util.List;

public interface IProductTypeService extends IService<ProductType> {
    /**
     * 查询出所有  商品大类型  给前端使用
     * @return
     */
    List<ProductType> selectTypesByParentId(int i);
    /**
     * @return 首页查询
     */
    List<ProductType> selectAll();
    /**
     * @return 首页轮播图上查询
     */
    List<ProductType> selectNav();
    /**
     * @return 商品详细页面头顶字段查询
     */
    ProductType selectDetails(Integer cid);

}
