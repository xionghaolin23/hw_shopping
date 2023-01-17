package com.huawei.hw_shopping.service.impl;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huawei.hw_shopping.mapper.OrderMapper;
import com.huawei.hw_shopping.model.Order;
import com.huawei.hw_shopping.model.vo.OrderVO;
import com.huawei.hw_shopping.service.IOrderService;
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
public class OrderServiceImpl implements IOrderService {

    @Autowired
    OrderMapper orderMapper;


    @Override
    public boolean save(Order entity) {

        int insert = orderMapper.insert(entity);
        return insert==1?true:false;

    }

    @Override
    public boolean saveBatch(Collection<Order> entityList, int batchSize) {
        List<Order> orders = orderMapper.selectBatchIds(entityList);
        return orders==null?true:false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<Order> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean removeById(Serializable id) {
        int i = orderMapper.deleteById(id);
        return i==1?true:false;
    }

    @Override
    public boolean removeByMap(Map<String, Object> columnMap) {
        return false;
    }

    @Override
    public boolean remove(Wrapper<Order> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return false;
    }

    @Override
    public boolean updateById(Order entity) {
        int i = orderMapper.updateById(entity);
        return i==1?true:false;

    }

    @Override
    public boolean update(Order entity, Wrapper<Order> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<Order> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(Order entity) {
        return false;
    }

    @Override
    public Order getById(Serializable id) {
        return orderMapper.selectById(id);
    }

    @Override
    public Collection<Order> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<Order> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public Order getOne(Wrapper<Order> queryWrapper, boolean throwEx) {
        return orderMapper.selectOne(queryWrapper);
    }

    @Override
    public Map<String, Object> getMap(Wrapper<Order> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<Order> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<Order> queryWrapper) {
        return 0;
    }

    @Override
    public List<Order> list(Wrapper<Order> queryWrapper) {
        return null;
    }

    @Override
    public IPage<Order> page(IPage<Order> page, Wrapper<Order> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<Order> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<Order> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<Order> page, Wrapper<Order> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<Order> getBaseMapper() {
        return null;
    }

    @Override
    public List<Order> seletOrder(String userId) {
        return orderMapper.seletOrder(userId);
    }

    @Override
    public List<Order> selectAllOrder(Integer pageNum, Integer pageSize) {
        Page<Order> page = PageHelper.startPage(pageNum, pageSize);
        return orderMapper.selectAllOrder(pageNum,pageSize);
    }

    @Override
    public Integer seletAllOrderCount() {
        return orderMapper.seletAllOrderCount();
    }

    @Override
    public Order selectOrder(String out_trade_no) {
        return orderMapper.selectOrder(out_trade_no);
    }

    @Override
    public Order getOrderStatus(String oderid) {
        return orderMapper.getOrderStatus(oderid);
    }

    @Override
    public Order selectOrderNo(String orderNo) {
        return orderMapper.selectOrderNo(orderNo);
    }

    @Override
    public List<Order> getWaitPayment(Integer payStatus) {
        return orderMapper.getWaitPayment(payStatus);
    }

    @Override
    public List<Order> totalOrder() {
        return orderMapper.totalOrder();
    }

    @Override
    public Order getAllById(String s) {
        return orderMapper.getAllById(s);
    }
}
