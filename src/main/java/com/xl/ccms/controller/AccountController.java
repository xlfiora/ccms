package com.xl.ccms.controller;

import com.xl.ccms.entity.Account;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2019/1/9.
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @RequestMapping("/login")
    public void login(){

    }

    @RequestMapping("/addStu")
    public void addStu(Account account){


    }

    @RequestMapping("/removeStu")
    public void removeStu(){

    }

    @RequestMapping("/modifyStu")
    public void modifyStu(){

    }

    @RequestMapping("/searchAllStu")
    public void searchAllStu(){

    }





}
