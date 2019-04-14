package com.xl.ccms.service.impl;

import com.xl.ccms.dao.RegisterInfoDao;
import com.xl.ccms.dao.RoleDao;
import com.xl.ccms.dao.StudentDao;
import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Page;
import com.xl.ccms.service.StudentService;
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
public class StudentServiceImpl implements StudentService{

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private RegisterInfoDao registerInfoDao;

    @Override
    public Map<String,Object> queryAllStu(Page page, Account account) {

        Map<String,Object> map = new HashMap<>();

        List<Account> students = studentDao.selectStudentByPage(page, account);
        Integer num = studentDao.countStudentByCondition(account);

        map.put("rows",students);
        map.put("total",num);

        return map;
    }

    @Override
    public Integer addStudent(Account account) {
        Integer count = studentDao.countById(account.getId());
        if(count>0){
            return 0;
        }else{
            account.setSalt(RandomSaltUtil.generetRandomSaltCode());
            account.setPassword(new Md5Hash(account.getPassword(),account.getSalt(),1024).toString());
            Integer r1 = studentDao.insertStudent(account);
            Integer r2 = roleDao.insertRole(UUID.randomUUID().toString(), account.getId(), "3");
            return r1+r2;
        }
    }

    @Override
    public Integer removeStudent(String id) {
        Integer r1 = studentDao.deleteStudent(id);
        Integer r2 = roleDao.deleteRole(id);
        Integer r3 = registerInfoDao.deleteRegisterInfo(id);
        return r1+r2+r3;
    }

    @Override
    public Integer modifyStudent(Account account) {
        return studentDao.updateStudent(account);
    }

    @Override
    public List<Account> queryAll() {
        return studentDao.selectAll();
    }
}
