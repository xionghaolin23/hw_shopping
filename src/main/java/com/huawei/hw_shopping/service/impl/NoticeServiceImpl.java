package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huawei.hw_shopping.mapper.NoticeMapper;
import com.huawei.hw_shopping.mapper.UserMapper;
import com.huawei.hw_shopping.model.Notice;
import com.huawei.hw_shopping.model.User;
import com.huawei.hw_shopping.service.INoticeService;
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
public class NoticeServiceImpl implements INoticeService {

    @Autowired
    NoticeMapper noticeMapper;

    @Override
    public boolean save(Notice entity) {
        int insert = noticeMapper.insert(entity);
        return insert==1?true:false;
    }

    @Override
    public boolean saveBatch(Collection<Notice> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<Notice> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean removeById(Serializable id) {
        int i = noticeMapper.deleteById(id);
        return i==1?true:false;
    }

    @Override
    public boolean removeByMap(Map<String, Object> columnMap) {
        return false;
    }

    @Override
    public boolean remove(Wrapper<Notice> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        int i = noticeMapper.deleteBatchIds(idList);
        return i==1?true:false;

    }

    @Override
    public boolean updateById(Notice entity) {
        int i = noticeMapper.updateById(entity);
        return i==1?true:false ;
    }

    @Override
    public boolean update(Notice entity, Wrapper<Notice> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<Notice> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(Notice entity) {
        return false;
    }

    @Override
    public Notice getById(Serializable id) {
        return noticeMapper.selectById(id);
    }

    @Override
    public Collection<Notice> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<Notice> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public Notice getOne(Wrapper<Notice> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<Notice> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<Notice> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<Notice> queryWrapper) {
        return 0;
    }

    @Override
    public List<Notice> list(Wrapper<Notice> queryWrapper) {
        return null;
    }

    @Override
    public IPage<Notice> page(IPage<Notice> page, Wrapper<Notice> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<Notice> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<Notice> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<Notice> page, Wrapper<Notice> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<Notice> getBaseMapper() {
        return null;
    }

    @Override
    public List<Notice> selectAllNotice() {
        return noticeMapper.selectAllNotice();
    }
}
