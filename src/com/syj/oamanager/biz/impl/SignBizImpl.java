package com.syj.oamanager.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.syj.oamanager.biz.SignBiz;
import com.syj.oamanager.entity.Sign;
import com.syj.oamanager.mapper.DepartmentMapper;
import com.syj.oamanager.mapper.SignMapper;
@Service(value="SignBiz")
public class SignBizImpl implements SignBiz{
	@Autowired
	SignMapper signMapper;
	@Autowired
	DepartmentMapper departmentMapper;

	@Override
	public int deleteByPrimaryKey(Integer signid) {
		// TODO Auto-generated method stub
		return signMapper.deleteByPrimaryKey(signid);
	}

	@Override
	public int insert(Sign record) {
		// TODO Auto-generated method stub
		return signMapper.insert(record);
	}

	@Override
	public int insertSelective(Sign record) {
		// TODO Auto-generated method stub
		return signMapper.insertSelective(record);
	}

	@Override
	public Sign selectByPrimaryKey(Integer signid) {
		// TODO Auto-generated method stub
		return signMapper.selectByPrimaryKey(signid);
	}

	@Override
	public int updateByPrimaryKeySelective(Sign record) {
		// TODO Auto-generated method stub
		return signMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Sign record) {
		// TODO Auto-generated method stub
		return signMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Sign> selectall() {
		// TODO Auto-generated method stub
		return signMapper.selectall();
	}

	@Override
	public List<Sign> selectallByStaffidAndDpName(String staffid) {
		// TODO Auto-generated method stub
		List<Sign> signList =signMapper.selectallByStaffid(staffid);
		for(int i=0;i<signList.size();i++) {//将输出的日志表中的部门ID转化为部门名字方便前端显示
			signList.get(i).setDepartmentid(departmentMapper.selectByPrimaryKey(signList.get(i).getDepartmentid()).getName());
		}
		return signList;
	}

}
