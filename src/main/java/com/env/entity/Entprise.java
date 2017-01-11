package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 监测企业 基本信息
 *
 * @author hbj403
 */
@Entity
@Table(name = "entprise")
public class Entprise implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String entpriseId;//企业本条数据id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业用户ID--外键 ent_user表的entUserId

    @Column(length = 255, nullable = false)
    private String entUsercode;//企业用户ID

    @Column(length = 255)
    private String entName;// 企业名称

    @Column(length = 32)
    private String entReperson;// 企业法人代表

    @Column(length = 1024)
    private String entAddress;// 企业地址

    @Column(length = 255)
    private String entProduct;//企业代表主要产品

    @Column(length = 255)
    private String entScale;//企业生产规模

    @Column(length = 255)
    private String entproductCycle;//企业生产周期

    @Column(length = 255)
    private String entCheckItem;//主要检查项目

    @Column(length = 32)
    private String entZone;// 企业所属地区 安吉 德清 长兴 吴兴 南浔 开发区

    @Column(length = 255)
    private String entType;// 企业污染类型  水污染  大气污染  固体废物  噪声    其他污染类型

    @Column(length = 255)
    private String entBusiness;// 所属行业

    @Column(length = 20)
    private String entControl;// 企业被控属性 国控 省控 县区控

    @Column(length = 255)
    private Date createDate; // 企业创建时间

    @Column(length = 20)
    private String entPhone;// 联系电话

    @Column(length = 20)
    private String entPhoneName;// 联系人姓名

    @Column(length = 32)
    private Date loginDate;//企业登陆时间

    @Column(length = 1024)
    private String entOtherInfo;// 企业其他信息

    @Column(length = 1024)
    private String entProductAndManage;// 企业生产和管理服务的主要内容

    @Column(length = 32)
    private String pollutionMethod;// 排放方式 连续排放

    public Entprise() {
    }

    public Entprise(String entUserId, String entUsercode, String entName, String entReperson, String entAddress,
                    String entProduct, String entScale, String entproductCycle,
                    String entCheckItem, String entZone, String entType,
                    String entBusiness, String entControl, Date createDate,
                    String entPhone, String entPhoneName, String entOtherInfo, String entProductAndManage,
                    String pollutionMethod) {
        this.entUserId = entUserId;
        this.entUsercode = entUsercode;
        this.entName = entName;
        this.entReperson = entReperson;
        this.entAddress = entAddress;
        this.entProduct = entProduct;
        this.entScale = entScale;
        this.entproductCycle = entproductCycle;
        this.entCheckItem = entCheckItem;
        this.entZone = entZone;
        this.entType = entType;
        this.entBusiness = entBusiness;
        this.entControl = entControl;
        this.createDate = createDate;
        this.entPhone = entPhone;
        this.entPhoneName = entPhoneName;
        this.entOtherInfo = entOtherInfo;
        this.entProductAndManage = entProductAndManage;
        this.pollutionMethod = pollutionMethod;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getEntUsercode() {
        return entUsercode;
    }

    public void setEntUsercode(String entUsercode) {
        this.entUsercode = entUsercode;
    }

    public String getEntName() {
        return entName;
    }

    public void setEntName(String entName) {
        this.entName = entName;
    }

    public String getEntReperson() {
        return entReperson;
    }

    public void setEntReperson(String entReperson) {
        this.entReperson = entReperson;
    }

    public String getEntAddress() {
        return entAddress;
    }

    public void setEntAddress(String entAddress) {
        this.entAddress = entAddress;
    }

    public String getEntProduct() {
        return entProduct;
    }

    public void setEntProduct(String entProduct) {
        this.entProduct = entProduct;
    }

    public String getEntScale() {
        return entScale;
    }

    public void setEntScale(String entScale) {
        this.entScale = entScale;
    }

    public String getEntCheckItem() {
        return entCheckItem;
    }

    public void setEntCheckItem(String entCheckItem) {
        this.entCheckItem = entCheckItem;
    }

    public String getEntZone() {
        return entZone;
    }

    public void setEntZone(String entZone) {
        this.entZone = entZone;
    }

    public String getEntType() {
        return entType;
    }

    public void setEntType(String entType) {
        this.entType = entType;
    }

    public String getEntBusiness() {
        return entBusiness;
    }

    public void setEntBusiness(String entBusiness) {
        this.entBusiness = entBusiness;
    }

    public String getEntControl() {
        return entControl;
    }

    public void setEntControl(String entControl) {
        this.entControl = entControl;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    public String getEntPhone() {
        return entPhone;
    }

    public void setEntPhone(String entPhone) {
        this.entPhone = entPhone;
    }

    public String getEntPhoneName() {
        return entPhoneName;
    }

    public void setEntPhoneName(String entPhoneName) {
        this.entPhoneName = entPhoneName;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    public String getEntpriseId() {
        return entpriseId;
    }

    public void setEntpriseId(String entpriseId) {
        this.entpriseId = entpriseId;
    }

    public String getEntproductCycle() {
        return entproductCycle;
    }

    public void setEntproductCycle(String entproductCycle) {
        this.entproductCycle = entproductCycle;
    }

    public String getEntOtherInfo() {
        return entOtherInfo;
    }

    public void setEntOtherInfo(String entOtherInfo) {
        this.entOtherInfo = entOtherInfo;
    }

    public String getPollutionMethod() {
        return pollutionMethod;
    }

    public void setPollutionMethod(String pollutionMethod) {
        this.pollutionMethod = pollutionMethod;
    }

    public String getEntProductAndManage() {
        return entProductAndManage;
    }

    public void setEntProductAndManage(String entProductAndManage) {
        this.entProductAndManage = entProductAndManage;
    }

}
