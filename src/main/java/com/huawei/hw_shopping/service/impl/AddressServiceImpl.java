package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.huawei.hw_shopping.mapper.AddressMapper;
import com.huawei.hw_shopping.model.Address;
import com.huawei.hw_shopping.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Service
@Transactional(rollbackFor = {Exception.class}) /*事务注解 实现AOP数据库事务控制，出现异常 回滚*/
public class AddressServiceImpl implements IAddressService {

    @Autowired
    AddressMapper addressMapper;


    @Override
    public boolean save(Address entity) {
        int insert = addressMapper.insert(entity);
        return insert==1?true:false ;
    }

    @Override
    public boolean saveBatch(Collection<Address> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<Address> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean removeById(Serializable id) {
        int i = addressMapper.deleteById(id);
        return i==1?true:false ;
    }

    @Override
    public boolean removeByMap(Map<String, Object> columnMap) {
        return false;
    }

    @Override
    public boolean remove(Wrapper<Address> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return false;
    }

    @Override
    public boolean updateById(Address entity) {
        return false;
    }

    @Override
    public boolean update(Address entity, Wrapper<Address> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<Address> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(Address entity) {
        return false;
    }

    @Override
    public Address getById(Serializable id) {
        return null;
    }

    @Override
    public Collection<Address> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<Address> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public Address getOne(Wrapper<Address> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<Address> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<Address> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<Address> queryWrapper) {
        return 0;
    }

    @Override
    public List<Address> list(Wrapper<Address> queryWrapper) {
        return null;
    }

    @Override
    public IPage<Address> page(IPage<Address> page, Wrapper<Address> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<Address> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<Address> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<Address> page, Wrapper<Address> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<Address> getBaseMapper() {
        return null;
    }

    @Override
    public List<Address> selectAddressListByUserId(String userId) {

        List<Address> address = addressMapper.selectAddressListByUserId(userId);
        return address;
    }
}
