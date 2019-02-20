package com.xl.ccms.service;

import com.xl.ccms.entity.Page;

import java.util.Map;

/**
 * Created by xl on 2019/2/17 0017.
 */
public interface RoleService {

    public Map<String,Object> queryRoleInfo(Page page);

    public Integer modifyRole(String accountId,String roleId);


}
