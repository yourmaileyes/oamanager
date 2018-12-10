<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form class="form-horizontal" action="staffupdata.do" method="post" role="form">
			<input type="hidden" name="id" value="${loginStaff.id }">
			    <div class="form-group">
					 <label for="inputEmail1" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-10">
						<input width="80px;" type="text" class="form-control" id="inputEmail1" name="name" value="${loginStaff.name }"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail2" class="col-sm-2 control-label">电话</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputEmail2" name="phone" value="${loginStaff.phone }"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="inputEmail3" name="email" value="${loginStaff.email }"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">密码</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="inputEmail3" name="password" value="${loginStaff.password}"/>
					</div>
				</div>
				<div class="form-group">
					 <label for="inputEmail4" class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
					   <c:if test="${loginStaff.sex eq '男' }">
						<label><input type="radio" id="inputEmail4" name="sex" value="男" checked="checked"/>男</label>
						<label><input type="radio" id="inputEmail4" name="sex" value="女"/>女</label>
						</c:if>
						<c:if test="${loginStaff.sex eq '女' }">
						<label><input type="radio" id="inputEmail4" name="sex" value="男"/>男</label>
						<label><input type="radio" id="inputEmail4" name="sex" value="女" checked="checked"/>女</label>
						</c:if>
						<c:if test="${loginStaff.sex == null }">
						<label><input type="radio" id="inputEmail4" name="sex" value="男"/>男</label>
						<label><input type="radio" id="inputEmail4" name="sex" value="女"/>女</label>
						</c:if>
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">薪资</label>
					
						${loginStaff.salary }元
					
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">职位</label>
					
						${loginStaff.position }
					
				</div>
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label">所属部门</label>
					
						${department.name }
					
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <button type="submit" class="btn btn-default">确认修改</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>