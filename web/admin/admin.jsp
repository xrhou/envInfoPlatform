<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String bathPath = request.getScheme() + "://" + request.getServerName() + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员后台管理admin</title>
    <link rel="stylesheet" type="text/css" href="../js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="../js/easyui/demo.css">
    <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
        #fm {
            margin: 0;
            padding: 10px 30px;
        }

        .ftitle {
            font-size: 14px;
            font-weight: bold;
            padding: 5px 0;
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }

        .fitem {
            margin-bottom: 5px;
        }

        .fitem label {
            display: inline-block;
            width: 80px;
        }

        .fitem input {
            width: 160px;
        }
    </style>
</head>
<body>
    <h2>管理员后台管理admin</h2>
    <table id="dg" title="修改污染源企业用户登录密码" class="easyui-datagrid" style="width:850px;height:750px"
           url="${bathPath}getEasyUIData" toolbar="#toolbar" pagination="true" rownumbers="true"
           fitColumns="true" singleSelect="true">
        <thead>
        <tr>
            <th field="firstname" width="50">单位名称</th>
            <th field="lastname" width="50">组织机构代码</th>
            <th field="phone" width="50">联系电话</th>
            <th field="email" width="50">邮箱</th>
        </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">删除</a>
    </div>

    <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
         closed="true" buttons="#dlg-buttons">
        <div class="ftitle">企业用户信息</div>
        <form id="fm" method="post" novalidate>
            <div class="fitem">
                <label>First Name:</label>
                <input name="firstname" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>Last Name:</label>
                <input name="lastname" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>联系电话:</label>
                <input name="phone" class="easyui-textbox">
            </div>
            <div class="fitem">
                <label>E-mail:</label>
                <input name="email" class="easyui-textbox" validType="email">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
           onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
    <script type="text/javascript">
        var url;
        function newUser() {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle', '新增');
            $('#fm').form('clear');
            url = 'save_user.php';
        }

        function editUser() {
            alert(url)
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $('#dlg').dialog('open').dialog('center').dialog('setTitle', '修改');
                $('#fm').form('load', row);
                url = 'update_user.php?id=' + row.id;
            }
        }
        function saveUser() {
            $('#fm').form('submit', {
                url: url,
                onSubmit: function () {
                    return $(this).form('validate');
                },
                success: function (result) {
                    var result = eval('(' + result + ')');
                    if (result.errorMsg) {
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#dlg').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                    }
                }
            });
        }
        function destroyUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('是否删除', '您确定要删除数据吗?', function (r) {
                    if (r) {
                        $.post('destroy_user.php', {id: row.id}, function (result) {
                            if (result.success) {
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        }, 'json');
                    }
                });
            }
        }
    </script>
</body>
</html>