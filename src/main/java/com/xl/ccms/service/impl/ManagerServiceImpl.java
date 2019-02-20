package com.xl.ccms.service.impl;

import com.xl.ccms.dao.ManagerDao;
import com.xl.ccms.dao.RoleDao;
import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;
import com.xl.ccms.service.ManagerService;
import com.xl.ccms.util.RandomSaltUtil;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2019/1/21.
 */
@Service
@Transactional
public class ManagerServiceImpl implements ManagerService{

    @Autowired
    private ManagerDao managerDao;

    @Autowired
    private RoleDao roleDao;

    @Override
    public Map<String,Object> queryManager(Page page, Account account) {

        Map<String,Object> map = new HashMap<>();

        List<Account> managers = managerDao.selectManagerByPage(page, account);
        Integer num = managerDao.countManagerByCondition(account);

        map.put("rows",managers);
        map.put("total",num);

        return map;
    }

    @Override
    public Integer addManager(Account account) {
        account.setSalt(RandomSaltUtil.generetRandomSaltCode());
        account.setPassword(new Md5Hash(account.getPassword(),account.getSalt(),1024).toString());
        return managerDao.insertManager(account)+roleDao.insertRole(UUID.randomUUID().toString(),account.getId(),"2");
    }

    @Override
    public Integer removeManager(String id) {
        return managerDao.deleteManager(id)+roleDao.deleteRole(id);
    }

    @Override
    public Integer modifyManager(Account account) {
        return managerDao.updateManager(account);
    }
}
