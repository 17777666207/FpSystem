package org.ph.entity;

public class User {
    private Integer id;
    private String account;
    private String pwd;
    private String email;
    private String tel;
    private String img_att;
    private String create_time;
    private String update_time;
    /**
     * 使用中，账号类别： 2爱心用户，1受助用户 默认2,3为正在认证
     */
    private String status;
    /**
     * 使用中，认证状态：0->默认，1->正在认证
     */
    private String att_status;
    private String by3;
    private Integer by4;
    private Integer by5;

    /*新增*/
    /**
     * 真实名字
     */
    private String real_name;
    /**
     * 户籍地址
     */
    private String address;
    /**
     * 身份证号
     */
    private String p_id;

    /**
     * 图片名字
     */
    private String fileName;


    public User() {
    }

    public User(String account, String pwd, String email, String tel) {
        this.account = account;
        this.pwd = pwd;
        this.email = email;
        this.tel = tel;
    }

    public User(String account, String pwd, String email) {
        this.account = account;
        this.pwd = pwd;
        this.email = email;
    }

    public User(String account, String pwd, String email, String tel, String img) {
        this.account = account;
        this.pwd = pwd;
        this.email = email;
        this.tel = tel;
        this.img_att = img;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getImg_att() {
        return img_att;
    }

    public void setImg_att(String img_att) {
        this.img_att = img_att;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAtt_status() {
        return att_status;
    }

    public void setAtt_status(String att_status) {
        this.att_status = att_status;
    }

    public String getBy3() {
        return by3;
    }

    public void setBy3(String by3) {
        this.by3 = by3;
    }

    public Integer getBy4() {
        return by4;
    }

    public void setBy4(Integer by4) {
        this.by4 = by4;
    }

    public Integer getBy5() {
        return by5;
    }

    public void setBy5(Integer by5) {
        this.by5 = by5;
    }

    public String getReal_name() {
        return real_name;
    }

    public void setReal_name(String real_name) {
        this.real_name = real_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
