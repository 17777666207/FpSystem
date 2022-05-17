package org.ph.controller;


import com.github.pagehelper.PageInfo;
import com.github.pagehelper.util.StringUtil;
import org.apache.commons.io.FilenameUtils;
import org.ph.entity.*;
import org.ph.service.AdminService;
import org.ph.service.UserService;

import org.ph.util.Pay_status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@Controller
@RequestMapping("admin")
public class index_controller {

    @Autowired
    UserService userService;

    @Autowired
    AdminService adminService;

    String codee = "";

    /*主页*/
    @RequestMapping("pkAbout.do")
    public String index(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
        List<ArticleClass> acc = userService.selectArticleClass();
        List<Article> ac = userService.selectArticle();
        session.setAttribute("ac", ac); //pkAbout.jsp不在web-inf文件下
        session.setAttribute("acc", acc);
//		request.setAttribute("ac",ac);

        return "redirect:../pkAbout.jsp";
    }

    @RequestMapping("index.do")
    public String index_first(HttpServletRequest request) {
        List<ArticleClass> articleClasses = userService.selectArticleClass();
        request.setAttribute("acc", articleClasses);
        return "../../index";

    }

    @RequestMapping("connect.do")
    public String connect(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, HttpServletRequest request, HttpSession session, HttpServletResponse response) {

        PageInfo<Article> pageInfo = adminService.select_U_Article_pgInfo(pageNum, 12);
        request.setAttribute("ac", pageInfo);
        return "connect";
    }

    @RequestMapping("public_donation.do")
    public String public_donation(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, HttpServletRequest request, HttpSession session, HttpServletResponse response) {
        List<ArticleClass> acc = userService.selectArticleClass();
        PageInfo<Article> pageInfo = adminService.select_S_Article_pgInfo(pageNum, 12);
        request.setAttribute("ac", pageInfo);
        request.setAttribute("acc", acc);
        return "public_donation";
    }


    /***
     * 用户注册
     * @param account
     * @param pwd
     * @param email
     * @param tel
     * @return
     */
    @RequestMapping("registerUser")
    public void reg(String account, String pwd, String email, String tel, HttpServletResponse response) {
        // int t = Integer.valueOf(tel);
        //做账号校验、头像
        User user = new User(account, pwd, email, tel);
        boolean b = userService.registerUser(user);
        if (b) {
            try {
                response.getWriter().println(b);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.getWriter().println(!b);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
//		return "redirect:../login.jsp";
    }

    /**
     * show_登录
     *
     * @return
     */
    @RequestMapping("login.do")
    public String login(HttpServletRequest request, HttpServletResponse response) {
        return "login";
    }

    /**
     * 验证码
     *
     * @return
     */
    @RequestMapping("code.do")
    public void code(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //����ͼƬ���
        int width = 80;
        int height = 30;
        String cd = "";
        //����ͼƬ
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
        Graphics g = img.createGraphics();
        g.setColor(Color.gray);
        g.fillRect(0, 0, width, height);

        //��������
        g.setColor(Color.BLUE);
        for (int i = 0; i <= 10; i++) {
            int x1 = new Random().nextInt(width);
            int y1 = new Random().nextInt(height);
            int x2 = new Random().nextInt(width);
            int y2 = new Random().nextInt(height);
            g.drawLine(x1, y1, x2, y2);

        }
        //��ȡ�����
        g.setColor(Color.white);
        String code = "0123456789abcdefghijklnnABCDEFGHJK";
        for (int i = 0; i < 4; i++) {
            char c = code.charAt(new Random().nextInt(code.length()));
            g.drawString(c + "", 24 * i, 18);
            cd += c;
            request.getSession().setAttribute("code", c);

        }

        codee = cd;
        session.setAttribute("codee", codee);
        response.setContentType("image/png");

        try {
            ImageIO.write(img, "jpg", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * show_注册
     *
     * @return
     */
    @RequestMapping("register.do")
    public String register() {
        return "register";
    }

    /***
     * 用户登录（未显示个人主页）
     * @param user
     * @param request
     * @param response
     * @param Session
     * @return
     * @throws IOException
     */
    @RequestMapping("login_index.do")
    public void login_index(User user, String check, HttpServletRequest request, HttpServletResponse response, HttpSession Session) {
        if (codee.equals(check)) {
            User find_user = userService.selectUserOfLogin(user);
            int v = userService.select_order_sum(find_user.getId());
            if (!StringUtils.isEmpty(find_user)) {
                Session.setAttribute("user", find_user);
                request.setAttribute("sum", v);//参与项目
                try {
                    response.getWriter().println(true);
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
        } else {
            try {
                String code = "code";
                response.getWriter().println(code);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    /**
     * 导航条_个人中心首页
     *
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("show_login_index.do")
    public String show_login_index(User user, HttpServletRequest request, HttpSession session) {
        User u = (User) session.getAttribute("user");
        int v = userService.select_order_sum(u.getId());
        request.setAttribute("sum", v);//参与项目

        return "/login_user/login_index";
    }

    /**
     * 登录成功_个人中心
     *
     * @param user
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("login_user.do")
    public String login_user(User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        User find_user = userService.selectUserOfLogin(user);
        User u = (User) session.getAttribute("user");
        int v = userService.select_order_sum(u.getId());
        request.setAttribute("sum", v);//参与项目
        if (request.getSession().getAttribute("user") != null) {
            return "login_user/login_index";  //个人中心
        } else {
            return "login";
        }
    }


    /*退出注销*/
    @RequestMapping("exit.do")
    public String exit(String url, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //System.out.println(url);停留当前页退出
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("loginInfo");
        System.out.println(request.getRequestURL());

        return "redirect:../pkAbout.jsp";
//		return "forward:" +request.getRequestURL() +"";
    }

    //-----个人信息---------------

    /***
     * show个人信息
     * @return
     */
    @RequestMapping("show_login_info.do")
    public String show_login_info() {
        return "login_user/login_info";
    }

    /***
     * 修改个人信息
     * @param user
     * @param request
     * @param response
     * @param session
     */
    @RequestMapping("login_info.do")
    public void login_info(User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        User session_u = (User) session.getAttribute("user");
        user.setId(session_u.getId());
        boolean ret = userService.updateUserInfo(user);
        if (ret) {
            request.getSession().removeAttribute("user");
            session_u.setAccount(user.getAccount());
            session_u.setEmail(user.getEmail());
            session_u.setTel(user.getTel());
            session.setAttribute("user", session_u);//覆盖获取个人信息
            try {
                response.getWriter().println(true);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.getWriter().print(false);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    /***
     * 修改密码模态框show
     * @param user
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_update_pwd.do")
    public String update_pwd(User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        return "login_user/login_update_pwd";
    }


    /***
     * 修改密码保存
     * @param user
     * @param new_pwd
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("update_pwd.do")
    public void pwd(User user, String new_pwd, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

//		if (userService.selectUserOfUpdate(user)) {
//			User user_up = new User();
//			user_up.setPwd(new_pwd);
//			user_up.setId(user.getId());
//			if (userService.updateUserPwd(user_up)) {
//				return "forward:/admin/login.do";
//			} else {
//				return "login_user/login_index";
//			}
//		}
//		return "login_user/login_index";

        if (userService.selectUserOfUpdate(user)) {
            User user_up = new User();
            user_up.setPwd(new_pwd);
            user_up.setId(user.getId());
            if (userService.updateUserPwd(user_up)) {
                try {
                    response.getWriter().println(true);
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


    }

    /**
     * 我的捐赠
     *
     * @param pageNum
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("show_join.do")
    public String show_join(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        User user = (User) session.getAttribute("user");
        PageInfo<Order> pageInfo = userService.select_order_id(user.getId(), pageNum, 6);
        request.setAttribute("order", pageInfo);
        request.setAttribute("pay", Pay_status.class);//枚举未起作用，保留
        //加相片的话要修改，加upload,因为文章被删除就没了
        return "login_user/login_join";
    }

    /**
     * 文章详情
     *
     * @param a
     * @param id
     * @param request
     * @return
     */
    @RequestMapping("show_particulars.do")
    public String show_particulars(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, Article a, String id, String fen_ye, HttpServletRequest request) {
        Article article = new Article();
        if (request.getAttribute("ac_id") != null) {
            article = adminService.selectArticle(Integer.parseInt(id));
        } else {
            article = adminService.selectArticle(Integer.parseInt(id));
        }

        PageInfo<Order> pageInfo = adminService.select_order_aid(Integer.parseInt(id), pageNum, 4);
        request.setAttribute("ac", article);
        Order order = new Order();
        order.setH_id(Integer.parseInt(article.getUser_id()));
        order.setArticle_id(article.getId());
        //现有金额，目标金额
        double v = 0;
        try {
            v = userService.select_sum(order);
            if (!(v > 0)) {
                v = 0.0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        DecimalFormat decimalFormat = new DecimalFormat("0.00");
        String format = decimalFormat.format((v / Double.parseDouble(article.getTarget())) * 100);

        request.setAttribute("total", v);
        request.setAttribute("plan", format);
        request.setAttribute("order", pageInfo);

        if ("1".equals(fen_ye)) {  /*帮扶记录分页*/
            request.setAttribute("p_n", fen_ye);
        }
        return "article_particulars";
    }

    /**
     * 认证中心显示
     *
     * @return
     */
    @RequestMapping("show_attestation.do")
    public String show_attestation() {
        return "/login_user/login_attestation";
    }


    /**
     * 认证提交保存
     */
    @RequestMapping("attestation_save.do")
    public String attestation_save(Attestation attestation, MultipartFile imgFile, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        String fileName = imgFile.getOriginalFilename();
        //获取扩展名
        String extension = FilenameUtils.getExtension(imgFile.getOriginalFilename());
        fileName = (UUID.randomUUID() + fileName.substring(0, fileName.length() - 4)).replaceAll(" ", "") + "." + extension;

        //获得文件的绝对路径加存储名字
        File file = new File("D:/IDEAworkspace/FpSystem/src/main/webapp/attestation_img" + "/" + fileName);

        try {
            imgFile.transferTo(file);//把你上传的文件存储到服务器的upload的文件中，用获得的路径加名字存储

        } catch (IllegalStateException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        attestation.setImg_att("/attestation_img/" + fileName);
        attestation.setFileName(fileName);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        attestation.setAddTime(time);
        attestation.setStatus(0);

        User user = (User) session.getAttribute("user");
        attestation.setU_id(user.getId());

        boolean b = userService.attestation_save(attestation);
        User u = (User) session.getAttribute("user");
        boolean b1 = userService.update_user_att(u.getId());
        if (b & b1) {
            request.setAttribute("message", true);
            return "forward:/admin/attestation_plan.do";
//		}
//			try {
//				response.getWriter().println(true);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
        } else {
            request.setAttribute("message", false);
            return "forward:/admin/attestation_plan.do";
        }

//			try {
//				response.getWriter().println(false);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
    }

    /**
     * 认证进度显示
     *
     * @return
     */
    @RequestMapping("attestation_plan.do")
    public String attestation_plan(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, String user_account, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        User user = (User) session.getAttribute("user");
        Attestation attestation = new Attestation();
        attestation.setU_id(user.getId());
//			attestation.setStatus(0);
        PageInfo<Attestation> pageInfo = adminService.select_attestation_search(attestation, pageNum, 6);

        request.setAttribute("att", pageInfo);

        return "login_user/attestation/attestation_plan";
    }

    /**
     * 用户申请详情
     *
     * @param id
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("attestation_plan_more.do")
    public String attestation_plan_more(String id, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Attestation attestation = adminService.select_attestation_more(Integer.parseInt(id));
        request.setAttribute("att", attestation);
//        request.setAttribute("account",user.getAccount());
        return "login_user/attestation/attestation_plan_more";
    }

    @RequestMapping("attestation_plan_ud.do")
    public String attestation_plan_ud(String id, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Attestation attestation = adminService.select_attestation_more(Integer.parseInt(id));
        request.setAttribute("att", attestation);
        return "login_user/attestation/attestation_plan_ud";
    }

    /**
     * 需求保存
     *
     * @param article
     * @param imgFile
     * @param articleClass
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("help_save")
    public String help_save(Article article, MultipartFile imgFile, ArticleClass articleClass, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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

        User user = (User) session.getAttribute("user");
        article.setUser_id(String.valueOf(user.getId()));
        article.setStatus(0);

        article.setImg("/upload/" + fileName);
        article.setFileName(fileName);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        article.setAddTime(time);
        String acc_name = request.getParameter("articleClass");
        article.setArticleClass_id(Integer.valueOf(acc_name));
//		boolean b = userService.article_save(article);
        boolean b = userService.att_article_save(article);
        if (b) {

            return "redirect:att_plan.do";

        } else {
            request.setAttribute("fal", false);
            return "redirect:login_post_help.do";
        }
    }

    /**
     * 弃用
     *
     * @param id
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("help_plan_more.do")
    public String help_plan_more(String id, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Article article = userService.selectArticle_order(Integer.parseInt(id));
        List<ArticleClass> articleClasses = userService.selectArticleClass();
        request.setAttribute("ac", article);
        request.setAttribute("acc", articleClasses);
        return "login_user/help_plan_more";

    }


    /**
     * 我的进度
     *
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("att_plan")
    public String my_plan(String status, @RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Article article = new Article();
        User user = (User) session.getAttribute("user");
        article.setUser_id(String.valueOf(user.getId()));
        if (StringUtil.isNotEmpty(status)) {
            if (StringUtil.isNotEmpty(status)) {
                article.setStatus(Integer.parseInt(status));
            }
            PageInfo<Article> pageInfo = userService.select_article_status(article, pageNum, 6);
            request.setAttribute("c", status);
            request.setAttribute("ac", pageInfo);
        } else {
            PageInfo<Article> pageInfo = userService.select_article_status(article, pageNum, 6);
            request.setAttribute("ac", pageInfo);
        }

        return "/login_user/att_plan";

    }


    /**
     * 我的进度
     *
     * @param request
     * @param response
     * @param session
     * @return
     */
    @RequestMapping("my_plan")
    public String att_plan(String title, String clear, @RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        if (StringUtil.isNotEmpty(title) | StringUtil.isNotEmpty(clear)) {
            User user = (User) session.getAttribute("user");
            Article article = new Article();
            if (StringUtil.isNotEmpty(title)) {
                article.setTitle(title);
            }
            if (StringUtil.isNotEmpty(clear)) {
                article.setClear(Integer.parseInt(clear));
            }
            article.setUser_id(String.valueOf(user.getId()));
            PageInfo<Article> pageInfo = userService.select_article_u_search(article, pageNum, 6);
            request.setAttribute("c", clear);
            request.setAttribute("ac", pageInfo);
            request.setAttribute("title", title);
        } else {
            User user = (User) session.getAttribute("user");
            PageInfo<Article> pageInfo = userService.select_article_user(user.getId(), pageNum, 6);
            List<ArticleClass> articleClasses = userService.selectArticleClass();
            request.setAttribute("ac", pageInfo);
        }

        return "/login_user/my_plan";

    }


    @RequestMapping("show_pass")
    public String show_pass(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        return "/login_user/login_pass";
    }


    @RequestMapping("show_post_help")
    public String show_post_help(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        List<ArticleClass> articleClasses = userService.selectArticleClass();
        request.setAttribute("acc", articleClasses);
        return "/login_user/login_post_help";
    }

    @RequestMapping("show_integral.do")
    public String show_integral(User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        return "login_user/login_integral";
    }

    @RequestMapping("show_donation.do")
    public String show_donation(User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        return "login_user/login_donation";
    }


    @RequestMapping("ningjinhuan.do")
    public String ningjinhuan(User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //获取数据
        //第一步：我们要向数据库取数据 一般我的习惯先写dao层查询数据  model层->dao、service层
        //1.dao层：有userdao daoxml两个文件，因为是面向接口编程，要在userdao中写接口，具体sql语句在xml中
        //2.service层：dao层将数据传到service层，因为是面向接口编程，先写service,再写serviceimpl
        //以上两个是model(dao、service)，模型查询数据库，返回数据任务完成，

        //接下来是controller层

        List<User> users = userService.select_ningjinhuan();//调用model中service层的接口，得到dao层返回的数据

        //controller连接前后端，接收seivice层得到的dao层数据，返回前端，任务完成

        //接下来是view视图层
        //通过视图解析器将数据和界面返回 model and view
        request.setAttribute("u", users);//用这个方法把user返回前端
        return "admin/ningjinhuan";//视图解析器

        //至此，mvc三层任务全部完成
    }


}
