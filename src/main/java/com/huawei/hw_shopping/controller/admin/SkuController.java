package com.huawei.hw_shopping.controller.admin;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huawei.hw_shopping.controller.common.BaseController;
import com.huawei.hw_shopping.model.Sku;
import com.huawei.hw_shopping.service.ISkuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * sku控制器
 */
@Controller
@RequestMapping("/sku")
public class SkuController extends BaseController {
    @Autowired
    ISkuService skuService;
    private static final Logger logger = LoggerFactory.getLogger(SkuController.class);

    @ResponseBody
    @RequestMapping("/selectAllSku")
    public String selectAllSku(Integer pageNum, Integer pageSize) {
        List<Sku> products = skuService.selectAllSku(pageNum, pageSize);
        Integer count = skuService.selectAllCount();
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", count);
        obj.put("data", products);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }



}
