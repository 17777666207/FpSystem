package org.ph.service;

import com.github.pagehelper.PageInfo;
import org.ph.entity.*;

import java.util.List;

public interface AdminService {


    /***
     * 发布文章分类保存
     * @param articleClass
     * @return
     */
    public boolean articleClass_save(ArticleClass articleClass);

    /**
     * 查询系统文章(不分页)
     *
     * @return
     */
    public List<Article> select_Article();

    /***
     * 查询系统文章分类(分页)
     * @return
     */
    public PageInfo<Article> selectArticle_fy(int id, int PageNum, int PageSize);

    /***
     * id查文章
     * @param id
     * @return
     */
    public Article selectArticle(Integer id);

    /***
     * id查文章分类
     * @param id
     * @return
     */
    public ArticleClass selectArticleClass(Integer id);


    /***
     * 更新文章
     * @return
     */
    boolean update_Article(Article article);

    /***
     * 更新文章分类
     * @return
     */
    boolean update_ArticleClass(ArticleClass articleClass);

    /****
     * 项目管理中查询（articleClass_id,title）
     * @param article
     * @return
     */
//    List<Article> select_title_articleClass_id(Article article);
    PageInfo<Article> select_title_articleClass_id(Article article, int PageNum, int PageSize);


    /***
     * 项目管理中查询文章分类（className）
     * @param articleClass
     * @return
     */
//    List<ArticleClass>  select_className(ArticleClass articleClass);
    PageInfo<ArticleClass> select_className(ArticleClass articleClass, int PageNum, int PageSize);


    /***
     * 删除——系统文章
     * @param id
     * @return
     */
    boolean delete_article(String id);

    /**
     * 删除——系统文章l(外键删除)
     *
     * @param articleClass_id
     * @return
     */
    boolean delete_article_accid(String articleClass_id);

    /**
     * 删除——系统文章分类
     *
     * @param id
     * @return
     */
    boolean delete_articleClass(String id);


    /***
     * 查询系统文章(分页)
     * @return
     */
    public PageInfo<Article> selectArticle_pgInfo(int PageNum, int PageSize);

    /**
     * 首页查询系统项目文章(分页)
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Article> select_S_Article_pgInfo(int PageNum, int PageSize);

    /**
     * 首页查询用户项目文章(分页)
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Article> select_U_Article_pgInfo(int PageNum, int PageSize);

    /***
     * 查询系统文章分类(分页)
     * @return
     */
    public PageInfo<ArticleClass> selectArticleClass_pgInfo(int PageNum, int PageSize);

    /**
     * 管理员订单显示
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Order> select_order(int PageNum, int PageSize);

    /**
     * 按文章id查询订单
     *
     * @param id
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Order> select_order_aid(int id, int PageNum, int PageSize);

    /**
     * 管理员订单显示_模糊查询
     *
     * @param order
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Order> select_order_search(Order order, int PageNum, int PageSize);

    /**
     * 爱心进度模糊查询
     *
     * @param article
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Article> select_ac_search(Article article, int PageNum, int PageSize);

    /**
     * 查看申请(分页)
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Attestation> select_attestation(int PageNum, int PageSize);

    /**
     * 查看申请_搜索(分页)
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Attestation> select_attestation_search(Attestation attestation, int PageNum, int PageSize);

    /**
     * 查看申请详情
     *
     * @param id
     * @return
     */
    public Attestation select_attestation_more(int id);

    /**
     * 通过attestationId查申请人id
     *
     * @param attestation
     * @return
     */
    public Attestation select_userId_of_attestationId(Attestation attestation);

    /**
     * 审核员审核
     *
     * @param attestation
     * @return
     */
    public boolean update_att_status(Attestation attestation);

    /**
     * 需求发布审核
     *
     * @return
     */
    public boolean update_article_apply(Article article);

    /**
     * 需求发布审核-search_title
     *
     * @param article
     * @return
     */
    public PageInfo<Article> article_apply_search(Article article, int PageNum, int PageSize);

    /**
     * 受助认证成功修改user状态
     *
     * @param user
     * @return
     */
    boolean update_user_status(User user);

    /**
     * 查询订单信息：user_name,文章分类名称，捐款总数
     *
     * @return
     */
    PageInfo<Article> select_article_all(int PageNum, int PageSize);

    /**
     * 爱心进度清算
     *
     * @param article
     * @return
     */
    boolean clear_article(Article article);

    /**
     * 查询订单信息：user_name,文章分类名称，捐款总数 模糊查询
     *
     * @param article
     * @param PageNum
     * @param PageSize
     * @return
     */
    PageInfo<Article> select_article_all_search(Article article, int PageNum, int PageSize);

    /**
     * 根据id查账号
     *
     * @param id
     * @return
     */
    public User select_userName(int id);

    /**
     * 根据账号查id
     *
     * @param user
     * @return
     */
    public User select_uid(User user);


}
