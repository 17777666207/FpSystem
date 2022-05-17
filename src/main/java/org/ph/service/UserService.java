package org.ph.service;

import com.github.pagehelper.PageInfo;
import org.ph.entity.*;

import java.util.List;

public interface UserService {

    /***
     * 用户注册
     * @param user
     * @return
     */
    public boolean registerUser(User user);

    /***
     * 用户登录
     * @param user
     * @return
     */
    public User selectUserOfLogin(User user);

    /**
     * 累计参与项目
     *
     * @param id
     * @return
     */
    public int select_order_sum(int id);

    /***
     * 用户修改信息
     * @param user
     * @return
     */
    public boolean updateUserInfo(User user);

    /***
     * 用户修改密码
     * @param user
     * @return
     */
    public boolean updateUserPwd(User user);

    /***
     * 用户修改密码查询
     * @param user
     * @return
     */
    public boolean selectUserOfUpdate(User user);


    /***
     * 查询系统文章(不分页)
     * @return
     */
    public List<Article> selectArticle();

    /**
     * 查询文章(status)
     *
     * @param article
     * @return
     */
    public PageInfo<Article> select_article_status(Article article, int PageNum, int PageSize);

    /**
     * 查询具体文章
     *
     * @param id
     * @return
     */
    public Article selectArticle_order(int id);

    /**
     * 当捐助金额达到，进行清算
     *
     * @param id
     * @return
     */
    public boolean update_clear(int id);

    /***
     * 查询系统文章分类(不分页)
     * @return
     */
    public List<ArticleClass> selectArticleClass();


    /***
     * 文章发布保存（管理员）
     * @param article
     * @return
     */
    public boolean article_save(Article article);

    /**
     * 文章发布保存（管理员）
     *
     * @param article
     * @return
     */
    public boolean att_article_save(Article article);


    //支付宝

    /**
     * 订单初建立
     *
     * @param order
     * @return
     */
    public boolean insert_payOrder(Order order);

    public Order select_orderByOut_trade_no(String out_trade_no);

    /**
     * 订单二次完善
     *
     * @param order
     * @return
     */
    public boolean insert_payOrder_second(Order order);

    /**
     * id查用户订单
     *
     * @param id
     * @return
     */
    public PageInfo<Order> select_order_id(int id, int PageNum, int PageSize);

    /***
     * 用户认证保存
     * @param attestation
     * @return
     */
    public boolean attestation_save(Attestation attestation);

    /**
     * 用户认证时修改user表状态为3->正在认证
     *
     * @param id
     * @return
     */
    public boolean update_user_att(int id);

    /**
     * 查 user
     *
     * @return
     */
    public List<User> select_user();

    /**
     * 查询捐助总额
     *
     * @param order
     * @return
     */
    double select_sum(Order order);

    /**
     * 查询user捐助总额(爱心进度)
     *
     * @param order
     * @return
     */
    double select_sum_user(Order order);

    /**
     * 贫困用户查看需求进度
     *
     * @param id
     * @return
     */
    PageInfo<Article> select_article_user(int id, int PageNum, int PageSize);

    /**
     * 贫困用户查询需求进度
     *
     * @param id
     * @param article
     * @param PageNum
     * @param PageSize
     * @return
     */
    PageInfo<Article> select_article_u_search(Article article, int PageNum, int PageSize);

    /**
     * 接收dao层传送回来的数据
     *
     * @return
     */
    List<User> select_ningjinhuan();

}
