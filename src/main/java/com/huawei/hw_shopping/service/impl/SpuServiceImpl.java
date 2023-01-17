package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huawei.hw_shopping.mapper.SpuMapper;
import com.huawei.hw_shopping.mapper.UserMapper;
import com.huawei.hw_shopping.model.Spu;
import com.huawei.hw_shopping.model.User;
import com.huawei.hw_shopping.service.ISpuService;
import com.huawei.hw_shopping.service.IUserService;
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
public class SpuServiceImpl implements ISpuService {

    @Autowired
    SpuMapper spuMapper;

    @Override
    public boolean save(Spu entity) {
        int insert = spuMapper.insert(entity);
        return insert==1?true:false;
    }

    @Override
    public boolean saveBatch(Collection<Spu> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<Spu> entityList, int batchSize) {
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
    public boolean remove(Wrapper<Spu> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return false;
    }

    @Override
    public boolean updateById(Spu entity) {
        int i = spuMapper.updateById(entity);
        return i==1?true:false;
    }

    @Override
    public boolean update(Spu entity, Wrapper<Spu> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<Spu> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(Spu entity) {
        return false;
    }

    @Override
    public Spu getById(Serializable id) {
        return spuMapper.selectById(id);
    }

    @Override
    public Collection<Spu> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<Spu> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public Spu getOne(Wrapper<Spu> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<Spu> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<Spu> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<Spu> queryWrapper) {
        return 0;
    }

    @Override
    public List<Spu> list(Wrapper<Spu> queryWrapper) {
        return null;
    }

    @Override
    public IPage<Spu> page(IPage<Spu> page, Wrapper<Spu> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<Spu> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<Spu> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<Spu> page, Wrapper<Spu> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<Spu> getBaseMapper() {
        return null;
    }

    @Override
    public List<Spu> selectAllSpuList(Integer pageNum, Integer pageSize) {
        Page<Spu> page = PageHelper.startPage(pageNum, pageSize);
        return spuMapper.selectAllSpuList(pageNum, pageSize);
    }

    @Override
    public Integer selectAllCount() {
        return spuMapper.selectAllCount();
    }

    @Override
    public List<Spu> selectAllSpu() {
        return spuMapper.selectAllSpu();
    }
}
