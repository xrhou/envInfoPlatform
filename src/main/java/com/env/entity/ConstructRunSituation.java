package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 防治污染设施的建设和运行情况
 *
 * @author hbj403
 */
@Entity
@Table(name = "Construct_Run_Situation")
public class ConstructRunSituation implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String crunSid;//建设和运行情况id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 128)
    private String facilityName;//设施名称

    @Column(length = 32)
    private String runTime;//设施投运行时间

    @Column(length = 32)
    private String handleAbulity;//处理能力

    @Column(length = 128)
    private String runStation;//运行情况

    @Column(length = 128)
    private String operatorUnit;//运维单位

    @Column(length = 32)
    private String facilityClass;//设施类别

    public String getCrunSid() {
        return crunSid;
    }

    public void setCrunSid(String crunSid) {
        this.crunSid = crunSid;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getFacilityName() {
        return facilityName;
    }

    public void setFacilityName(String facilityName) {
        this.facilityName = facilityName;
    }

    public String getRunTime() {
        return runTime;
    }

    public void setRunTime(String runTime) {
        this.runTime = runTime;
    }

    public String getHandleAbulity() {
        return handleAbulity;
    }

    public void setHandleAbulity(String handleAbulity) {
        this.handleAbulity = handleAbulity;
    }

    public String getRunStation() {
        return runStation;
    }

    public void setRunStation(String runStation) {
        this.runStation = runStation;
    }

    public String getOperatorUnit() {
        return operatorUnit;
    }

    public void setOperatorUnit(String operatorUnit) {
        this.operatorUnit = operatorUnit;
    }

    public String getFacilityClass() {
        return facilityClass;
    }

    public void setFacilityClass(String facilityClass) {
        this.facilityClass = facilityClass;
    }

}
