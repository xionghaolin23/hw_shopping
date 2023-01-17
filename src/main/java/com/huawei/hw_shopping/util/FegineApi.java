package com.huawei.hw_shopping.util;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import java.util.HashMap;
import java.util.Map;
/**
 全国快递物流查询
 商品购买地址： https://market.aliyun.com/products/56928004/cmapi021863.html
 String host = "http://wuliu.market.alicloudapi.com"; //服务器
 String path = "/kdi"; //接口地址
 */
public class FegineApi {
    public static void main(String[] args) {
        String host = "http://wuliu.market.alicloudapi.com";
        String path = "/kdi";
        String method = "GET";
        System.out.println("请先替换成自己的AppCode");
        String appcode = "226792b40dd74eada70231515dbbf46d";  // !!! 替换这里填写你自己的AppCode 请在买家中心查看
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("Authorization", "APPCODE " + appcode); //格式为:Authorization:APPCODE 83359fd73fe11248385f570e3c139xxx
        Map<String, String> querys = new HashMap<String, String>();
        querys.put("no", "73128954714488");// !!! 请求参数
        querys.put("type", "zto");// !!! 请求参数
        try {
            HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
            //System.out.println(response.toString()); //输出头部
            System.out.println(EntityUtils.toString(response.getEntity())); //输出json
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

