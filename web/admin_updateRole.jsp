<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@page import="com.system.service.PermissionService" %>
<%@page import="youngPackage.db.YoungRepository" %>
<%@page import="com.system.utils.Myutils" %>
<%@page import="com.system.bean.PermissionVO" %>
<%@page import="com.system.dao.PermissionDAO"%>
<%@page import="com.system.service.RoleService" %>
<%@page import="com.system.bean.RoleVO" %>
<%@page import="com.system.dao.RoleDAO"%> --%>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	/* YoungRepository youngEM=(YoungRepository) request.getSession().getAttribute(Myutils.getProperty("youngEM"));
	PermissionDAO permissionDAO=PermissionDAO.getInstance();
	List<PermissionVO> permissionList = permissionDAO.getAllPermissions(youngEM,false);
	Map<String,String> tempMap=new HashMap<String,String>();
	for(PermissionVO permissionVO:permissionList){
		tempMap.put(permissionVO.getPermission_id(),"0 0 0");
	}
	//Myutils.println("---1----"+tempMap);
	String contentid=request.getParameter("contentid");
	RoleDAO roleDAO=RoleDAO.getInstance();
	RoleVO roleVO = roleDAO.getRoleByContentId(youngEM, contentid);
	List<PermissionVO> permissions = roleVO.getPermissionList();
	for(PermissionVO permissionVO:permissions){
		tempMap.put(permissionVO.getPermission_id(),"1 "+permissionVO.getPermission_order()+" "+permissionVO.getPermission_flag());
	} */
	//Myutils.println("---2----"+tempMap);
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新角色</title>
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
        parent.$(".l-dialog,.l-window-mask").show();
        function fromSubmit() {
        	$("#btn").attr("disabled","disabled"); 
            for(var i=0;i<<%=permissionList.size()%>;i++){
            	var permission_checked = document.getElementById("permission_id"+i).checked;
            	//alert(permission_checked);
            	if(permission_checked){
            		var permission_id = document.getElementById("permission_id"+i).value;
            		var permission_order = document.getElementById("permission_order"+i).value;
            		var permission_flag = document.getElementById("permission_flag"+i).value;
            		var permissionStr="*"+permission_id+"_"+permission_order+"_"+permission_flag
            		//alert(permissionStr);//&FPGL 3 0&QT 2 1
            		if($("#role_permission").val().indexOf(permissionStr)<0){
            			$("#role_permission").val($("#role_permission").val()+permissionStr); 
                	}
                }
            }
        	//alert($("#role_permission").val());
        	$.ajax({ 
				type: "POST", 
				dataType:"text" ,
				data:"contentid="+encodeURI($("#contentid").val())+"&role_name="+encodeURI($("#role_name").val())+"&role_permission="+encodeURI($("#role_permission").val()),
				url:"<%=request.getContextPath()%>/RoleServlet?opt=update", 
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
  <input type="hidden" name="contentid" id="contentid" value="<%=request.getParameter("contentid")%>"/>
  <input type="hidden" name="role_permission" id="role_permission"/>
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
    <span class="font3">角色名称:</span><input name="role_name" id="role_name" type="text" value="<%-- <%=roleVO.getRole_name() %> --%>" class="bk8" /></td> 
  </tr>
</table>
</div>
    <div class="bg98"></div>
  </div>
<div class="box">
    <div class="bg99"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="27" valign="bottom"><span class="font5">权限设置</span></td>
    <td>&nbsp;</td>
    <td align="right" valign="bottom"><span class="font6"><a href="#"></a></span></td>
  </tr>
</table>
</div>
    <div class="bg100b"> 
 <table width="100%"  cellspacing="0" cellpadding="0" border="1px "  style="border-collapse:collapse;  ">
  <tr>
    <td width="5%" align="center"><span class="font3"></span></td>
    <td width="" align="center"><span class="font3">权限名称</span></td>
    <td width="" align="center"><span class="font3">权限等级</span></td>
    <td width="" align="center"><span class="font3">等级说明</span></td>
    <td width="10%" align="center"><span class="font3">显示顺序</span></td>
    <td width="10%" align="center"><span class="font3">是否有效</span></td>
  </tr>
 <%--  <%for(int i=0;i<permissionList.size();i++){ 
	  PermissionVO permissionVO = permissionList.get(i);
	  String[] temp =tempMap.get(permissionVO.getPermission_id()).split(" ");
	  String checked=temp[0];
	  String order=temp[1];
	  String flag=temp[2];
  %> --%>
  <tr <%-- <%if("1".equals(checked)){ %>style="background-color: #ccc"<%} %> --%>>
    <td align="center"><span class="font4"><input type="checkbox" name="permission_id" id="permission_id<%-- <%=i %> --%>" value="<%-- <%=permissionVO.getPermission_id() %> --%>" <%-- <%if("1".equals(checked)){ %>checked="checked"<%} %> --%>/></span></td>
    <td align="center"><span class="font4" <%-- <%if("1".equals(checked)&&"0".equals(flag)){%> style="color: red" title="无效"<%} %> --%>><%-- <%=permissionVO.getPermission_name() %> --%></span></td>
    <td align="center"><span class="font4"><%-- <%=permissionVO.getPermission_grade() %> --%></span></td>
    <td align="center"><span class="font4"><%-- <%=permissionVO.getPermission_remark() %> --%></span></td>
    <td align="center"><span class="font4"><input type="text" name="permission_order" id="permission_order<%-- <%=i %> --%>" value="<%-- <%=order %> --%>" style="text-align: center;width: 30px"/></span></td>
     <td align="center">
       <span class="font4">
           <select name="permission_flag" id="permission_flag<%-- <%=i %> --%>">
               <option value="1" <%-- <%if("1".equals(flag)){%>selected="selected" <%} %> --%>>是</option>
               <option value="0" <%-- <%if("0".equals(flag)){%>selected="selected" <%} %> --%>>否</option>
           </select>
       </span>
     </td>
  </tr>
 <%--  <%} %> --%>
</table>
</div>
    <div class="bg98"></div>
</div>

    <br />
 	<div style="float:right">
	 	<input type="button" value="确定" onclick="fromSubmit()" id="btn" class="l-button l-button-submit" /> 
		<input type="button" value="取消" onclick="closeWin()" class="l-button l-button-reset"/>
	</div>
</form>	 
</body>
</html>