package com.syj.oamanager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syj.oamanager.biz.DepartmentBiz;
import com.syj.oamanager.entity.Department;
import com.syj.oamanager.mapper.DepartmentMapper;
@Service(value="DepartmentBiz")
public class DepartmentBizImpl implements DepartmentBiz{
	@Autowired
	DepartmentMapper departmentMapper;

	@Override
	public int deleteByPrimaryKey(String ids) {
		// TODO Auto-generated method stub
		String str[]=ids.split(",");
		for(String id:str) {
			departmentMapper.deleteByPrimaryKey(id);
		}
		return str.length;
	}

	@Override
	public int insert(Department record) {
		// TODO Auto-generated method stub
		return departmentMapper.insert(record);
	}

	@Override
	public int insertSelective(Department record) {
		// TODO Auto-generated method stub
		return departmentMapper.insertSelective(record);
	}

	@Override
	public Department selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return departmentMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Department record) {
		// TODO Auto-generated method stub
		return departmentMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Department record) {
		// TODO Auto-generated method stub
		return departmentMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Department> selectallDepartment(String rows, String page) {
		// TODO Auto-generated method stub
		page = String.valueOf((Integer.parseInt(page)-1)*Integer.parseInt(rows));
		return departmentMapper.selectallDepartment(rows, page);
	}

	@Override
	public int selectnumber() {
		// TODO Auto-generated method stub
		return departmentMapper.selectnumber();
	}

}
