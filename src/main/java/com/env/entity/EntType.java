package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 企业类型
 *
 * @author hbj403
 */
@Entity
@Table(name = "Ent_Type")
public class EntType implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String EntTypeId;//企业类型id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 64)
    private String typeId;//

    @Column(length = 128)
    private String entTypecode;//企业类型 气污染 水污染 ...

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getEntTypecode() {
        return entTypecode;
    }

    public void setEntTypecode(String entTypecode) {
        this.entTypecode = entTypecode;
    }

    public String getEntTypeId() {
        return EntTypeId;
    }

    public void setEntTypeId(String entTypeId) {
        EntTypeId = entTypeId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

}
