<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path=request.getContextPath();
	String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<%
	String flag = request.getParameter("flag");
	request.setAttribute("flag",flag);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>所有企业信息</title>
    <link href="${basePath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<link href="${basePath}js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
<link href="${basePath}js/ligerui/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />
<script src="${basePath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script> 
<script src="${basePath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script> 
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
<script src="${basePath}js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script type="text/javascript">
        var grid = null;
    	$(document).ready(getData); 
        function getData(){
	        var flag=$("#flag").val();
	        var entName=encodeURIComponent($("#entName").val());
	        grid=$("#maingrid").ligerGrid({
	                columns: [
	                { display: '企业组织机构代码', name: 'entUserCode', align: 'left', width:"15%"},
	                { display: '监测企业名称', name: 'entName', align: 'left',width: "30%",
	                	render: function (rowDate){
	                        return "<a style='text-decoration:none;' href='#'>"+rowDate.entName+"</a>";
	                    }
	                },
	                { display: '企业类型', name: 'entType', width: "20%"},
	                { display: '所属地区', name: 'entZone',width:"10%"},
	                { display: '被控属性', name: 'entControl', width: "11%"},
	                { display: '企业信息', width: "12%",isAllowHide: false,
	                	 render: function (row){
	                         var html = '<a style="text-decoration:none;" href="javascript:void(0);" onclick="showRow(\'' + row.entUserId + '\');return false;">查看</a>';
	                         return html;
	                     }
	                }
	                ],
	                dataAction: 'local', 
	                url: "<%=request.getContextPath()%>/jsonfindAllEntPrise?flag="+flag+"&entName="+entName,
	                pageSizeOptions: [15, 20, 50, 100, 500], 
	                pageSize:50,
	                sortName: 'entId',
	                root:'rows',
	                record:'total',                        
	                usePager:true,
	                rownumbers:false,
	                checkbox:false,
	                //应用灰色表头
	     			cssClass: 'l-grid-gray', 
	     			width: '100%', 
	     			height: '99%',
	     			onSelectRow: selectRow,
	            });
	            $("#pageloading").hide();
        }

        
        function showRow(entUserId){
        	//$.ligerDialog.alert("${basePath}entprise/getEntprise?entUserId="+entUserId+"");
        	window.open("${basePath}getEntprise?entUserId="+entUserId+"");
        }
        
        function selectRow(data){
        	//$.ligerDialog.alert('选择的是' + data.entUserId);
        	window.open("${basePath}getEntprise?entUserId="+data.entUserId+"");
        }
    </script>
</head>
<body style="padding:0px; overflow:hidden;">
	<input name="flag" type="hidden" id="flag" value="${flag}"/>
	<div class="l-loading" style="display:block" id="pageloading"></div>
	<div class="l-panel-search">
			<div class="l-panel-search-item">企业名称：</div>
			<div class="l-panel-search-item">
				<input type="text" style="width: 300px;" id="entName" name="entName"/>
			</div>
			<div class="l-panel-search-item">
				<a href="javascript:void(0)" onclick="getData()" id="btn"
				 style="text-decoration:none;background:#EDEDED;color:#080808;font-weight:bold;border:1px solid black;border-radius: 4px 4px 4px 4px;">搜索</a>
			</div>
	</div>
	<div id="maingrid" style="display:block;"></div>
	<div style="display:none;"></div>
</body>
</html>
