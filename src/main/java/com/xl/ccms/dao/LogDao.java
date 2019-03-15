package com.xl.ccms.dao;

import com.xl.ccms.entity.Log;
import com.xl.ccms.entity.Page;

import java.util.List;


public interface LogDao {

    public Integer insertLog(Log log);

    public Integer countTotalRows();

    public List<Log> selectByPage(Page page);

}
