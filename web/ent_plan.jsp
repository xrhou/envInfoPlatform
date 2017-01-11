<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
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
        var gridManager = null;
        $(function (){
        //表格
         $("#maingrid").ligerGrid({
                columns: [
                { display: '企业组织机构代码', name: 'entId', align: 'left', width:"15%"},
                { display: '监测企业名称', name: 'entName', align: 'left',width: "25%"},
                { display: '所属行业', name: 'entBusiness', align: 'center',width: "28%"},
                { display: '所属地区', name: 'entZone',width:"10%"},
                { display: '被控属性', name: 'entControl', width: "12%"},
                { display: '企业信息', width: "10%",isAllowHide: false,
                	 render: function (row){
                         var html = '<a style="text-decoration:none;" href="javascript:void(0);" onclick="showRow(\'' + row.entId + '\');return false;">查看</a>';
                         return html;
                     }
                }
                ],
                dataAction: 'local', 
                url: "<%=request.getContextPath()%>/EntPriseServlet?method=jsonfindAll",
                pageSizeOptions: [15, 20, 50, 100, 500], 
                pageSize:15,
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
            });
            $("#pageloading").hide();
        });

        function showRow(entId){
        	//$.ligerDialog.alert('选择的是：' + data.entId);
        	window.open("${bathPath}EntPriseServlet?method=findById&entId="+entId+"");
        }
    </script>
</head>
<body style="padding:0px; overflow:hidden;"> 
	<div class="l-loading" style="display:block" id="pageloading"></div>
	<div id="maingrid" style="display:block;"></div>
	<div style="display:none;"></div>
</body>
</html>
