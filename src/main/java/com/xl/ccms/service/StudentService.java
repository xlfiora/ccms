package com.xl.ccms.service;

import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;

import java.util.Map;

/**
 * Created by Administrator on 2019/1/21.
 */
public interface StudentService {

    public Map<String,Object> queryAllStu(Page page, Account account);
}
