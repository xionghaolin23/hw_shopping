package com.huawei.hw_shopping.controller.admin;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.huawei.hw_shopping.controller.common.BaseController;
import com.huawei.hw_shopping.model.Notice;
import com.huawei.hw_shopping.service.INoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 公告
 */
@Controller
@RequestMapping("/notice")
public class NoticeController extends BaseController {

    @Resource
    INoticeService iNoticeService;


    /** 查看所有公告
     * @return
     */
    @RequestMapping("selectAllNotice")
    @ResponseBody
    public String selectAllNotice(){
        List<Notice> notices = iNoticeService.selectAllNotice();
        JSONObject obj = new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count", 10);
        obj.put("data", notices);
        return JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd  HH:mm:ss");
    }

    /** 新增公告
     * @param notice
     * @return
     */
    @RequestMapping("noticeAdd")
    @ResponseBody
    public Map<String,Object> noticeAdd(Notice notice){
        HashMap<String,Object> map= new HashMap();
        if(getAdminUser().getUserName()!=null){
            notice.setReleaseName(getAdminUser().getUserName());
        }
        boolean save = iNoticeService.save(notice);
        if (save) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }


    /**根据ID查询出公告回显
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/selectById/id={id}")
    public String noticeUpdateById(Model model, @PathVariable("id") Serializable id) {

        Notice noticeById = iNoticeService.getById(id);
        model.addAttribute("noticeById", noticeById);
        //或者用户数据后  跳转到新的页面显示
        return "admin/views/product/indexConfiguration/noticConfiguration/updateNotice";
    }

    /**更新
     * @param notice
     * @return
     */
    @ResponseBody
    @RequestMapping("/noticeUpdateById")
    public Map<String, Object> updateById(Notice notice) {
        Map<String, Object> map = new HashMap<>();
        boolean result = iNoticeService.updateById(notice);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }

    }

    /** 根据ID删除
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/noticeDeleteById/{id}")
    public Map<String, Object> noticeDeleteById(@PathVariable("id") Serializable id) {
        Map<String, Object> map = new HashMap<>();
        System.out.println(id);
        boolean result = iNoticeService.removeById(id);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }

    /**
     * @param
     * @return 批量删除
     */
    @ResponseBody
    @RequestMapping("/noticeDeleteByIdAll")
    //@RequestParam 此注解作用 传递参数名字不一样的时候用 前台 <a href=user/login?name='xhl'>
    //控制器中可以用@RequestParam(value = "name")String username) 意思是把超链接中name的值赋给username
    public Map<String, Object> deleteByIdAll(@RequestParam(value = "array[]") Collection<Serializable> listId) {
        Map<String, Object> map = new HashMap<>();
        boolean result = iNoticeService.removeByIds(listId);
        if (result) {
            map.put("success", true);
            return map;
        } else {
            map.put("errorInfo", false);
            return map;
        }
    }
}
