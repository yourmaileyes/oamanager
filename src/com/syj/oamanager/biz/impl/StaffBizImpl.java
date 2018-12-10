package com.syj.oamanager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syj.oamanager.biz.StaffBiz;
import com.syj.oamanager.entity.Staff;
import com.syj.oamanager.mapper.DepartmentMapper;
import com.syj.oamanager.mapper.StaffMapper;
@Service(value="StaffBiz")
public class StaffBizImpl implements StaffBiz{
	@Autowired
	StaffMapper staffMapper;
	@Autowired
	DepartmentMapper departmentMapper;

	@Override
	public Staff selectLonginStaff(String id, String password) {
		// TODO Auto-generated method stub
		return staffMapper.selectLonginStaff(id, password);
	}

	@Override
	public List<Staff> selectallStaff(String rows,String page,Staff staff) {
		// TODO Auto-generated method stub
		/*if(rows==null&&page==null) {
			return staffMapper.selectallStaff();
		}*/
		int row =Integer.parseInt(rows);
		int toline =(Integer.parseInt(page)-1)*row;
		if(staff==null) {
			staff = new Staff();
		}
		if(staff.getSex()!=null&&staff.getSex().equals("null")) {
			staff.setSex(null);
		}
		if(staff.getDepartment()!=null&&staff.getDepartment().equals("null")) {
			staff.setDepartment(null);
		}
		if(staff.getName()!=null&&staff.getName().equals("")) {
			staff.setName(null);
		}
		if(staff.getId()!=null&&staff.getId().equals("")) {
			staff.setId(null);
		}
		List<Staff> staffList =staffMapper.selectallStaff(row,toline,staff.getId(),staff.getName(),staff.getSex(),staff.getDepartment());
		for(int i=0;i<staffList.size();i++) {
			if(staffList.get(i).getDepartment()==null)
				continue;
			
			staffList.get(i).setDepartment(departmentMapper.selectByPrimaryKey(staffList.get(i).getDepartment()).getName());
		}
		return staffList;
	}

	@Override
	public int selectnumber(Staff staff) {
		// TODO Auto-generated method stub
		if(staff==null) {
			staff = new Staff();
		}
		if(staff.getSex()!=null&&staff.getSex().equals("null")) {
			staff.setSex(null);
		}
		if(staff.getDepartment()!=null&&staff.getDepartment().equals("null")) {
			staff.setDepartment(null);
		}
		if(staff.getName()!=null&&staff.getName().equals("")) {
			staff.setName(null);
		}
		if(staff.getId()!=null&&staff.getId().equals("")) {
			staff.setId(null);
		}
		return staffMapper.selectnumber(staff.getId(),staff.getName(),staff.getSex(),staff.getDepartment());
	}

	@Override
	public int deleteByPrimaryKey(String ids) {
		// TODO Auto-generated method stub
		String str[]=ids.split(",");
		for(String id:str) {
			staffMapper.deleteByPrimaryKey(id);
		}
		return str.length;
	}

	@Override
	public int insertSelective(Staff record) {
		// TODO Auto-generated method stub
		if(record.getDepartment().equals("技术部")) {
			record.setDepartment("1001");
		}
		if(record.getDepartment().equals("财政部")) {
			record.setDepartment("1002");
		}
		if(record.getDepartment().equals("人事部")) {
			record.setDepartment("1003");
		}
		if(record.getDepartment().equals("综合部")) {
			record.setDepartment("1004");
		}
		return staffMapper.insertSelective(record);
	}

	@Override
	public int updateByPrimaryKeySelective(Staff record) {
		// TODO Auto-generated method stub
		return staffMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public Staff selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return staffMapper.selectByPrimaryKey(id);
	}

}
