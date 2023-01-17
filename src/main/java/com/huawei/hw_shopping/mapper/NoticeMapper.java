package com.huawei.hw_shopping.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.huawei.hw_shopping.model.Notice;
import com.huawei.hw_shopping.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * MyBatis  SQL Mapper
 */
@Mapper
@Component
public interface NoticeMapper extends BaseMapper<Notice> {
     List<Notice> selectAllNotice();
}
