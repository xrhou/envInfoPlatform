<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.*"%>
<%@page import="com.tgb.web.controller.entity.EntUser"%>
<html>
<%            
	String path = request.getContextPath();      
	String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <title>企业用户密码修改</title>
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
    <script>
	function closeWin(){
		window.close();
	}
	function fromSubmit() {
        var password = document.getElementById("userpassword").value;
        var repass = document.getElementById("repwd").value;
        if(password.length<=0){
             alert("密码不能为空值！");
             return false;
         }
        if(password!=repass){
            alert("两次输入的密码不一致，请重新输入！");
            return false;
        }
    	if(!confirm("您确定要更改密码吗？")){return false;}
    	$("#btn").attr("disabled","disabled");
    	$.ajax({
			type: "POST", 
			dataType:"text",
			data:"entUserId="+$("#entUserId").val()+"&userpassword="+$("#userpassword").val()+"&entId="+$("#entId").val(),
			url:"<%=basepath%>UserPWDUpdate", 
			isAjaxSubmit: true,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			success: function(data){ 
				if(data=="success"){
					alert("用户密码更改成功!");
					window.close(); //关闭弹出窗
				}else{
				    alert("用户密码更改失败!");
				}
			},
			error: function() {
				alert("服务器出错,请联系 管理员!");
			}
		});
    }
	function checkNum(obj){}
</script>
</head>
<body style="padding:10px;background-color:#B4EEB4"> 
<form name="form1" id="form1">
  <input type="hidden" name="entUserId" id="entUserId" value="${entUser.entUserId}"/>
  <table style="margin-left: 60px;margin-top: 40px">
    <tr>
      <td><span style="visibility: hidden">空</span>企业名称:</td>
      <td><input type="text" id="entName" readonly="readonly" name="entName" value="${entUser.entName}" style="width:280px;"/></td>
    </tr>
    <tr>
      <td>组织机构代码：</td>
      <td><input type="text" id="entId" readonly="readonly" name="entId" value="${entUser.entId}" style="width:280px;"/></td>
    </tr>
    <tr>
      <td><span style="visibility: hidden">空空</span>新密码：</td>
      <td><input type="password" id="userpassword"  name="userpassword" value="" onblur="checkNum(this)" style="width:280px;"/></td>
    </tr>
    <tr>
      <td><span style="visibility: hidden">空</span>确认密码：</td>
      <td><input type="password" id="repwd" name="repwd" value=""/></td>
    </tr>
    <tr>
	    <td colspan="2">
	      <span style="float:right;margin-right: 40%">
	        <input type="button" value="确定" onclick="fromSubmit()" id="btn" /> 
		    <input type="button" value="取消" onclick="closeWin()" />
		  </span>
	    </td>
    </tr>
  </table>
</form>	
</body>
</html>