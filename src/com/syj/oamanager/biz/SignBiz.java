package com.syj.oamanager.biz;

import java.util.List;

import com.syj.oamanager.entity.Sign;

public interface SignBiz {
    List<Sign> selectall();
	
	List<Sign> selectallByStaffidAndDpName(String staffid);
	
	int deleteByPrimaryKey(Integer signid);

    int insert(Sign record);

    int insertSelective(Sign record);

    Sign selectByPrimaryKey(Integer signid);

    int updateByPrimaryKeySelective(Sign record);

    int updateByPrimaryKey(Sign record);
}
