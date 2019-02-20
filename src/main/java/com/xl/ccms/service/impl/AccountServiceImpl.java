package com.xl.ccms.service.impl;

import com.xl.ccms.dao.AccountDao;
import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Role;
import com.xl.ccms.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by xl on 2019/2/16 0016.
 */
@Service
@Transactional
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDao accountDao;

    @Override
    public Integer addAccount(Account account) {
        return null;
    }

    @Override
    public Integer removeAccount(String id) {
        return null;
    }

    @Override
    public Integer modifyAccount(Account account) {
        return null;
    }

    @Override
    public Account queryAccountById(String id) {
        return accountDao.selectAccountById(id);
    }

    @Override
    public List<Account> queryAllAccount() {
        return null;
    }

    @Override
    public List<Role> queryRoleById(String id) {
        return accountDao.selectRoleById(id);

    }


}
