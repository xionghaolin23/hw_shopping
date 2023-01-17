package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.huawei.hw_shopping.mapper.ProductTypeMapper;
import com.huawei.hw_shopping.model.ProductType;
import com.huawei.hw_shopping.service.IProductTypeService;
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
public class ProductTypeServiceImpl implements IProductTypeService {
    @Autowired
    ProductTypeMapper productTypeMapper;

    @Override
    public boolean save(ProductType productType) {
        int i = productTypeMapper.insert(productType);
        return i == 1 ? true : false;
    }

    @Override
    public boolean saveBatch(Collection<ProductType> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<ProductType> entityList, int batchSize) {
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
    public boolean remove(Wrapper<ProductType> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return false;
    }

    @Override
    public boolean updateById(ProductType entity) {
        return false;
    }

    @Override
    public boolean update(ProductType entity, Wrapper<ProductType> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<ProductType> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(ProductType entity) {
        return false;
    }

    @Override
    public ProductType getById(Serializable id) {
        return productTypeMapper.selectById(id);
    }

    @Override
    public Collection<ProductType> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<ProductType> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public ProductType getOne(Wrapper<ProductType> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<ProductType> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<ProductType> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<ProductType> queryWrapper) {
        return 0;
    }

    @Override
    public List<ProductType> list(Wrapper<ProductType> queryWrapper) {
        return null;
    }

    @Override
    public IPage<ProductType> page(IPage<ProductType> page, Wrapper<ProductType> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<ProductType> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<ProductType> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<ProductType> page, Wrapper<ProductType> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<ProductType> getBaseMapper() {
        return null;
    }

    /**
     * 查询出所有  商品大类型  给前端使用
     *
     * @return
     */
    @Override
    public List<ProductType> selectTypesByParentId(int i) {
       /* List<ProductType> productTypes = productTypeMapper.selectTypesByParentId(i);
        for (ProductType p : productTypes) { //在for循环调用查询语句非常影响性能
            //根据父类id找到子类id
            List<ProductType> childrenTypes = productTypeMapper.selectTypesByParentId(p.getCid());
            p.setChildrenTypes(childrenTypes);
        }
        System.out.println(productTypes);
        System.out.println(productTypes.size());
        return productTypes;*/
        return productTypeMapper.selectTypesByParentId(i);
    }

    /**
     * @return 首页查询
     */
    @Override
    public List<ProductType> selectAll() {
        return productTypeMapper.selectAll();
    }
    /**
     * @return 首页轮播图上查询
     */
    @Override
    public List<ProductType> selectNav() {

        return productTypeMapper.selectNav();
    }

    /**
     * @return 商品详细页面头顶字段查询
     */
    @Override
    public ProductType selectDetails(Integer cid) {

        return productTypeMapper.selectDetails(cid);
    }


}
