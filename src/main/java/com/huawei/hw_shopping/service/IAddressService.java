package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huawei.hw_shopping.model.Address;

import java.util.List;

public interface IAddressService extends IService<Address> {
    /**
     * 根据用户id查出默认地址
     * @param userId
     * @return
     */
    List<Address> selectAddressListByUserId(String userId);
}
