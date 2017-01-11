package com.env.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 企业主要生产产品
 *
 * @author hbj403
 */
@Entity
@Table(name = "EntProduct")
public class EntProduct implements Serializable {

    private static final long serialVersionUID = 1511417111579756147L;

    @Id
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(length = 32)
    private String entProductId;//企业生产产品id

    @Column(length = 16, nullable = false)
    private String entUserId;//企业登记号

    @Column(length = 255)
    private String entProduct01;//主要生产产品

    @Column(length = 255)
    private String entScale01;//企业生产规模

    @Column(length = 255)
    private String entProduct02;//主要生产产品

    @Column(length = 255)
    private String entScale02;//企业生产规模

    @Column(length = 255)
    private String entProduct03;//主要生产产品

    @Column(length = 255)
    private String entScale03;//企业生产规模

    @Column(length = 255)
    private String entProduct04;//主要生产产品

    @Column(length = 255)
    private String entScale04;//企业生产规模

    @Column(length = 255)
    private String entProduct05;//主要生产产品

    @Column(length = 255)
    private String entScale05;//企业生产规模

    @Column(length = 255)
    private String entProduct06;//主要生产产品

    @Column(length = 255)
    private String entScale06;//企业生产规模

    @Column(length = 255)
    private String entProduct07;//主要生产产品

    @Column(length = 255)
    private String entScale07;//企业生产规模

    @Column(length = 255)
    private String entProduct08;//主要生产产品

    @Column(length = 255)
    private String entScale08;//企业生产规模

    @Column(length = 255)
    private String entProduct09;//主要生产产品

    @Column(length = 255)
    private String entScale09;//企业生产规模

    @Column(length = 255)
    private String entProduct10;//主要生产产品

    @Column(length = 255)
    private String entScale10;//企业生产规模

    public String getEntProductId() {
        return entProductId;
    }

    public void setEntProductId(String entProductId) {
        this.entProductId = entProductId;
    }

    public String getEntProduct01() {
        return entProduct01;
    }

    public String getEntUserId() {
        return entUserId;
    }

    public void setEntUserId(String entUserId) {
        this.entUserId = entUserId;
    }

    public void setEntProduct01(String entProduct01) {
        this.entProduct01 = entProduct01;
    }

    public String getEntScale01() {
        return entScale01;
    }

    public void setEntScale01(String entScale01) {
        this.entScale01 = entScale01;
    }

    public String getEntProduct02() {
        return entProduct02;
    }

    public void setEntProduct02(String entProduct02) {
        this.entProduct02 = entProduct02;
    }

    public String getEntScale02() {
        return entScale02;
    }

    public void setEntScale02(String entScale02) {
        this.entScale02 = entScale02;
    }

    public String getEntProduct03() {
        return entProduct03;
    }

    public void setEntProduct03(String entProduct03) {
        this.entProduct03 = entProduct03;
    }

    public String getEntScale03() {
        return entScale03;
    }

    public void setEntScale03(String entScale03) {
        this.entScale03 = entScale03;
    }

    public String getEntProduct04() {
        return entProduct04;
    }

    public void setEntProduct04(String entProduct04) {
        this.entProduct04 = entProduct04;
    }

    public String getEntScale04() {
        return entScale04;
    }

    public void setEntScale04(String entScale04) {
        this.entScale04 = entScale04;
    }

    public String getEntProduct05() {
        return entProduct05;
    }

    public void setEntProduct05(String entProduct05) {
        this.entProduct05 = entProduct05;
    }

    public String getEntScale05() {
        return entScale05;
    }

    public void setEntScale05(String entScale05) {
        this.entScale05 = entScale05;
    }

    public String getEntProduct06() {
        return entProduct06;
    }

    public void setEntProduct06(String entProduct06) {
        this.entProduct06 = entProduct06;
    }

    public String getEntScale06() {
        return entScale06;
    }

    public void setEntScale06(String entScale06) {
        this.entScale06 = entScale06;
    }

    public String getEntProduct07() {
        return entProduct07;
    }

    public void setEntProduct07(String entProduct07) {
        this.entProduct07 = entProduct07;
    }

    public String getEntScale07() {
        return entScale07;
    }

    public void setEntScale07(String entScale07) {
        this.entScale07 = entScale07;
    }

    public String getEntProduct08() {
        return entProduct08;
    }

    public void setEntProduct08(String entProduct08) {
        this.entProduct08 = entProduct08;
    }

    public String getEntScale08() {
        return entScale08;
    }

    public void setEntScale08(String entScale08) {
        this.entScale08 = entScale08;
    }

    public String getEntProduct09() {
        return entProduct09;
    }

    public void setEntProduct09(String entProduct09) {
        this.entProduct09 = entProduct09;
    }

    public String getEntScale09() {
        return entScale09;
    }

    public void setEntScale09(String entScale09) {
        this.entScale09 = entScale09;
    }

    public String getEntProduct10() {
        return entProduct10;
    }

    public void setEntProduct10(String entProduct10) {
        this.entProduct10 = entProduct10;
    }

    public String getEntScale10() {
        return entScale10;
    }

    public void setEntScale10(String entScale10) {
        this.entScale10 = entScale10;
    }


}
