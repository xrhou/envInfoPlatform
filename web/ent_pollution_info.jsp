<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="${bathPath}css/yhxx.css" rel="stylesheet" type="text/css" />
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="${bathPath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    
	<link rel="stylesheet" type="text/css" href="${bathPath}js/easyui/themes/default/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="${bathPath}js/easyui/themes/icon.css"/>
	<script type="text/javascript" src="${bathPath}js/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="${bathPath}js/easyui/jquery.easyui.min.js"></script>
</head>
<body>
	<input name="entType" type="hidden" id="entType" value="${entprise.entType}"/>
	<div style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span id="local_span" >${entUser.entName}</span><span style="color:red;">&nbsp;&nbsp;企业排污信息</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="800" height="2" />
	<div style="margin:5px 0px 0px 10px;width:790px;height:auto;" class="easyui-tabs">
		<div title="水污染物" data-options="iconCls:'icon-search'" style="padding:10px">
			<iframe width="100%" height="475" src="${bathPath}showwaterPollution.jsp" 
			scrolling="yes" frameborder="0" name="center" id="center" style="background:none;">
			</iframe>
		</div>
		<div title="大气污染物" data-options="iconCls:'icon-filter'" style="padding:10px">
			<iframe width="100%" height="475" src="${bathPath}showgasPollution.jsp" 
			scrolling="yes" frameborder="0" name="center" id="center" style="background:none;">
			</iframe>
		</div>
		<div title="固体废物" data-options="iconCls:'icon-tip'" style="padding:10px">
			<iframe width="100%" height="475" src="${bathPath}showsolidPollution.jsp" 
			scrolling="yes" frameborder="0" name="center" id="center" style="background:none;">
			</iframe>
		</div>
		<div title="噪声" data-options="iconCls:'icon-save'">
			<iframe width="100%" height="475" src="${bathPath}shownoisePollution.jsp" 
			scrolling="yes" frameborder="0" name="center" id="center" style="background:none;">
			</iframe>
		</div>
		<div title="其他污染类型" data-options="iconCls:'icon-reload'">
			<iframe width="100%" height="475" src="${bathPath}showsolidPollution.jsp" 
			scrolling="yes" frameborder="0" name="center" id="center" style="background:none;">
			</iframe>
		</div>
	</div>
</body>
</html>