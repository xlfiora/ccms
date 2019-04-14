package com.xl.ccms.controller;

import com.xl.ccms.entity.Page;
import com.xl.ccms.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by xl on 2019/2/17 0017.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;


    @RequestMapping("/queryRoleInfo")
    public @ResponseBody Map<String,Object> queryRoleInfo(@RequestParam("page")Integer nowPage, @RequestParam("rows")Integer pageSize){

        Page page = new Page();
        page.setPageIndex(nowPage);
        page.setSingleRows(pageSize);

        return roleService.queryRoleInfo(page);
    }

    @RequestMapping("/modifyRole")
    public @ResponseBody Integer modifyRole(String accountId,String roleId){
        roleService.modifyRole(accountId,roleId);
        return 1;
    }

}
