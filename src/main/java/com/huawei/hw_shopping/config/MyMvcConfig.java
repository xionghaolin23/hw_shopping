package com.huawei.hw_shopping.config;

import com.huawei.hw_shopping.common.Common;
import com.huawei.hw_shopping.common.LoginHandlerInterceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 配置拦截器
 */

@Configuration
public class MyMvcConfig implements WebMvcConfigurer {

    private static final Logger logger = LoggerFactory.getLogger(WebMvcConfigurer.class);

    @Override

    /**
     * @param registry 视图映射器
     *                 向浏览器发送/请求来到页面index.html
     */
    public void addViewControllers(ViewControllerRegistry registry) {
        //registry.addViewController("/").setViewName("users/index");
       // registry.addViewController("/index.html").setViewName("users/index");
        registry.addViewController("/login.html").setViewName("users/user/login");
        registry.addViewController("/adminLogin.html").setViewName("admin/views/index");
        registry.addViewController("/register.html").setViewName("users/user/register");
        registry.addViewController("/findBackPassword.html").setViewName("users/user/findBackPassword");
        registry.addViewController("/console.html").setViewName("admin/views/home/console");
        registry.addViewController("/homepage1.html").setViewName("admin/views/home/homepage1");
        registry.addViewController("/homepage2.html").setViewName("admin/views/home/homepage2");
        registry.addViewController("/userList.html").setViewName("admin/views/user/user/list");
        registry.addViewController("/administratorsList.html").setViewName("admin/views/user/administrators/list");
        registry.addViewController("/addUser.html").setViewName("admin/views/user/user/addUser");
        registry.addViewController("/addAdmin.html").setViewName("admin/views/user/administrators/addAdmin");
        //
        registry.addViewController("/demo.html").setViewName("demo");
        registry.addViewController("/ds.html").setViewName("ds");
        registry.addViewController("/file.html").setViewName("file");
        registry.addViewController("/multifile.html").setViewName("multifile");
        registry.addViewController("/updateCarousel.html").setViewName("admin/views/user/user/updateUsers");
        registry.addViewController("/goodsDetail.html").setViewName("product/goodsDetail");


        registry.addViewController("/zone.html").setViewName("users/product/zone");
        registry.addViewController("/details.html").setViewName("users/product/details");
        registry.addViewController("/nowConfirmCard.html").setViewName("users/order/nowConfirmCard");
        registry.addViewController("/payment.html").setViewName("users/order/payment");
        registry.addViewController("/member-my-order.html").setViewName("users/order/member-my-order");
        registry.addViewController("/member-news-order.html").setViewName("users/order/member-news-order");
        registry.addViewController("/shopping-trolley.html").setViewName("users/product/shopping-trolley");
        registry.addViewController("/product-list.html").setViewName("users/product/product-list");
        //registry.addViewController("/addProduct.html").setViewName("admin/views/product/addProduct");
       // registry.addViewController("/productTypeAdd.html").setViewName("admin/views/product/productTypeAdd");
        registry.addViewController("/a.html").setViewName("users/a");

        /*模板*/
        registry.addViewController("/addresslist.html").setViewName("admin/views/template/addresslist");
        registry.addViewController("/personalpage.html").setViewName("admin/views/template/personalpage");
        registry.addViewController("/caller.html").setViewName("admin/views/template/caller");
        registry.addViewController("/goodslist.html").setViewName("admin/views/template/goodslist");
        registry.addViewController("/msgboard.html").setViewName("admin/views/template/msgboard");
        registry.addViewController("/search.html").setViewName("admin/views/template/search");
        registry.addViewController("/reg.html").setViewName("admin/views/user/reg");
        //registry.addViewController("/login.html").setViewName("admin/views/user/login.html");
        registry.addViewController("/forget.html").setViewName("admin/views/user/forget");
        registry.addViewController("/404.html").setViewName("admin/views/template/tips/404");
        registry.addViewController("/error.html").setViewName("admin/views/template/tips/error");
        //应用
        registry.addViewController("/list.html").setViewName("admin/views/app/content/list");
        registry.addViewController("/tags.html").setViewName("admin/views/app/content/tags");
        registry.addViewController("/comment.html").setViewName("admin/views/app/content/comment");
        registry.addViewController("/forumList.html").setViewName("admin/views/app/forum/list");
        registry.addViewController("/replys.html").setViewName("admin/views/app/forum/replys");
        registry.addViewController("/messageIndex.html").setViewName("admin/views/app/message/index");
        registry.addViewController("/workorderList.html").setViewName("admin/views/app/workorder/list");
        //高级
        registry.addViewController("/line.html").setViewName("admin/views/senior/echarts/line");
        registry.addViewController("/bar.html").setViewName("admin/views/senior/echarts/bar");
        registry.addViewController("/bar.html").setViewName("admin/views/senior/echarts/bar");
        registry.addViewController("/map.html").setViewName("admin/views/senior/echarts/map");

        //头顶信息 set/user/info.html
        registry.addViewController("/info.html").setViewName("admin/views/set/user/info");
        registry.addViewController("/password.html").setViewName("admin/views/set/user/password");
        registry.addViewController("/Member-Center.html").setViewName("users/user/Member-Center");
        registry.addViewController("/member-message-center.html").setViewName("users/user/member-message-center");
        registry.addViewController("/member-news-order.html").setViewName("users/order/member-news-order");
        registry.addViewController("/member-delivery-address.html").setViewName("users/user/member-delivery-address");
        registry.addViewController("/member-delivery-address.html").setViewName("users/user/member-delivery-address");
        registry.addViewController("/account-center.html").setViewName("users/user/account-center");
        registry.addViewController("/account-user-info.html").setViewName("users/user/account-user-info");

        //商品管理
        registry.addViewController("/productList.html").setViewName("admin/views/product/ProductList");
        registry.addViewController("/addProduct.html").setViewName("admin/views/product/addProduct");
        //订单管理
        registry.addViewController("/orderList.html").setViewName("admin/views/order/orderList");
        registry.addViewController("/addIogistics.html").setViewName("admin/views/order/addIogistics");
        //spu 管理
        registry.addViewController("/spuList.html").setViewName("admin/views/spu/spuList");
        registry.addViewController("/addSpu.html").setViewName("admin/views/spu/addSpu");
        //sku管理
        registry.addViewController("/skuList.html").setViewName("admin/views/sku/skuList");
        registry.addViewController("/addSku.html").setViewName("admin/views/sku/addSku");

        //首页配置
        //轮播图配置
        registry.addViewController("/carouselList.html").setViewName("admin/views/product/indexConfiguration/carouselList");
        registry.addViewController("/addCarousel.html").setViewName("admin/views/product/indexConfiguration/addCarousel");
        //公告配置
        registry.addViewController("/noticeList.html").setViewName("admin/views/product/indexConfiguration/noticConfiguration/noticeList");
        registry.addViewController("/addNotice.html").setViewName("admin/views/product/indexConfiguration/noticConfiguration/addNotice");
        //热销单品配置
        registry.addViewController("/hotList.html").setViewName("/admin/views/product/indexConfiguration/hotConfiguration/hotlList");
        registry.addViewController("/addHot.html").setViewName("/admin/views/product/indexConfiguration/hotConfiguration/addHot");
        registry.addViewController("/updateHot.html").setViewName("/admin/views/product/indexConfiguration/hotConfiguration/updateHot");
        //registry.addViewController("/jIndex.html").setViewName("/admin/views/product/indexConfiguration/hotConfiguration/index.html");
        //精品推荐
        registry.addViewController("/boutiqueList.html").setViewName("/admin/views/product/indexConfiguration/boutiqueConfiguration/boutiqueList");
        //手机配置
        registry.addViewController("/phoneList.html").setViewName("/admin/views/product/indexConfiguration/phoneConfiguration/phoneList");
        registry.addViewController("/addPhone.html").setViewName("/admin/views/product/indexConfiguration/phoneConfiguration/addPhone");
        registry.addViewController("/updatePhone.html").setViewName("/admin/views/product/indexConfiguration/phoneConfiguration/updatePhone");

        registry.addViewController("/pay.html").setViewName("/users/pay");
        //物流
        registry.addViewController("/logistics.html").setViewName("/admin/views/logistics/logistics.html");
        registry.addViewController("/mobile.html").setViewName("/admin/views/product/indexConfiguration/mobile");
    }



    /**
     * @param registry 自定义静态资源映射目录  使能够访问静态资源
     *                 配置项目虚拟路劲映射到磁盘真正的路径
     */
    @Override
       public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String docPath= Common.getConfigUploadPath();
        logger.info("图片的上传路径为{}",docPath);
        registry.addResourceHandler("/upload/**")
                .addResourceLocations(docPath);

    }


    /*@Override
    public void addInterceptors(InterceptorRegistry registry) {
        //指定拦截器类
        //addInterceptor 添加一个拦截器
        // /** 拦截任意多层路径下得 任意请求  addPathPatterns("/**")对所有请求都拦截
        //  excludePathPatterns 排除那些请求
        //指定该类拦截的url，过滤掉指定的url
        registry.addInterceptor(new LoginHandlerInterceptor()).
                addPathPatterns("/**")
                .excludePathPatterns("", "/", "/index", "/index.html","/login.html",
                                     "/details/**","/upload/**","/user/login",
                                      "/user/sendEmail",
                                      "/register.html","/index/serch/",
                                    "/user/register","/static/**");
        //registry.addInterceptor(new LoginHandlerInterceptor()).addPathPatterns("/**").excludePathPatterns("/login.html","/user/login");
    }*/

}
