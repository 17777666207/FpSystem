package org.ph.dao;


import org.ph.entity.*;

import java.util.List;

public interface UserDao {
    /***
     * 注册成为用户
     * @param user
     * @return
     */
    int insertUser(User user);

    /***
     * 用户登录
     * @param user
     * @return
     */
    User selectUserOfLogin(User user);

    /**
     * 累计参与项目
     *
     * @param id
     * @return
     */
    int select_order_sum(int id);

    /***
     * 用户修改信息
     * @param user
     * @return
     */
    int updateUserInfo(User user);

    /***
     * 用户修改密码
     * @param user
     * @return
     */
    int updateUserPwd(User user);

    /***
     * 用户修改密码查询
     * @param user
     * @return
     */
    User selectUserOfUpdate(User user);

    /***
     * 查询系统文章
     * @return
     */
    List<Article> selectArticle();

    /***
     * 查询文章(status)
     * @return
     */
    List<Article> select_article_status(Article article);


    /**
     * 查询具体文章
     *
     * @param id
     * @return
     */
    Article selectArticle_order(int id);

    /**
     * 当捐助金额达到，进行清算
     *
     * @param id
     * @return
     */
    int update_clear(int id);

    /***
     * 查询系统文章分类
     * @return
     */
    List<ArticleClass> selectArticleClass();

    /***
     * 文章发布保存(管理员)
     * @return
     */
    int article_save(Article article);

    /**
     * 文章发布保存(用户)
     *
     * @param article
     * @return
     */
    int att_article_save(Article article);


    //---------支付宝

    /**
     * 订单初建立
     *
     * @param order
     * @return
     */
    int insert_payOrder(Order order);

    Order select_orderByOut_trade_no(String out_trade_no);

    /**
     * 订单二次完善
     *
     * @param order
     * @return
     */
    int insert_payOrder_second(Order order);

    /**
     * 按id查询用户订单
     *
     * @param id
     * @return
     */
    List<Order> select_order(Integer id);

    /**
     * 认证用户保存
     *
     * @param attestation
     * @return
     */
    int attestation_save(Attestation attestation);

    /**
     * 查user
     *
     * @return
     */
    List<User> select_user();

    /**
     * 查询捐助总额-首页
     *
     * @param order
     * @return
     */
    double select_sum(Order order);

    /**
     * 询捐助总额-个人中心
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
    List<Article> select_article_user(Integer id);

    /**
     * 贫困用户查询需求进度
     *
     * @param article
     * @return
     */
    List<Article> select_article_u_search(Article article);

    /**
     * 用户认证时修改user表状态为3->正在认证
     *
     * @param user
     * @return
     */
    boolean update_user_att(User user);


    /***
     * 现在是查询所有用户。也就是user表
     * @return
     */
    List<User> select_ningjinhuan();


}
