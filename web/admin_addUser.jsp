<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- <%@page import="youngPackage.security.YoungUser"%> --%>
<%@page import="java.util.*"%>
<html>
<%            
	String path = request.getContextPath();      
	String basepath = request.getScheme() + "://"  
			+ request.getServerName() + ":" + request.getServerPort() 
			+ path + "/";
			
	List<Map<String, String>> listRole = (List<Map<String, String>>)request.getAttribute("securityRole");
	Map<String,String> departmentMap= (Map<String,String>)request.getAttribute("department");
%>
<head>
    <title></title>
    <link href="<%=basepath%>js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="<%=basepath%>js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="<%=basepath%>js/ligerui/lib/jquery/jquery-1.5.2.min.js" type="text/javascript"></script> 
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerMenu.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerMenuBar.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
	<script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=basepath%>content/user/data/CustomersData.js" type="text/javascript"></script>

    <script>

    parent.$(".l-dialog,.l-window-mask").show();
    
function addClose(){
	window.parent.$.ligerDialog.hide(); 
}

function check(){
	var yhm = trim(document.getElementById("yhm").value);
	document.getElementById("yhm").value = yhm;
	var xm = document.getElementById("xm").value;
	var password = trim(document.getElementById("password").value);
	var password1 = trim(document.getElementById("password1").value);
	if(yhm.length==0){
		alert("用户名不能为空！");
		return false;
	}
	if(password.length<3){
		alert("密码不能少于3位！");
		return false;
	}
	if(password1.length<3){
		alert("确认密码不能少于3位！");
		return false;
	}
	if(password!=password1){
		alert("确认密码与密码不相同！");
		return false;
	}
	   $.ajax({ 
			type: "POST", 
			dataType:"html" ,
			data:"yhm="+encodeURI(yhm),
			url:"<%=request.getContextPath()%>/UserCheckServlet", 
			isAjaxSubmit: true,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			success: function(data) { 
			 if(data=="false"){
			   alert("用户名重复");
			 }else{
			  //alert("用户名不重复");
			  document.getElementById("form").submit();
			  $.ligerDialog.waitting('正在保存中,请稍候...');
			  parent.$.ligerDialog.close(); //关闭弹出窗
			  parent.window.initBaseInfoGrid();//调父窗口某个方法
			  parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
			}
   }
});
}
function trim(str){ //删除左右两端的空格
	return str.replace(/(^\s*)|(\s*$)/g, "");
}
</script>
</head>
<body style="padding:0px;  "> 
<form id="form" action="<%=basepath %>UserAddServlet">
<input type="hidden" id="url" value="<%=basepath %>" />
<div id="addDetail" style="line-height:30px;margin-left: 2px">
	用户名称：<input type="text" id="yhm" name="yhm" value=""/>
	<span style="visibility: hidden">空空</span>姓名：<input type="text" id="xm"  name="xm" /><br/>
	<!--  组织机构代码：<input type="text" id="zzjg"  name="zzjg" />-->
	<span style="visibility: hidden"></span>手机号码：<input type="text" id="sjhm"  name="sjhm" value=""/>
	<span style="visibility: hidden">空空</span>状态：<select name="zt" style="width: 130px;">
		<option value="0">启用</option>
		<option value="1">禁用</option>
		</select>
		<br/>
		所属部门：<select id="bm" name="bm">
		<%
		if(null!=departmentMap){
		   Iterator iter = departmentMap.entrySet().iterator();
		   while (iter.hasNext()) {
		       Map.Entry entry = (Map.Entry) iter.next();
		       String id = entry.getKey()+"";
		       String name = entry.getValue()+"";
		       %>
			    <option value="<%=id %>"><%=name %></option>
			   <%
		   }
	 
		 }%>
		</select>&nbsp;&nbsp;&nbsp;&nbsp;
		安全角色：<select id="js" name="js">
		<%
		if(null!=listRole){
		   for(int i=0;i<listRole.size();i++){
			   Iterator iter = listRole.get(i).entrySet().iterator();
			   while (iter.hasNext()) {
			       Map.Entry entry = (Map.Entry) iter.next();
			       String role_id = entry.getKey()+"";
			       String role_name = entry.getValue()+"";
			       %>
				    <option value="<%=role_id %>"><%=role_name %></option>
				   <%
			   }
		}
		 }%>
		</select>
		<br/>
		<span style="visibility: hidden">空空</span>职位：<input type="text" id="position"  name="position" value=""/>
		办公电话：<input type="text" id="BGDH"  name="BGDH" value=""/>
		<br/>
		
		<span style="visibility: hidden">空空</span>宅电：<input type="text" id="ZD"  name="ZD" value=""/>
		<span style="visibility: hidden">空</span>虚拟网：<input type="text" id="XNW"  name="XNW" value=""/>
		<br/>
		
	
	<span style="visibility: hidden">空空</span>密码：<input type="password" id="password"  name="password" value=""/>
	确认密码：<input type="password" id="password1"  name="password1" value=""/><br/>
     	<span style="visibility: hidden">空空</span>序号：<input type="text" id="order"  name="order" value="<%=session.getAttribute("U_ORDER") %>"/>
		<br/>
		&nbsp;&nbsp;&nbsp;&nbsp; <div style="float: right;width: 90px;"><input type="button" onclick="addClose();" value="关闭" style="width: 80px;height: 30px;cursor: pointer;" /></div>
		&nbsp;&nbsp;&nbsp;&nbsp;<div style="float: right;width: 90px;"><input type="button"  value="新增" onclick="check()"	 style="width: 80px;height: 30px;cursor: pointer;" /></div>
		</div>
</form>
</body>
</html>