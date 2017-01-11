package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 其他应当公开环境信息
 *
 * @author hbj403
 */
@Entity
@Table(name = "Other_Public_Info")
public class OtherPublicInfo implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String OtherInfoId;//企业类型id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 255)
    private String otherInfo;//其他环境信息

    @Column(length = 128)
    private String otherPollutionName;//其他应当公开的污染物名称

    @Column(length = 20)
    private String otherTime;//监测时间

    @Column(length = 1024)
    private String otherPollutionDetail;//污染物详情

    public String getOtherInfoId() {
        return OtherInfoId;
    }

    public void setOtherInfoId(String otherInfoId) {
        OtherInfoId = otherInfoId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getOtherInfo() {
        return otherInfo;
    }

    public void setOtherInfo(String otherInfo) {
        this.otherInfo = otherInfo;
    }

    public String getOtherPollutionName() {
        return otherPollutionName;
    }

    public void setOtherPollutionName(String otherPollutionName) {
        this.otherPollutionName = otherPollutionName;
    }

    public String getOtherTime() {
        return otherTime;
    }

    public void setOtherTime(String otherTime) {
        this.otherTime = otherTime;
    }

    public String getOtherPollutionDetail() {
        return otherPollutionDetail;
    }

    public void setOtherPollutionDetail(String otherPollutionDetail) {
        this.otherPollutionDetail = otherPollutionDetail;
    }

}
