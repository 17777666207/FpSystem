package org.ph.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.ph.dao.AdminDao;
import org.ph.entity.*;
import org.ph.service.AdminService;
import org.ph.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("adminService")
public class adminDaoImpl implements AdminService {

    @Autowired
    AdminDao adminDao;

    @Autowired
    AdminService adminService;

    @Autowired
    UserService userService;

    /***
     * 发布文章分类保存
     * @param articleClass
     * @return
     */
    public boolean articleClass_save(ArticleClass articleClass) {

        int ret = 0;
        ret = adminDao.insert_articleClass(articleClass);
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 查文章(分页)
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Article> selectArticle_fy(int id, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Article> articles = adminDao.select_Article_accid(id);

        Order order = new Order();  //查询总金额
        for (Article article : articles) {
            order.setArticle_id(article.getId());//获取文章id
            double v = 0;
            try {
                v = userService.select_sum(order);
                if (!(v > 0)) {
                    v = 0.0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            article.setTotal(v);
        }
        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        return pageInfo;
    }

    /**
     * 查文章(不分页)
     *
     * @return
     */
    public List<Article> select_Article() {
        List<Article> articles = adminDao.select_Article();
        return articles;
    }

    /**
     * id查文章
     *
     * @param id
     * @return
     */
    public Article selectArticle(Integer id) {
        Article article = adminDao.selectArticle(id);
        return article;
    }

    /***
     * id查文章分类
     * @param id
     * @return
     */
    public ArticleClass selectArticleClass(Integer id) {
        ArticleClass articleClass = adminDao.selectArticleClass(id);
        return articleClass;
    }

    /***
     * 更新文章分类
     * @return
     */
    public boolean update_Article(Article ac) {
        boolean b = false;
        int ret = 0;
        ret = adminDao.update_Article(ac);
        if (ret > 0) {
            b = true;
            return b;
        } else {
            return b;
        }

    }

    /****
     * 更新文章分类
     * @return
     */
    public boolean update_ArticleClass(ArticleClass acc) {
        boolean b = false;
        int ret = 0;
        ret = adminDao.update_ArticleClass(acc);
        if (ret > 0) {
            b = true;
            return b;
        } else {
            return b;
        }
    }


    /***
     * 项目管理中模糊查询（articleClass_id,title）
     * @param article
     * @return
     */
    public PageInfo<Article> select_title_articleClass_id(Article article, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);//设置分页信息,当前页，页面总数
        List<Article> articles = adminDao.select_title_articleClass_id(article);
        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        return pageInfo;
    }

    /***
     * 项目管理中模糊查询文章分类（className）
     * @param articleClass
     * @return
     */
    public PageInfo<ArticleClass> select_className(ArticleClass articleClass, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);//设置分页信息,当前页，页面总数
        List<ArticleClass> articleClasses = adminDao.select_className(articleClass);
        PageInfo<ArticleClass> pageInfo = new PageInfo<ArticleClass>(articleClasses);
        return pageInfo;
    }

    /**
     * 删除——系统文章
     *
     * @param id
     * @return
     */
    public boolean delete_article(String id) {
        int i = 0;
        i = adminDao.delete_article(id);
        if (i > 0) {
            return true;
        } else {
            return false;
        }

    }

    /***
     * 删除——系统文章l(外键删除)
     * @param articleClass_id
     * @return
     */
    public boolean delete_article_accid(String articleClass_id) {
        int i = 0;
        i = adminDao.delete_article_accid(articleClass_id);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    /***
     * 删除——系统文章分类
     * @param id
     * @return
     */
    public boolean delete_articleClass(String id) {
        int i = 0;
        i = adminDao.delete_articleClass(id);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }


    /***
     * 查询文章(分页)
     * @return
     */
    public PageInfo<Article> selectArticle_pgInfo(int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);//设置分页信息,当前页，页面总数
        List<Article> articles = adminDao.selectArticle_pgInfo(PageNum, PageSize);
        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        return pageInfo;
    }

    /***
     * 首页查询系统项目文章(分页)
     * @return
     */
    public PageInfo<Article> select_S_Article_pgInfo(int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);//设置分页信息,当前页，页面总数
        List<Article> articles = adminDao.select_S_Article_pgInfo(PageNum, PageSize);

        Order order = new Order();  //查询总金额
        for (Article article : articles) {
            order.setArticle_id(article.getId());//获取文章id
            double v = 0;
            try {
                v = userService.select_sum(order);
                if (!(v > 0)) {
                    v = 0.0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            article.setTotal(v);
        }

        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        return pageInfo;
    }

    /***
     * 首页查询用户项目文章(分页)
     * @return
     */
    public PageInfo<Article> select_U_Article_pgInfo(int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);//设置分页信息,当前页，页面总数
        List<Article> articles = adminDao.select_U_Article_pgInfo(PageNum, PageSize);

        Order order = new Order();  //查询总金额
        for (Article article : articles) {
            order.setArticle_id(article.getId());//获取文章id
            double v = 0;
            try {
                v = userService.select_sum(order);
                if (!(v > 0)) {
                    v = 0.0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            article.setTotal(v);
        }

        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        return pageInfo;
    }

    /***
     * 查询文章分类(分页)
     * @return
     */
    public PageInfo<ArticleClass> selectArticleClass_pgInfo(int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<ArticleClass> acc = adminDao.selectArticleClass_pgInfo(PageNum, PageSize);
        PageInfo<ArticleClass> articleClassPageInfo = new PageInfo<ArticleClass>(acc);
        return articleClassPageInfo;
    }

    /**
     * 管理员订单显示
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Order> select_order(int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Order> orders = adminDao.select_order();
        PageInfo<Order> pageInfo = new PageInfo<Order>(orders);
        return pageInfo;
    }

    public PageInfo<Order> select_order_aid(int id, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        Order order = new Order();
        order.setArticle_id(id);
        List<Order> orders = adminDao.select_order_aid(order);
        PageInfo<Order> pageInfo = new PageInfo<Order>(orders);
        return pageInfo;
    }

    /**
     * 爱心管理模糊查询
     *
     * @param order
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Order> select_order_search(Order order, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Order> orders = adminDao.select_order_search(order);
        PageInfo<Order> pageInfo = new PageInfo<Order>(orders);
        return pageInfo;
    }


    /**
     * 爱心进度模糊查询
     *
     * @param article
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Article> select_ac_search(Article article, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Article> articles = adminDao.select_ac_search(article);
        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        return pageInfo;
    }

    /**
     * 爱心进度清算
     *
     * @param article
     * @return
     */
    public boolean clear_article(Article article) {
        boolean b = adminDao.clear_article(article);
        return b;
    }

    /**
     * 查询申请列表
     *
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Attestation> select_attestation(int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Attestation> attestation = adminDao.select_attestation();
        PageInfo<Attestation> pageInfo = new PageInfo<Attestation>(attestation);
        return pageInfo;
    }

    /**
     * 查询申请列表(搜素)
     *
     * @param a
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Attestation> select_attestation_search(Attestation a, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Attestation> attestation = adminDao.select_attestation_search(a);
        PageInfo<Attestation> pageInfo = new PageInfo<Attestation>(attestation);
        return pageInfo;
    }

    /**
     * 申请详情
     *
     * @param id
     * @return
     */
    public Attestation select_attestation_more(int id) {
        Attestation attestations = adminDao.select_attestation_more(id);
        return attestations;
    }

    /**
     * 通过attestationId查申请人id
     *
     * @param attestation
     * @return
     */
    public Attestation select_userId_of_attestationId(Attestation attestation) {
        Attestation attestation1 = adminDao.select_userId_of_attestationId(attestation);
        return attestation1;
    }

    /**
     * 受助认证审核
     *
     * @param attestation
     * @return
     */
    public boolean update_att_status(Attestation attestation) {
        int i = 0;
        i = adminDao.update_att_status(attestation);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 文章发布审核
     *
     * @param article
     * @return
     */
    public boolean update_article_apply(Article article) {
        int i = 0;
        i = adminDao.update_article_apply(article);
        if (i > 0) {
            return true;
        } else {
            return false;
        }

    }

    /**
     * 文章发布审核_search
     *
     * @param article
     * @return
     */
    public PageInfo<Article> article_apply_search(Article article, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Article> articles = adminDao.article_apply_search(article);
        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        return pageInfo;
    }

    /**
     * 受助认证成功修改user状态
     *
     * @param user
     * @return
     */
    public boolean update_user_status(User user) {
        int i = 0;
        i = adminDao.update_user_status(user);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 查询订单信息：user_name,文章分类名称，捐款总数
     *
     * @return
     */
    public PageInfo<Article> select_article_all(int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Article> article1 = adminDao.select_article_all();

        Order order = new Order();  //查询总金额
        for (Article article : article1) {
            order.setH_id(Integer.parseInt(article.getUser_id()));//获取捐款人id
            order.setArticle_id(article.getId());//获取文章id
            double v = 0;
            try {
                v = userService.select_sum_user(order);
                if (!(v > 0)) {
                    v = 0.0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            article.setTotal(v);
        }
        PageInfo<Article> pageInfo = new PageInfo<Article>(article1);

        return pageInfo;
    }

    /**
     * 查询订单信息：user_name,文章分类名称，捐款总数，模糊总数
     *
     * @param ac
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Article> select_article_all_search(Article ac, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Article> article1 = adminDao.select_article_all_search(ac);


        Order order = new Order();  //查询总金额
        for (Article article : article1) {
            order.setH_id(Integer.parseInt(article.getUser_id()));//获取捐款人id
            order.setArticle_id(article.getId());//获取文章id
            double v = 0;
            try {
                v = userService.select_sum(order);
                if (!(v > 0)) {
                    v = 0.0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            article.setTotal(v);
        }
        PageInfo<Article> pageInfo = new PageInfo<Article>(article1);

        return pageInfo;
    }

    /***
     * 根据id查账号（爱心进度）
     * @param id
     * @return
     */
    public User select_userName(int id) {
        User user = adminDao.select_userName(id);
        return user;
    }

    /**
     * 根据账号查id（爱心进度）
     *
     * @param user
     * @return
     */
    public User select_uid(User user) {
        User user1 = adminDao.select_uid(user);
        return user1;
    }
}

