package com.syj.oamanager.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.syj.oamanager.biz.DepartmentBiz;
import com.syj.oamanager.biz.SignBiz;
import com.syj.oamanager.biz.StaffBiz;
import com.syj.oamanager.entity.Department;
import com.syj.oamanager.entity.Sign;
import com.syj.oamanager.entity.Staff;
import com.syj.oamanager.util.JsonUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
@Controller
public class StaffContorller {
	@Autowired
	StaffBiz staffBiz;
	@Autowired
	DepartmentBiz departmentBiz;
	@Autowired
	SignBiz signBiz;
	
	@RequestMapping(value="login")
	public String login(String id,String password,HttpSession session) {
		Staff loginStaff = staffBiz.selectLonginStaff(id, password);
		if(loginStaff==null) {
			session.setAttribute("error", "工号或密码错误");
			return "index";
		}
		if(loginStaff.getAdmin()!=null&&loginStaff.getAdmin().equals("admin")) {
			session.setAttribute("loginStaff", loginStaff);
			return "main";
		}
		Department department = departmentBiz.selectByPrimaryKey(loginStaff.getDepartment());
		session.setAttribute("loginStaff", loginStaff);
		session.setAttribute("department", department);
		return "staffmain";
	}
	
	@RequestMapping(value="stafflist")
	public String stafflist(HttpServletResponse res,Staff staff,String rows,String page,HttpSession session) throws Exception {
		//这里添加多种参数用于搜索指定用户
		List<Staff> staffList = staffBiz.selectallStaff(rows,page,staff);
		int total = staffBiz.selectnumber(staff);
		JsonUtil.formatListWriteTOResponse(res, staffList,total);
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
	
	
	@RequestMapping(value="staffSave")
	public String staffsave(Staff staff,String type,HttpSession session){
		Staff loginStaff = (Staff) session.getAttribute("loginStaff");
		Sign sign = new Sign();
		sign.setPostdate(new Date());
		sign.setStaffid(staff.getId());
		if(type!=null&&type.equals("save")) {
			Staff os = staffBiz.selectByPrimaryKey(staff.getId());
			if(!staff.getDepartment().equals(os.getDepartment())) {
				sign.setDepartmentid(staff.getDepartment());
				sign.setMark("调转部门，职位："+staff.getPosition());
				signBiz.insert(sign);
			}
			if(!staff.getPosition().equals(os.getPosition())) {
				sign.setDepartmentid(staff.getDepartment());
				sign.setMark("职位更换，职位："+staff.getPosition());
				signBiz.insert(sign);
			}
			staffBiz.updateByPrimaryKeySelective(staff);
			return null;
		}
		sign.setDepartmentid(staff.getDepartment());
		sign.setMark("加入公司，职位："+staff.getPosition());
		staff.setPassword(staff.getPhone().substring(staff.getPhone().length()-4, staff.getPhone().length()));
		staffBiz.insertSelective(staff);
		signBiz.insert(sign);
		return null;
	}
	
	@RequestMapping(value="staffDelete")
	public String staffdelete(HttpServletResponse res,String delIds) throws IOException{
		JsonUtil.delres(res,staffBiz.deleteByPrimaryKey(delIds));
		return null;
	}
	
	
	
	@RequestMapping(value="staffinfo")
	public String staffinfo(HttpSession session){
		Staff loginStaff = (Staff) session.getAttribute("loginStaff");
		
		return "staffinfo";
	}
	
	@RequestMapping(value="stafflog")
	public String stafflog(HttpSession session){
		Staff loginStaff = (Staff) session.getAttribute("loginStaff");
		List<Sign> signList = signBiz.selectallByStaffidAndDpName(loginStaff.getId());
		session.setAttribute("signList", signList);
		return "stafflog";
	}
	@RequestMapping(value="staffupdata")
	public String staffupdata(Staff staff,HttpSession session){
		staff.getId();
		staffBiz.updateByPrimaryKeySelective(staff);
		session.setAttribute("loginStaff", staffBiz.selectLonginStaff(staff.getId(), staff.getPassword()));
		return "staffinfo";
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "index";
	}


}
