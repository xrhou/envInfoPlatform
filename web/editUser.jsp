<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<script type="text/javascript">
	function updateUser(){
		var form = document.forms[0];
		form.action="/EnvironmentInfoPublicPlatform/user/updateUser";
		form.method="post";
		form.submit();
	}
</script>
</head>
<body>
	<h1>修改用户</h1>
	<form name="userForm" action="">
		<input type="hidden" name="uid" value="${user.uid }">
		姓名：<input type="text" name="userName" value="${user.userName}">
		年龄：<input type="text" name="age" value="${user.age}">
		<input type="button" value="修改" onclick="updateUser()">
	</form>
	
	
</body>
</html>