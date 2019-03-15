package com.xl.ccms.dao;

import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Role;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface AccountDao {

    public Integer insertAccount(Account account);

    public Integer deleteAccount(String id);

    public Integer updateAccount(Account account);

    public Account selectAccountById(String id);

    public List<Account> selectAllAccount();

    public List<Role> selectRoleById(String id);

    public Integer countByCondition(Account account);

}
