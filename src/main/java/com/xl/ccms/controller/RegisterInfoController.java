package com.xl.ccms.controller;

import com.xl.ccms.dao.ClubDao;
import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Club;
import com.xl.ccms.entity.Page;
import com.xl.ccms.entity.RegisterInfo;
import com.xl.ccms.service.RegisterInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * Created by xl on 2019/2/20 0020.
 */

@Controller
@RequestMapping("/registerInfo")
public class RegisterInfoController {

    @Autowired
    private ClubDao clubDao;

    @Autowired
    private RegisterInfoService registerInfoService;

    @RequestMapping("/addRegisterInfo")
    public @ResponseBody void addRegisterInfo(String clubId, HttpSession session){

        Account account = (Account) session.getAttribute("account");

        Club club = clubDao.selectClubById(clubId);

        RegisterInfo registerInfo = new RegisterInfo();

        registerInfo.setId(UUID.randomUUID().toString());
        registerInfo.setAccountId(account.getId());
        registerInfo.setAccountName(account.getUsername());
        registerInfo.setClubId(clubId);
        registerInfo.setClubNmae(club.getClubName());
        registerInfo.setStatus("0");
        registerInfo.setRegisterDate(new Date());

        registerInfoService.addRegisterInfo(registerInfo);

    }

    @RequestMapping("/queryAllRegisterInfo")
    public @ResponseBody Map<String,Object> queryAllRegisterInfo(@RequestParam("page")Integer nowPage, @RequestParam("rows")Integer pageSize){

        Page page = new Page();
        page.setPageIndex(nowPage);
        page.setSingleRows(pageSize);

        RegisterInfo registerInfo = new RegisterInfo();

        return registerInfoService.queryAllRegisterInfo(page,registerInfo);
    }

    @RequestMapping("/approval")
    private @ResponseBody void approval(String id,String status){
        RegisterInfo registerInfo = new RegisterInfo();
        registerInfo.setId(id);
        registerInfo.setStatus(status);
        registerInfoService.modifyRegisterInfo(registerInfo);
    }

    @RequestMapping("/queryMyClub")
    public @ResponseBody Map<String,Object> queryAllRegisterInfo(@RequestParam("page")Integer nowPage, @RequestParam("rows")Integer pageSize,HttpSession session){

        Page page = new Page();
        page.setPageIndex(nowPage);
        page.setSingleRows(pageSize);

        Account account = (Account) session.getAttribute("account");

        RegisterInfo registerInfo = new RegisterInfo();

        registerInfo.setAccountId(account.getId());

        return registerInfoService.queryAllRegisterInfo(page,registerInfo);
    }

}
