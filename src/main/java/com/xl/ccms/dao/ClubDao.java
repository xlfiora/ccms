package com.xl.ccms.dao;

import com.xl.ccms.entity.Club;

import java.util.List;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface ClubDao {

    public Integer insertClub(Club club);

    public Integer deleteClub(String id);

    public Integer updateClub(Club club);

    public Club selectClub(String id);

    public List<Club> selectAllClub();
}
