package com.huawei.hw_shopping.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;

@Data
@TableName("HW_SHOPPING_NOTICE")
@KeySequence(value = "HW_SHOPPING_NOTICE_SEQ", clazz = String.class)
public class Notice {
    @TableId(value = "N_ID", type = IdType.INPUT)
    private  String nId;
    //公告内容
    private String nContent;
    //创建者
    private String releaseName;
    //创建时间
    private Date createTime;

}
