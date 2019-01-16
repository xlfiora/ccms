package com.xl.ccms.service;

import com.xl.ccms.entity.Account;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface AccountService {

    public Integer addAccount(Account account);

    public Integer removeAccount(String id);

    public Integer modifyAccount(Account account);

    public Account queryAccount(String id);

    public List<Account> queryAllAccount();

}
