<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业基本信息</title>
<link href="${bathPath}css/style.css" rel="stylesheet" type="text/css" />
<link href="${bathPath}css/yhxx.css" rel="stylesheet" type="text/css" />
<link href="${bathPath}css/nry.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="conterright">
    	<div class="conterright_header" style=" border:0; text-align: left; text-indent:1em;">企业基本信息</div>
    	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
	    <div class="lb">
	    	<a href="#"><img src="${bathPath}images/lbt.jpg" width="128" height="77" /></a>
	      	<div class="imagesright">各开放实验室领导非常重视这次活动，进行了充分的准备，各开放实验室领导非常重视这 次活动，进行了充分的准备，进行了充分的准..........>>
	      	<a href="#">详情</a>
	      	</div>
	    </div>
 </div>
</body>
</html>