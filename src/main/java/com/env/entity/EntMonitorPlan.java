package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 企业自行监测方案
 *
 * @author hbj403
 */
@Entity
@Table(name = "ent_monitor_plan")
public class EntMonitorPlan implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String planId;//企业自行监测方案id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 255)
    private String entPlanFileName;//企业自行监测方案名称

    @Column(length = 255)
    private String entPlanFilePath;//企业自行监测方案存放路径

    @Column(length = 255)
    private Date entPlanDate;//监测方案提交时间

    @Column(length = 16)
    private String entYear;//监测方案年

    public String getPlanId() {
        return planId;
    }

    public void setPlanId(String planId) {
        this.planId = planId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getEntPlanFileName() {
        return entPlanFileName;
    }

    public void setEntPlanFileName(String entPlanFileName) {
        this.entPlanFileName = entPlanFileName;
    }

    public String getEntPlanFilePath() {
        return entPlanFilePath;
    }

    public void setEntPlanFilePath(String entPlanFilePath) {
        this.entPlanFilePath = entPlanFilePath;
    }

    public Date getEntPlanDate() {
        return entPlanDate;
    }

    public void setEntPlanDate(Date entPlanDate) {
        this.entPlanDate = entPlanDate;
    }

    public String getEntYear() {
        return entYear;
    }

    public void setEntYear(String entYear) {
        this.entYear = entYear;
    }


}
