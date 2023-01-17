package com.huawei.hw_shopping.controller.common;

import com.huawei.hw_shopping.common.Common;

import com.huawei.hw_shopping.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 *  文件上传基类
 */
public class BaseController {
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);
    /** 上传文件
     * @param uploadDir 上传目录  以/开头
     * @param f 上传得文件
     * @return
     */
    protected String uploadFile(String uploadDir, MultipartFile f) {
        String realPath = Common.getUploadPath();
        //获得上传文件名
        String uploadFileame = f.getOriginalFilename();
        //获得图片后缀名
        String hz = uploadFileame.substring(uploadFileame.lastIndexOf(".") + 1);
        String uploadPath = uploadDir + UUID.randomUUID() + "." + hz;
        File file = new File(realPath + uploadPath);
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs();
        }
        try {
            if (!f.isEmpty()) {
                if (f.getSize() > 0) {
                    f.transferTo(file);
                    logger.info("图片已经存到：" + realPath + uploadPath);
                    return uploadPath;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    /** 获取request对象
     * @return
     */
    protected HttpServletRequest getRequest(){
        return  ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
    }

    /** 获取session对象
     * @return
     */
    protected HttpSession getSession(){
       return  this.getRequest().getSession();
    }

    /** 获取userId
     * @return
     */
    protected User getUser(){
        User loginUser = (User)getSession().getAttribute("loginUser");
        return loginUser;
    }
    protected User getAdminUser(){
        User AdminUser = (User)getSession().getAttribute("AdminUser");
        return AdminUser;
    }
}
