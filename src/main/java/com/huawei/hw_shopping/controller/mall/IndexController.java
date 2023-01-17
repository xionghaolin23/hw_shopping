package com.huawei.hw_shopping.controller.mall;

import com.github.pagehelper.Page;
import com.huawei.hw_shopping.model.Carousel;
import com.huawei.hw_shopping.model.Notice;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.ProductType;
import com.huawei.hw_shopping.service.ICarouselService;
import com.huawei.hw_shopping.service.INoticeService;
import com.huawei.hw_shopping.service.IProductService;
import com.huawei.hw_shopping.service.IProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 *  首页  展示控制器
 */
@Controller
public class IndexController {
    @Autowired
    IProductTypeService productTypeService;
    @Autowired
    ICarouselService CarouselService;
    @Autowired
    IProductService productService;
    @Resource
    INoticeService iNoticeService;
    /**
     * @param model 首页轮播图上的显示小类商品
     * @return
     */
    @RequestMapping ({"", "/", "/index", "/index.html"})
    public String index(Model model){
        /**找到 selectTypesByParentId(-1) 方法返回的  cid parentTypeId typeName  sort
         *  只有当parentTypeId=-1时才是大类（手机 电脑）
         *  productTypes 返回的具有父类id（parentTypeId） 和子类id（cid）的列表
         *  循环productTypes列表：找到子类id（cid）的列表  childrenTypes
         */
        //找到所有大类(-1)
        List<ProductType> productTypes = productTypeService.selectTypesByParentId(-1);
        //循环取出大类cid
        for (ProductType p : productTypes) { //在for循环调用查询语句非常影响性能
            //根据父类id找到子类id  根据手机 找到有荣耀。。。和其他（子类）
            List<ProductType> childrenTypes = productTypeService.selectTypesByParentId(p.getCid());
            p.setChildrenTypes(childrenTypes);
        }

        //System.out.println(productTypes);
        //List<ProductType> productAll = productTypeService.selectNav();
        //找到parentId=-1 得 父类 给前台
        model.addAttribute("productTypes",productTypes);
        //model.addAttribute("productAll",productAll);

        //首页轮播图展示
        List<Carousel> iCarouseList = CarouselService.selectCarousel();
        model.addAttribute("iCarouseList",iCarouseList);
        //首页公告
        List<Notice> noticesList = iNoticeService.selectAllNotice();
        model.addAttribute("noticesList",noticesList);
        //热销单品展示
        List<Product> indexHotList = productService.indexHotList();
        model.addAttribute("indexHotList",indexHotList);
        //精品单品展示
        List<Product> indexBoutiqueList = productService.boutiqueList();
        model.addAttribute("indexBoutiqueList",indexBoutiqueList);
        //手机展示
        List<Product> indexPhoneList = productService.phoneList();
        model.addAttribute("indexPhoneList",indexPhoneList);
        //电脑展示
        List<Product> indexNotebookList = productService.notebooNkList();
        model.addAttribute("indexNotebookList",indexNotebookList);
        //平板展示
        List<Product> indexTabletList = productService.tabletList();
        model.addAttribute("indexTabletList",indexTabletList);
        //智能穿戴展示
        List<Product> indexSmartWearList = productService.indexSmartWearList();
        model.addAttribute("indexSmartWearList",indexSmartWearList);
        //智能家居展示
        List<Product> indexSmartHomeList = productService.indexSmartHomeList();
        model.addAttribute("indexSmartHomeList",indexSmartHomeList);




        return "users/index";

    }

    /** 首页查看商品详情
     * @param model
     * @param pid
     * @return
     */
    @RequestMapping(value = "/details/{pid}")
    public String productDetails(Model model,@PathVariable String pid){
        //根据前台传过来得id获得整个商品信息
        Product products = productService.selectAllById(pid);
        //或许商品其他信息    此处也可以作多表连接查询
        ProductType byId = productTypeService.selectDetails(products.getCid());
        model.addAttribute("products",products);
        model.addAttribute("byId",byId);
        return "users/product/details";
    }

    /** 首页搜索
     * @param model
     * @param
     * @return
     */
    @RequestMapping("/index/serch/{pageNum}")
    public String serch(Model model, HttpSession session,
                         String keyword,
                        @PathVariable int pageNum){
        //第一次进来 保存查询条件
        if (keyword != null) {
            //保存查询条件 防止点下一页的时候查询条件因为刷新不见
            session.setAttribute("keyword", keyword);
        } else {
            // 取出来用
            keyword = (String) session.getAttribute("keyword");
        }
        Page<Product> productsList=productService.serch(keyword,pageNum,15);
        model.addAttribute("productsList",productsList);
        return "users/product/product-list.html";
    }


    /** 轮播图上点击事件
     * @param model
     * @param keyword
     * @return
     */
    @RequestMapping("/index/serchType")
    public String serchType(Model model,@RequestParam("keyword") String keyword){
        List<Product> productsList=productService.serchType(keyword.substring(0, keyword.length() - 2));
        model.addAttribute("productsList",productsList);
        return "users/product/product-list.html";
    }

    @RequestMapping("/index/cidSerch")
    public String cidSerch(Model model,@RequestParam("cid") String cid){
        List<Product> productsList=productService.cidSerch(cid);
        model.addAttribute("productsList",productsList);
        return "users/product/product-list.html";
    }

}
