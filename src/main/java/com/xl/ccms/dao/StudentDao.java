package com.xl.ccms.dao;

import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2019/1/21.
 */
public interface StudentDao {

    public List<Account> selectStudentByPage(@Param("page") Page page,@Param("account") Account account);

    public Integer countStudentByCondition(@Param("account")Account account);

    public Integer insertStudent(Account account);

    public Integer deleteStudent(String id);

    public Integer updateStudent(Account account);

    public List<Account> selectAll();

    public Integer countById(String id);

}
