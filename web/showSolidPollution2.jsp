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
    <title>固体废物排放信息</title>
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
                      	{ display: '废物名称', name: 'wasteName', align: 'left', width: '20%'}, 
	        			{ display: '是否危险废物', name: 'isDanger', align: 'center', width: '15%'}, 
	        			{ display: '处理处置方式', name: 'handleType', align: 'center', width: '15%'}, 
	        			{ display: '处理处置数量(Kg)', name: 'handleNumber', align: 'center', width: '15%'},
	                    { display: '处置去向', name: 'handleDirection', align: 'center',width: '20%'}
	        			],
        	toolbar: { items: [
	        		                { text: '查看', click: showRow , icon:'pager'},
	        		     			{ line:true },
	        		                { text: '刷新', click: function(){grid.loadData(true);}, icon: 'refresh'}
	        		                ]
	        },
        	dataAction: 'local',
			url: "<%=request.getContextPath()%>/jsonfindAllSolidWasteByEntUserId?entUserId="+entUserId,
			pageSize: 17,
			pageSizeOptions: [5, 10, 20, 30, 40, 50, 100],
            root:'Rows',
            record:'Total',                        
			checkbox: false,
			isSort: false,
			rowHeight: '18',
            headerRowHeight:'20',
            selectRowButtonOnly: true,
            rownumbers:false,
            sortName: 'solidWasteId',
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
    				title:'查看固体废物排放信息',
    				width: 335, height: 315,
    				url: url+'watchSolidWasteBySolidWasteId?solidWasteId='+encodeURIComponent(rowData.solidWasteId),
    				isResize: true, top: 50
    			});
    		}
        }
	    
        function addRow() {	
        	var url=$("#url").val();
    		$.ligerDialog.open({
    			title:'添加固体废物排放信息',
    			width: 335, height: 305,
    			url:url+'admin_addSolidWaste.jsp',
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
    				title:'修改固体废物排放信息',
    				width: 335, height: 315,
    				url: url+'getSolidWasteBySolidWasteId?solidWasteId='+encodeURIComponent(rowData.solidWasteId),
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
    			$.ligerDialog.confirm('是否确定删除？', function (type){
    		    	if(type==true){
    		    		$.ajax({
    		    	      	type: "POST", 
    		    	      	dataType:"html",
    		    	      	data:"solidWasteId="+encodeURIComponent(rowData.solidWasteId),
    		    	      	url: url+"deleteSolidWasteBySolidWasteId", 
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
  <div id="maingrid4" style="margin:0; padding:0;height:600px"></div>
  <div style="display:none;">
</div>
</body>
</html>
