package com.huawei.hw_shopping.controller.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;


/**
 * 文件上传控制器
 */
@Controller
public class FileUploadController {

    private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
    private static final List<String> CONTENT_TYPES= Arrays.asList("image/jpeg","image/png","image/gif");
    /**
     * 实现文件上传
     */
    @RequestMapping("fileUpload")
    @ResponseBody
    public String fileUpload(@RequestParam("fileName") MultipartFile file) {
        //判断上传文件是否为空
        if (file.isEmpty()) {
            logger.info("上传的文件为空：{}", file);
            return "上传的文件不能为空";
        }
        //获得文件名
        String oldName = file.getOriginalFilename();
        //校验文件类型
        String contentType = file.getContentType();
        if(!CONTENT_TYPES.contains(contentType)){
            logger.info("上传的文件类型不合法：{}", file);
            return "上传的文件类型不合法";
        }
        //检验文件内容
        try {
            BufferedImage readImage = ImageIO.read(file.getInputStream());
            if (readImage == null) {
                logger.info("上传的文件内容不合法：{}", oldName);
                return "上传的文件内容不合法";
            }

            //重命名  保证上传的文件名不重复
            String newName = UUID.randomUUID().toString() + oldName.substring(oldName.lastIndexOf("."), oldName.length());
            //查看文件大小
            int size = (int) file.getSize();
            System.out.println(oldName + "-->" + size + "kb");
            //保存到服务器
            String path = "E:/test";
            File dest = new File(path + "/" + newName);
            //判断文件父目录是否存在  不存在创建目录
            if (!dest.getParentFile().exists()) {
                dest.getParentFile().mkdir();
            }
            //保存文件
            file.transferTo(dest);
            return "E:\\test\\" + newName;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "上传成功";
    }
    //返回url进行回显

    /**
     * 实现多文件上传
     */

    @RequestMapping(value = "multifileUpload", method = RequestMethod.POST)
    @ResponseBody
    public String multifileUpload(HttpServletRequest request) {

        List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("fileName");

        if (files.isEmpty()) {
            return "false";
        }

        String path = "E:/test";

        for (MultipartFile file : files) {
            String fileName = file.getOriginalFilename();
            int size = (int) file.getSize();
            System.out.println(fileName + "-->" + size);

            if (file.isEmpty()) {
                return "false";
            } else {
                File dest = new File(path + "/" + fileName);
                if (!dest.getParentFile().exists()) { //判断文件父目录是否存在
                    dest.getParentFile().mkdir();
                }
                try {
                    file.transferTo(dest);
                } catch (Exception e) {
                    e.printStackTrace();
                    return "false";
                }
            }
        }
        return "true";
    }
}




/*
package com.huawei.hw_shopping.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

*/


/**
 * 文件上传控制器
 *//*

@RestController
public class FileUploadController {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd/");

    @PostMapping("/upload")
    public String upload(MultipartFile uploadFile, HttpServletRequest request) {
        String realPath = request.getSession().getServletContext().getRealPath("/uploadFile/");
        String format = sdf.format(new Date());
        File folder = new File(realPath + format);
        if (!folder.isDirectory()){
            folder.mkdirs();
        }
        String oldName = uploadFile.getOriginalFilename();
       String newName= UUID.randomUUID().toString()+oldName.substring(oldName.lastIndexOf("."),oldName.length());
       try {
           uploadFile.transferTo(new File(folder,newName));
           String filePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/uploadFile/"+format+newName;
           return filePath;
       }catch (IOException e){
           e.printStackTrace();
       }
       return "上传失败";
    }



}
*/