<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>湖州环保企业详细信息</title>
<link href="<%=basePath%>css/style.css" rel="stylesheet" type="text/css" />
</head>
<body style="background-image:url(${bathPath}images/bjZL.jpg);">
	<jsp:include page="${bathPath}top.jsp"></jsp:include>
  <div style="margin:0 auto;width:1000px;height:520px;">
    <div class="biao">
      <div class="member1">
       <iframe width="100%" height="510px" src="${bathPath}entpriseInfo.jsp" scrolling="no" frameborder="0" name="right" id="right" style="background:none;"></iframe>
      </div>
    </div>
    &nbsp;
    <div class="news">
    	<div class="member">&nbsp;&nbsp;&nbsp;企业信息列表</div>
    	<iframe id="left" name="left"  width="200" height="480px" src="${bathPath}menuleft.jsp"  scrolling="no" frameborder="0" style="background: #e8f1f8;"></iframe>
    </div>
  </div>
  <jsp:include page="${bathPath}footer.jsp"></jsp:include>
</body>