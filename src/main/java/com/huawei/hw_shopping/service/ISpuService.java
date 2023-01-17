package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.Spu;

import java.util.List;

public interface ISpuService extends IService<Spu> {

    /** 查询出所有spu
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<Spu> selectAllSpuList(Integer pageNum, Integer pageSize);

    Integer selectAllCount();

    /** 查询所有spu名称
     * @return
     */
    List<Spu> selectAllSpu();
}
