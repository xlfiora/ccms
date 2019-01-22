package com.xl.ccms.service.impl;

import com.xl.ccms.dao.ManagerDao;
import com.xl.ccms.dao.StudentDao;
import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;
import com.xl.ccms.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/1/21.
 */
@Service
public class ManagerServiceImpl implements ManagerService{

    @Autowired
    private ManagerDao managerDao;

    @Override
    public Map<String,Object> queryManager(Page page, Account account) {

        Map<String,Object> map = new HashMap<>();

        List<Account> managers = managerDao.selectManagerByPage(page, account);
        Integer num = managerDao.countManagerByCondition(account);

        map.put("rows",managers);
        map.put("total",num);

        return map;
    }
}
