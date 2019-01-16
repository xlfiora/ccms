package com.xl.ccms.service;

import com.xl.ccms.entity.Activity;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface ActivityService {

    public Integer addActivity(Activity activity);

    public Integer removeActivity(String id);

    public Integer modifyActivity(Activity activity);

    public Activity queryActivity(String id);

    public List<Activity> queryAllActivity();

}
