package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 企业所属地区
 *
 * @author hbj403
 */
@Entity
@Table(name = "Ent_Zone")
public class EntZone implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String entzoneId;//企业所属地区表id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 32)
    private String entZoneCode;//企业所属地区 安吉 德清 长兴 吴兴 南浔 开发区

    public String getEntzoneId() {
        return entzoneId;
    }

    public void setEntzoneId(String entzoneId) {
        this.entzoneId = entzoneId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getEntZoneCode() {
        return entZoneCode;
    }

    public void setEntZoneCode(String entZoneCode) {
        this.entZoneCode = entZoneCode;
    }

}
