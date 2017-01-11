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
        $(function(){
        	var flag=$("#flag").val();
	        var entName=encodeURIComponent($("#entName").val());
            $("#maingrid4").ligerGrid({
            columns: [{ display: '组织机构代码', name: 'entUserCode', align: 'left', width: '10%'}, 
          			{ display: '企事业单位名称', name: 'entName', align: 'left', width: '30%'}, 
        			{ display: '所在地区', name: 'entZone', align: 'left', width: '10%'}, 
        			{ display: '企业污染类型', name: 'entType', align: 'left', width: '20%'},
                    { display: '企业法人', name: 'entReperson', align: 'left', width: '15%'},
                    { display: '所属行业', name: 'entBusiness', align: 'left', width: '15%'}
        		],
        	dataAction: 'local',
			url: "<%=request.getContextPath()%>/jsonfindAllEntPrise?flag="+flag+"&entName="+entName,
			pageSize: 16,
			pageSizeOptions: [5, 10, 20, 30, 40, 50, 100],
            root:'rows',
            record:'total',                        
			checkbox: false,
			isSort: false,
            rowHeight: '22',
            headerRowHeight:'22',
            rownumbers: false,
            sortName: 'entUserId',
            usePager:true,
            width: '99%',
            height: '99%'
            });
            $("#pageloading").hide();
        });
    </script>
</head>
<body style="padding:6px; overflow:hidden;">
	<input type="hidden" name="flag"  id="flag" value=""/>
	<input type="hidden" id="entName" name="entName" value=""/>
 	<div style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span id="local_span" style="font-size:x-larger;color:red;">污染源企业</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="99%" height="4" /><br/>
    <div id="maingrid4" style="margin:5px 0px 0px 5px; padding:0"></div>
  <div style="display:none;">
</div>
</body>
</html>
