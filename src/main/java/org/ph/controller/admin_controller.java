package org.ph.controller;

import com.alibaba.druid.util.StringUtils;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.apache.commons.io.FilenameUtils;
import org.ph.entity.*;
import org.ph.service.AdminService;
import org.ph.service.UserService;
import org.ph.util.Pay_status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import java.util.logging.Logger;


@Controller
@RequestMapping("admin")
public class admin_controller {

    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    Logger logger;


    /***
     * 发布文章show
     * @param article
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("test.do")
    public String article_show(Article article, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        List<Article> ac = userService.selectArticle();//无用，需要添加贫困人信息，以及证明相片
        List<ArticleClass> acc = userService.selectArticleClass();
        request.setAttribute("acc", acc);

        return "admin/test";
    }

    /***
     * 文章发布保存
     * @param article
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("article_save.do")
    public String article_save(Article article, MultipartFile imgFile, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
	  /* 	article.setAddTime(java.sql.Date.valueOf(String.valueOf(new Date().getTime())));

        try {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            article.setAddTime(df.parse(String.valueOf(new Date().getTime())));
        } catch (ParseException e) {
            e.printStackTrace();
        }
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            sdf.parse(String.valueOf(new Date()));
        } catch (ParseException e) {
            e.printStackTrace();
        }


       /* SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        article.setAddTime(java.sql.Date.valueOf(time));*/

     /*   File file;
        if (!StringUtils.isEmpty(fileName)){
            file = new File("D:/IDEAworkspace/FpSystem/src/main/webapp/WEB-INF/jsp/upload"+"/"+fileName);
        }else {
            fileName  =imgFile.getOriginalFilename();
            file = new File("D:/IDEAworkspace/FpSystem/src/main/webapp/WEB-INF/jsp/upload"+"/"+fileName);
  //        File file = new File("D:\\upload\\"+fileName);
        }*/

        //处理上传头像
        String fileName = imgFile.getOriginalFilename();
        //获取扩展名
        String extension = FilenameUtils.getExtension(imgFile.getOriginalFilename());
        fileName = (UUID.randomUUID() + fileName.substring(0, fileName.length() - 4)).replaceAll(" ", "") + "." + extension;

        //获得文件的绝对路径加存储名字
        File file = new File("D:/IDEAworkspace/FpSystem/src/main/webapp/upload" + "/" + fileName);

        try {
            imgFile.transferTo(file);//把你上传的文件存储到服务器的upload的文件中，用获得的路径加名字存储

        } catch (IllegalStateException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        //把相片存到admin表中
        ///WEB-INF/jsp/upload/9f12526fee66dddc-c71ee4957eaff481-31d90c147352301fc5f22d71a815583e.jpg

//        article.setImg(request.getServletContext().getContextPath()+"/webapp/WEB-INF/jsp/upload/"+fileName);
//        article.setImg("/FpSystem_war_exploded/upload/"+fileName);

        article.setImg("/upload/" + fileName);
        article.setFileName(fileName);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        article.setAddTime(time);
        String acc_name = request.getParameter("articleClass");
        article.setArticleClass_id(Integer.valueOf(acc_name));
        boolean b = userService.article_save(article);
        if (b) {
//            request.setAttribute("success",b);
//            return  "forward:test.do";
            return "redirect:test01.do";

        } else {
            request.setAttribute("fal", false);
            return "redirect:test.do";
        }
      /*  if (b){
            try {
                response.getWriter().println(b);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            try {
                response.getWriter().println(false);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }*/

//        return "login_index";
    }

    /***
     * 发布文章分类show
     * @param articleClass
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_post_articleClass.do")
    public String articleClass_show(ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        return "admin/post_articleClass";
    }

    /***
     * 文章分类发布保存
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("add_post_articleClass_save.do")
    public void add_post_articleClass_save(ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        articleClass.setAddTime(time);
        boolean b = adminService.articleClass_save(articleClass);
        if (b) {
            try {
                response.getWriter().println(b);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.getWriter().println(false);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

//        return "login_index";
    }

    /***
     * 发布文章管理
     * @param article
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("test01.do")
    public String test01(Article article, ArticleClass articleClass, @RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        if (article.getTitle() != null | article.getArticleClass_id() != null) { //配合分页，使得筛选也能进行分页效果
            PageInfo<Article> articles = adminService.select_title_articleClass_id(article, pageNum, 5);
            List<ArticleClass> acc = userService.selectArticleClass();
            request.setAttribute("title_select", article.getTitle());
            request.setAttribute("c_id_select", article.getArticleClass_id());
            request.setAttribute("ac", articles);
            request.setAttribute("acc", acc);
            return "admin/test01";
        } else {
            PageInfo<Article> ac = adminService.selectArticle_pgInfo(pageNum, 5);
            List<ArticleClass> acc = userService.selectArticleClass();
            request.setAttribute("title", "");
            request.setAttribute("ac", ac);
            request.setAttribute("acc", acc);
            return "admin/test01";
        }


    }

    /***
     * 项目管理_文章管理界面_模糊搜索
     * @param article
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("select_article.do")
    public String select_article(Article article, @RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        ////////////////////////////////////弃用

        PageInfo<Article> articles = adminService.select_title_articleClass_id(article, pageNum, 5);
        List<ArticleClass> acc = userService.selectArticleClass();
        request.setAttribute("title", article.getTitle());
        request.setAttribute("ac", articles);
        request.setAttribute("acc", acc);

        return "admin/test01";
    }

    /***
     * 项目管理_文章分类管理界面_模糊搜索
     * @param article
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("select_articleClass.do")
    public String select_articleClass(Article article, @RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        ////////////////////弃用

        PageInfo<ArticleClass> acc = adminService.select_className(articleClass, pageNum, 5);
        request.setAttribute("acc", acc);

        return "admin/test02";
    }

    /***
     * 文章分类管理
     * @param article
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("test02.do")
    public String test02(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, Article article, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        if (articleClass.getClassName() != null) {
            PageInfo<ArticleClass> acc = adminService.select_className(articleClass, pageNum, 5);
            request.setAttribute("acc", acc);
            request.setAttribute("className_select", articleClass.getClassName());
            return "admin/test02";
        } else {
            PageInfo<ArticleClass> acc = adminService.selectArticleClass_pgInfo(pageNum, 5);
            request.setAttribute("acc", acc);
            request.setAttribute("className_select", "");
            return "admin/test02";
        }

    }

    /***
     * 文章编辑show
     * @param article
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_article_edit.do")
    public String show_article_edit(String id, Article article, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        List<ArticleClass> acc = userService.selectArticleClass();
        Article a = adminService.selectArticle(Integer.valueOf(id));
        ArticleClass acc_firstName = adminService.selectArticleClass(a.getArticleClass_id());

        request.setAttribute("acc_firstName", acc_firstName.getClassName());
        request.setAttribute("acc_id", a.getArticleClass_id());

        request.setAttribute("ac", a);
        request.setAttribute("acc", acc);
        return "admin/article_edit";
    }

    /***
     * 文章分类编辑show
     * @param article
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_articleClass_edit.do")
    public String show_articleClass_edit(String id, Article article, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        ArticleClass acc = adminService.selectArticleClass(Integer.valueOf(id));
        request.setAttribute("acc", acc);
        return "admin/articleClass_edit";
    }

    /***
     * 文章编辑保存
     * @param article
     * @param id
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("article_update_save.do")
    public String article_update_save(Article article, MultipartFile imgFile, String id, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

      /*  Article article1 = adminService.selectArticle(Integer.valueOf(id));
        if (StringUtils.isEmpty(article1.getImg())){
            File deleteFile = new File("D:/IDEAworkspace/FpSystem/src/main/webapp/WEB-INF/jsp/upload"+"/"+fileName);
            deleteFile.delete();
        }
        */


        //更新前将原有相片删除
        Article article1 = adminService.selectArticle(Integer.valueOf(id));
        File deleteFile = new File("D:/IDEAworkspace/FpSystem/src/main/webapp/upload" + "/" + article1.getFileName());
        boolean delete = deleteFile.delete();
        System.out.println(delete);

        //处理上传头像
        String fileName = imgFile.getOriginalFilename();
        //获取扩展名
        String extension = FilenameUtils.getExtension(imgFile.getOriginalFilename());
        fileName = (UUID.randomUUID() + fileName.substring(0, fileName.length() - 4)).replaceAll(" ", "") + "." + extension;
        //获得文件的绝对路径加存储名字
        File file = new File("D:/IDEAworkspace/FpSystem/src/main/webapp/upload" + "/" + fileName);
//        File file = new File("D:\\upload\\"+fileName);
        try {
            imgFile.transferTo(file);//把你上传的文件存储到服务器的upload的文件中，用获得的路径加名字存储

        } catch (IllegalStateException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        //把相片存到admin表中
        article.setImg("/upload/" + fileName);
        article.setFileName(fileName);

        boolean ac_b = adminService.update_Article(article);
        if (ac_b) {
            return "redirect:test01.do";
        } else {
            return "forward:article_edit.do";
        }

    }

    /***
     * 文章分类编辑保存
     * @param id
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("articleClass_update_save.do")
    public String articleClass_update_save(String id, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        boolean acc_b = adminService.update_ArticleClass(articleClass);
        if (acc_b) {
            return "forward:test02.do";
        } else {
            return "forward:how_article_edit.do";
        }
    }

    /***
     * 文章_删除
     * @param id
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_article_delete.do")
    public String show_article_delete(String id, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        //将原有相片删除
        Article article1 = adminService.selectArticle(Integer.valueOf(id));
        File deleteFile = new File("D:/IDEAworkspace/FpSystem/src/main/webapp/upload" + "/" + article1.getFileName());
        boolean delete = deleteFile.delete();
        System.out.println(delete);

        boolean b = adminService.delete_article(id);
        if (b) {
            return "forward:test01.do";
        } else {
            return "forward:test01.do";
        }

    }


    @RequestMapping("articleClass_delete.do")
    public String articleClass_delete(String id, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        boolean b_ac = adminService.delete_article_accid(id);
        boolean b_acc = adminService.delete_articleClass(id);
        if (b_ac && b_acc) {
            return "forward:test02.do";
        } else {
            return "forward:test02.do";
        }

    }

    /**
     * 一级分类更多
     *
     * @param id
     * @param pageNum
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_article_more.do")
    public String article_more(String id, @RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        ArticleClass articleClass = adminService.selectArticleClass(Integer.parseInt(id));
        PageInfo<Article> pageInfo = adminService.selectArticle_fy(Integer.parseInt(id), pageNum, 12);
        request.setAttribute("acc", articleClass);
        request.setAttribute("ac", pageInfo);

        //现有金额，目标金额
//        Article article = adminService.selectArticle(Integer.parseInt(id));
//        request.setAttribute("ac",article);
//        Order order = new Order();
//        order.setH_id(Integer.parseInt(article.getUser_id()));
//        order.setArticle_id(article.getId());
//        double v = 0;
//        try {
//            v = userService.select_sum(order);
//            if (!(v>0)){
//                v=0.0;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        request.setAttribute("total",v);


        return "article_more";

    }

    @RequestMapping("donations_manage.do")
    public String show_join(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum,
                            HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        List<ArticleClass> articleClasses = userService.selectArticleClass();
        PageInfo<Order> pageInfo = adminService.select_order(pageNum, 6);
        request.setAttribute("acc", articleClasses);
        request.setAttribute("order", pageInfo);
        request.setAttribute("pay", Pay_status.class);//枚举未起作用，保留
        return "admin/donations_manage";


    }


    @RequestMapping("donations_manage_search.do")
    public String donations_manage_sreach(String articleClass, String subject, String user_account, @RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum,
                                          HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Order order = new Order();
//        if (articleClass != null | subject != null |user_account != null) { //配合分页，使得筛选也能进行分页效果
        if (StringUtil.isNotEmpty(articleClass) | StringUtil.isNotEmpty(subject) | StringUtil.isNotEmpty(user_account)) { //配合分页，使得筛选也能进行分页效果
            order.setArticleClass(articleClass);
            order.setUser_account(user_account);
            order.setSubject(subject);
//
            List<ArticleClass> articleClasses = userService.selectArticleClass();
            PageInfo<Order> pageInfo = adminService.select_order_search(order, pageNum, 6);
            request.setAttribute("acc", articleClasses);
            request.setAttribute("order", pageInfo);
            request.setAttribute("articleClass", articleClass);
            request.setAttribute("subject_select", subject);
            request.setAttribute("account_select", user_account);
            return "admin/donations_manage";
        } else {
            List<ArticleClass> articleClasses = userService.selectArticleClass();
            PageInfo<Order> pageInfo = adminService.select_order(pageNum, 6);
            request.setAttribute("acc", articleClasses);
            request.setAttribute("order", pageInfo);
            request.setAttribute("pay", Pay_status.class);//枚举未起作用，保留
            return "admin/donations_manage";
        }
    }

    /**
     * 爱心进度
     *
     * @param article
     * @param articleClass
     * @param articleClass_id
     * @param title
     * @param user_account
     * @param pageNum
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("donation_plan.do")
    public String donation_plan(Article article, String articleClass, String articleClass_id, String title, String user_account, @RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum,
                                String clear, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Order order = new Order();
        if (StringUtil.isNotEmpty(articleClass_id) | StringUtil.isNotEmpty(title) | StringUtil.isNotEmpty(clear)) { //配合分页，使得筛选也能进行分页效果

            if (StringUtil.isNotEmpty(articleClass_id)) {
                article.setArticleClass_id(Integer.parseInt(articleClass_id));
            }
            if (StringUtil.isNotEmpty(title)) {
                article.setTitle(title);
            }
            if (StringUtil.isNotEmpty(clear)) {
                article.setClear(Integer.parseInt(clear));
            }
            List<ArticleClass> articleClasses = userService.selectArticleClass();
            PageInfo<Article> pageInfo = adminService.select_article_all_search(article, pageNum, 6);
            request.setAttribute("acc", articleClasses);
            request.setAttribute("c", clear);
            request.setAttribute("ac", pageInfo);
            request.setAttribute("articleClass", articleClass);
            request.setAttribute("articleClass_id", articleClass_id);
            request.setAttribute("subject_select", title);
            request.setAttribute("account_select", user_account);
            return "admin/donation_plan";
        } else {
            List<ArticleClass> articleClasses = userService.selectArticleClass();
            PageInfo<Article> articles1 = adminService.select_article_all(pageNum, 6);
            request.setAttribute("acc", articleClasses);
            request.setAttribute("ac", articles1);
            request.setAttribute("pay", Pay_status.class);//枚举未起作用，保留
            return "admin/donation_plan";
        }
    }

    /**
     * 爱心捐助——清算
     *
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("donation_clear.do")
    public void donation_clear(Article article, String id, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        article.setDisplay(1);
        article.setClear(2);
        article.setId(Integer.parseInt(id));
        boolean b = adminService.clear_article(article);
        if (b) {
            try {
                response.getWriter().println(true);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.getWriter().println(true);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

//        return "admin/donation_plan";
    }

    /**
     * show_申请表
     *
     * @param pageNum
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_attestation_apply.do")
    public String show_attestation_apple(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, Attestation attestation, String status, String user_account, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        if (StringUtil.isNotEmpty(user_account) | status != null) {
            if (StringUtil.isNotEmpty(user_account)) {
                User user = new User();
                user.setAccount(user_account);
                User user1 = adminService.select_uid(user);
                attestation.setU_id(user1.getId());
            }

            PageInfo<Attestation> pageInfo = adminService.select_attestation_search(attestation, pageNum, 6);
            request.setAttribute("att", pageInfo);

            request.setAttribute("user_account", user_account);
            request.setAttribute("status", status);

        } else {
            PageInfo<Attestation> pageInfo = adminService.select_attestation(pageNum, 6);
            request.setAttribute("att", pageInfo);
        }
        List<User> users = userService.select_user();
        request.setAttribute("users", users);
        return "admin/attestation/attestation_apply";
    }

    /**
     * show_申请详情
     *
     * @param id
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_attestation_more.do")
    public String show_attestation_more(String id, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Attestation attestation = adminService.select_attestation_more(Integer.parseInt(id));
        request.setAttribute("att", attestation);
        return "admin/attestation/attestation_more";

    }

    /**
     * 管理员审核
     *
     * @param attestation
     * @param apply_status
     * @param id
     * @param request
     * @param response
     * @param session
     */
    @RequestMapping("attestation_apply.do")
    public void attestation_apply(Attestation attestation, String apply_status, String id, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        attestation.setStatus(Integer.parseInt(apply_status));
        boolean b = adminService.update_att_status(attestation);
        Attestation attestation1 = adminService.select_userId_of_attestationId(attestation);
        if (b) {
            //修改user表状态
            User user = new User();
            user.setId(attestation1.getU_id());
            user.setStatus(apply_status);
            boolean b1 = adminService.update_user_status(user);
            if (b) {
                try {
                    response.getWriter().println(b);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }


        } else {
            try {
                response.getWriter().println(false);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * 发布需求show
     *
     * @param pageNum
     * @param request
     * @return
     */
    @RequestMapping("show_help_apply.do")
    public String show_help_apply(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, String s_title, HttpServletRequest request) {
        Article article = new Article();
        article.setTitle(s_title);
        if (StringUtil.isNotEmpty(s_title)) {
            PageInfo<Article> pageInfo = adminService.article_apply_search(article, pageNum, 6);
            List<ArticleClass> articleClasses = userService.selectArticleClass();
            List<User> users = userService.select_user();
            request.setAttribute("users", users);
            request.setAttribute("acc", articleClasses);
            request.setAttribute("ac", pageInfo);
            request.setAttribute("s_title", s_title);
            return "admin/article/help_apply";
        } else {
            PageInfo<Article> pageInfo = adminService.selectArticle_pgInfo(pageNum, 6);
            List<ArticleClass> articleClasses = userService.selectArticleClass();
            List<User> users = userService.select_user();
            request.setAttribute("users", users);
            request.setAttribute("acc", articleClasses);
            request.setAttribute("ac", pageInfo);
            return "admin/article/help_apply";
        }

    }

    /**
     * 需求审核详情
     *
     * @param id
     * @param className
     * @param account
     * @param request
     * @return
     */
    @RequestMapping("help_article_apply_more.do")
    public String help_apply_more(String id, String className, String account, HttpServletRequest request) {


        Article article = adminService.selectArticle(Integer.parseInt(id));
        ArticleClass articleClass = adminService.selectArticleClass(article.getArticleClass_id());
        request.setAttribute("ac", article);
        request.setAttribute("className", articleClass.getClassName());
        return "admin/article/help_apply_more";
    }

    /**
     * 用户需求审核
     *
     * @param article
     * @param apply_status
     * @param id
     * @param request
     * @param response
     * @param session
     */
    @RequestMapping("article_apply.do")
    public void article_apply(Article article, String apply_status, String id, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        article.setStatus(Integer.parseInt(apply_status));
        boolean b = adminService.update_article_apply(article);
        if (b) {
            try {
                response.getWriter().println(b);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.getWriter().println(false);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }


    @RequestMapping("test_table.do")
    public String test_table() {
        return "admin/test_table";
    }


}