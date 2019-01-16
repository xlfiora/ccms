package com.xl.ccms.dao;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface Category {

    public Integer insertCategory(Category category);

    public Integer deleteCategory(String id);

    public Integer updateCategory(Category category);

    public Category selectCategory(String id);

    public List<Category> selectAllCAtegory();
}
