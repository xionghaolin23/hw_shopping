package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huawei.hw_shopping.mapper.SkuMapper;
import com.huawei.hw_shopping.mapper.SkuMapper;
import com.huawei.hw_shopping.model.Sku;

import com.huawei.hw_shopping.model.Spu;
import com.huawei.hw_shopping.service.ISkuService;
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
public class SkuServiceImpl implements ISkuService {

    @Autowired
    SkuMapper skuMapper;


    @Override
    public List<Sku> selectAllSku(Integer pageNum, Integer pageSize) {
        Page<Sku> page = PageHelper.startPage(pageNum, pageSize);
        return skuMapper.selectAllSku(pageNum,pageSize);
    }

    @Override
    public Integer selectAllCount() {
        return skuMapper.selectAllCount();
    }

    @Override
    public boolean save(Sku entity) {
        return false;
    }

    @Override
    public boolean saveBatch(Collection<Sku> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<Sku> entityList, int batchSize) {
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
    public boolean remove(Wrapper<Sku> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return false;
    }

    @Override
    public boolean updateById(Sku entity) {
        return false;
    }

    @Override
    public boolean update(Sku entity, Wrapper<Sku> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<Sku> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(Sku entity) {
        return false;
    }

    @Override
    public Sku getById(Serializable id) {
        return null;
    }

    @Override
    public Collection<Sku> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<Sku> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public Sku getOne(Wrapper<Sku> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<Sku> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<Sku> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<Sku> queryWrapper) {
        return 0;
    }

    @Override
    public List<Sku> list(Wrapper<Sku> queryWrapper) {
        return null;
    }

    @Override
    public IPage<Sku> page(IPage<Sku> page, Wrapper<Sku> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<Sku> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<Sku> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<Sku> page, Wrapper<Sku> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<Sku> getBaseMapper() {
        return null;
    }
}
