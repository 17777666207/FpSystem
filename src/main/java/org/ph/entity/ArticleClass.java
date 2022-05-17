package org.ph.entity;

import java.util.List;

public class ArticleClass {
    private Integer id;
    private String className;
    private String url;
    private Integer sequence;
    private String addTime;

    private List articleClassList;


    public ArticleClass() {

    }

    public ArticleClass(Integer id, String className, Integer sequence, String addTime) {
        this.id = id;
        this.className = className;
        this.sequence = sequence;
        this.addTime = addTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Integer getSequence() {
        return sequence;
    }

    public void setSequence(Integer sequence) {
        this.sequence = sequence;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public List getArticleClassList() {
        return articleClassList;
    }

    public void setArticleClassList(List articleClassList) {
        this.articleClassList = articleClassList;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
