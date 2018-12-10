package com.syj.oamanager.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonUtil {

	public static void formatListWriteTOResponse(HttpServletResponse res,List<?> list,int total)throws Exception{
		JSONArray jso = JSONArray.fromObject(list);
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("rows", jso);
		jsonobj.put("total", total);
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		pw.println(jsonobj.toString());
		pw.flush();
		pw.close();
	}
	public static void delres(HttpServletResponse res,int total) throws IOException {
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("success", "true");
		jsonobj.put("delNums", total);
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		pw.println(jsonobj.toString());
		pw.flush();
		pw.close();
	}
	
}
