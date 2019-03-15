package com.xl.ccms.service;



import com.xl.ccms.entity.Page;

import java.util.Map;


public interface LogService {

    public Map<String,Object> queryLogByPage(Page page);

}
