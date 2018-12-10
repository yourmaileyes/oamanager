<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>班级信息管理</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.6.7/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.6.7/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.6.7/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.6.7/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.6.7/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var url;
	
	function searchGrade(){
		$('#dg').datagrid('load',{
			gradeName:$('#s_gradeName').val()
		});
	}
	
	function deleteGrade(){
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
				$.post("deletedepartment.do",{delIds:ids},function(result){
					if(result.success){
						$.messager.alert("系统提示","您已成功删除<font color=red>"+result.delNums+"</font>条数据！");
						$("#dg").datagrid("reload");
					}else{
						$.messager.alert('系统提示','<font color=red>'+selectedRows[result.errorIndex].gradeName+'</font>'+result.errorMsg);
					}
				},"json");
			}
		});
	}
	
	
	function openGradeAddDialog(){
		$("#dlg").dialog("open").dialog("setTitle","添加部门信息");
		url="departmentSave.do";
		resetValue();
	}
	
	function openGradeModifyDialog(){
		var selectedRows=$("#dg").datagrid('getSelections');
		if(selectedRows.length!=1){
			$.messager.alert("系统提示","请选择一条要编辑的数据！");
			return;
		}
		var row=selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle","编辑部门信息");
		$("#fm").form("load",row);
		url="departmentSave.do?type=save";
	}
	
	function closeGradeDialog(){
		$("#dlg").dialog("close");
		resetValue();
	}
	
	function resetValue(){
		$("#dname").val("");
		$("#dphone").val("");
		$("#demail").val("");
		$("#dmanager").val("");
		$("#dmanagername").val("");
		$("#dintro").val("");
		$("#dnotice").val("");
	}
	
	
	function saveGrade(){
		$("#fm").form("submit",{
			url:url,
			onSubmit:function(){
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
	
	
</script>
</head>
<body style="margin: 5px;">
	<table id="dg" title="部门信息" class="easyui-datagrid" fitColumns="true"
	 pagination="true" rownumbers="true" url="departmentlist.do" fit="true" toolbar="#tb">
		<thead>
			<tr>
				<th field="cb" checkbox="true"></th>
				<th field="id" width="50">编号</th>
				<th field="name" width="100">部门名称</th>
				<th field="phone" width="50">部门电话</th>
				<th field="email" width="50">部门邮箱</th>
				<th field="manager" width="50">部门管理人工号</th>
				<th field="managername" width="50">部门管理人姓名</th>
				<th field="intro" width="50">部门描述</th>
				<th field="notice" width="150">部门公告</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb">
		<div>
			<a href="javascript:openGradeAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
			<a href="javascript:openGradeModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
			<a href="javascript:deleteGrade()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		</div>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width: 400px;height: 480px;padding: 10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post">
			<table>
			<input type="hidden" name="id">
				<tr>
					<td>部门名称：</td>
					<td><input type="text" name="name" id="dname" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>&nbsp;</tr>
				<tr>
					<td valign="top">部门电话：</td>
					<td><input type="text" name="phone" id="dphone" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>&nbsp;</tr>
				<tr>
					<td valign="top">部门邮箱：</td>
					<td><input type="text" name="email" id="demail" class="easyui-validatebox" required="true" validType="email"/></td>
				</tr>
				<tr>&nbsp;</tr>
				<tr>
					<td valign="top">部门经理人工号：</td>
					<td><input type="text" name="manager" id="dmanager" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>&nbsp;</tr>
				<tr>
					<td valign="top">部门经理人姓名：</td>
					<td><input type="text" name="managername" id="dmanagername" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>&nbsp;</tr>
				<tr>
					<td valign="top">部门描述：</td>
					<td><input type="text" name="intro" id="dintro" class="easyui-validatebox" /></td>
				</tr>
				<tr>&nbsp;</tr>
				<tr>
					<td valign="top">部门公告：</td>
					<td><textarea rows="7" cols="30" name="notice" id="dnotice"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="dlg-buttons">
		<a href="javascript:saveGrade()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
		<a href="javascript:closeGradeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
	</div>
</body>
</html>