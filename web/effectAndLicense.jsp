<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%
String path=request.getContextPath();
String bathPath = request.getScheme() + "://"+ request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>建设项目环境影响评价及其他环境保护行政许可情况</title>
    <link href="${bathPath}css/yhxx.css" rel="stylesheet" type="text/css" />
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="${bathPath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
	<script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script type="text/javascript">
    	 $(function(){
    	    var entUserId=$("#entUserId").val();
    	    $("#maingrid4").ligerGrid({
	            	columns: [{ display: '建设项目环境影响评价及其他环境保护行政许可情况', columns: 
		            	[{ display: '建设项目名称', name: 'BuildingName', align: 'left', width: "22%" },
		 				{ display: '环评批复单位', name: 'EiaUnits', align: 'center', width: "13%" },
		 				{ display: '环评批复时间', name: 'EiaDate', align: 'center', width: "10%" },
		 				{ display: '环评批复文号', name: 'EiaDocNumber', align: 'center', width: "13%" },
		 				{ display: '竣工验收单位', name: 'CompletedUnit', align: 'center', width: "13%" },
		 				{ display: '竣工验收时间', name: 'CompletedTime', align: 'center', width: "10%" },
		 				{ display: '竣工验收文号', name: 'CompletedDocNumber', align: 'center', width: "13%"},
		 				{ display: '详情', width: "6%",isAllowHide: false,
		                	 render: function (rowData){
		                         var html = '<a style="text-decoration:none;" href="javascript:void(0);" onclick="showRow(\'' + rowData.EffectLicenseId + '\');return false;">查看</a>';
		                         return html;
		                     }
		 				}
		 				]
	            }],
	            dataAction:'local', 
	            url: "<%=request.getContextPath()%>/jsonfindffectAppraiseAndLicenseByEntUserId?entUserId="+entUserId,
	            pageSize: 18,
				pageSizeOptions: [5, 10, 20, 30, 40, 50, 100],
				isScroll: true,
				checkbox: false,
				isSort: false,
	            rowHeight: '22',
	            headerRowHeight:'20',
	            rownumbers: false,
	            userPager:true,
	            width: '99%',
	            height: '99%'
	            });
	            $("#pageloading").hide();
        });
    	 
    	function showRow(effectLicenseId){
     		var url = $("#url").val();
     		if(null!=effectLicenseId){ 
     			$.ligerDialog.open({
     				title:'查看建设项目环境影响评价及其他行政许可情况',
     				width: 590,height: 320,
     				url: url+'watchEffectAppraiseAndLicense?effectLicenseId='+encodeURIComponent(effectLicenseId),
     				isResize: true, top: 50
     			});
     		} 
         }
    </script>
</head>
<body style="padding:6px; overflow:hidden;">
	<input type="hidden" name="url" id="url" value="<%=bathPath%>"/>
	<input type="hidden" name="entUserId" id="entUserId" value="${entprise.entUserId}"/>
 	<div style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span>${entprise.entName}</span><span id="local_span" style="color:red;">&nbsp;&nbsp;行政许可情况</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
    <div id="maingrid4" style="margin:5px 0px 0px 5px; padding:0"></div>
  <div style="display:none;">
</div>
</body>
</html>
