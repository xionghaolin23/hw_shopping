package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huawei.hw_shopping.model.ShopCart;
import com.huawei.hw_shopping.model.vo.ShopCartVO;

import java.util.List;

public interface IShopCartService extends IService<ShopCart> {
    ShopCart selectShopPid(String pid);

    /**
     * @param user_id 根据用户id查出购物车内容
     * @return
     */
    List<ShopCart> selectShopUserId(String user_id);

    /**根据用户查询购物车列表
     * @param userId
     * @return
     */
    List<ShopCart> findUserCars(String userId);

    /** 删除购物车商品
     * @param pid
     * @return
     */
    Boolean deleteProduct(String pid);

    List<ShopCart> byPidSelectShopList(String pid);

    Integer byPidSelectShopCount(String id);

    List<ShopCart> selectShopBypid(String pid);

    ShopCart selectProduct(String pid);

}
