<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
		<div class="col-md-12 column" style="background: url('images/main1.jpg');height: 70px;">
			<!-- <img alt="140x140" src="images/main1.jpg" /> -->
			<div style="float: right;margin-top: 10px;margin-right: 200px;">
			<span style="font-size: 30px;">当前用户 ：${loginStaff.name}</span>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="logout.do">退出用户</a>
			</div>
	    </div>
	</div>
	<div class="row clearfix" style="margin-top: 50px;">
		<div class="col-md-2 column">
			<div class="list-group">
				 <a  class="list-group-item active">导航</a>
				<div class="list-group-item">
					<h4 class="list-group-item-heading">
						<a href="staffinfo.do" target="_ret">我的信息</a>
					</h4>
					<p class="list-group-item-text">
						...
					</p>
				</div>
				<div class="list-group-item">
					<h4 class="list-group-item-heading">
						<a href="stafflog.do" target="_ret">我的履历</a>
					</h4>
					<p class="list-group-item-text">
						...
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-6 column">
			<iframe name="_ret" style="height: 600px;width: 100%;" frameborder="0" src="staffinfo.do"></iframe>
		</div>
		<div class="col-md-4 column">
			<div class="jumbotron">
				<h1>
					公告栏<hr>
				</h1>
				<p>
					${department.notice}
				</p>
				<p>
					 <!-- <a class="btn btn-primary btn-large" href="#">Learn more</a> -->
				</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>