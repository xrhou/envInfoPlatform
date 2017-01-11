<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@page import="youngPackage.db.YoungRepository" %>
<%@page import="com.system.utils.Myutils" %> --%>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%-- <%@page import="com.system.dao.PermissionDAO"%> --%>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	/* YoungRepository youngEM=(YoungRepository) request.getSession().getAttribute(Myutils.getProperty("youngEM")); */
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门添加</title>
<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css" />
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
     /*
     $(function ()
        {
            $("form").ligerForm();
        }); 
      */ 
        parent.$(".l-dialog,.l-window-mask").show();
		
        function fromSubmit() {
        	$("#btn").attr("disabled","disabled"); 
        	$.ajax({ 
				type: "POST", 
				dataType:"text" ,
				data:"name="+encodeURI($("#name").val()),
				url:"<%=request.getContextPath()%>/DepartmentServlet?opt=add", 
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
    
</head>
<body style="padding:10px">
<form name="form1" id="form1">
  <div class="box">
  <div class="bg99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="28" valign="bottom"><span class="font5">基本信息</span></td>
    <td>&nbsp;</td>
    <td align="right" valign="bottom"><span class="font6"><a href="#"></a></span></td>
  </tr>
</table>
</div>
    <div class="bg100">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="28" align="left">
    <span class="font3">部门名称:</span><input name="name" id="name" type="text"  class="bk8" />
    </td> 
    <td>
    
    </td>
  </tr>
</table>
</div>
    <div class="bg98"></div>
  </div>
 
  <div style="float:right">
	 	<input type="button" value="确定" onclick="fromSubmit()" id="btn" class="l-button l-button-submit" /> 
		<input type="button" value="取消" onclick="closeWin()" class="l-button l-button-reset"/>
	</div>
</form>	 
</body>
</html>