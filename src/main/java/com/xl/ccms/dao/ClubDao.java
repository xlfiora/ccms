package com.xl.ccms.dao;

import com.xl.ccms.entity.Club;
import com.xl.ccms.entity.EchartResult;
import com.xl.ccms.entity.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/1/16.
 */
public interface ClubDao {

    public Integer insertClub(Club club);

    public Integer deleteClub(String id);

    public Integer updateClub(Club club);

    public Club selectClubById(String id);

    public List<Club> selectClubByPage(@Param("page") Page page, @Param("club") Club club);

    public Integer countClubByCondition(@Param("club") Club club);

    public List<EchartResult> countClubCategory();

    public List<EchartResult> countClubUnApprove();

    public List<EchartResult> countClubApprove();
}
