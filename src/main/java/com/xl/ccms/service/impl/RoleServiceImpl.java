package com.xl.ccms.service.impl;

import com.xl.ccms.dao.RoleDao;
import com.xl.ccms.entity.Page;
import com.xl.ccms.entity.RoleInfo;
import com.xl.ccms.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by xl on 2019/2/17 0017.
 */

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public Map<String,Object> queryRoleInfo(Page page) {
        Map<String,Object> map = new HashMap<>();

        List<RoleInfo> roleInfos = roleDao.selectRoleInfo(page);

        for (RoleInfo roleInfo : roleInfos) {
            System.out.println(roleInfo);
        }


        Integer num = roleDao.countRoleInfo();

        map.put("rows",roleInfos);
        map.put("total",num);

        return map;
    }

    @Override
    public Integer modifyRole(String accountId, String roleId) {
        Integer r1 = roleDao.deleteRole(accountId);
        Integer r2 = roleDao.insertRole(UUID.randomUUID().toString(),accountId,roleId);
        return r1+r2;
    }

}
