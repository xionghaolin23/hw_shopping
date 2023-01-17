package com.huawei.hw_shopping.controller.admin;
import com.huawei.hw_shopping.controller.common.BaseController;
import com.huawei.hw_shopping.model.ProductType;
import com.huawei.hw_shopping.service.IProductTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 商品类型控制器
 */
@Controller
@RequestMapping("/productType")
public class ProductTypeController extends BaseController {
    @Autowired
    IProductTypeService ProductTypeService;
    private static final Logger logger = LoggerFactory.getLogger(ProductTypeController.class);

    @RequestMapping("/productTypeAdd.html")
    public String  ProductType(Model model) {
        model.addAttribute("types",ProductTypeService.selectTypesByParentId(-1));
        return "admin/views/product/productTypeAdd";
    }
    /**
     * 后台添加商品类型
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/add")
    public Map<String, Object> ProductTypeAdd(ProductType productType,MultipartFile pim) {
        System.out.println(productType);
        HashMap<String, Object> map = new HashMap<>();
        String imgUrl = uploadFile("/upload/nav/", pim);
        productType.setTimage(imgUrl);
        boolean save = ProductTypeService.save(productType);
        if (save) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }

    /**
     * 后台添加商品   级联
     *  addProduct.html 前台传一个cid过来
     * @return
     */

    @RequestMapping("/cascade/id={cid}")
    @ResponseBody
    public List<ProductType> ProductTypeAddCascade(@PathVariable("cid")Integer cid, Model model) {
        List<ProductType> children = ProductTypeService.selectTypesByParentId(cid);
//        System.out.println(children);
        model.addAttribute("children",children);
        //return "admin/views/product/addProduct";
        return children;
        //return "users/a";
    }

}
