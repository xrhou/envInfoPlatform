package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 企业控制属性
 *
 * @author hbj403
 */

@Entity
@Table(name = "ent_control_type")
public class EntControlType implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String controlTypeId;//企业控制属性编号id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 32)
    private String entcontrolCode;//企业控制属性 国控 省控 县区控

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getControlTypeId() {
        return controlTypeId;
    }

    public void setControlTypeId(String controlTypeId) {
        this.controlTypeId = controlTypeId;
    }

    public String getEntcontrolCode() {
        return entcontrolCode;
    }

    public void setEntcontrolCode(String entcontrolCode) {
        this.entcontrolCode = entcontrolCode;
    }

}
