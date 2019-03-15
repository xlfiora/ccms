package com.xl.ccms.service.impl;

import com.xl.ccms.dao.ClubDao;
import com.xl.ccms.entity.Account;
import com.xl.ccms.entity.Club;
import com.xl.ccms.entity.EchartResult;
import com.xl.ccms.entity.Page;
import com.xl.ccms.service.ClubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xl on 2019/2/18 0018.
 */
@Service
@Transactional
public class ClubServiceImpl implements ClubService {

    @Autowired
    private ClubDao clubDao;

    @Override
    public Integer addClub(Club club) {
        return clubDao.insertClub(club);
    }

    @Override
    public Integer removeClub(String id) {
        return clubDao.deleteClub(id);
    }

    @Override
    public Integer modifyClub(Club club) {
        return clubDao.updateClub(club);
    }

    @Override
    public Club queryClubById(String id) {
        return clubDao.selectClubById(id);
    }

    @Override
    public Map<String,Object> queryAllClub(Page page,Club club) {

        Map<String,Object> map = new HashMap<>();

        List<Club> clubs = clubDao.selectClubByPage(page,club);
        Integer num = clubDao.countClubByCondition(club);

        map.put("rows",clubs);
        map.put("total",num);

        return map;


    }

    @Override
    public Map<String,Object> countClubCategory() {

        HashMap<String, Object> map = new HashMap<>();

        ArrayList<String> x = new ArrayList<>();

        List<EchartResult> results = clubDao.countClubCategory();

        for (EchartResult item : results) {
             x.add(item.getName());
        }

        map.put("x",x);
        map.put("value",results);

        return map;
    }

    @Override
    public Map<String, Object> countClubRegisterInfo() {

        HashMap<String, Object> map = new HashMap<>();

        ArrayList<String> club = new ArrayList<>();
        ArrayList<Integer> unApprove = new ArrayList<>();
        ArrayList<Integer> approve = new ArrayList<>();

        List<EchartResult> r1 = clubDao.countClubUnApprove();

        for (EchartResult item : r1) {
            club.add(item.getName());
            unApprove.add(item.getValue());
        }


        List<EchartResult> r2 = clubDao.countClubApprove();
        for (EchartResult item : r2) {
            approve.add(item.getValue());
        }

        map.put("club",club);
        map.put("unApprove",unApprove);
        map.put("approve",approve);

        return map;
    }
}
