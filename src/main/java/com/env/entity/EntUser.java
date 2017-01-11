package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 企业用户登陆信息
 *
 * @author hbj403
 */
@Entity
@Table(name = "Ent_User")
public class EntUser implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 255)
    private String entUserId;//企业用户id

    @Column(length = 255, nullable = false)
    private String entId;//企业登记号
    @Column(length = 255)
    private String entOrganizationCode;// 企业组织机构代码
    @Column(length = 255)
    private String entName;// 登陆企业名称
    @Column(length = 255)
    private String userpassword;// 登陆企业密码
    @Column(length = 32)
    private Date loginTime;// 登陆时间


    public EntUser() {
    }

    public EntUser(String entUserId, String entId, String entOrganizationCode, String entName) {
        this.entUserId = entUserId;
        this.entId = entId;
        this.entOrganizationCode = entOrganizationCode;
        this.entName = entName;
    }


    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getEntId() {
        return entId;
    }

    public void setEntId(String entId) {
        this.entId = entId;
    }

    public String getEntOrganizationCode() {
        return entOrganizationCode;
    }

    public void setEntOrganizationCode(String entOrganizationCode) {
        this.entOrganizationCode = entOrganizationCode;
    }

    public String getEntName() {
        return entName;
    }

    public void setEntName(String entName) {
        this.entName = entName;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

}
