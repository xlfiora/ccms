package com.xl.ccms.service;

import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;

import java.util.Map;

/**
 * Created by Administrator on 2019/1/21.
 */
public interface ManagerService {

    public Map<String,Object> queryManager(Page page, Account account);
}
