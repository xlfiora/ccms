package com.xl.ccms.service;

import com.xl.ccms.entity.Page;
import com.xl.ccms.entity.RegisterInfo;

import java.util.Map;

/**
 * Created by xl on 2019/2/20 0020.
 */
public interface RegisterInfoService {

    public Integer addRegisterInfo(RegisterInfo registerInfo);

    public Integer modifyRegisterInfo(RegisterInfo registerInfo);

    public Map<String,Object> queryAllRegisterInfo(Page page,RegisterInfo registerInfo);

}
