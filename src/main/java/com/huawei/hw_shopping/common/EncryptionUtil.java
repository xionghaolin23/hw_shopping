package com.huawei.hw_shopping.common;

import org.apache.shiro.crypto.hash.Md5Hash;


/**
 * shiro框架自带得MD5加密认证
 * 加密工具类  md5算法加密
 */
public class EncryptionUtil {
    public final static String SALT = "code";

    /**
     * md5算法加密
     */
    public static String md5(String str, String salt) {
        return new Md5Hash(str, salt).toString();
    }

    public static void main(String[] args) {
        String password = "123456";
        System.out.println(EncryptionUtil.md5(password, SALT));

    }
}
