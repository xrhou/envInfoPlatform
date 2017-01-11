<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
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
<title>左侧功能菜单</title>
<link href="<%=basePath%>css/part1.css" rel="stylesheet" type="text/css" />
<style type="text/css">

</style>
<script language="javascript" src="<%=basePath%>js/jquery-1.7.1.min.js"></script>
<script>
 function selectLink(n){
   $("#sel_"+n).css({"color":"red"});
   for(var i=1;i<=5;i++){
	   if(i==n){continue;}
	   $("#sel_"+i).css({"color":"#055999"});
   }
 }
</script>
</head>
<body onload="selectLink('1')">
<div class="bg3">
  <ul>
    <li class="bg5 " id="bg5" onclick="selectLink('1')">
       <a href="<%=basePath%>admin_entpriseinfo.jsp" target="right" style="text-decoration: none">
          <img src="<%=basePath%>images/m_9.png" width="30" height="30" />
          <span id="sel_1" style="vertical-align: text-bottom;">单位基本信息</span>
       </a>
    </li>
     <li class="bg55"></li>
    <li class="bg5 " id="bg5" onclick="selectLink('2')">
       <a href="<%=basePath%>admin_tabsInfo.jsp" target="right" style="text-decoration:none">
          <img src="<%=basePath%>images/m_2.png" width="30" height="30"/>
          <span id="sel_2" >单位排污信息</span>
       </a>
       <ul id="menulist"></ul>
    </li>
       <li class="bg55"></li>
    <li class="bg5 " id="bg5" onclick="selectLink('3')">
       <a href="<%=basePath%>admin_facility.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_1.png" width="30" height="30" />
          <span id="sel_3" >设施建设运行管理</span>
       </a>
    </li>
       <li class="bg55"></li>
    <li class="bg5 " id="bg5" onclick="selectLink('4')">
       <a  href="<%=basePath%>admin_effectAppraiseAndLicense.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_3.png" width="30" height="30" />
          <span id="sel_4" >影响评价行政许可</span>
       </a>
    </li>
       <li class="bg55"></li>
    <li class="bg5 " id="bg5" onclick="selectLink('5')">
       <a href="<%=basePath%>admin_selfEmergencyPlan.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_9.png" width="30" height="30" />
          <span id="sel_5" >环境突发应急预案</span>
        </a>
     </li>
       <li class="bg55"></li>
       <li class="bg5 " id="bg5" onclick="selectLink('6')">
       <a href="<%=basePath%>admin_selfReport.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_2.png" width="30" height="30" />
          <span id="sel_5" >环境自行监测报告</span>
        </a>
     </li>
     <li class="bg55"></li>
     <li class="bg5 " id="bg5" onclick="selectLink('7')">
       <a href="<%=basePath%>admin_other_ent_info.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_1.png" width="30" height="30" />
          <span id="sel_5" >其他公开环境信息</span>
        </a>
     </li>
       <li class="bg55"></li>
  </ul>
</div>
</body>
</html>

