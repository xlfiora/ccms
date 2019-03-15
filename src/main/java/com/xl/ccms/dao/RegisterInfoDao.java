package com.xl.ccms.dao;

import com.xl.ccms.entity.Page;
import com.xl.ccms.entity.RegisterInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by xl on 2019/2/20 0020.
 */
public interface RegisterInfoDao {

    public Integer insertRegisterInfo(RegisterInfo registerInfo);

    public Integer deleteRegisterInfo(String id);

    public Integer updateRegisterInfo(RegisterInfo registerInfo);

    public List<RegisterInfo> selectByPage(@Param("page") Page page, @Param("registerInfo") RegisterInfo registerInfo);

    public Integer countByCondition(@Param("registerInfo") RegisterInfo registerInfo);

}
