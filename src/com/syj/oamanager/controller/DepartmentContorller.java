package com.syj.oamanager.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.syj.oamanager.biz.DepartmentBiz;
import com.syj.oamanager.entity.Department;
import com.syj.oamanager.util.JsonUtil;

@Controller
public class DepartmentContorller {
	@Autowired
	DepartmentBiz departmentBiz;
	
	@RequestMapping(value="departmentlist")
	public String departmentlist(HttpServletResponse res,String rows,String page,HttpSession session) throws Exception {
		
		List<Department> departmentList = departmentBiz.selectallDepartment(rows,page);
		/*System.out.println(departmentList.size());*/
		int total = departmentBiz.selectnumber();
		JsonUtil.formatListWriteTOResponse(res, departmentList,total);
		/*JSONArray jso = JSONArray.fromObject(staffList);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("rows", jso);
		jsonobj.put("total", staffList.size());
		System.out.println(jsonobj.toString());
		System.out.println(jso.toString());
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		pw.println(jsonobj.toString());*/
		return null;
	}
	@RequestMapping(value="departmentSave")
	public void departmentSave(Department department,String type) {
		if(type!=null&&type.equals("save")) {
			departmentBiz.updateByPrimaryKeySelective(department);
			return;
		}
		department.setId(null);
		departmentBiz.insertSelective(department);
		return;
	}
	
	@RequestMapping(value="deletedepartment")
	public void deletedepartment(HttpServletResponse res,String delIds) throws IOException {
		JsonUtil.delres(res, departmentBiz.deleteByPrimaryKey(delIds));
	}

}
