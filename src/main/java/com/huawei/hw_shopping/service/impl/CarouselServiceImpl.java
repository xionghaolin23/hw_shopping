package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huawei.hw_shopping.mapper.CarouselMapper;
import com.huawei.hw_shopping.model.Carousel;
import com.huawei.hw_shopping.service.ICarouselService;
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
public class CarouselServiceImpl implements ICarouselService {
    @Autowired
    CarouselMapper carouselMapper;
    /**
     * @return 后台首页配置  轮盘图配置  显示轮播图界面
     */
    @Override
    public List<Carousel> selectAll(Integer pageNum, Integer pageSize) {
        Page<Carousel> page = PageHelper.startPage(pageNum, pageSize);
        return  carouselMapper.selectAll(pageNum,pageSize);

    }

    @Override
    public Integer selectAllCount() {
        return carouselMapper.selectAllCount();
    }

    /**
     * 前台首页配置  轮盘图配置  显示轮播图界面
     */
    @Override
    public List<Carousel> selectCarousel() {
        return carouselMapper.selectCarousel();
    }

    @Override
    public boolean save(Carousel carousel) {
        int insert = carouselMapper.insert(carousel);
        return insert==1?true:false;
    }

    @Override
    public boolean saveBatch(Collection<Carousel> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<Carousel> entityList, int batchSize) {
        return false;
    }

    /**后台删除轮播图
     * @param id
     * @return
     */
    @Override
    public boolean removeById(Serializable id) {

        int i = carouselMapper.deleteById(id);
        return i==1?true:false;

    }

    @Override
    public boolean removeByMap(Map<String, Object> columnMap) {
        return false;
    }

    @Override
    public boolean remove(Wrapper<Carousel> queryWrapper) {
        return false;
    }

    /**
     * @param idList 后台轮播图 批量删除
     * @return
     */
    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {

        int i= carouselMapper.deleteBatchIds(idList);
        return i==1?true:false;
    }

    @Override
    public boolean updateById(Carousel carousel) {
        int i = carouselMapper.updateById(carousel);
        return i == 1 ? true : false;

    }

    @Override
    public boolean update(Carousel entity, Wrapper<Carousel> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<Carousel> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(Carousel entity) {
        return false;
    }

    /**
     * @param id 后台首页配置  轮盘图配置  更新前的回显查看
     * @return
     */
    @Override
    public Carousel getById(Serializable id) {
        return carouselMapper.selectById(id);
    }

    @Override
    public Collection<Carousel> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<Carousel> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public Carousel getOne(Wrapper<Carousel> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<Carousel> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<Carousel> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<Carousel> queryWrapper) {
        return 0;
    }

    @Override
    public List<Carousel> list(Wrapper<Carousel> queryWrapper) {
        return null;
    }

    @Override
    public IPage<Carousel> page(IPage<Carousel> page, Wrapper<Carousel> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<Carousel> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<Carousel> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<Carousel> page, Wrapper<Carousel> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<Carousel> getBaseMapper() {
        return null;
    }
}
