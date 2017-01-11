package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 操作日志VO
 *
 * @author
 * @date 2015-6-1
 */
@Entity
@Table(name = "operationlog")
public class OperationLog implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String operatorlogid;//操作日志id

    @Column(length = 255)
    private String entUserId;//操作企业用户标识

    @Column(length = 32)
    private String log_id;//操作日志编号

    @Column(length = 32)
    private String deal_IP;//计算机IP

    @Column(length = 64)
    private String deal_date;//操作日期

    @Column(length = 32)
    private String deal_type;//操作类型

    @Column(length = 128)
    private String description;//日志描述（记录每一个操作）

    public OperationLog() {

    }

    public OperationLog(String deal_IP, String deal_type, String description) {
        this.deal_IP = deal_IP;
        this.deal_type = deal_type;
        this.description = description;
    }

    public OperationLog(String entUserId, String deal_IP, String deal_date, String deal_type, String description) {
        this.entUserId = entUserId;
        this.deal_IP = deal_IP;
        this.deal_date = deal_date;
        this.deal_type = deal_type;
        this.description = description;
    }

    public OperationLog(String log_id, String entUserId, String deal_IP, String deal_date,
                        String deal_type, String description) {
        this.log_id = log_id;
        this.entUserId = entUserId;
        this.deal_IP = deal_IP;
        this.deal_date = deal_date;
        this.deal_type = deal_type;
        this.description = description;
    }

    public String getOperatorlogid() {
        return operatorlogid;
    }

    public void setOperatorlogid(String operatorlogid) {
        this.operatorlogid = operatorlogid;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setentUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getLog_id() {
        return log_id;
    }

    public void setLog_id(String log_id) {
        this.log_id = log_id;
    }

    public String getDeal_IP() {
        return deal_IP;
    }

    public void setDeal_IP(String deal_IP) {
        this.deal_IP = deal_IP;
    }

    public String getDeal_date() {
        return deal_date;
    }

    public void setDeal_date(String deal_date) {
        this.deal_date = deal_date;
    }

    public String getDeal_type() {
        return deal_type;
    }

    public void setDeal_type(String deal_type) {
        this.deal_type = deal_type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
