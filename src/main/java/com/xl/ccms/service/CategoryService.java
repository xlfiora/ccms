package com.xl.ccms.service;

import com.xl.ccms.dao.Category;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface CategoryService {

    public Integer addCategory(Category category);

    public Integer removeCategory(String id);

    public Integer modifyCategory(Category category);

    public Category queryCategory(String id);

    public List<Category> queryAllCategory();

}
