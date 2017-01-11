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
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/grid/CustomersData.js" type="text/javascript"></script>
    <script type="text/javascript">
        var columns1 = [
            { display: '应急预案名称', name: 'CompanyName', align: 'left', width: '45%'}, 
			{ display: '备案部门', name: 'CustomerID', align: 'left', width: '20%'}, 
			{ display: '备案时间', name: 'ContactName', align: 'left', width: '15%'}, 
			{ display: '预案详细内容', name: 'CustomerID', align: 'left', width: '20%'}
        ];
        $(function(){
            $("#maingrid4").ligerGrid({
            columns: [{ display: '突发环境应急预案', columns: columns1}],
            pageSize: 15,
			pageSizeOptions: [5, 10, 20, 30, 40, 50, 100],
			checkbox: false,
			isSort: true,
            data: CustomersData,
            rowHeight: '25',
            headerRowHeight:'22',
            rownumbers:false,
            userPager:true,
            width: '99%',
            height: '99%'
            });
            $("#pageloading").hide();
        });
    </script>
</head>
<body style="padding:6px; overflow:hidden;">
 	<div style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span id="local_span" style="color:red;">突发应急预案</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
    <div id="maingrid4" style="margin:0; padding:0"></div>

  <div style="display:none;">
</div>
</body>
</html>
