<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();      
String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()  + path + "/";
%>
<body onload="init();"></body>
<script>
	function init(){
		alert("添加成功！");
	}
</script>