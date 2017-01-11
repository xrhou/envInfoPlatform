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
	background-image: url(${bathPath}images/bjZL.jpg);
}
.main {
  background: #fff;
  height: auto;
  width: 1000px;
  padding: 15px 12px 20px 12px;
  margin:15px 200px 10px 200px;
  display:block;
}
.main .dqwz{margin-bottom: 10px;}
.main .qy_dhxx{width: 978px;height: auto;margin: 0 auto;}
.main .qy_dhxx .qy_jbxx_l{width: 250px;}
.qy_jbxx_bt1 {background: url(${bathPath}/images/detail_title.jpg) no-repeat;width: 250px;height: 36px;line-height: 36px;text-align: center;font-family: "微软雅黑";font-size: 20px;
}
.main .qy_dhxx .qy_jbxx_cont {width: 248px;border: #dee0e3 1px solid;border-top: 0px;height: auto;}
.qy_jbxx_cont{padding: 10px 5px 40px 5px;}
</style>
<script src="${bathPath}js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${bathPath}js/jquery.nav.js" type="text/javascript"></script>
<script src="${bathPath}js/framework.js" type="text/javascript" ></script>
</head>
<body>
<jsp:include page="${bathPath}top.jsp"/>

<div class="main">
	<div class="dqwz">
		当前位置：<a href="">首页</a>&nbsp;&nbsp;>&nbsp;<a href="">XXX污水处理厂</a>&nbsp;&nbsp;>&nbsp;监测情况
	</div>
	<div class="qy_dhxx">
		<div style="background:url(${bathPath}/images/detail_title.jpg) no-repeat;
			width: 250px;height: 36px;line-height: 36px;text-align: center;
			font-family:"微软雅黑";font-size:20px;">企业详情</div>
		<div class="qy_jbxx_cont">
			<ul>
				<li><a href="#">企业基本信息</a></li>
				<li><a href="#">自行监测方案</a></li>
				<li><a href="#">监测情况</a></li>
				<li><a href="#">年度自行监测报告</a></li>
			</ul>
		</div>
	</div>
	<div >
	企业基本信息
	</div>

</div>
<jsp:include page="${bathPath}footer.jsp"/>
</body>
</html>
