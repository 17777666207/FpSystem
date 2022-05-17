package org.ph.entity;

import java.util.Date;
import java.util.List;

public class Article {
    private Integer id;
    private String title;
    private String user_id;
    private String target;
    private String content;
    private Integer sequence;
    private String mark;
    private Integer articleClass_id;
    private String img;
    private String fileName;
    private String addTime;

    private String system_article;
    /**
     * 文章状态：0->待审核，1->审核通过，2->审核不通过
     */
    private Integer status;

    /**
     * 是否结算：0->正在进行、1->未结算、2->已结算
     */
    private Integer clear;
    /**
     * 是否显示：0->显示、1->不显示
     */
    private Integer display;

    //--sql使用字段
    /**
     * 总捐款数
     */
    private Double total;
    /**
     * 所属用户
     */
    private User account;

    /**
     * 文章分类
     */
    private ArticleClass articleClass_name;


    private List articleList;

    public Article() {

    }


    public Article(Integer id, String title, String content, String addTime) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.addTime = addTime;
    }

    public Article(String title, String content, String target, Integer articleClass_id, String addTime) {

        this.title = title;
        this.content = content;
        this.target = target;
        this.articleClass_id = articleClass_id;
        this.addTime = addTime;
    }

    public Article(Integer id, String title, String content, Integer sequence, Integer articleClass_id, String img, String fileName, String addTime) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.sequence = sequence;
        this.articleClass_id = articleClass_id;
        this.img = img;
        this.fileName = fileName;
        this.addTime = addTime;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public Integer getArticleClass_id() {
        return articleClass_id;
    }

    public void setArticleClass_id(Integer articleClass_id) {
        this.articleClass_id = articleClass_id;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public User getAccount() {
        return account;
    }

    public void setAccount(User account) {
        this.account = account;
    }

    public ArticleClass getArticleClass_name() {
        return articleClass_name;
    }

    public void setArticleClass_name(ArticleClass articleClass_name) {
        this.articleClass_name = articleClass_name;
    }

    public String getSystem_article() {
        return system_article;
    }

    public void setSystem_article(String system_article) {
        this.system_article = system_article;
    }

    public Integer getClear() {
        return clear;
    }

    public void setClear(Integer clear) {
        this.clear = clear;
    }

    public Integer getDisplay() {
        return display;
    }

    public void setDisplay(Integer display) {
        this.display = display;
    }
}
