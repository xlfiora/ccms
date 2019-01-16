package com.xl.ccms.dao;

import com.xl.ccms.entity.Account;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface AccountDao {

    public Integer insertAccount(Account account);

    public Integer deleteAccount(String id);

    public Integer updateAccount(Account account);

    public Account selectAccount(String id);

    public List<Account> selectAllAccount();

}
