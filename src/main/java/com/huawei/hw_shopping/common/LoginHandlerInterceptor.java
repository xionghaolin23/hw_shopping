
package com.huawei.hw_shopping.common;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 登录拦截器
 * 登陆检查
 * 执行循序 preHandle-controller-postHandle-afterCompletion
 */

public class LoginHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //System.out.println("前置方法");
        Object loginUser = request.getSession().getAttribute("loginUser");
        Object Adminuser = request.getSession().getAttribute("AdminUser");
        if (loginUser != null||Adminuser!=null) {
            //登录  放行
            return true;
        } else {
            //未登录  返回登陆页面
            request.setAttribute("errorInfo", "没有权限访问，请先登录");
            request.getRequestDispatcher("/login.html").forward(request, response);
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        //System.out.println("后置方法");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        //System.out.println("完成方法");
    }
}

