<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加企業用户</title>
<script type="text/javascript">
	function addEntprise(){
		var form = document.forms[0];
		form.action="/EnvironmentInfoPublicPlatform/entprise/addEntprise";
		form.method="post";
		form.submit();
	}
</script>
</head>
<body>
	<h1>添加用户</h1>
	<form name="userForm" action="">
		entId：<input type="text" id="entId" name="entId"><br>
		entName：<input type="text"  id="entName" name="entName"><br>
		entReperson：<input type="text" id="entReperson" name="entReperson"><br>
		entAddress：<input type="text" id="entAddress" name="entAddress"><br>
		entPhone：<input type="text" id="entPhone" name="entPhone"><br>
		entPhoneName：<input type="text" id="entPhoneName" name="entPhoneName"><br>
		<input type="button" value="添加" onclick="addEntprise()">
	</form>
</body>
</html>