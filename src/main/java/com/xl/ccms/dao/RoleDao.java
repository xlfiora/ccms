package com.xl.ccms.dao;

import com.xl.ccms.entity.Page;
import com.xl.ccms.entity.RoleInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by xl on 2019/2/17 0017.
 */
public interface RoleDao {

    public Integer insertRole(@Param("id") String id, @Param("accountId") String accountId, @Param("roleId") String roleId);

    public Integer deleteRole(String accountId);

    public List<RoleInfo> selectRoleInfo(@Param("page") Page page);

    public Integer countRoleInfo();

}
