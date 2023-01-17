package com.huawei.hw_shopping.service.impl;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.huawei.hw_shopping.mapper.OrderItemMapper;
import com.huawei.hw_shopping.model.OrderItem;
import com.huawei.hw_shopping.service.IOrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Service
@Transactional(rollbackFor = {Exception.class}) /*事务注解 实现AOP数据库事务控制，出现异常 回滚*/
public class OrderItemServiceImpl implements IOrderItemService {

    @Autowired
    OrderItemMapper orderItemMapper;


    @Override
    public boolean save(OrderItem entity) {
        int insert = orderItemMapper.insert(entity);
        return insert==1?true:false;
    }

    @Override
    public boolean saveBatch(Collection<OrderItem> entityList, int batchSize) {
        //List<OrderItem> orderItems = orderItemMapper.insert(entityList);
        return false;

    }

    @Override
    public boolean saveOrUpdateBatch(Collection<OrderItem> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean removeById(Serializable id) {
        return false;
    }

    @Override
    public boolean removeByMap(Map<String, Object> columnMap) {
        return false;
    }

    @Override
    public boolean remove(Wrapper<OrderItem> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return false;
    }

    @Override
    public boolean updateById(OrderItem entity) {
        return false;
    }

    @Override
    public boolean update(OrderItem entity, Wrapper<OrderItem> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<OrderItem> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(OrderItem entity) {
        return false;
    }

    @Override
    public OrderItem getById(Serializable id) {
        return null;
    }

    @Override
    public Collection<OrderItem> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<OrderItem> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public OrderItem getOne(Wrapper<OrderItem> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<OrderItem> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<OrderItem> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<OrderItem> queryWrapper) {
        return 0;
    }

    @Override
    public List<OrderItem> list(Wrapper<OrderItem> queryWrapper) {
        return null;
    }

    @Override
    public IPage<OrderItem> page(IPage<OrderItem> page, Wrapper<OrderItem> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<OrderItem> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<OrderItem> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<OrderItem> page, Wrapper<OrderItem> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<OrderItem> getBaseMapper() {
        return null;
    }

    @Override
    public List<OrderItem> selectOrderIdList(String orderId) {
        return orderItemMapper.selectOrderIdList(orderId);
    }
}
