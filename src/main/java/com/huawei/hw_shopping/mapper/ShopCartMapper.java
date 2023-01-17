package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.huawei.hw_shopping.model.Carousel;
import com.huawei.hw_shopping.model.ShopCart;
import com.huawei.hw_shopping.model.vo.ShopCartVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ShopCartMapper extends BaseMapper<ShopCart> {

    ShopCart selectShopPid(String pid);
    /**
     * @param user_id 根据用户id查出购物车内容
     * @return
     */
    List<ShopCart> selectShopUserId(String user_id);

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
