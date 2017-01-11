package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 企业自行监测报告
 *
 * @author hbj403
 */
@Entity
@Table(name = "Ent_Monitor_Report")
public class EntMonitorReport implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String reportId;//企业自行监测报告id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 255)
    private String entReportFileName;//企业自行监测方案名称

    @Column(length = 255)
    private String entReportFilePath;//企业自行监测方案存放路径

    @Column(length = 20)
    private String entReportDate;//监测方案提交时间

    @Column(length = 8)
    private String productDay;//生产天数

    @Column(length = 8)
    private String monitorDay;//监测天数

    @Column(length = 1024)
    private String reportedUrl;//其他已公开的监测报告平台地址

    public EntMonitorReport() {
    }

    public EntMonitorReport(String entUserId, String entReportFileName, String entReportFilePath,
                            String entReportDate, String productDay, String monitorDay, String reportedUrl) {
        this.entUserId = entUserId;
        this.entReportFileName = entReportFileName;
        this.entReportFilePath = entReportFilePath;
        this.entReportDate = entReportDate;
        this.productDay = productDay;
        this.monitorDay = monitorDay;
        this.reportedUrl = reportedUrl;
    }

    public String getReportId() {
        return reportId;
    }

    public void setReportId(String reportId) {
        this.reportId = reportId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getEntReportFileName() {
        return entReportFileName;
    }

    public void setEntReportFileName(String entReportFileName) {
        this.entReportFileName = entReportFileName;
    }

    public String getEntReportFilePath() {
        return entReportFilePath;
    }

    public void setEntReportFilePath(String entReportFilePath) {
        this.entReportFilePath = entReportFilePath;
    }

    public String getEntReportDate() {
        return entReportDate;
    }

    public void setEntReportDate(String entReportDate) {
        this.entReportDate = entReportDate;
    }

    public String getProductDay() {
        return productDay;
    }

    public void setProductDay(String productDay) {
        this.productDay = productDay;
    }

    public String getMonitorDay() {
        return monitorDay;
    }

    public void setMonitorDay(String monitorDay) {
        this.monitorDay = monitorDay;
    }

    public String getReportedUrl() {
        return reportedUrl;
    }

    public void setReportedUrl(String reportedUrl) {
        this.reportedUrl = reportedUrl;
    }
}
