package com.xl.ccms.entity;

import java.util.Date;

/**
 * Created by Administrator on 2019/1/3.
 */
public class Club {
    private String id;
    private String clubName;
    private String founder;
    private String attached;
    private String campus;
    private Date createdate;
    private String introduction;
    private Double dues;
    private String emblem;
    private String adviser;

    public Club() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public String getFounder() {
        return founder;
    }

    public void setFounder(String founder) {
        this.founder = founder;
    }

    public String getAttached() {
        return attached;
    }

    public void setAttached(String attached) {
        this.attached = attached;
    }

    public String getCampus() {
        return campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Double getDues() {
        return dues;
    }

    public void setDues(Double dues) {
        this.dues = dues;
    }

    public String getEmblem() {
        return emblem;
    }

    public void setEmblem(String emblem) {
        this.emblem = emblem;
    }

    public String getAdviser() {
        return adviser;
    }

    public void setAdviser(String adviser) {
        this.adviser = adviser;
    }
}
