<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>footer</title>
<link href="${bathPath}css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="foot">
		<p>&copy;版权所有 2010-2016 Copyright 湖州市环保局信息中心&nbsp;|&nbsp;&nbsp;技术支持:houxiurong@yeah.net</p>
		<p>地址：湖州市长兴路128号 邮编：313000  浙ICP备10030413号</p>
	</div>
</body>
</html>