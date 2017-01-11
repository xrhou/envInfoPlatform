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
    <script type="text/javascript">
    var qiwuran = null;
	var shuiwuran = null;
    $(f_initGrid);
 	function f_initGrid(){
	    var columns1 = [
	                    { display: '排放口编号<br>或名称', name: 'pMouth', align: 'left', width: '10%'}, 
	        			{ display: '排放口位置', name: 'pLocation', align: 'left', width: '10%'}, 
	        			{ display: '排放方式', name: 'pMethod', align: 'left', width: '10%'}, 
	        			{ display: '特征污染物名称', name: 'pName', align: 'left', width: '15%'},
	        			{ display: '排放浓度(mg/L)', name: 'mgL', align: 'left', width: '8%'}, 					
	                    { display: '监测方式', name: 'monitorMothod', align: 'left', width: '10%'}
	                ];
	     var columns2 = [
	                    { display: '监测时间', name: 'monitorDate', align: 'left', width: '10%'}, 
	        			{ display: '排放总量<br>(Kg)', name: 'totalEmission', align: 'left', width: '10%'}, 
	        			{ display: '核定的排放<br>总量(Kg)', name: 'accountTotalEmission', align: 'left', width: '10%'}, 
	        			{ display: '执行的污染物排放<br>标准及浓度限值(mg/L)', name: 'standartMGL', align: 'left',width: '18%'},
	                    { display: '是否<br>超标', name: 'over', align: 'left',width: '5%'}
	                ];
	       var columns3 = [{ display: '排放口数量', columns: columns1 },{ display: '', columns: columns2 }];
	    
	       qiwuran=$("#maingrid4").ligerGrid({
	            //columns: [{ display: '水污染物', columns: columns3}],
	            columns: [{display: '排放口数量', columns: columns1 },{ display: '', columns: columns2}],
	        	toolbar: { items: [
	        		                { text: '增加', click: addRow, icon: 'add' },
	        		                { line: true },
	        		                { text: '修改', click: updateRow, icon: 'modify' },
	        		                { line: true },
	        		                { text: '删除', click: deleteRow, icon: 'delete' },
	        		                { line: true },
	        		                { text: '刷新', click: function(){g.loadData(true);}, icon: 'refresh'}
	        		                ]
	        		         },
				pageSize: 15,
				pageSizeOptions: [10, 20, 50, 100],
				checkbox: false,
				isSort: false,
	            data: CustomersData,
	            rowHeight: '22',
	            headerRowHeight:'28',
	            rownumbers: false,
	            userPager:true,
	            width: '99%',
	            height: '99%'
	            });
 	}
 	shuiwuran=$("#maingrid5").ligerGrid({
        columns: [{ display: '水污染物', columns: columns3}],
    	toolbar: { items: [
    		                { text: '增加', click: addRow, icon: 'add' },
    		                { line: true },
    		                { text: '修改', click: updateRow, icon: 'modify' },
    		                { line: true },
    		                { text: '删除', click: deleteRow, icon: 'delete' },
    		                { line: true },
    		                { text: '刷新', click: function(){g.loadData(true);}, icon: 'refresh'}
    		                ]
    		         },
		pageSize: 15,
		pageSizeOptions: [10, 20, 50, 100],
		checkbox: false,
		isSort: false,
        data: CustomersData,
        rowHeight: '22',
        headerRowHeight:'28',
        rownumbers: false,
        userPager:true,
        width: '20%',
        height: '10%'
        });
        
        function addRow() {	
        	alert("增加其他信息!");
        }
    	function updateRow(){
    		alert("更新其他信息!");
    	}
    	 
    	function deleteRow(){	
    		alert("选中一条其他信息，删除!");
        } 
    </script>
</head>
<body style="padding:6px; overflow:hidden;">
 	<div style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span id="local_span" >${entUser.entName}</span><span style="color:red;">&nbsp;&nbsp;单位排污信息</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
    <div id="maingrid4" style="margin-bottom:5px"></div>
    <br/>
    <div id="maingrid5" style="height:10%"></div>
    <br/>
  	<div style="display:none;"></div>
</body>
</html>
