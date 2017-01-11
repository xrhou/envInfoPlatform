package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 环境影响评价及其他环境保护行政许可情况
 *
 * @author hbj403
 */
@Entity
@Table(name = "Effect_License")
public class EffectAppraiseAndLicense implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String effectLicenseId;//影响评价id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 255)
    private String buildingName;//建设项目名称

    @Column(length = 128)
    private String eiaUnits;//环评批复单位

    @Column(length = 32)
    private String eiaDate;//环评批复时间

    @Column(length = 64)
    private String eiaDocNumber;//环评批复文号

    @Column(length = 255)
    private String completedUnit;//竣工验收单位

    @Column(length = 32)
    private String completedTime;//竣工验收时间

    @Column(length = 64)
    private String completedDocNumber;//竣工验收文号

    @Column(length = 255)
    private String otherSituation;//其他许可情况

    public String getEffectLicenseId() {
        return effectLicenseId;
    }

    public void setEffectLicenseId(String effectLicenseId) {
        this.effectLicenseId = effectLicenseId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getBuildingName() {
        return buildingName;
    }

    public void setBuildingName(String buildingName) {
        this.buildingName = buildingName;
    }

    public String getEiaUnits() {
        return eiaUnits;
    }

    public void setEiaUnits(String eiaUnits) {
        this.eiaUnits = eiaUnits;
    }

    public String getEiaDate() {
        return eiaDate;
    }

    public void setEiaDate(String eiaDate) {
        this.eiaDate = eiaDate;
    }

    public String getEiaDocNumber() {
        return eiaDocNumber;
    }

    public void setEiaDocNumber(String eiaDocNumber) {
        this.eiaDocNumber = eiaDocNumber;
    }

    public String getCompletedUnit() {
        return completedUnit;
    }

    public void setCompletedUnit(String completedUnit) {
        this.completedUnit = completedUnit;
    }

    public String getCompletedTime() {
        return completedTime;
    }

    public void setCompletedTime(String completedTime) {
        this.completedTime = completedTime;
    }

    public String getCompletedDocNumber() {
        return completedDocNumber;
    }

    public void setCompletedDocNumber(String completedDocNumber) {
        this.completedDocNumber = completedDocNumber;
    }

    public String getOtherSituation() {
        return otherSituation;
    }

    public void setOtherSituation(String otherSituation) {
        this.otherSituation = otherSituation;
    }

}
