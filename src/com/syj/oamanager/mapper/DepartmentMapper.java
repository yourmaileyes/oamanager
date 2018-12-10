package com.syj.oamanager.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syj.oamanager.entity.Department;

public interface DepartmentMapper {
	
	List<Department> selectallDepartment(@Param("rows")String rows, @Param("page")String page);
	
	int selectnumber();
	
    int deleteByPrimaryKey(String id);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);
}