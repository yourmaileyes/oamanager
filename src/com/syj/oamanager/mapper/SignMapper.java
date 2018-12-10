package com.syj.oamanager.mapper;

import java.util.List;

import com.syj.oamanager.entity.Sign;

public interface SignMapper {
	List<Sign> selectall();
	
	List<Sign> selectallByStaffid(String staffid);
	
    int deleteByPrimaryKey(Integer signid);

    int insert(Sign record);

    int insertSelective(Sign record);

    Sign selectByPrimaryKey(Integer signid);

    int updateByPrimaryKeySelective(Sign record);

    int updateByPrimaryKey(Sign record);
}