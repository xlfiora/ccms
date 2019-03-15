package com.xl.ccms.service;

import com.xl.ccms.entity.Club;
import com.xl.ccms.entity.Page;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface ClubService {

    public Integer addClub(Club club);

    public Integer removeClub(String id);

    public Integer modifyClub(Club club);

    public Club queryClubById(String id);

    public Map<String,Object> queryAllClub(Page page,Club club);

    public Map<String,Object> countClubCategory();

    public Map<String,Object> countClubRegisterInfo();

}
