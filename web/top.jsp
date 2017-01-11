<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>湖州市企业事业单位环境信息公开平台</title>
<link href="${bathPath }css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	background-image: url(${bathPath }images/bjZL.jpg);
}
</style>
<!--bnner js-->
<script src="${bathPath }js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${bathPath }js/jquery.nav.js" type="text/javascript"></script>
<script src="${bathPath }js/framework.js" type="text/javascript" ></script>
</head>
<body>
<div class="ding" >
  <div class="msg">
    <div class="left"><span>
    	<script language="javascript" src="/EnvironmentInfoPublicPlatform/js/date.js" type="text/javascript"></script>
    	&nbsp;&nbsp;欢迎您进入 湖州市企业事业单位环境信息公开平台！
    </span>
    </div>
  </div>
</div>
<div class="block">
  <div class="top"><img src="${bathPath}images/top.jpg" width="1013" height="98" /></div>
  <!--nav-->
  <div class="header">
    <div class="nav">
      <ul>
        <li><a href="${bathPath}index.jsp">首页</a></li>
       <!--  <li><a href="#">新闻通知</a></li> -->
        <li><a href="${bathPath}allentlist.jsp">污染源企业</a></li>
      </ul>
    </div>
  </div>
</div>

</body>
</html>