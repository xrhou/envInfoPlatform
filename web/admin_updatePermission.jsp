<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@page import="com.system.service.PermissionService" %>
<%@page import="youngPackage.db.YoungRepository" %>
<%@page import="com.system.utils.Myutils" %>
<%@page import="com.system.bean.PermissionVO" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	String contentid = request.getParameter("contentid");
	//System.out.println("contentid--------"+contentid);
	/* YoungRepository youngEM=(YoungRepository) request.getSession().getAttribute(Myutils.getProperty("youngEM"));
	PermissionService service = new PermissionService();
	PermissionVO permissionVO = new PermissionVO(); */
	/* permissionVO = service.getPermissionByContentId(youngEM,contentid);
	String permission_name = permissionVO.getPermission_name();
	String permission_url = permissionVO.getPermission_url();
	String permission_order= permissionVO.getPermission_order(); //顺序
	String permission_flag= permissionVO.getPermission_flag();  //有效标识
	
	String permission_grade = permissionVO.getPermission_grade();
	String permission_remark = permissionVO.getPermission_remark(); */
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限更新</title>
<link href="<%=basePath%>js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-form.css" rel="stylesheet"type="text/css" />
<script src="<%=basePath%>js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function ()
        {
            $("form").ligerForm();
        }); 
        
        parent.$(".l-dialog,.l-window-mask").show();
        
        function fromSubmit() {
        	var contentid = $("#contentid").val();
        	var permission_name = $("#name").val();
        	var permission_url = $("#url").val();
        	var permission_order = $("#order").val();
        	var permission_flag = $("#flag").val();
        	var permission_grade = $("#grade").val();
        	var permission_remark = $("#remark").val();
        	//alert(name);
        	//alert(address);
        	//alert(contentid);
        	
        	$.ajax({ 
				type: "POST", 
				dataType:"text" ,
				data:"contentid="+contentid+"&permission_name="+encodeURI(permission_name)+"&permission_url="+encodeURI(permission_url)+
				"&permission_flag="+encodeURI(permission_flag)+"&permission_order="+encodeURI(permission_order)+
				"&permission_grade="+encodeURI(permission_grade)+"&permission_remark="+encodeURI(permission_remark),
				url:"<%=request.getContextPath()%>/PermissionServlet?opt=update", 
				isAjaxSubmit: true,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				success: function(data) { 
					
					if(data=="success"){
						    parent.$.ligerDialog.close(); //关闭弹出窗
							parent.window.initBaseInfoGrid();//调父窗口某个方法
							parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
					   }else{
							//alert("服务器出错!请联系 管理员.");
							//$("#loading_container").hide();
					   }
				},
				error: function() {
					alert("服务器出错!请联系 管理员.");
				}
			});
        	
        }
        
        function closeWin() {
        	parent.$.ligerDialog.close(); //关闭弹出窗
			parent.window.initBaseInfoGrid();//调父窗口某个方法
			parent.$(".l-dialog,.l-window-mask").remove(); //关闭弹出层
        }
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
</head>
<body style="padding:10px">
	<form name="form1" id="form1">
		<div></div>
		<input type="hidden" id="contentid" value="<%=contentid %>"/>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">权限名称:</td>
                <td align="left" class="l-table-edit-td"><input name="permission_name" id="name" type="text" id="txtName" type="text" value="<%-- <%=permission_name %> --%>" /></td>
                <td align="left"></td>
            </tr>
             
             <tr>
                <td align="right" class="l-table-edit-td">权限等级:</td>
                <td align="left" class="l-table-edit-td"><input name="permission_grade" id="grade" type="text" id="txtName" type="text" value="<%-- <%=permission_grade %> --%>" /></td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">等级说明:</td>
                <td align="left" class="l-table-edit-td"><input name="permission_remark" id="remark" type="text"  type="text" value="<%-- <%=permission_remark %> --%>" /></td>
                <td align="left"></td>
            </tr>
            
            <tr>
                <td align="right" class="l-table-edit-td">显示序号:</td>
                <td align="left" class="l-table-edit-td"><input name="permission_order" id="order" type="text"  type="text" value="<%-- <%=permission_order %> --%>" /></td>
                <td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">是否有效:</td>
                <td align="left" class="l-table-edit-td">
                   <select name="permission_flag" id="flag">
                     <option value="1" <%-- <%if("1".equals(permission_flag)){%>selected="selected" <%} %> --%>>是</option>
                     <option value="0" <%-- <%if("0".equals(permission_flag)){%>selected="selected" <%} %> --%>>否</option>
                   </select>
                </td>
                <td align="left"></td>
            </tr>
        </table>
 		<br />
 	<div style="float:right">
	 	<input type="button" value="确定" onclick="fromSubmit()" id="Button1" class="l-button l-button-submit" /> 
		<input type="button" value="取消" onclick="closeWin()" class="l-button l-button-reset"/>
	</div>
	</form>
    <div style="display:none">
    <!--  数据统计代码 --></div> 
</body>
</html>