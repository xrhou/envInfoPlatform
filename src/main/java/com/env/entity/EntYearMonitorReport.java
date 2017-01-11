package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 年度企业自行监测报告
 *
 * @author hbj403
 */
@Entity
@Table(name = "Ent_Year_Monitor_Report")
public class EntYearMonitorReport implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String year_reportId;//企业年监测报告id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 255)
    private String entYearReportFileName;// 年度企业自行监测报告名称

    @Column(length = 255)
    private String entYearReportFilePath;// 年度企业自行监测报告存放路径

    @Column(length = 32)
    private Date entYearReportDate;// 年度监测报告提交时间

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getEntYearReportFileName() {
        return entYearReportFileName;
    }

    public void setEntYearReportFileName(String entYearReportFileName) {
        this.entYearReportFileName = entYearReportFileName;
    }

    public String getEntYearReportFilePath() {
        return entYearReportFilePath;
    }

    public void setEntYearReportFilePath(String entYearReportFilePath) {
        this.entYearReportFilePath = entYearReportFilePath;
    }

    public Date getEntYearReportDate() {
        return entYearReportDate;
    }

    public void setEntYearReportDate(Date entYearReportDate) {
        this.entYearReportDate = entYearReportDate;
    }

    public String getYear_reportId() {
        return year_reportId;
    }

    public void setYear_reportId(String year_reportId) {
        this.year_reportId = year_reportId;
    }

}
