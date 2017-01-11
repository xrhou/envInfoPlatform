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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>自行监控企业水污染物管理</title>
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
    <script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <style type="text/css">
        #fm{
            margin:0;
            padding:10px 30px;
        }
        .ftitle{
            font-size:14px;
            font-weight:bold;
            color:#666;
            padding:5px 0;
            margin-bottom:10px;
            border-bottom:1px solid #ccc;
        }
        .fitem{
            margin-bottom:5px;
        }
        .fitem label{
            display:inline-block;
            width:80px;
        }
    </style>

    <script type="text/javascript">
        var url;
        function newUser(){
            $('#dlg').dialog('open').dialog('setTitle','新增信息');
            $('#fm').form('clear');
            url = 'add_stu.do';
        }
        function editUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','修改信息');
                $('#fm').form('load',row);
                url = 'edit_stu.do?id='+row.id;
            }
        }
        function saveUser(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.success){
                        $('#dlg').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                        $.messager.show({
                            title: 'Message',
                            msg: '添加成功'
                        });
                    } else {
                        $.messager.show({
                            title: '出错',
                            msg: result.msg
                        });
                    }
                }
            });
        }
        function removeUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('Confirm','您确定要删除本条信息吗?',function(r){
                    if (r){
                        $.post('remove_stu.do',{id:row.id},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                                $.messager.show({
                                    title: 'Message',
                                    msg: '添加成功'
                                });
                            } else {
                                $.messager.show({    // show error message
                                    title: '出错',
                                    msg: result.msg
                                });
                            }
                        },'json');
                    }
                });
            }
        }
    </script>
</head>
<body>
    <table id="dg" title="水污染物" class="easyui-datagrid" style="width:800px;height:750px" url="get_stu.do" toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
			<tr>
			    <th colspan="6">排放口数量</th>
			    <th colspan="5">我的顶顶顶顶顶</th>
			    <!-- <th data-options="field:'itemid',width:80" rowspan="2">Item ID</th>
			    <th data-options="field:'productid',width:100" rowspan="2">Product</th> -->
			</tr>
			<tr>
			    <th data-options="field:'listprice',width:108,align:'center'">排放口编号或名称</th>
			    <th data-options="field:'unitcost',width:80,align:'center'">排放口位置</th>
			    <th data-options="field:'attr1',width:80,align:'center'">排放方式</th>
			    <th data-options="field:'status',width:130,align:'center'">主要/特征污染物名称</th>
			    <th data-options="field:'status',width:80,align:'center'">排放浓度(mg/L)</th>
			    <th data-options="field:'status',width:60,align:'center'">监测方式</th>
			    <th data-options="field:'listprice',width:108,align:'center'">1</th>
			    <th data-options="field:'unitcost',width:80,align:'center'">2</th>
			    <th data-options="field:'attr1',width:80,align:'center'">3</th>
			    <th data-options="field:'status',width:130,align:'center'">4</th>
			    <th data-options="field:'status',width:80,align:'center'">5</th>
			</tr>
		</thead>
    </table>
    <div id="toolbar">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="removeUser()">删除</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">User Information</div>
        <form id="fm" method="post" novalidate>
            <div class="fitem">
                <label>姓名:</label>
                <input name="name" class="easyui-validatebox" required="true">
                <label>年龄:</label>
                <input name="name" class="easyui-validatebox" required="true">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()">保存</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    </div>
</body>
</html>