package com.xl.ccms.service.impl;

import com.xl.ccms.dao.LogDao;
import com.xl.ccms.entity.Log;
import com.xl.ccms.entity.Page;
import com.xl.ccms.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xl on 2019/2/23 0023.
 */
@Service
@Transactional
public class LogServiceImpl implements LogService{

    @Autowired
    private LogDao logDao;

    @Override
    public Map<String,Object> queryLogByPage(Page page) {

        // 总记录数
        Integer count = logDao.countTotalRows();
        page.setTotalRows(count);

        // 当前页需要的数据集合
        List<Log> logs = logDao.selectByPage(page);

        Map<String, Object> map = new HashMap<>();
        map.put("total", count);
        map.put("rows", logs);

        return map;
    }
}
