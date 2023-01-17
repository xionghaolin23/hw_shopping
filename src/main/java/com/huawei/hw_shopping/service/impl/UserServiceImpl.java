package com.huawei.hw_shopping.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.huawei.hw_shopping.mapper.UserMapper;
import com.huawei.hw_shopping.model.User;
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
public class UserServiceImpl implements IUserService {

    @Autowired
    UserMapper userMapper;


    /**
     * @return 后台查询普通用户
     */

    @Override
    public List<User> selectUserPage(int pageNum, int pageSize) {
        Page<User> page = PageHelper.startPage(pageNum, pageSize);
        return userMapper.selectUserPage(pageNum, pageSize);
    }

    /**
     * @return 后台查询管理员
     */

    @Override
    public List<User> selectAdminerPage(int pageNum, int pageSize) {
        Page<User> page = PageHelper.startPage(pageNum, pageSize);
        return userMapper.selectAdminerPage(pageNum, pageSize);
    }


    /**
     * @param user 注册方法
     * @return 没用上 直接用mabatis-plus的sava方法了 如下
     */
   /* @Override
    public Boolean register(User user) {
        return userMapper.register(user);
    }
*/
    /**
     * @param user 注册方法
     * @return
     */
    @Override
    public boolean save(User user) {
        int i = userMapper.insert(user);
        return i == 1 ? true : false;
    }


    /**
     * @param user 登录功能
     * @return
     */
    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    /**后台查询总访问量
     * @return
     */
    @Override
    public Integer loginNum() {
        return userMapper.loginNum();
    }

    /**
     * @param email 忘记密码中判断邮件是否存在
     * @return
     */
    @Override
    public User findByEmail(String email) {
        return userMapper.findByEmail(email);
    }

    /**
     * @param user 后台搜索普通用户
     * @return
     */
    @Override
    public List<User> serchUser(User user) {
        return userMapper.serchUser(user);
    }
    /**
     * @param user 后台搜索管理员
     * @return
     */

    /**
     * @param id 根据id删除
     * @return
     */
    @Override
    public boolean removeById(Serializable id) {
        int i = userMapper.deleteById(id);
        return i == 1 ? true : false;

    }

    /**
     * @param user 后台更新用户
     * @return
     */
    @Override
    public boolean updateById(User user) {
        int i = userMapper.updateById(user);
        return i == 1 ? true : false;
    }

    /**
     * @param id 根据id查用户信息
     * @return
     */
    @Override
    public User getById(Serializable id) {
        return userMapper.selectById(id);
    }

    /**
     * @param queryWrapper 查总记录数
     * @return
     */
    @Override
    public int count(Wrapper<User> queryWrapper) {
        return userMapper.selectCount(queryWrapper);
    }


    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        int i = userMapper.deleteBatchIds(idList);
        return i==1?true:false;

    }

    /** 后台搜索管理员
     * @param user
     * @return
     */
    @Override
    public List<User> serchAdmin(User user) {
        return userMapper.serchAdmin(user);
    }

    @Override
    public List<User> userAccount() {
        return userMapper.userAccount();
    }

    @Override
    public List<User> AdminUSerAccount() {
        return userMapper.AdminUSerAccount();
    }

    @Override
    public boolean updatePwd(String mobile,String MD5Psssword) {
        return userMapper.updatePwd(mobile,MD5Psssword);
    }

    @Override
    public boolean saveBatch(Collection<User> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<User> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean removeByMap(Map<String, Object> columnMap) {
        return false;
    }

    @Override
    public boolean remove(Wrapper<User> queryWrapper) {
        return false;
    }

    @Override
    public boolean update(User entity, Wrapper<User> updateWrapper) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<User> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(User entity) {
        return false;
    }


    @Override
    public Collection<User> listByIds(Collection<? extends Serializable> idList) {
        return null;
    }

    @Override
    public Collection<User> listByMap(Map<String, Object> columnMap) {
        return null;
    }

    @Override
    public User getOne(Wrapper<User> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<User> queryWrapper) {
        return null;
    }

    @Override
    public <V> V getObj(Wrapper<User> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }


    @Override
    public List<User> list(Wrapper<User> queryWrapper) {
        return null;
    }

    @Override
    public IPage<User> page(IPage<User> page, Wrapper<User> queryWrapper) {
        return null;
    }

    @Override
    public List<Map<String, Object>> listMaps(Wrapper<User> queryWrapper) {
        return null;
    }

    @Override
    public <V> List<V> listObjs(Wrapper<User> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public IPage<Map<String, Object>> pageMaps(IPage<User> page, Wrapper<User> queryWrapper) {
        return null;
    }

    @Override
    public BaseMapper<User> getBaseMapper() {
        return null;
    }
}
