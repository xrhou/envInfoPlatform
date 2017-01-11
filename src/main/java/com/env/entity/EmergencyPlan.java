package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 突发环境应急预案
 *
 * @author hbj403
 */
@Entity
@Table(name = "Emergency_Plan")
public class EmergencyPlan implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String emergencyPlanId;//突发应急预案id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 32)
    private String planDept;//备案部门

    @Column(length = 16)
    private String planTime;//备案时间

    @Column(length = 255)
    private String emergencyPlanName;//应急预案 名称

    @Column(length = 16777216)
    private String planContent;//主要内容

    @Column(length = 255)
    private String planPath;//应急预案 文件路径

    public EmergencyPlan() {
    }

    public EmergencyPlan(String emergencyPlanId, String entUserId, String planDept, String planTime, String emergencyPlanName, String planContent, String planPath) {
        this.emergencyPlanId = emergencyPlanId;
        this.entUserId = entUserId;
        this.planDept = planDept;
        this.planTime = planTime;
        this.emergencyPlanName = emergencyPlanName;
        this.planContent = planContent;
        this.planPath = planPath;
    }

    public String getEmergencyPlanId() {
        return emergencyPlanId;
    }

    public void setEmergencyPlanId(String emergencyPlanId) {
        this.emergencyPlanId = emergencyPlanId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getPlanDept() {
        return planDept;
    }

    public void setPlanDept(String planDept) {
        this.planDept = planDept;
    }

    public String getPlanTime() {
        return planTime;
    }

    public void setPlanTime(String planTime) {
        this.planTime = planTime;
    }

    public String getPlanContent() {
        return planContent;
    }

    public void setPlanContent(String planContent) {
        this.planContent = planContent;
    }

    public String getPlanPath() {
        return planPath;
    }

    public void setPlanPath(String planPath) {
        this.planPath = planPath;
    }

    public String getEmergencyPlanName() {
        return emergencyPlanName;
    }

    public void setEmergencyPlanName(String emergencyPlanName) {
        this.emergencyPlanName = emergencyPlanName;
    }

}
