package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.huawei.hw_shopping.mapper.ShopCartMapper;
import com.huawei.hw_shopping.model.ShopCart;
import com.huawei.hw_shopping.model.vo.ShopCartVO;
import com.huawei.hw_shopping.service.IShopCartService;
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
public class ShopCartServiceImpl implements IShopCartService {
    @Autowired
    ShopCartMapper shopCartMapper;

    @Override
    public boolean save(ShopCart entity) {
        int insert = shopCartMapper.insert(entity);
        return insert==1?true:false;
    }

    @Override
    public boolean saveBatch(Collection<ShopCart> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<ShopCart> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean removeById(Serializable id) {
        int i = shopCartMapper.deleteById(id);
        return i==1?true:false;
    }

    @Override
    public boolean removeByMap(Map<String, Object> columnMap) {
        return false;
    }

    @Override
    public boolean remove(Wrapper<ShopCart> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return false;
    }

    @Override
    public boolean updateById(ShopCart entity) {
        int i = shopCartMapper.updateById(entity);
        return i==1?true:false;
    }

    @Override
    public boolean update(ShopCart entity, Wrapper<ShopCart> updateWrapper) {
        int update = shopCartMapper.update(entity, updateWrapper);
        return update==1?true:false;
    }

    @Override
    public boolean updateBatchById(Collection<ShopCart> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(ShopCart entity) {
        return false;
    }

    @Override
    public ShopCart getById(Serializable id) {
        return shopCartMapper.selectById(id);
    }

    @Override
    public Collection<ShopCart> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<ShopCart> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public ShopCart getOne(Wrapper<ShopCart> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<ShopCart> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<ShopCart> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<ShopCart> queryWrapper) {
        return 0;
    }

    @Override
    public List<ShopCart> list(Wrapper<ShopCart> queryWrapper) {
        return null;
    }

    @Override
    public IPage<ShopCart> page(IPage<ShopCart> page, Wrapper<ShopCart> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<ShopCart> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<ShopCart> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<ShopCart> page, Wrapper<ShopCart> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<ShopCart> getBaseMapper() {
        return null;
    }

    @Override
    public ShopCart selectShopPid(String pid) {
        return shopCartMapper.selectShopPid(pid);
    }

    /**
     * @param user_id 根据用户id查出购物车内容
     * @return
     */
    @Override
    public List<ShopCart> selectShopUserId(String user_id) {
        return shopCartMapper.selectShopUserId(user_id);
    }

    @Override
    public List<ShopCart> findUserCars(String userId) {
        List<ShopCart> cartVOS=shopCartMapper.findUserCars(userId);
        return cartVOS;
    }

    @Override
    public Boolean deleteProduct(String pid) {
        return shopCartMapper.deleteProduct(pid);
    }

    @Override
    public List<ShopCart> byPidSelectShopList(String pid) {
        return shopCartMapper.byPidSelectShopList(pid);
    }

    @Override
    public Integer byPidSelectShopCount(String id) {
        return shopCartMapper.byPidSelectShopCount(id);
    }

    @Override
    public List<ShopCart> selectShopBypid(String pid) {
        return shopCartMapper.selectShopBypid(pid);
    }

    @Override
    public ShopCart selectProduct(String pid) {
        return shopCartMapper.selectProduct(pid);
    }


}
