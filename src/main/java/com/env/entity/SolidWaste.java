package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 固体废物
 *
 * @author hbj403
 */
@Entity
@Table(name = "Solid_Waste")
public class SolidWaste implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;
    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String solidWasteId;//固体废物id

    @Column(length = 16, nullable = false)
    private String entUserId;//固体废物企业登记号

    @Column(length = 128)
    private String wasteName;//固体废物名称

    @Column(length = 2)
    private String isDanger;//是否危险物

    @Column(length = 128)
    private String handleType;//危险物处理方式

    @Column(length = 12)
    private String handleNumber;//处理处置数量

    @Column(length = 128)
    private String handleDirection;//处置方向

    public String getSolidWasteId() {
        return solidWasteId;
    }

    public void setSolidWasteId(String solidWasteId) {
        this.solidWasteId = solidWasteId;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public String getWasteName() {
        return wasteName;
    }

    public void setWasteName(String wasteName) {
        this.wasteName = wasteName;
    }

    public String getIsDanger() {
        return isDanger;
    }

    public void setIsDanger(String isDanger) {
        this.isDanger = isDanger;
    }

    public String getHandleType() {
        return handleType;
    }

    public void setHandleType(String handleType) {
        this.handleType = handleType;
    }

    public String getHandleNumber() {
        return handleNumber;
    }

    public void setHandleNumber(String handleNumber) {
        this.handleNumber = handleNumber;
    }

    public String getHandleDirection() {
        return handleDirection;
    }

    public void setHandleDirection(String handleDirection) {
        this.handleDirection = handleDirection;
    }

}
