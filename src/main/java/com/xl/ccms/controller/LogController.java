package com.xl.ccms.controller;

import com.xl.ccms.entity.Page;
import com.xl.ccms.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by Administrator on 2019/1/11.
 */
@Controller
@RequestMapping("/log")
public class LogController {

    @Autowired
    private LogService logService;

    @RequestMapping("/queryLogByPage")
    public @ResponseBody
    Map<String,Object> queryLogByPage(@RequestParam("page") Integer nowPage, @RequestParam("rows") Integer pageSize){
        Page page = new Page();
        page.setPageIndex(nowPage);
        page.setSingleRows(pageSize);
        return logService.queryLogByPage(page);
    }


}
