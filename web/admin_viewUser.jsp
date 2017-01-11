﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tgb.web.controller.entity.EntUser"%>
<%@page import="java.util.List"%>
<%@page import="com.tgb.web.controller.utils.Myutils"%>
<%-- <%@page import="com.system.dao.RoleDAO"%> --%>
<html>
<%       
	String path = request.getContextPath();      
	String basepath = request.getScheme() + "://"  
			+ request.getServerName() + ":" + request.getServerPort() 
			+ path + "/";
			
	EntUser user = (EntUser)request.getAttribute("user");
	String roleName = (String)request.getAttribute("roleName");
	String BM = (String)request.getAttribute("BM");
%>
<head>
    <title></title>
    <link href="<%=basepath%>js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="<%=basepath%>js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="<%=basepath%>js/ligerui/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script> 
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerMenuBar.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
	<script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=basepath%>content/user/data/CustomersData.js" type="text/javascript"></script>

    <style type="text/css">
    #showDetail{
     width:80%;
     height:80%;
     font-size: medium;
     margin-top: 35px;
     margin-left: 10%;
    } 
    </style>
</head>
<body > 
 
<div id="showDetail">
 <table style="width: 100%;" border="1" cellspacing=5 cellpadding=3>
    <tr  style="">
       <td  >用户名称：<%=user.getEntName() %></td>
    </tr>
    <tr  style="">
       <td ><span style="visibility: hidden">空空</span>姓名：<%-- <%=null==user.getRealName()?"":user.getRealName() %> --%></td>
    </tr>
   <!--   <tr  style="">
        <td >组织机构代码: </td>
    </tr>-->
    <tr  style="">
        <td >手机号码：<%-- <%=null==user.getPhone()?"":user.getPhone() %> --%></td>
    </tr>
    <tr  style="">
        <td ><span style="visibility: hidden">空空</span>部门：<%--  <%=BM%> --%></td>
    </tr>
    <tr  style="">
        <td ><span style="visibility: hidden">空空</span>角色：<%--  <%=roleName %> --%></td>
    </tr>
     <tr  style="">
        <td ><span style="visibility: hidden">空空</span>职位：<%--  <%=user.getPosition() %> --%></td>
    </tr>
     <tr  style="">
        <td >办公电话： <%-- <%=user.getBGDH() %> --%></td>
    </tr>
     <tr  style="">
        <td ><span style="visibility: hidden">空空</span>宅电： <%-- <%=user.getZD() %> --%></td>
    </tr>
     <tr  style="">
        <td ><span style="visibility: hidden">空</span>虚拟网： <%-- <%=user.getXNW() %> --%></td>
    </tr>
     <tr  style="">
        <td ><span style="visibility: hidden">空</span>创建者：<%--  <%=user.getCreater() %> --%></td>
    </tr>
     <tr  style="">
        <td >创建时间： <%-- <%=user.getCreateTime() %> --%></td>
    </tr>
    
    <tr  style="">
        <td ><span style="visibility: hidden">空空</span>状态：
        <%--  <%if("0".equals(user.getStatus())){%>
         <font style="color: blue">启用</font>
         <%}else if("1".equals(user.getStatus())){%>
         <font style="color: red">禁用</font><%} %> --%></td>
    </tr>
 </table>
 </div>
 
</body>
</html>