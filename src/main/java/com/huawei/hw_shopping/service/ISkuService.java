package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huawei.hw_shopping.model.Sku;

import java.util.List;

public interface ISkuService extends IService<Sku> {

    /** 查询出所有sku
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<Sku> selectAllSku(Integer pageNum, Integer pageSize);

    Integer selectAllCount();
}
