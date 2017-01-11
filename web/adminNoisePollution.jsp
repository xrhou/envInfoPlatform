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
    <title>噪声排放信息</title>
    <link href="${bathPath}css/yhxx.css" rel="stylesheet" type="text/css" />
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="${bathPath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
	<script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script type="text/javascript">
    var grid;
    $(function(){
    	var entUserId = $("#entUserId").val();
    	grid=$("#maingrid4").ligerGrid({
            columns: [
                      {display: '厂界位置', name: 'location', align: 'center', width: '15%'},
                      {display: '噪声值(dB)', columns: [
											{ display: '昼间', name: 'noiseValueDay', align: 'left', width: '15%' }, 
											{ display: '夜间', name: 'noiseValueNight', align: 'left',width: '15%' }]
                      },
                      {display: '执行的厂界噪声<br/>排放标准限值(dB)', columns: [
                        					{ display: '昼间', name: 'dBValueDay', align: 'left', width: '15%' }, 
                        					{ display: '夜间', name: 'dBValueNight', align: 'left',width: '15%' }]
                      },
                      {display: '超标情况', name: 'overSituation', align: 'left', width: '15%'}
                      ],
        	toolbar: { items: [
	        		                { text: '增加', click: addRow, icon: 'add' },
	        		                { line: true },
	        		                { text: '修改', click: updateRow, icon: 'modify' },
	        		                { line: true },
	        		                { text: '删除', click: deleteRow, icon: 'delete' },
	        		                { line: true },
	        		                { text: '查看', click: showRow , icon:'pager'},
	        		     			{ line:true },
	        		                { text: '刷新', click: function(){grid.loadData(true);}, icon: 'refresh'}
	        		                ]
	        		         },
        	dataAction: 'local',
			url: "<%=request.getContextPath()%>/jsonfindAllNoiseInfoByEntUserId?entUserId="+entUserId,
			pageSize: 17,
			pageSizeOptions: [5, 10, 20, 30, 40, 50, 100],
            root:'Rows',
            record:'Total',                        
			checkbox: false,
			isSort: false,
			rowHeight: '18',
            headerRowHeight:'32',
            selectRowButtonOnly: true,
            rownumbers:false,
            sortName: 'noiseInfoId',
            usePager:true,
            width: '99%',
            height: '99%'
            });
            $("#pageloading").hide();
        });
    
	    function initBaseInfoGrid() {
	    	grid.loadData(true);
		}
	    
	    function showRow(){
        	var rowData = grid.getSelectedRow();
    		var url = $("#url").val();
    		if (null==rowData) {
    			$.ligerDialog.warn('亲,请选择一行数据!');
    		}else{
    			$.ligerDialog.open({
    				title:'查看噪声信息',
    				width: 420, height: 325,
    				url: url+'watchNoiseInfoByNoiseInfoId?noiseInfoId='+encodeURIComponent(rowData.noiseInfoId),
    				isResize: true, top: 50
    			});
    		}
        }
	    
        function addRow() {	
        	var url=$("#url").val();
    		$.ligerDialog.open({
    			title:'添加噪声信息',
    			width: 420, height: 325,
    			url:url+'admin_addNoiseInfo.jsp',
    			isResize: true, top: 50 
    		});
        }
        
    	function updateRow(){
    		var rowData = grid.getSelectedRow();
    		var url = $("#url").val();
    		if (null==rowData) {
    			$.ligerDialog.warn('亲,请选择一行数据!');
    		}else{
    			$.ligerDialog.open({
    				title:'修改噪声信息',
    				width: 420, height: 325,
    				url: url+'getNoiseInfoByNoiseInfoId?noiseInfoId='+encodeURIComponent(rowData.noiseInfoId),
    				isResize: true, top: 50
    			});
    		}
    	}
    	
    	//删除
    	function deleteRow(){	
    		var url = $("#url").val();
    		var rowData =grid.getSelectedRow();
    		if(null==rowData){
    			$.ligerDialog.warn('亲,请选择一行数据!');
    		}else{
    			$.ligerDialog.confirm('亲,是否确定删除？', function (type){
    		    	if(type==true){
    		    		$.ajax({
    		    	      	type: "POST", 
    		    	      	dataType:"html",
    		    	      	data:"noiseInfoId="+encodeURIComponent(rowData.noiseInfoId),
    		    	      	url: url+"deleteNoiseInfoByNoiseInfoId", 
    		    	      	isAjaxSubmit: true,
    		    	      	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
    		    	      	success: function(data) { 
	    		    	      	if (null!=data) {
	    		    	      		if(data=="success"){
	    		    	      			initBaseInfoGrid();
		    		    	      		var manager = $.ligerDialog.waitting('删除成功！');
		    		    	            setTimeout(function (){manager.close();grid.loadData(true);}, 1000);
	    		    		    	}else if(data=="fail"){
	    		    		    		$.ligerDialog.warn('删除数据失败，请重试！');
	    		        		    }
	    		    	      	}
    		    	      	}
    		    	       }); 
    			       }
    		         });
    		}
    	}
    </script>
</head>
<body style="padding:2px; overflow:hidden;">
	<input type="hidden" name="url" id="url" value="<%=bathPath%>"/>
	<input type="hidden" name="entUserId" id="entUserId" value="${entprise.entUserId}"/>
	<div id="title"><span style="float:center; padding:5px 20px;color:red;">噪声(周边有噪声敏感建筑物的单位应当公开，其他单位自愿公开)</span></div>
	<div id="maingrid4" style="margin:0; padding:0;height:600px"></div>
	<div style="display:none;">
</div>
</body>
</html>
