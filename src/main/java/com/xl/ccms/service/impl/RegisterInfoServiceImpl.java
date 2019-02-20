package com.xl.ccms.service.impl;

import com.xl.ccms.dao.RegisterInfoDao;
import com.xl.ccms.entity.Page;
import com.xl.ccms.entity.RegisterInfo;
import com.xl.ccms.service.RegisterInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xl on 2019/2/20 0020.
 */
@Service
@Transactional
public class RegisterInfoServiceImpl implements RegisterInfoService {

    @Autowired
    private RegisterInfoDao registerInfoDao;


    @Override
    public Integer addRegisterInfo(RegisterInfo registerInfo) {
        return registerInfoDao.insertRegisterInfo(registerInfo);
    }

    @Override
    public Integer modifyRegisterInfo(RegisterInfo registerInfo) {
        return registerInfoDao.updateRegisterInfo(registerInfo);
    }

    @Override
    public Map<String, Object> queryAllRegisterInfo(Page page, RegisterInfo registerInfo) {

        HashMap<String, Object> map = new HashMap<>();

        List<RegisterInfo> registerInfos = registerInfoDao.selectByPage(page, registerInfo);

        Integer num = registerInfoDao.countByCondition(registerInfo);

        map.put("rows",registerInfos);
        map.put("total",num);

        return map;
    }
}
