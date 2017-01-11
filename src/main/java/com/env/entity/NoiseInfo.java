package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 噪声污染物
 *
 * @author hbj403
 */
@Entity
@Table(name = "Noise_Info")
public class NoiseInfo implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String noiseInfoId;//噪声污染物id

    @Column(length = 16, nullable = false)
    private String entUserId;//噪声污染物企业登记号

    @Column(length = 128)
    private String location;//噪声污染物厂界位置

    @Column(length = 32)
    private String noiseValueDay;//噪声值 昼
    @Column(length = 32)
    private String noiseValueNight;//噪声值 夜
    @Column(length = 32)
    private String dBValueDay;//噪声值 昼
    @Column(length = 32)
    private String dBValueNight;//噪声值 夜
    @Column(length = 255)
    private String overSituation;//超标情况

    public String getNoiseInfoId() {
        return noiseInfoId;
    }

    public void setNoiseInfoId(String noiseInfoId) {
        this.noiseInfoId = noiseInfoId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getNoiseValueDay() {
        return noiseValueDay;
    }

    public void setNoiseValueDay(String noiseValueDay) {
        this.noiseValueDay = noiseValueDay;
    }

    public String getNoiseValueNight() {
        return noiseValueNight;
    }

    public void setNoiseValueNight(String noiseValueNight) {
        this.noiseValueNight = noiseValueNight;
    }

    public String getdBValueDay() {
        return dBValueDay;
    }

    public void setdBValueDay(String dBValueDay) {
        this.dBValueDay = dBValueDay;
    }

    public String getdBValueNight() {
        return dBValueNight;
    }

    public void setdBValueNight(String dBValueNight) {
        this.dBValueNight = dBValueNight;
    }

    public String getOverSituation() {
        return overSituation;
    }

    public void setOverSituation(String overSituation) {
        this.overSituation = overSituation;
    }

}
