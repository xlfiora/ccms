package com.xl.ccms.service.impl;

import com.xl.ccms.dao.StudentDao;
import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;
import com.xl.ccms.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/1/21.
 */
@Service
public class StudentServiceImpl implements StudentService{

    @Autowired
    private StudentDao studentDao;

    @Override
    public Map<String,Object> queryAllStu(Page page, Account account) {

        Map<String,Object> map = new HashMap<>();

        List<Account> students = studentDao.selectStudentByPage(page, account);
        Integer num = studentDao.countStudentByCondition(account);

        map.put("rows",students);
        map.put("total",num);

        return map;
    }
}
