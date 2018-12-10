<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生信息管理</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.6.7/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.6.7/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.6.7/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.6.7/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.6.7/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	
	function deleteStudent(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length==0){
			$.messager.alert("系统提示","请选择要删除的数据！");
			return;
		}
		var strIds=[];
		for(var i=0;i<selectedRows.length;i++){
			strIds.push(selectedRows[i].id);
		}
		var ids=strIds.join(",");
		$.messager.confirm("系统提示","您确认要删掉这<font color=red>"+selectedRows.length+"</font>条数据吗？",function(r){
			if(r){
				$.post("staffDelete.do",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示',result.errorMsg);
					}
				},"json");
			}
		});
	}

	function searchStudent(){
		$('#dg').datagrid('load',{
			id:$('#sid').val(),
			name:$('#sname').val(),
			sex:$('#ssex').combobox("getValue"),
			department:$('#s_gradeId').combobox("getValue")
		});
	}
	
	
	function openStudentAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加员工信息");
		resetValue();
		url="staffSave.do";
	}
	
	function saveStudent(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
				if($('#sex').combobox("getValue")==""){
					$.messager.alert("系统提示","请选择性别");
					return false;
				}
				if($('#department').combobox("getValue")==""){
					$.messager.alert("系统提示","请选择所属部门");
					return false;
				}
				return $(this).form("validate");
			},
			success:function(result){
				if(result.errorMsg){
					$.messager.alert("系统提示",result.errorMsg);
					return;
				}else{
					$.messager.alert("系统提示","保存成功");
					resetValue();
					$("#dlg").dialog("close");
					$("#dg").datagrid("reload");
				}
			}
		});
	}
	
	function resetValue(){
		$("#staffid").val("");
		$("#staffname").val("");
		$("#sex").combobox("setValue","");
		$("#staffphone").val("");
		$("#staffemail").val("");
		$("#staffsalary").val("");
		$("#position").combobox("setValue","");
		$("#department").combobox("setValue","");
	}
	
	function closeStudentDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function openStudentModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑员工信息");
		$("#fm").form("load",row);
		url="staffSave.do?type=save";
	}
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="员工信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="stafflist.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50" align="center">编号</th>
				<th field="name" width="100" align="center">姓名</th>
				<th field="sex" width="100" align="center">性别</th>
				<th field="phone" width="100" align="center">手机号</th>
				<th field="salary" width="100" align="center" >薪资</th>
				<th field="position" width="100" align="center">职位</th>
				<th field="email" width="150" align="center">Email</th>
				<th field="department" width="250" align="center">部门</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openStudentAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openStudentModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteStudent()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
		<div>&nbsp;工号：&nbsp;<input type="text" name="id" id="sid" size="10"/>
		&nbsp;姓名：&nbsp;<input type="text" name="name" id="sname" size="10"/>
		&nbsp;性别：&nbsp;<select class="easyui-combobox" id="ssex" name="sex" editable="false" panelHeight="auto">
		    <option value="null">请选择...</option>
			<option value="男">男</option>
			<option value="女">女</option>
		</select>
		&nbsp;所属部门：&nbsp;<select class="easyui-combobox" id="s_gradeId" name="department" editable="false" panelHeight="auto">
		    <option value="null">请选择...</option>
			<option value="1001">技术部</option>
			<option value="1002">财政部</option>
			<option value="1003">人事部</option>
			<option value="1004">综合部</option>
		</select>
		    
		<a href="javascript:searchStudent()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 370px;height: 450px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
		<table  width="300" height="300">
		<tr>
            <td><label>工号:</label></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td><input name="id" id="staffid" class="easyui-validatebox" required="true"></td>
        </tr>
        <tr>
            <td><label>姓名:</label></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td><input name="name" id="staffname" class="easyui-validatebox" required="true"></td>
        </tr>
        <tr>
            <td><label>性别:</label></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
           <td> <select class="easyui-combobox" id="sex" name="sex" editable="false" panelHeight="auto" style="width: 155px">
					    <option value="">请选择...</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select></td>
        </tr>
        <tr>
           <td> <label>电话:</label></td>
           <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
           <td> <input name="phone" id="staffphone"></td>
        </tr>
        <tr>
            <td><label>Email:</label></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
           <td> <input name="email" id="staffemail" class="easyui-validatebox" validType="email"></td>
        </tr>
        <tr>
            <td><label>月薪:</label></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td><input name="salary" id="staffsalary" class="easyui-validatebox" ></td>
        </tr>
        <tr>
            <td><label>职位:</label></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td><select class="easyui-combobox" id="position" name="position" editable="false" panelHeight="auto" style="width: 155px">
				<option value="实习生">实习生</option>
						<option value="员工">员工</option>
						<option value="经理">经理</option>
				</select></td>
        </tr>
        <tr>
            <td><label>部门:</label></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td><select class="easyui-combobox" id="department" name="department" editable="false" panelHeight="auto" style="width: 155px">
				<option value="">请选择...</option>
						<option value="1001">技术部</option>
						<option value="1002">财政部</option>
						<option value="1003">人事部</option>
						<option value="1004">综合部</option>
				</select></td>
        </tr>
        </table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveStudent()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeStudentDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>