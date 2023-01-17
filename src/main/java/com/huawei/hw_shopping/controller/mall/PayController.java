package com.huawei.hw_shopping.controller.mall;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.request.AlipayTradeWapPayRequest;
import com.huawei.hw_shopping.config.AlipayConfig;
import com.huawei.hw_shopping.model.Order;
import com.huawei.hw_shopping.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;


@Controller
@RequestMapping("/pay")
public class PayController {

    @Autowired
    IOrderService orderService;
    /**
     * 支付
     *
     * @param out_trade_no 订单号
     * @param subject      订单内容
     * @param total_amount 总价格
     * @return
     * @throws Exception
     */
    @RequestMapping("/toPay")
    @ResponseBody
    public String toPay(String out_trade_no, String subject, String total_amount) throws Exception {
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl,
                AlipayConfig.app_id,
                AlipayConfig.merchant_private_key,
                "json", AlipayConfig.charset,
                AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        String form = alipayClient.pageExecute(alipayRequest).getBody();
        //System.out.println(form);
        return form;
    }

    @RequestMapping(value = "/refund/{orderNo}", method = RequestMethod.GET)

    public String refund(HttpServletResponse httpResponse, HttpServletResponse response, HttpSession session, @PathVariable String orderNo) throws IOException, AlipayApiException {

        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();

        //获得初始化的AlipayClient

        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl,
                AlipayConfig.app_id,
                AlipayConfig.merchant_private_key,
                "json", AlipayConfig.charset,
                AlipayConfig.alipay_public_key,
                AlipayConfig.sign_type);

        //设置请求参数

        AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();

        Order order = orderService.selectOrderNo(orderNo);


        //商户订单号，必填

       String out_trade_no = order.getOrderNo();
        //需要退款的金额，该金额不能大于订单金额，必填
        String refund_amount =String.valueOf(order.getTotalPrice());

        //标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
        String out_request_no = new String(UUID.randomUUID().toString());

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"refund_amount\":\""+ refund_amount +"\","
                + "\"out_request_no\":\""+ out_request_no +"\"}");

        //请求

        String result = alipayClient.execute(alipayRequest).getBody();
        //输出
        order.setPayStatus(0);
        boolean b = orderService.updateById(order);
        return "redirect:/index.html";
    }

}








