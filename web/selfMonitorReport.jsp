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
        	var entUserId = $("#entUserId").val();
            $("#maingrid4").ligerGrid({
            columns: [
                    { display: '自行监测报告', name: 'entReportFileName', align: 'left', width: '30%'}, 
                    { display: '监测天数', name: 'monitorDay', align: 'center', width: '10%'}, 
          			{ display: '监测报告时间', name: 'entReportDate', align: 'center', width: '15%'}, 
          			{ display: '生产天数', name: 'productDay', align: 'center', width: '10%'},
          			{ display: '其他已公开的平台地址', name: 'reportedUrl', align: 'left', width: '26%',
          				render:function(row){
      			    	   var reportedUrl = row.reportedUrl;
      			    	   if(reportedUrl.length==0){
      			    		   return "<a target='_blank'  href='http://101.64.238.234/info/'>http://101.64.238.234/info/</a>";
      					   }else{
      						   //alert(reportedUrl);
      						   return "<a  target='_blank' href='"+reportedUrl+"'>"+reportedUrl+"</a>";
      			           }
      			     }		
          			},
          			{ display: '查看', name: 'entReportFilePath', align: 'center', width: '10%',
          				render:function(row){
     			    	   var reportId = row.reportId;
     			    	   if(reportId.length==0){
     			    		   return "<font color='red'>亲,文件不存在</font>";
     					   }else{ 
     						   //alert("我的路径:"+"<a href='"+reportId+"'>下载</a>");
     						   return "<a href='"+"<%=request.getContextPath()%>/getDownFile?reportId="+reportId+"'>下载</a>";
     			           }
     			     }	
          			} 
                     ],
            dataAction: 'local',
            url: "<%=request.getContextPath()%>/jsonfindByEntUserId?entUserId="+entUserId,
			pageSize: 18,
			pageSizeOptions: [5, 10, 20, 30, 40, 50, 100],
			isScroll: true,
			checkbox: false,
			isSort: false,
            rowHeight: '22',
            headerRowHeight:'22',
            rownumbers: false,
            userPager:true,
            width: '99%',
            height: '99%'
            });
            $("#pageloading").hide();
        });
    </script>
</head>
<body style="padding:6px; overflow:hidden;">
	<input type="hidden" name="entUserId" id="entUserId" value="${entprise.entUserId}"/>
 	<div style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span>${entprise.entName}</span><span id="local_span" style="color:red;">&nbsp;&nbsp;自行监测报告</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
    <div id="maingrid4" style="margin:5px 0px 0px 5px; padding:0"></div>

  <div style="display:none;">
</div>
</body>
</html>
