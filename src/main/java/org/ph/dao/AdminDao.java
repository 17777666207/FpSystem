package org.ph.dao;

import com.github.pagehelper.PageInfo;
import org.ph.entity.*;

import java.util.List;

public interface AdminDao {

    /***
     * 发布文章保存
     * @param articleClass
     * @return
     */
    int insert_articleClass(ArticleClass articleClass);

    /**
     * 查询系统文章分类_按所属ArticleClass
     *
     * @return
     */
    List<Article> select_Article();

    /**
     * 查询系统文章分类_按所属ArticleClass
     *
     * @return
     */
    List<Article> select_Article_accid(Integer articleClass_id);

    /***
     * id查文章
     * @param id
     * @return
     */
    Article selectArticle(Integer id);

    /***
     * id查文章分类
     * @param id
     * @return
     */
    ArticleClass selectArticleClass(Integer id);

    /***
     * 更新文章
     * @return
     */
    int update_Article(Article article);

    /***
     * 更新文章分类
     * @return
     */
    int update_ArticleClass(ArticleClass articleClass);

    /***
     * 项目管理中查询（articleClass_id,title）
     * @param article
     * @return
     */
    List<Article> select_title_articleClass_id(Article article);

    /***
     * 项目管理中查询文章分类（className）
     * @param articleClass
     * @return
     */
    List<ArticleClass> select_className(ArticleClass articleClass);

    /***
     * 删除文章
     * @param id
     * @return
     */
    int delete_article(String id);

    /***
     * 删除文章(外键删除)
     * @param articleClass_id
     * @return
     */
    int delete_article_accid(String articleClass_id);

    /***
     * 删除文章文类
     * @param id
     * @return
     */
    int delete_articleClass(String id);

    /***
     * 查询文章（分页）
     * @param PageNum
     * @param PageSize
     * @return
     */
    List<Article> selectArticle_pgInfo(int PageNum, int PageSize);

    /**
     * 首页查询系统项目文章
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    List<Article> select_S_Article_pgInfo(int PageNum, int PageSize);

    /**
     * 首页查询用户项目文章
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    List<Article> select_U_Article_pgInfo(int PageNum, int PageSize);

    /***
     * 查询文章分类（分页）
     * @param PageNum
     * @param PageSize
     * @return
     */
    List<ArticleClass> selectArticleClass_pgInfo(int PageNum, int PageSize);


    /**
     * 订单管理
     *
     * @return
     */
    List<Order> select_order();

    /**
     * 根据文章id查订单
     *
     * @param order
     * @return
     */
    List<Order> select_order_aid(Order order);

    /**
     * 管理员订单显示_模糊查询
     *
     * @return
     */
    List<Order> select_order_search(Order order);

    /**
     * 爱心进度模糊查询
     *
     * @param article
     * @return
     */
    List<Article> select_ac_search(Article article);

    /**
     * 查看申请
     *
     * @return
     */
    List<Attestation> select_attestation();

    /**
     * 查看申请搜索
     *
     * @param attestation
     * @return
     */
    List<Attestation> select_attestation_search(Attestation attestation);

    /**
     * 查看申请详情
     *
     * @param id
     * @return
     */
    Attestation select_attestation_more(Integer id);


    /**
     * 通过attestationId查申请人id
     *
     * @param attestation
     * @return
     */
    Attestation select_userId_of_attestationId(Attestation attestation);

    /**
     * 管理员 受助申请status
     *
     * @param attestation
     * @return
     */
    int update_att_status(Attestation attestation);

    /**
     * 需求发布审核
     *
     * @param article
     * @return
     */
    int update_article_apply(Article article);

    /**
     * 需求发布审核-search_title
     *
     * @param article
     * @return
     */
    List<Article> article_apply_search(Article article);

    /**
     * 受助认证成功修改user状态
     *
     * @param user
     * @return
     */
    int update_user_status(User user);

    /**
     * 查询订单信息：user_name,文章分类名称，捐款总数
     *
     * @return
     */
    List<Article> select_article_all();

    /**
     * 爱心捐助结算
     *
     * @param article
     * @return
     */
    boolean clear_article(Article article);

    /**
     * 查询订单信息：user_name,文章分类名称，捐款总数,模糊查询
     *
     * @param article
     * @return
     */
    List<Article> select_article_all_search(Article article);

    /**
     * 查询userName
     *
     * @param id
     * @return
     */
    User select_userName(Integer id);

    /**
     * 查询用户（账号）
     *
     * @param user
     * @return
     */
    User select_uid(User user);


    ArticleClass select_className_id(Integer id);


}
