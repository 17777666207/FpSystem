package org.ph.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.ph.dao.UserDao;
import org.ph.entity.*;
import org.ph.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class userServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    UserService userService;

    /***
     * 用户注册
     * @param user
     * @return
     */
    public boolean registerUser(User user) {

        Boolean ret = false;
        int b = 0;
        b = userDao.insertUser(user);
        if (b > 0) {
            ret = true;
        }
        return ret;
    }

    /***
     * 用户登录
     * @param user
     * @return
     */
    public User selectUserOfLogin(User user) {

        User get_user = userDao.selectUserOfLogin(user);
        return get_user;
    }

    public int select_order_sum(int id) {
        int order_sum = userDao.select_order_sum(id);
        return order_sum;
    }

    /***
     * 用户注册
     * @param user
     * @return
     */
    public boolean updateUserInfo(User user) {
        Boolean ret = false;
        int result = 0;
        result = userDao.updateUserInfo(user);
        if (result > 0) {
            ret = true;
            return ret;
        } else {
            return ret;
        }
    }

    /***
     * 用户修改密码
     * @param user
     * @return
     */
    public boolean updateUserPwd(User user) {
        System.out.println(user.getId());
        System.out.println(user.getPwd());
        Boolean ret = false;
        int result = 0;
        result = userDao.updateUserPwd(user);
        if (result > 0) {
            ret = true;
            return ret;
        } else {
            return ret;
        }
    }

    /***
     * 用户修改密码查询
     * @param user
     * @return
     */
    public boolean selectUserOfUpdate(User user) {
        Boolean ret = false;
        User get_user = userDao.selectUserOfUpdate(user);
        if (get_user != null) {
            ret = true;
            return ret;
        } else {
            return ret;
        }
    }

    /***
     * 查询文章(不分页)
     * @return
     */
    public List<Article> selectArticle() {

        List<Article> articles = userDao.selectArticle();

        return articles;
    }

    /**
     * 查询文章(status)
     *
     * @param article
     * @return
     */
    public PageInfo<Article> select_article_status(Article article, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Article> articles = userDao.select_article_status(article);
        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        return pageInfo;
    }

    /**
     * 查询具体文章
     *
     * @param id
     * @return
     */
    public Article selectArticle_order(int id) {

        List<Article> articles = userDao.selectArticle();
        Article article = userDao.selectArticle_order(id);

        return article;
    }

    /**
     * 当捐助金额达到，进行清算
     *
     * @param id
     * @return
     */
    public boolean update_clear(int id) {
        int i = 0;
        i = userDao.update_clear(id);
        if (i > 0) {
            return true;
        } else {
            return false;
        }

    }


    /***
     * 查询文章分类(不分页)
     * @return
     */
    public List<ArticleClass> selectArticleClass() {

        List<ArticleClass> acc = userDao.selectArticleClass();
        return acc;
    }

    /***
     * 文章发布保存（管理员）
     * @param article
     * @return
     */
    public boolean article_save(Article article) {
        Boolean ret = false;
        int ac = 0;
        ac = userDao.article_save(article);
        if (ac > 0) {
            ret = true;
            return ret;
        } else {
            return ret;
        }

    }


    public boolean att_article_save(Article article) {
        Boolean ret = false;
        int i = 0;
        i = userDao.att_article_save(article);
        if (i > 0) {
            ret = true;
            return ret;
        } else {
            return ret;
        }

    }


    //-----支付宝

    public boolean insert_payOrder(Order order) {
        int i = 0;
        i = userDao.insert_payOrder(order);
        if (i > 0) {

            return true;
        } else {
            return false;
        }

    }

    public Order select_orderByOut_trade_no(String out_trade_no) {
        Order order = userDao.select_orderByOut_trade_no(out_trade_no);
        return order;
    }

    public boolean insert_payOrder_second(Order order) {
        int i = 0;
        i = userDao.insert_payOrder_second(order);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    public PageInfo<Order> select_order_id(int id, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Order> order = userDao.select_order(id);
        PageInfo<Order> pageInfo = new PageInfo<Order>(order);
        return pageInfo;
    }

    /**
     * 用户认证保存
     *
     * @param attestation
     * @return
     */
    public boolean attestation_save(Attestation attestation) {
        int i = 0;
        i = userDao.attestation_save(attestation);
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 用户认证时修改user表状态为3->正在认证
     *
     * @param id
     * @return
     */
    public boolean update_user_att(int id) {
        User user = new User();
        user.setId(id);
        boolean b = userDao.update_user_att(user);
        return b;
    }

    /**
     * 查user
     *
     * @return
     */
    public List<User> select_user() {
        List<User> user = userDao.select_user();
        return user;
    }

    /**
     * 查询总金额
     *
     * @param order
     * @return
     */
    public double select_sum(Order order) {
        double v = 0;
        v = userDao.select_sum(order);
        return v;
    }

    /**
     * 查询总金额_受助人用户总金额
     *
     * @param order
     * @return
     */
    public double select_sum_user(Order order) {
        double v = 0;
        v = userDao.select_sum_user(order);
        return v;
    }

    /**
     * 贫困用户需求进度
     *
     * @param id
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Article> select_article_user(int id, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Article> articles = userDao.select_article_user(id);

        Order order = new Order();  //查询总金额
        for (Article article : articles) {
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

        PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
        return pageInfo;

    }

    /**
     * 贫困用户查询需求进度
     *
     * @param article
     * @param PageNum
     * @param PageSize
     * @return
     */
    public PageInfo<Article> select_article_u_search(Article article, int PageNum, int PageSize) {
        PageHelper.startPage(PageNum, PageSize);
        List<Article> articles = userDao.select_article_u_search(article);
        Order order = new Order();  //查询总金额
        for (Article a : articles) {
            order.setH_id(Integer.parseInt(a.getUser_id()));//获取捐款人id
            order.setArticle_id(a.getId());//获取文章id
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


    public List<User> select_ningjinhuan() {
        //这里是sevice层，在这里调用dao层接口，接收数据库数据
        List<User> users = userDao.select_ningjinhuan();//调用了用什么接受呢？
        //为什么说service是中间人，因为他只是接收dao层的数据，再传回给controller

        return users;//直接返回一个user类
    }
}
