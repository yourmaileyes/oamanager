package com.syj.oamanager.biz;

import java.util.List;

import com.syj.oamanager.entity.Department;

public interface DepartmentBiz {
	
        List<Department> selectallDepartment(String rows,String page);
	
	    int selectnumber();
	
	    int deleteByPrimaryKey(String id);

	    int insert(Department record);

	    int insertSelective(Department record);

	    Department selectByPrimaryKey(String id);

	    int updateByPrimaryKeySelective(Department record);

	    int updateByPrimaryKey(Department record);
}
