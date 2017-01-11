package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 企业排污信息表
 *
 * @author hbj403
 */
@Entity
@Table(name = "Ent_Pollution_Info")
public class EntPollutionInfo implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String pollutionInfoId;//企业排污信息表id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 32)
    private String pMouth;//排放口编号或名称

    @Column(length = 64)
    private String pLocation;//排放口位置

    @Column(length = 64)
    private String pMethod;//排放方式

    @Column(length = 128)
    private String pName;//特征污染物名称

    @Column(length = 64)
    private String mgL;//排放浓度

    @Column(length = 32)
    private String monitorMothod;//监测方式

    @Column(length = 32)
    private String monitorDate;//监测时间

    @Column(length = 32)
    private String totalEmission;//排放总量

    @Column(length = 32)
    private String accountTotalEmission;//核定的排放总量

    @Column(length = 32)
    private String standartMGL;//执行的污染物排放浓度标准浓度限值mg/L

    @Column(length = 2)
    private String over;//是否超标

    @Column(length = 16)
    private String gasOrWater;//判断是水还是从气页面添加的信息  水/气

    public String getPollutionInfoId() {
        return pollutionInfoId;
    }

    public void setPollutionInfoId(String pollutionInfoId) {
        this.pollutionInfoId = pollutionInfoId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getpMouth() {
        return pMouth;
    }

    public void setpMouth(String pMouth) {
        this.pMouth = pMouth;
    }

    public String getpLocation() {
        return pLocation;
    }

    public void setpLocation(String pLocation) {
        this.pLocation = pLocation;
    }

    public String getpMethod() {
        return pMethod;
    }

    public void setpMethod(String pMethod) {
        this.pMethod = pMethod;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getMgL() {
        return mgL;
    }

    public void setMgL(String mgL) {
        this.mgL = mgL;
    }

    public String getMonitorMothod() {
        return monitorMothod;
    }

    public void setMonitorMothod(String monitorMothod) {
        this.monitorMothod = monitorMothod;
    }

    public String getMonitorDate() {
        return monitorDate;
    }

    public void setMonitorDate(String monitorDate) {
        this.monitorDate = monitorDate;
    }

    public String getTotalEmission() {
        return totalEmission;
    }

    public void setTotalEmission(String totalEmission) {
        this.totalEmission = totalEmission;
    }

    public String getAccountTotalEmission() {
        return accountTotalEmission;
    }

    public void setAccountTotalEmission(String accountTotalEmission) {
        this.accountTotalEmission = accountTotalEmission;
    }

    public String getStandartMGL() {
        return standartMGL;
    }

    public void setStandartMGL(String standartMGL) {
        this.standartMGL = standartMGL;
    }

    public String getOver() {
        return over;
    }

    public void setOver(String over) {
        this.over = over;
    }

    public String getGasOrWater() {
        return gasOrWater;
    }

    public void setGasOrWater(String gasOrWater) {
        this.gasOrWater = gasOrWater;
    }

}
