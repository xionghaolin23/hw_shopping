package com.huawei.hw_shopping.controller.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huawei.hw_shopping.util.HttpUtils;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 物流
 */
@Controller
public class LogisticsController {

    /**
     * @param logistics 单号
     * @param LogCompany 快递公司
     * @return
     */
    @RequestMapping("/logistics")
    @ResponseBody
    public JSONObject logistics(@RequestParam("logistics") String logistics,
                                @RequestParam("LogCompany") String LogCompany) {
        String host = "http://wuliu.market.alicloudapi.com";
        String path = "/kdi";
        String method = "GET";
        String appcode = "226792b40dd74eada70231515dbbf46d";  // !!! 替换这里填写你自己的AppCode 请在买家中心查看
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("Authorization", "APPCODE " + appcode); //格式为:Authorization:APPCODE 83359fd73fe11248385f570e3c139xxx
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("no", logistics);// !!! 请求参数
        querys.put("type", LogCompany);// !!! 请求参数
        try {
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
            //System.out.println(response.toString()); //输出头部
            String logisticsInformation = EntityUtils.toString(response.getEntity());
            JSONObject jsonObject = JSON.parseObject(logisticsInformation);
            return jsonObject;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
