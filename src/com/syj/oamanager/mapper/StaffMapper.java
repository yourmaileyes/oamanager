package com.syj.oamanager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syj.oamanager.entity.Staff;

public interface StaffMapper {
	Staff selectLonginStaff(@Param("id") String id,@Param("password")String password);
	
	List<Staff> selectallStaff(@Param("rows")int rows,@Param("page")int page,@Param("id")String id,@Param("name")String name,@Param("sex")String sex,@Param("department")String department);
	
	int selectnumber(@Param("id")String id,@Param("name")String name,@Param("sex")String sex,@Param("department")String department);
	
    int deleteByPrimaryKey(String id);

    int insert(Staff record);

    int insertSelective(Staff record);

    Staff selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Staff record);

    int updateByPrimaryKey(Staff record);
}