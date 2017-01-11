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
    <title></title>
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
    	var g;
        $(function(){
        	var entUserId = $("#entUserId").val();
        	window['g'] = $("#maingrid4").ligerGrid({
            columns: [{ display: '自行监测方案', name: 'entReportFileName', align: 'left', width: '20%'}, 
          			{ display: '监测天数', name: 'monitorDay', align: 'center', width: '10%'}, 
        			{ display: '监测报告时间', name: 'entReportDate', align: 'center', width: '10%'}, 
        			{ display: '生产天数', name: 'productDay', align: 'center', width: '10%'},
        			{ display: '其他已公开的平台地址', name: 'reportedUrl', align: 'left', width: '35%',
        				render:function(rowData){
     			    	   var reportedUrl = rowData.reportedUrl;
     			    	   if(reportedUrl.length==0){
     			    		   return "<a target='_blank' href='http://101.64.238.234/info/'>http://101.64.238.234/info/</a>";
     					   }else{
     						   //alert("路径:"+"<a href='"+reportedUrl+"'>"+reportedUrl+"</a>");
     						   return "<a target='_blank' href='"+reportedUrl+"'>"+reportedUrl+"</a>";
     			           }
     			     }	
        			},
        			{ display: '查看', name: 'entReportFilePath', align: 'center', width: '15%',
        				 render:function(rowData){
        			    	   var reportId = rowData.reportId;
        			    	   if(reportId.length==0){
        			    		   return "<font color='red'>文件不存在</font>";
        					   }else{
        						   //alert("我的路径:"+"<a href='"+reportId+"'>下载</a>");
        						   return "<a href='"+"<%=request.getContextPath()%>/getDownFile?reportId="+reportId+"'>下载</a>";
        			           }
        			     } 	
        			} 					
        		],
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
        	dataAction: 'local',
        	url: "<%=request.getContextPath()%>/jsonfindByEntUserId?entUserId="+entUserId,
        	pageSize: 15,
			pageSizeOptions: [10, 20, 50, 100],
			checkbox: false,
			isSort: false,
            rowHeight: '22',
            headerRowHeight:'22',
            rownumbers: true,
            userPager:true,
            width: '99%',
            height: '99%'
            });
            $("#pageloading").hide();
        });
        
        function initBaseInfoGrid() {
    		g.loadData(true);
    	}
        
      	//得到选中行
		function getSelectedRow(){         
			var manager = $("#maingrid4").ligerGetGridManager();            
			return manager.getSelectedRow();     
		}
      	
        //增加监测报告
        function addRow() {
        	var url=$("#url").val();
    		$.ligerDialog.open({
    			title:'添加自行监测报告',
    			width: 420, height: 350,
    			modal:false,
    			url:url+'admin_addSelfReport.jsp',
    			isResize: true, top: 50 
    		}); 
        }
        
    	//修改
    	function updateRow(item){
    		var url = $("#url").val();
    		var rowData = getSelectedRow();
    		//alert("rowData.reportId:"+rowData.reportId);
    		if(rowData!=null){
    			window.winfilter = $.ligerDialog.open({
    				title:'修改自行监测报告',
    				width: 420, height: 350,
    				url: url+'getMonitorReportByReportId?reportId='+encodeURIComponent(rowData.reportId),
    				isResize: true, top: 50
    			});
    		}else{
    			$.ligerDialog.warn('请选择一行数据。');
    		}	
    	}
    	
    	//删除
    	function deleteRow(item){	
    		var url = $("#url").val();
    		var rowData = getSelectedRow();
    		//alert("rowData.reportId:"+rowData.reportId+":"+url);
    		if(rowData!=null){
    			$.ligerDialog.confirm('是否确定删除？', function (type){
    		    	if(type==true){
    		    		$.ajax({ 
    		    	      	type: "POST", 
    		    	      	dataType:"html",
    		    	      	data:"reportId="+encodeURIComponent(rowData.reportId),
    		    	      	url: url+"deleteEntMonitorReportByReportId", 
    		    	      	isAjaxSubmit: true,
    		    	      	contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
    		    	      	success: function(data) { 
	    		    	      	if (null!=data) {
	    		    	      		if(data=="success"){
	    		    	      			initBaseInfoGrid();
		    		    	      		var manager = $.ligerDialog.waitting('删除成功！');
		    		    	            setTimeout(function (){manager.close();g.loadData(true);}, 1000);
	    		    		    	}else if(data=="fail"){
	    		    		    		$.ligerDialog.warn('删除数据失败，请重试！');
	    		        		    }
	    		    	      	} 
    		    	      	}
    		    	       }); 
    			       }
    		         });
    			}else{
    				$.ligerDialog.warn('亲,请选择一行数据!');
    			}
    	}
    </script>
</head>
<body style="padding:6px; overflow:hidden;">
	<input type="hidden" name="url" id="url" value="<%=bathPath%>"/>
	<input type="hidden" name="entUserId" id="entUserId" value="${entprise.entUserId}"/>
 	<div style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span>${entUser.entName}</span><span  id="local_span" style="color:red;">&nbsp;&nbsp;环境自行监测报告</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
    <div id="maingrid4" style="margin:5px 0px 0px 5px; padding:0"></div>

  	<div style="display:none;">
</div>
</body>
</html>
