package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.huawei.hw_shopping.model.Address;
import com.huawei.hw_shopping.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * MyBatis  SQL Mapper
 */
@Mapper
@Component
public interface AddressMapper extends BaseMapper<Address> {


     List<Address> selectAddressListByUserId(String userId);
}
