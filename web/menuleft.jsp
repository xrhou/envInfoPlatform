<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>左侧功能菜单</title>
<link href="<%=basePath%>css/part1.css" rel="stylesheet" type="text/css" />
<style type="text/css">

</style>
<script language="javascript" src="<%=basePath%>js/jquery-1.7.1.min.js"></script>
<script>
 function selectLink(n){
   $("#sel_"+n).css({"color":"red"});
   for(var i=1;i<=7;i++){
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
       <a href="<%=basePath%>entpriseInfo.jsp?entUserId=${entUser.entUserId}" target="right" style="text-decoration: none">
          <img src="<%=basePath%>images/m_9.png" width="30" height="30" />
          <span id="sel_1" style="vertical-align: text-bottom;">企业基本信息</span>
       </a>
    </li>
     <li class="bg55"></li>
    <li class="bg5 " id="bg5" onclick="selectLink('2')">
       <a href="<%=basePath%>ent_pollution_info.jsp" target="right" style="text-decoration: none">
          <img src="<%=basePath%>images/m_2.png" width="30" height="30"/>
          <span id="sel_2" >企业排污信息</span>
       </a>
    </li>
       <li class="bg55"></li>
       <li class="bg5 " id="bg5" onclick="selectLink('3')">
       <a  href="<%=basePath%>pollution_facility.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_3.png" width="30" height="30" />
          <span id="sel_3" >污染设施情况</span>
       </a>
    </li>
       <li class="bg55"></li>
    <li class="bg5 " id="bg5" onclick="selectLink('4')">
       <a href="<%=basePath%>effectAndLicense.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_1.png" width="30" height="30" />
          <span id="sel_4" >行政许可情况</span>
       </a>
    </li>
       <li class="bg55"></li>
    <li class="bg5 " id="bg5" onclick="selectLink('5')">
       <a href="<%=basePath%>selfEmergencyPlanList.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_9.png" width="30" height="30" />
          <span id="sel_5" >突发应急预案</span>
        </a>
     </li>
       <li class="bg55"></li>
       <li class="bg5 " id="bg5" onclick="selectLink('6')">
       <a href="<%=basePath%>selfMonitorReport.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_2.png" width="30" height="30" />
          <span id="sel_5" >自行监测报告</span>
        </a>
     </li>
     <li class="bg55"></li>
     <li class="bg5 " id="bg5" onclick="selectLink('7')">
       <a href="<%=basePath%>other_ent_info.jsp" target="right" style="text-decoration: none">
          <img  src="<%=basePath%>images/m_1.png" width="30" height="30" />
          <span id="sel_5">其他公开信息</span>
        </a>
     </li>
       <li class="bg55"></li>
  </ul>
</div>
</body>
</html>

