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
<link href="${bathPath}css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	background-image: url(images/bjZL.jpg);
}
</style>
<script src="${bathPath}js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${bathPath}js/jquery.nav.js" type="text/javascript"></script>
<script src="${bathPath}js/framework.js" type="text/javascript" ></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class=" block">
	  <div style="width:1000px;height:475px;">
	    <div>
	      <div>
	       <iframe width="100%" height="475" src="${bathPath}showNoisePollution2.jsp" scrolling="yes" frameborder="0" name="center" id="center" style="background:none;"></iframe>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>
