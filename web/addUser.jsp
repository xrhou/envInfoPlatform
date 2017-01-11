<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${bathPath}js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${bathPath}js/ajaxfileupload.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<script type="text/javascript">
function ajaxFileUpload() {
	alert("dddd");
	$.ajaxFileUpload({
		url : '/EnvironmentInfoPublicPlatform/addReport',
		secureuri : false,
		fileElementId : 'fileToUpload',
		dataType : 'json',
		data:{
			entUserId:$('#entUserId').val(),entName:$('#entName').val(),entUsercode:$('#entUsercode').val(),productDay:$('#productDay').val(),
			reportDate:$('#reportDate').val(),reportName:$('#reportName').val()
		},
		success : function(data, status) {
			var code = data['code'];
			if (code==200) {
				alert("检测报告上传成功！");
				$.ligerDialog.waitting('正在保存中,请稍候...');
				 parent.$.ligerDialog.close(); //关闭弹出窗
				 parent.window.initBaseInfoGrid();//调父窗口某个方法
				 parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
			}else{
				alert("处理异常！");
			}
		},
		error : function(data, status, e) {
			alert("上传发生异常");
		}
	});
	return false;
}
	/* function addentUser(){
		var form = document.forms[0];
		form.action="/EnvironmentInfoPublicPlatform/addReport";
		form.method="post";
		form.submit();
	} */
</script>
</head>
<body>
	<h1>添加企业用户信息</h1>
	<form name="userForm" action="" enctype="multipart/form-data" method="post" >
		单位名称：<input type="text" name="entName" value="${entprise.entName}">
		年龄：<input type="text" name="entUsercode" value="${entprise.entUsercode}">
	 	生产天数<input name="productDay" type="text" id="productDay"/>
		检测天数：<input name="monitorDay" type="text" id="monitorDay"/>
		报告时间: <input name="reportDate" type="text" id="reportDate"/>
		报告名称: <input id="reportName" name="reportName" type="text" id="reportName"/>
		自行监测报告附件: <input type="file" name="file">
		<input type="button" value="添加" onclick="ajaxFileUpload()">
	</form>
</body>
</html>