package com.huawei.hw_shopping.controller.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huawei.hw_shopping.common.Common;
import com.huawei.hw_shopping.controller.common.BaseController;
import com.huawei.hw_shopping.model.Carousel;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.ProductType;
import com.huawei.hw_shopping.model.vo.ProductVO;
import com.huawei.hw_shopping.service.ICarouselService;
import com.huawei.hw_shopping.service.IProductService;
import com.huawei.hw_shopping.service.IProductTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 商品控制器
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseController {
    @Autowired
    IProductService productService;
    @Autowired
    IProductTypeService ProductTypeService;
    @Autowired
    ICarouselService CarouselService;

    private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

    @RequestMapping("/addProduct.html")
    public String addProduct(Model model) {
        model.addAttribute("types", ProductTypeService.selectTypesByParentId(-1));
        return "admin/views/product/addProduct";

    }

    /**
     * 后台添加商品
     * @return
     */
    @ResponseBody
    @RequestMapping("/add")
    public Map<String, Object> add(Product product, MultipartFile pim) {
        HashMap<String, Object> map = new HashMap<>();
        if ("on".equals(product.getPflag())) {
            //设置上架
            product.setPflag("上架");
        } else {
            //设置下架
            product.setPflag("下架");
        }
        //设置增加商品时间
        String time = Common.time();
        try {
            product.setPdate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
        } catch (ParseException e) {
            logger.info("时间格式化错误{}", time);
            e.printStackTrace();
        }
        String imgUrl = uploadFile("/upload/products/", pim);
        product.setPimage(imgUrl);
        boolean save = productService.save(product);
        if (save) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }

    @RequestMapping("/productList.html")
    public String productList(Model model) {
        model.addAttribute("types", ProductTypeService.selectTypesByParentId(-1));
        return "admin/views/product/productList";
    }

    /**
     * 后台查看所有商品列表 带分页
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/?")
    public String selectProduct(Integer pageNum, Integer pageSize) {
        List<Product> products = productService.selectAll(pageNum, pageSize);
        Integer count = productService.selectAllCount();
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", count);
        obj.put("data", products);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }


    /** 上架
     * @param listId
     * @return
     */
    @ResponseBody
    @RequestMapping("/shelves")
    public Map<String, Object> shelves(@RequestParam(value = "array[]") List<String> listId) {
        HashMap <String,Object> map= new HashMap();
        boolean result=false;
        for (int i = 0; i < listId.size(); i++) {
            Product productById = productService.getById(listId.get(i));
            if(productById.getPflag().equals("下架")){
                productById.setPflag("上架");
            }else {
                map.put("success", false);
                map.put("msg", "此商品目前就是上架状态");
                return map;
            }
             result = productService.updateById(productById);
        }
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }


    /**下架
     * @param listId
     * @return
     */
    @RequestMapping("/soldOut")
    @ResponseBody
    public Map<String, Object> soldOut(@RequestParam(value = "array[]") List<String> listId) {
        HashMap <String,Object> map= new HashMap();
        boolean result=false;
        for (int i = 0; i < listId.size(); i++) {
            Product productById = productService.getById(listId.get(i));
            if(productById.getPflag().equals("上架")){
                productById.setPflag("下架");
            }else {
                map.put("success", false);
                map.put("msg", "此商品目前就是下架状态");
                return map;
            }
            result = productService.updateById(productById);
        }
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }


    /**
     * @param pname 商品名
     * @return
     */
    @RequestMapping("/serchProduct/{pname}")
    @ResponseBody
    public String serchProduct(@PathVariable String pname,
                                             Integer pageNum,
                                             Integer pageSize) {
        List<Product> productList = productService.serchProduct(pname,pageNum,pageSize);
        JSONObject obj = new JSONObject();
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", 20);
        obj.put("data", productList);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }


    /**
     * @return 更新商品 前  点击按钮 查看信息  根据主键id查询
     */
    @RequestMapping("/selectById/id={id}")
    public String selectById(Model model, @PathVariable("id") Serializable id) {
        Product product = productService.getById(id);
        model.addAttribute("product", product);
        //或者用户数据后  跳转到新的页面显示
        return "admin/views/product/updateProduct";
    }

    /**
     * 后台添加商品
     * @return
     */
    @ResponseBody
    @RequestMapping("/updateProduct")
    public Map<String, Object> updateProduct(Product product, MultipartFile pim) {
        HashMap<String, Object> map = new HashMap<>();
        //设置增加商品时间
        String time = Common.time();
        try {
            product.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
        } catch (ParseException e) {
            logger.info("时间格式化错误{}", time);
            e.printStackTrace();
        }
        String imgUrl = uploadFile("/upload/products/", pim);
        product.setPimage(imgUrl);
        boolean save = productService.updateById(product);
        if (save) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }


    /**
     * 后台删除商品 假删除 0未删除 1删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/productDeleteById/id={id}")
    public Map<String, Object> productDeleteById(@PathVariable("id") Serializable id) {
        Map<String, Object> map = new HashMap<>();
        System.out.println(id);
        Product product = productService.getById(id);
        product.setDeleteFlag(1);
        boolean result = productService.updateById(product);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }

    /*后台首页配置*/


    /** 轮播图配置-显示轮播图页面方法
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/indexCarouselList")
    @ResponseBody
    public String indexCarouselList(Integer pageNum, Integer pageSize) {
        List<Carousel> iCarouseList = CarouselService.selectAll(pageNum,pageSize);
        Integer count = CarouselService.selectAllCount();
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", count);
        obj.put("data", iCarouseList);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }


    /**
     * 更新轮播图 前  点击按钮 查看信息  根据主键id查询
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/CarouseSelectById/id={id}")
    public String carouseSelectById(Model model, @PathVariable("id") Serializable id) {
        Carousel CarouselbyId = CarouselService.getById(id);
        model.addAttribute("CarouselbyId", CarouselbyId);
        //或者用户数据后  跳转到新的页面显示
        return "admin/views/product/indexConfiguration/updateCarousel";
    }

    /**
     * 更新轮播图
     *
     * @param carousel
     * @param pim
     * @return
     */
    @ResponseBody
    @RequestMapping("/CarouselUpdateById")
    public Map<String, Object> carouselUpdateById(Carousel carousel, MultipartFile pim) {
        Map<String, Object> map = new HashMap<>();
        System.out.println(carousel);
        //设置修改轮播图时间
        String time = Common.time();
        try {
            carousel.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
        } catch (ParseException e) {
            logger.info("时间格式化错误{}", time);
            e.printStackTrace();
        }
        String imgUrl = uploadFile("/upload/carousel/", pim);
        carousel.setCarouselUrl(imgUrl);
        carousel.setRedirectUrl(imgUrl);
        //更新其他信息
        boolean result = CarouselService.updateById(carousel);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }


    /**
     * 后台添加轮播图
     *
     * @param carousel
     * @param pim
     * @return
     */
    @RequestMapping("/CarouselAdd")
    @ResponseBody
    public Map<String, Object> CarouselAdd(Carousel carousel, MultipartFile pim) {
        HashMap<String, Object> map = new HashMap<>();
        System.out.println(carousel);
        //设置增加商品时间
        String time = Common.time();
        try {
            carousel.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
        } catch (ParseException e) {
            logger.info("时间格式化错误{}", time);
            e.printStackTrace();
        }
        String imgUrl = uploadFile("/upload/carousel/", pim);
        carousel.setCarouselUrl(imgUrl);
        carousel.setRedirectUrl(imgUrl);
        boolean save = CarouselService.save(carousel);
        if (save) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }

    /**
     * 后台删除轮播图
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/carouselDeleteById/id={id}")
    public Map<String, Object> carouselDeleteById(@PathVariable("id") Serializable id) {
        Map<String, Object> map = new HashMap<>();
        System.out.println(id);
        boolean result = CarouselService.removeById(id);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /**
     * @param
     * @return 批量删除轮播图
     */
    @ResponseBody
    @RequestMapping("/carouselDeleteByIdAll")
    //@RequestParam 此注解作用 传递参数名字不一样的时候用 前台 <a href=user/login?name='xhl'>
    //控制器中可以用@RequestParam(value = "name")String username) 意思是把超链接中name的值赋给username
    public Map<String, Object> carouselDeleteByIdAll(@RequestParam(value = "array[]") Collection<Serializable> listId) {
        Map<String, Object> map = new HashMap<>();
        //从前台List.html传过来的数组 遍历取出  删除 循环里面连接执行删除 速率慢
//        for (int i=0;i<listId.length;i++){
//             result = userService.removeById(listId[i]);
//        }
        //批量删除 mybatis-plus批量删除方法 传进来是一个集合 不是数组
        boolean result = CarouselService.removeByIds(listId);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }


    /**
     * 热销单品配置-显示页面方法
     *
     * @return
     */
    @RequestMapping("/indexHotList")
    @ResponseBody
    public String indexHotList() {
        List<Product> indexHotList = productService.indexHotList();
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", 1000);
        obj.put("data", indexHotList);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }

    /**
     * 添加热销单品前 需要绑定ID，首先需要查询有无此ID  true：根据ID查出来商品信息 false：给出提示
     *
     * @param product
     * @return
     */
    @RequestMapping("/byIdHot")
    @ResponseBody
    public Map byIdHot(Product product) {
        //Product byId = productService.getById(id);
        HashMap<String, Object> map = new HashMap<>();
        //根据商品id查出整个商品
        Product byIdList = productService.getById(product.getPid());
        if(byIdList != null&&byIdList.getDeleteFlag()==0){
            map.put("success", true);
            map.put("byIdList", byIdList);
            return map;
        }else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /** 添加热销单品 添加功能  相当于更新
     * 因为只需要更新pSort的值 其他的不用（数据库中已经存在）
     * @param product
     * @return
     */
    @RequestMapping("/addHot")
    @ResponseBody
    public Map addHot(Product product) {
        HashMap<String, Object> map = new HashMap<>();
        product.setPSort(product.getPSort());
        //设置增加商品时间
        String time = Common.time();
        try {
            product.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
        } catch (ParseException e) {
            logger.info("时间格式化错误{}", time);
            e.printStackTrace();
        }
        boolean result = productService.updateById(product);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /**
     * 后台热销单品配置 点击编辑时候得回显
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("HotSelectById/id={id}")
    public String HotSelectById(Model model, @PathVariable("id") Serializable id) {
        Product hotById = productService.getById(id);
        model.addAttribute("hotById", hotById);
        //或者用户数据后  跳转到新的页面显示
        return "admin/views/product/indexConfiguration/hotConfiguration/updateHot.html";
    }

    /**后台热销单品配置 更新热销单品
     * @param product
     * @param pim
     * @return
     */
    @ResponseBody
    @RequestMapping("/hotUpdateById")
    public Map<String, Object> hotUpdateById(Product product, MultipartFile pim) {
        Map<String, Object> map = new HashMap<>();
        //设置修改轮播图时间
        String time = Common.time();
        try {
            product.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(time));
        } catch (ParseException e) {
            logger.info("时间格式化错误{}", time);
            e.printStackTrace();
        }
        String imgUrl = uploadFile("/upload/Hot/", pim);
        product.setPimage(imgUrl);
        //更新其他信息
        boolean result = productService.updateById(product);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }

    /** 后台删除热销商品 假删除 deleteFlag=1
     * @param product
     * @return
     */
    @ResponseBody
    @RequestMapping("/hotDeleteById/{pid}")
    public Map<String, Object> hotDeleteById(Product product) {
        Map<String, Object> map = new HashMap<>();
        product.setDeleteFlag(1);
        boolean result = productService.updateById(product);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /** 后台批量删除热销商品 假删除
     * @param listId 前端传过来的id数组
     * @param product
     * @return
     */
    @RequestMapping("/hotDeleteByIdAll")
    @ResponseBody
    public Map<String, Object> hotDeleteByIdAll(@RequestParam(value = "array[]") String[] listId,Product product) {
        Map<String, Object> map = new HashMap<>();
        //从前台List.html传过来的数组 遍历取出  删除 循环里面连接执行删除 速率慢
        boolean result=false;
        for (int i=0;i<listId.length;i++){
            product.setPid(listId[i]);
            product.setDeleteFlag(1);
            result = productService.updateById(product);
        }
        //批量删除 mybatis-plus批量删除方法 传进来是一个集合 不是数组
       // boolean result = productService.updateBatchById(listId);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }


    /**
     * 精品配置-显示页面方法
     *
     * @return
     */
    @RequestMapping("/boutiqueList")
    @ResponseBody
    public String boutiqueList() {
        List<Product> boutiqueList = productService.boutiqueList();
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", 1000);
        obj.put("data", boutiqueList);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }

    /**
     * 手机配置-显示页面方法
     *
     * @return
     */
    @RequestMapping("/phoneList")
    @ResponseBody
    public String phoneList() {
        List<Product> phoneList = productService.phoneList();
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", 1000);
        obj.put("data", phoneList);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }

    /**
     * 统计商品分类
     * @return
     */
    @ResponseBody
    @RequestMapping("/totalProduct")
    public List<ProductVO> totalProduct() {
        List<ProductVO> orders = productService.totalProduct();
        List<ProductVO> product=new ArrayList<>();
        for (int i = 0; i < orders.size(); i++) {
            ProductVO productVO = new ProductVO();
            ProductType productType = ProductTypeService.selectDetails(Integer.parseInt(orders.get(i).getParentType()));
            productVO.setParentType(productType.getTypeName());
            productVO.setTotal(orders.get(i).getTotal());
            product.add(productVO);
        }
            return product;
    }




}
