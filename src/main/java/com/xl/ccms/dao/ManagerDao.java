package com.xl.ccms.dao;

import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2019/1/22.
 */
public interface ManagerDao {

    List<Account> selectManagerByPage(@Param("page") Page page, @Param("account") Account account);

    Integer countManagerByCondition(Account account);
}
