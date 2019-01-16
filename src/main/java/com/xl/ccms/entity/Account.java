package com.xl.ccms.entity;

import java.util.Date;

/**
 * Created by Administrator on 2019/1/3.
 */
public class Account {
    private String id;
    private String username;
    private String password;
    private Date birthday;
    private String sex;
    private String tel;
    private String qq;
    private String dormitory;
    private String hobby;
    private String hometown;
    private String photo;
    private Date enterdate;

    public Account() {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getDormitory() {
        return dormitory;
    }

    public void setDormitory(String dormitory) {
        this.dormitory = dormitory;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getHometown() {
        return hometown;
    }

    public void setHometown(String hometown) {
        this.hometown = hometown;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Date getEnterdate() {
        return enterdate;
    }

    public void setEnterdate(Date enterdate) {
        this.enterdate = enterdate;
    }
}
