package com.xl.ccms.controller;

import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;
import com.xl.ccms.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
