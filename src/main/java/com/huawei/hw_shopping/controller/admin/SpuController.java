package com.huawei.hw_shopping.controller.admin;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huawei.hw_shopping.common.Common;
import com.huawei.hw_shopping.controller.common.BaseController;
import com.huawei.hw_shopping.model.Product;
import com.huawei.hw_shopping.model.ProductType;
import com.huawei.hw_shopping.model.Spu;
import com.huawei.hw_shopping.service.IProductTypeService;
import com.huawei.hw_shopping.service.ISpuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * spu控制器
 */
@Controller
@RequestMapping("/spu")
public class SpuController extends BaseController {
    @Autowired
    ISpuService spuService;
    private static final Logger logger = LoggerFactory.getLogger(SpuController.class);

    /** 查询出所有spu 列表 spuList.html
     * @param pageNum
     * @param pageSize
     * @return
     */
    @ResponseBody
    @RequestMapping("/selectAllSpuList")
    public String selectAllSpuList(Integer pageNum, Integer pageSize) {
        List<Spu> products = spuService.selectAllSpuList(pageNum, pageSize);
        Integer count = spuService.selectAllCount();
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", count);
        obj.put("data", products);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }

    /** 添加
     * @param pim
     * @param spu
     * @return
     */
    @ResponseBody
    @RequestMapping("/addSpu")
    public Map<String,Object> addSpu(MultipartFile pim,Spu spu) {
        HashMap<String, Object> map = new HashMap<>();
        System.out.println(spu);
        String imgUrl = uploadFile("/upload/spu/", pim);
        spu.setSpuImage(imgUrl);
        boolean save = spuService.save(spu);
        if (save) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }

    /** 根据id删除spu  假删除 0未删除 1删除
     * @return
     */

    @RequestMapping("spuDeleteById/id={id}")
    @ResponseBody
    public Map<String, Object> deleteById(@PathVariable("id") Serializable id) {
        Map<String, Object> map = new HashMap<>();
        Spu spu = spuService.getById(id);
        spu.setDeleteFlag(1);
        boolean result = spuService.updateById(spu);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }

    /**
     * 更新spu 前  点击按钮 查看信息  根据主键id查询
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("spuSelectById/id={id}")
    public String spuSelectById(Model model, @PathVariable("id") Serializable id) {
        Spu spuById = spuService.getById(id);
        model.addAttribute("spuById", spuById);
        //或者用户数据后  跳转到新的页面显示
        return "admin/views/spu/updateSpu.html";
    }

    /**
     * 更新SPU
     *
     * @param spu
     * @param spuImage
     * @return
     */
    @ResponseBody
    @RequestMapping("/spuUpdateById")
    public Map<String, Object> spuUpdateById(Spu spu,MultipartFile spuImage) {
        Map<String, Object> map = new HashMap<>();
        String imgUrl = uploadFile("/upload/spu/", spuImage);
       spu.setSpuImage(imgUrl);
        //更新其他信息
        boolean result = spuService.updateById(spu);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }



    /** 查询出所有SPU_NAME
     * @param model
     * @return
     */
    @RequestMapping("selectAllSpu")
    @ResponseBody
    public Map<String,Object> selectAllSpu(Model model){
        HashMap<String, Object> map = new HashMap<>();
        List<Spu> allSpu=spuService.selectAllSpu();
        map.put("allSpu",allSpu);
        return map;
    }
}
