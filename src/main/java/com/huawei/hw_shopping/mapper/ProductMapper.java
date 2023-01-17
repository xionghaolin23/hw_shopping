package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.pagehelper.Page;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.vo.ProductVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ProductMapper extends BaseMapper<Product> {
    /** 后台查询全部商品
     * @return
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

    /**查看商品ID
     * @return
     */
    List<String> selectProductId();

    /**后台 手机配置 显示手机
     * @return
     */
    List<Product> phoneList();

    Product byPidSelectShop(String pid);

    Product selectAllByID(String pid);

    Product byPidSelectPnameImg(String pid);

    /**     首页搜索 带分页
     * @param keyword
     * @param pageNum
     * @param pageSize
     * @return
     */
    Page<Product> serch(@Param("keyword") String keyword,
                        @Param("pageNum") int pageNum,
                        @Param("pageSize") int pageSize);

    List<Product> serchType(String keyword);

    List<Product> cidSerch(String cid);

    /** 搜索商品
     * @param pname
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<Product> serchProduct(@Param("pname") String pname,
                               @Param("pageNum") int pageNum,
                               @Param("pageSize") int pageSize);

    List<ProductVO> totalProduct();

    List<Product> notebooNkList();

    List<Product> tabletList();

    List<Product> indexSmartWearList();

    List<Product> indexSmartHomeList();
}
