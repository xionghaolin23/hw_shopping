package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.github.pagehelper.Page;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.vo.ProductVO;
import com.huawei.hw_shopping.model.vo.ShopCartVO;

import java.io.Serializable;
import java.util.List;

public interface IProductService extends IService<Product> {
    /**
     * 后台查询全部商品
     */
    List<Product> selectAll(int pageNum, int pageSize);

    /**
     * @return 商品总数
     */
    Integer selectAllCount();
    /**
     * 后台热销单品配置
     */
    List<Product> indexHotList();

    /**
     * 后台精品配置
     */
    List<Product> boutiqueList();

    /**
     * 查看商品ID
     * @return
     */
    List<String> selectProductId();

    /**后台 手机配置 显示手机
     * @return
     */
    List<Product> phoneList();

    Product byPidSelectShop(String pid);

    Product selectAllById(String pid);


    Product byPidSelectPnameImg(String pid);

    /** 首页搜索
     * @param keyword
     * @param pageNum
     * @param pageSize
     * @return
     */
    Page<Product> serch(String keyword, int pageNum, int pageSize);

    /** 轮播上搜索
     * @param keyword
     * @return
     */
    List<Product> serchType(String keyword);

    List<Product> cidSerch(String cid);

    /** 搜索商品
     * @param pname
     * @return
     */
    List<Product> serchProduct(String pname, Integer pageNum, Integer pageSize);

    List<ProductVO> totalProduct();

    List<Product> notebooNkList();

    List<Product> tabletList();

    List<Product> indexSmartWearList();

    List<Product> indexSmartHomeList();
}
