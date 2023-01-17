package com.huawei.hw_shopping.config;

public class AlipayConfig {
    // ↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016102200739235";//例：在沙箱网页中 信息部分中的必看部分2016101200671308

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDdZ25bBcwQpwYzrq0TJ/mM+Q/nriLckJii55l6xiUGAm9/m5W+gvN13ljTMAMINrb3ZWHLUdINeazAx4IWRf+dpe8/PTj2QztG4QlPOy2ctv413DfTei7sSWyPiA/YEqbHA+O8ryQU/9xni+h8kc9m6qZNlJH07rNpjhrDZo6PX1xTnr8TE2jN4WqRcKD/3H/5GDVFrvkGftc2lMagfckuE8bnO5Z9k8IL0G0msM3Fx5KeEjlOgbNz47WJyYiDkV4AAIvVRXpRrS5Dwkz+u7Z9osRlyfS6JOocMfC2o85T8cDDCRS+ygUjlPrS0kiO+8f4saujqzaQ6NK+S8EdP/rLAgMBAAECggEAfmArfYkxkc/Emnt6DxUiPHVtvrCG9Z8TgOjxkkLHn0aEnjIQp03X6c+go+sjz+xrQ4t65rMtUsPA98jpWA1cen/csBwiB28Yxrxss+zzfCB3ugaZVvzHC9hdPxBK+uqqh66Qr4LI9bOV+wTBD1mrKPOHOYE0Trpxbi7O1/oSJYMYy6l0l2j35ircoisP7Hv0tW88/yzuzJlmBsg9WeEf1APwk+16FsWDXW8wh3Cqb11PZfD1KXWod3t1L9txfXJXKjZgSHHIrPvSdtZsVYYwSQGyvoKaQH0NmlXm0lgrChSk2oCtRjzfY52I1Jeh+rGsbxTJFMAWyrR7tmx2zW70AQKBgQD8q9eddrO+67sXXMZgQKml1XtRmbr6UBz8lpwYXBErfQn/uwti0wpFRMPITI48Eb433k43rYY9wtfHqiKlFnXwjBpubFie76l/PKCMHCbLcrR+WhFeVJCu1NZfSbeforX+lB6O3r/JX+dWMB+DnJUXosxMxAS4egnijgnvx7hLGwKBgQDgUiMbCQJ84wG8A1bppX7Va9pMsEPUteNedLuN15itGGA/dD/fi3FwRl/72wC45wIi4l0dQoX1Re7vjFJZSrMMBoeoehoSI5JAF0a9vMnfxSsunMQGR6MGx6mFUxavOXKfeqYlCLPpo7oKV5TVBtoMTnEj5mBWKMA8UpUpoQraEQKBgGfjN9n0bl83iUtHyADXVWlr5zJb5Pb6bZClVDTn1d9tn+jXvQy6/OQSK/V1FJ46JV3PN5XI8QL/07yyhWAfZgqrcEqqnZ1rqOM5yEETahgIZ5Hz8mQ4nOxlcmbnZmpqei3cNNxFVdG0buePDcYNYXfAZgPCLLa05s+R2yANnAa1AoGBAKU+PFgNAgUnYD60oxCIde8XfP7jFYSa3DvXd9XcDL7t5vC3XNn6qXzQiqJHyLdsjJlP8NG+EFoGwyU5U+ws58ojAUmtcIkOJQ0LWHQqnvc1EkNK/ee2W7SB3jG1bE913Sb3vW4ohAfHMSOvMpbebj+EhTmx2iN972ZAW1sII6tRAoGAbJNM5jNCT8Qnma/PwhATq2Df/NKf120FGxc6zsZTM2mNbq09tsZTbd90IORH1lGpCpvm2sbGDF3U302s4340vibiRbG5E3nFniJ9fh1oiaDSEXuThLDeoPKIGYXodfKgxUDV49u/Syrjz51tf4k7r49AuRAoGkxAHjyI1/CDu0Y=";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm
    // 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhPWXM4lJyCNAluZUGKBi0ZYAHrGVDXlW8UDbAanAjlAl7bYaVDPnlXKEAnmwXeIZZlah8fF8TJsuwEjKII2RHBLprsyKj0f9C5HUPclJZBLdbBpUTs33zylNzVmvirXHkF0zs3f2nlbjl2dVk1jTydqQMsxlk3nxhf0xQTFA6//ZWkqOs97Cd3v0LJiTQLcc932IgOKmILPERHfDO0YPB8G8/xmxOh0JmOCelNNZnPdJA0WSPi+naXLo8xCVHRGqOXOBl8f9Gu//ZZpBlJJl9EVqBioHfiuQI+eJwc4oeb/k7vQFD4Z0RMwBoEMyf3wuFqBC04iN+T3+8tHzU3Vx/QIDAQAB";
    // 服务器异步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    /**
     * 返回的时候此页面不会返回到用户页面，只会执行你写到控制器里的地址
     */
    public static String notify_url = "http://localhost:8081/userOrder/paySuccess";
    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    /**
     * 此页面是同步返回用户页面，也就是用户支付后看到的页面，上面的notify_url是异步返回商家操作，谢谢
     * 要是看不懂就找度娘，或者多读几遍，或者去看支付宝第三方接口API，不看API直接拿去就用，遇坑不怪别人
     */
    public static String return_url = "http://localhost:8081/userOrder/paySuccess";
    // 签名方式
    public static String sign_type = "RSA2";
    // 字符编码格式
    public static String charset = "utf-8";
    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
    // 日志地址
    //public static String log_path = "D:/logs/";
    // ↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑*/
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号,开发时使用沙箱提供的APPID，生产环境改成自己的APPID

}

