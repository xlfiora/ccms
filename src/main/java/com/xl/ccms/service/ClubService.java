package com.xl.ccms.service;

import com.xl.ccms.entity.Club;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface ClubService {

    public Integer addClub(Club club);

    public Integer removeClub(String id);

    public Integer modifyClub(Club club);

    public Club queryClub(String id);

    public List<Club> queryAllClub();

}
