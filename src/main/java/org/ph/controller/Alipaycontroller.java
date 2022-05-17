package org.ph.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.util.StringUtil;
import org.ph.entity.Article;
import org.ph.entity.ArticleClass;
import org.ph.entity.Order;
import org.ph.entity.User;
import org.ph.service.AdminService;
import org.ph.service.UserService;
import org.ph.util.My_util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;

@Controller
@RequestMapping("pay")
public class Alipaycontroller {

    @Autowired
    UserService userServic;

    @Autowired
    AdminService adminService;

    @RequestMapping("alipay.trade.page.pay.do")
    public void alipay_page_pay(Order order, Order order_first, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        response.setCharacterEncoding("UTF-8");

        //获s得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = "";
        String total_amount = "";
        String subject = "";
        String sb = "";
        String body = "";

        try {
            out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
            //付款金额，必填
            total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"), "UTF-8");
            //订单名称，必填
            sb = new String(request.getParameter("WIDsubject").getBytes("UTF-8"), "UTF-8");
//			subject= new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
            subject = sb;
            //商品描述，可空
            body = new String(request.getParameter("WIDbody").getBytes("UTF-8"), "UTF-8");
        } catch (UnsupportedEncodingException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        //---完善订单
        order.setOut_trade_no(out_trade_no);
        order.setTotal_amount(total_amount);
        order.setBody(body);
        order.setSubject(sb);
        boolean b = userServic.insert_payOrder(order);

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
        //alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
        //		+ "\"total_amount\":\""+ total_amount +"\"," 
        //		+ "\"subject\":\""+ subject +"\"," 
        //		+ "\"body\":\""+ body +"\"," 
        //		+ "\"timeout_express\":\"10m\"," 
        //		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

        //请求
        String result = "";
        try {
            result = alipayClient.pageExecute(alipayRequest).getBody();
        } catch (AlipayApiException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        //输出2
        try {
            response.getWriter().println("<html>\r\n" +
                    "<head>\r\n" +
                    "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n" +
                    "<title>付款</title>\r\n" +
                    "</head>" + result + "<body>\r\n" +
                    "</body>\r\n" +
                    "</html>");
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


    @RequestMapping("return_url.do")
    public String article_show(Article article, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws AlipayApiException, UnsupportedEncodingException {

        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
//			//乱码解决，这段代码在出现乱码时使用
//			valueStr = new String(valueStr.getBytes("utf-8"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——
        Order order1 = new Order();
        if (signVerified) {
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            //付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

            order1 = userServic.select_orderByOut_trade_no(out_trade_no);
            order1.setTrade_no(trade_no);
            order1.setPay_status(1);
            boolean b = userServic.insert_payOrder_second(order1);

            //判断是否达到目标金额
            double v = userServic.select_sum(order1);
            Article article1 = userServic.selectArticle_order(order1.getArticle_id());
            System.out.println(Integer.parseInt(article1.getTarget()) <= v);
            if (Integer.parseInt(article1.getTarget()) <= v) {
                boolean b1 = userServic.update_clear(order1.getArticle_id());
                System.out.println(b1);
            }


        } else {
            try {
                response.getWriter().println("验签失败");
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        int id;
        request.setAttribute("ac_id", order1.getArticle_id());
        return "redirect:../admin/show_particulars.do?id=" + order1.getArticle_id();
//		 return "redirect:../pkAbout.jsp";

    }

    @RequestMapping("notify_url.do")
    public void notify_url(Article article, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {


    }

    /**
     * 支付首页
     *
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_pay.do")
    public String show_pay(Order order, Order order_first, String id, String article_id, String title, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {

        //----------创建订单--------------

        Article article = adminService.selectArticle(Integer.parseInt(article_id));
        ArticleClass articleClass = adminService.selectArticleClass(article.getArticleClass_id());
        order.setH_id(Integer.parseInt(article.getUser_id()));//set受助用户id
        User user = new User();
        if (StringUtil.isNotEmpty(id)) {
            user.setId(Integer.parseInt(id));
            order.setUser_account("匿名用户");
        } else {
            user = (User) session.getAttribute("user");//获取当前登录id
            order.setUser_account(user.getAccount());
        }
        order.setUser_id(user.getId());

        order.setSubject(title);
        order.setArticle_id(Integer.parseInt(article_id));
        order.setArticleClass(articleClass.getClassName());
        order.setPay_status(0);
        My_util my_util = new My_util();


        order.setAddTime(my_util.change_time());
        request.setAttribute("order", order);

        //----------订单结束--------------
        return "alipay/pay_index";

    }

//	/**
//	 * 支付首页
//	 * @param request
//	 * @param response
//	 * @param session
//	 * @return
//	 */
//	@RequestMapping("create_order_first.do")
//	public String create_order_first(Order order, String className,String article_id,String title,HttpServletRequest request, HttpServletResponse response , HttpSession session){
//
//
//		return "forward:alipay.trade.page.pay.do";

//	}


}
