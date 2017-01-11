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
    <title>防治污染设施的建设和运行情况</title>
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
    		var entUserId = $("#entUserId").val();//crunSid
            grid=$("#maingrid4").ligerGrid({
	            columns: [{ display: '设施类别', name: 'facilityClass', align: 'left', width: '10%'}, 
		          		  { display: '防治污染设施名称', name: 'facilityName', align: 'center', width: '30%'}, 
		        		  { display: '投运时间', name: 'runTime', align: 'center', width: '10%'}, 
		        		  { display: '处理能力', name: 'handleAbulity', align: 'center', width: '10%'},
		        		  { display: '运行情况', name: 'runStation', align: 'center', width: '15%'}, 					
		                  { display: '运维单位', name: 'operatorUnit', align: 'center', width: '15%'}
	        		],
	        	toolbar: {
						  items: [
	        		                { text: '增加', click: addRow, icon: 'add' },
	        		                { line: true },
	        		                { text: '修改', click: updateRow, icon: 'modify' },
	        		                { line: true },
	        		                { text: '删除', click: deleteRow, icon: 'delete' },
	        		                { line: true },
	        		                { text: '查看', click: showRow, icon: 'pager' },
	        		                { line: true },
	        		                { text: '刷新', click: function(){grid.loadData(true);}, icon: 'refresh'}
	        		              ]
	        		         },
				pageSize: 15,
				pageSizeOptions: [10, 20, 50, 100],
				checkbox: false,
				isSort: false,
				url: "<%=request.getContextPath()%>/jsonfindAllconstructRunSituationByEntUserId?entUserId="+entUserId,
				rowHeight: '22',
	            headerRowHeight:'22',
	            selectRowButtonOnly: true,
	            rownumbers:true,
	            userPager:true,
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
    				title:'查看防治污染设施的建设和运行情况',
    				width: 650, height: 290,
    				url: url+'watchConstructRunSituation?crunSid='+encodeURIComponent(rowData.crunSid),
    				isResize: true, top: 50
    			});
    		}
        }
        
        function addRow() {	
        	var url=$("#url").val();
    		$.ligerDialog.open({
    			title:'添加防治污染设施的建设和运行情况',
    			width: 650, height: 290,
    			url:url+'admin_addfacility.jsp',
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
    				title:'修改防治污染设施的建设和运行情况',
    				width: 650, height: 290,
    				url: url+'getConstructRunSituationBycrunSid?crunSid='+encodeURIComponent(rowData.crunSid),
    				isResize: true, top: 50
    			});
    		}
    	}
    	
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
    		    	      	data:"crunSid="+encodeURIComponent(rowData.crunSid),
    		    	      	url: url+"deleteConstructRunSituationBycrunSid", 
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
<body style="padding:6px; overflow:hidden;">
	<input type="hidden" name="url" id="url" value="<%=bathPath%>"/>
	<input type="hidden" name="entUserId" id="entUserId" value="${entprise.entUserId}"/>
 	<div style="border:0; text-align:left; text-indent:1em;">
	当前位置：<span id="local_span">${entUser.entName}</span><span id="local_span" style="color:red;">&nbsp;&nbsp;设施建设运行管理</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
    <div id="maingrid4" style="margin:5px 0px 0px 5px; padding:0"></div>

	<div style="display:none;">
</div>
</body>
</html>
