package org.ph.entity;

public class Attestation {

    private Integer id;

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
     * 情况说明
     */
    private String state;
    /**
     * 审核意见
     */
    private String result;
    /**
     * 认证图片
     */
    private String img_att;
    /**
     * 图片名字
     */
    private String fileName;
    /**
     * 审核状态:0待审核，1审核通过，2审核不通过
     */
    private Integer status;
    /**
     * 所属用户
     */
    private Integer u_id;

    private String addTime;

    private String passTime;


    public Attestation() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getImg_att() {
        return img_att;
    }

    public void setImg_att(String img_att) {
        this.img_att = img_att;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getPassTime() {
        return passTime;
    }

    public void setPassTime(String passTime) {
        this.passTime = passTime;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }
}
