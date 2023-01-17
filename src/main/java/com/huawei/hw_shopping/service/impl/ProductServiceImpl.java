package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huawei.hw_shopping.mapper.ProductMapper;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.vo.ProductVO;
import com.huawei.hw_shopping.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

@Service
@Transactional(rollbackFor = {Exception.class}) /*事务注解 实现AOP数据库事务控制，出现异常 回滚*/
public class ProductServiceImpl implements IProductService {
    @Autowired
    ProductMapper productMapper;

    /** 后台增加商品
     * @param product
     * @return
     */
    @Override
    public boolean save(Product product) {
        int i = productMapper.insert(product);
        return i==1?true:false;
    }

    /**
     * @return 后台查询全部商品
     */
    @Override
    public List<Product> selectAll(int pageNum, int pageSize) {
        Page<Product> page = PageHelper.startPage(pageNum, pageSize);
        return productMapper.selectAll(pageNum, pageSize);
    }

    @Override
    public Integer selectAllCount() {
        return productMapper.selectAllCount();
    }

    /**
     * 后台热销单品配置
     */
    @Override
    public List<Product> indexHotList() {

        return productMapper.indexHotList();
    }

    /**
     * 后台精品配置
     */
    @Override
    public List<Product> boutiqueList() {
        return productMapper.boutiqueList();
    }

    @Override
    public List<String> selectProductId() {
        return productMapper.selectProductId();
    }

    /**后台 手机配置 显示手机
     * @return
     */
    @Override
    public List<Product> phoneList() {
        return productMapper.phoneList();
    }

    @Override
    public Product byPidSelectShop(String pid) {
        return productMapper.byPidSelectShop(pid);
    }

    @Override
    public Product selectAllById(String pid) {
        return productMapper.selectAllByID(pid);
    }

    @Override
    public Product byPidSelectPnameImg(String pid) {
        return productMapper.byPidSelectPnameImg(pid);
    }


    @Override
    public Page<Product> serch(String keyword, int pageNum, int pageSize) {
        Page<Product> page = PageHelper.startPage(pageNum, pageSize);
        return productMapper.serch(keyword, pageNum, pageSize);
    }

    @Override
    public List<Product> serchType(String keyword) {
        return productMapper.serchType(keyword);
    }

    @Override
    public List<Product> cidSerch(String cid) {
        return productMapper.cidSerch(cid);
    }

    @Override
    public List<Product> indexSmartHomeList() {
        return productMapper.indexSmartHomeList();
    }

    @Override
    public List<Product> indexSmartWearList() {
        return productMapper.indexSmartWearList();
    }

    @Override
    public List<Product> tabletList() {
        return productMapper.tabletList();
    }

    @Override
    public List<Product> notebooNkList() {
        return productMapper.notebooNkList();
    }

    @Override
    public List<ProductVO> totalProduct() {
        return productMapper.totalProduct();
    }

    @Override
    public List<Product> serchProduct(String pname, Integer pageNum, Integer pageSize) {
        Page<Product> page = PageHelper.startPage(pageNum, pageSize);
        return productMapper.serchProduct(pname,pageNum,pageSize);
    }

    @Override
    public boolean saveBatch(Collection<Product> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<Product> entityList, int batchSize) {
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
    public boolean remove(Wrapper<Product> queryWrapper) {
        return false;
    }

    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return false;
    }

    @Override
    public boolean updateById(Product product) {

        int i = productMapper.updateById(product);
        return i==1?true:false;
    }

    @Override
    public boolean update(Product entity, Wrapper<Product> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<Product> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(Product entity) {
        return false;
    }

    @Override
    public Product getById(Serializable id) {
        return productMapper.selectById(id);
    }

    @Override
    public Collection<Product> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<Product> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public Product getOne(Wrapper<Product> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<Product> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<Product> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public int count(Wrapper<Product> queryWrapper) {
        return productMapper.selectCount(queryWrapper);
    }

    @Override
    public List<Product> list(Wrapper<Product> queryWrapper) {
        return null;
    }

    @Override
    public IPage<Product> page(IPage<Product> page, Wrapper<Product> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<Product> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<Product> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<Product> page, Wrapper<Product> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<Product> getBaseMapper() {
        return null;
    }


}
