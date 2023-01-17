package com.huawei.hw_shopping.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 首页轮播图实体
 */
@Data
@TableName("HW_SHOPPING_CAROUSEL")
@KeySequence(value = "HW_SHOPPING_CAROUSEL_SEQ", clazz = String.class)
public class Carousel {
    //轮播id
    @TableId(value = "CAROUSEL_ID", type = IdType.INPUT)
    String carouselId;
    //轮播图
    String carouselUrl;
    //点击后的跳转地址
    String redirectUrl;
    //排序值
    Integer carouselRank;
    //是否删除 0-未删除 1-已删除
    Integer isDeleted;
    //创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date createTime;
    //更新时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date updateTime;
    //更新人
    String updateUser;
}
