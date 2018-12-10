<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>员工界面</title>
<%
	// 权限验证
	if(session.getAttribute("loginStaff")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
</head>
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/bootstrapValidator.css">
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>

<body>
<table class="table">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							调任部门
						</th>
						<th>
							时间
						</th>
						<th>
							说明
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${signList }" var="sign">
					<tr>
						<td>
							${sign.signid }
						</td>
						<td>
							${sign.departmentid }
						</td>
						<td>
							<fmt:formatDate value="${sign.postdate }" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							${sign.mark }
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
</body>
</html>