package com.huawei.hw_shopping.common;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Random;

/**
 * 公共类
 */
public class Common {
    /**
     * @return 获取时间
     */
    public static String time(){
        //获取当前日期 年月日 时分秒
        LocalDate ymr = LocalDate.now();
        LocalTime sfm = LocalTime.now();
        return ymr+" "+sfm.getHour()+":"+sfm.getMinute()+":"+sfm.getSecond();
    }

    /**
     * @return 生成六位验证码
     */
    public static String getSixRandom(){
        Random random = new Random();
        String result="";
        for (int i=0;i<6;i++){
            result+=random.nextInt(10);
        }
        return result;
    }

    /**
     * @return 生成十二位订单号
     */
    public static String getOrderRandom(){
        Random random = new Random();
        String result="";
        for (int i=0;i<12;i++){
            result+=random.nextInt(10);
        }
        return result;
    }

    /**
     * @return 获取上传文件配置路径的方法
     */
    public static String getConfigUploadPath(){
        String realPath="file:/upload/";//写死
        String systemType = System.getProperty("os.name");//获取系统类别 windows mac linux
        if(systemType.toLowerCase().contains("windows")){
            //此时是windows系统
            realPath="file:E:\\upload\\";
        }
        return realPath;
    }


    public static String getUploadPath(){
        String realPath="/";//写死
        String systemType = System.getProperty("os.name");//获取系统类别 windows mac linux
        if(systemType.toLowerCase().contains("windows")){
            //此时是windows系统
             realPath="E:\\";
        }
        return realPath;
    }


}
