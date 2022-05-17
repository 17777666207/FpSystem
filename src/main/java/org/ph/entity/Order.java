package org.ph.entity;

import com.baomidou.mybatisplus.annotations.TableName;

@TableName("`order`")
public class Order {
    private int id;
    /**
     * 商户订单号
     */
    private String out_trade_no;

    /**
     * 支付宝支付宝交易号
     */
    private String trade_no;

    /**
     * 订单名称
     */
    private String subject;

    /**
     * 订单描述
     */
    private String body;

    /**
     * 总金额
     */
    private String total_amount;

    /**
     * 订单所属用户id,捐款人
     */
    private int user_id;

    /**
     * 受助人id
     */
    private int h_id;

    /**
     * 订单所属用户账号
     */
    private String user_account;

    /**
     * 所属文章分类
     */
    private String articleClass;

    /**
     * 所属文章id
     */
    private int article_id;

    /**
     * 交易状态 0为待支付，1支付成功
     */
    private int pay_status;

    /**
     * 创建时间
     */
    private String addTime;

    public Order() {
    }

    public Order(int id, String out_trade_no, String trade_no, String subject, String body, String total_amount, int user_id, String user_account, String articleClass, int article_id, int pay_status, String addTime) {
        this.id = id;
        this.out_trade_no = out_trade_no;
        this.trade_no = trade_no;
        this.subject = subject;
        this.body = body;
        this.total_amount = total_amount;
        this.user_id = user_id;
        this.user_account = user_account;
        this.articleClass = articleClass;
        this.article_id = article_id;
        this.pay_status = pay_status;
        this.addTime = addTime;
    }

    public Order(String out_trade_no, String subject, String body, String total_amount, int user_id, String user_account, String articleClass, int article_id, int pay_status, String addTime) {
        this.out_trade_no = out_trade_no;
        this.subject = subject;
        this.body = body;
        this.total_amount = total_amount;
        this.user_id = user_id;
        this.user_account = user_account;
        this.articleClass = articleClass;
        this.article_id = article_id;
        this.pay_status = pay_status;
        this.addTime = addTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getTrade_no() {
        return trade_no;
    }

    public void setTrade_no(String trade_no) {
        this.trade_no = trade_no;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(String total_amount) {
        this.total_amount = total_amount;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_account() {
        return user_account;
    }

    public void setUser_account(String user_account) {
        this.user_account = user_account;
    }

    public String getArticleClass() {
        return articleClass;
    }

    public void setArticleClass(String articleClass) {
        this.articleClass = articleClass;
    }

    public int getArticle_id() {
        return article_id;
    }

    public void setArticle_id(int article_id) {
        this.article_id = article_id;
    }

    public int getPay_status() {
        return pay_status;
    }

    public void setPay_status(int pay_status) {
        this.pay_status = pay_status;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public int getH_id() {
        return h_id;
    }

    public void setH_id(int h_id) {
        this.h_id = h_id;
    }
}
