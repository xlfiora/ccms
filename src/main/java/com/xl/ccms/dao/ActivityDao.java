package com.xl.ccms.dao;

import com.xl.ccms.entity.Activity;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface ActivityDao {

    public Integer insertActivity(Activity activity);

    public Integer deleteActivity(String id);

    public Integer updateActivity(Activity activity);

    public Activity selectActivity(String id);

    public List<Activity> selectAllActivity();

}
