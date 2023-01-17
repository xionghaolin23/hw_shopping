package com.huawei.hw_shopping.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.huawei.hw_shopping.model.Notice;

import java.util.List;


public interface INoticeService extends IService<Notice> {

    List<Notice> selectAllNotice();

}
