package com.xl.ccms.service;

import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Role;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface AccountService {

    public Integer addAccount(Account account);

    public Integer removeAccount(String id);

    public Integer modifyAccount(Account account);

    public Account queryAccountById(String id);

    public List<Account> queryAllAccount();

    public List<Role> queryRoleById(String id);

}
