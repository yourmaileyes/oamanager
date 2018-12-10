package com.syj.oamanager.biz;

import java.util.List;

import com.syj.oamanager.entity.Staff;

public interface StaffBiz {
	Staff selectLonginStaff(String id,String password);
	
	List<Staff> selectallStaff(String rows,String page,Staff staff);
	
	int selectnumber(Staff staff);
	
	int deleteByPrimaryKey(String id);
	
	int insertSelective(Staff record);
	
	int updateByPrimaryKeySelective(Staff record);
	
	Staff selectByPrimaryKey(String id);
}
