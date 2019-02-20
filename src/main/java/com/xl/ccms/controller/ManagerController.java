package com.xl.ccms.controller;

import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;
import com.xl.ccms.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.Map;

/**
 * Created by Administrator on 2019/1/21.
 */
@Controller
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @RequestMapping("/queryManager")
    public @ResponseBody Map<String,Object> queryManager(@RequestParam("page")Integer nowPage, @RequestParam("rows")Integer pageSize){

        Page page = new Page();
        page.setPageIndex(nowPage);
        page.setSingleRows(pageSize);

        Account account = new Account();

        return managerService.queryManager(page,account);
    }

    @RequestMapping("/addManager")
    public @ResponseBody void addManager(String stuId,String username,String password,String tel){

        Account account = new Account();
        account.setType("1");
        account.setId(stuId);
        account.setStuId(stuId);
        account.setUsername(username);
        account.setPassword(password);
        account.setTel(tel);
        account.setEnterdate(new Date());
        Integer result = managerService.addManager(account);

    }

    @RequestMapping("/removeManager")
    public @ResponseBody void removeManager(String id){
        managerService.removeManager(id);
    }

    @RequestMapping("/modifyManager")
    public @ResponseBody void modifyManager(String id,String username,String tel){
        Account account = new Account();
        account.setId(id);
        account.setUsername(username);
        account.setTel(tel);
        managerService.modifyManager(account);
    }


}
