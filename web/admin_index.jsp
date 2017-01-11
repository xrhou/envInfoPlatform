<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tgb.web.controller.utils.Myutils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>湖州市企事业环境信息公开平台</title>
<script src="${bathPath}js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${bathPath}js/jquery.nav.js" type="text/javascript"></script>
<script src="${bathPath}js/framework.js" type="text/javascript" ></script>
<link href="${basePath}css/part1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function logout(){
	if(confirm('您确定要退出系统吗？')){
		$("#btn").attr("disabled", true);
		$.ajax({
		        type:"post",
		        url:"${bathPath}entUserlogout",
		        data:"",
		        success:function(data){
		          if(isNaN(data) && data.length>1){
		              if(data=='success'){
		                  setTimeout("location.href = '/EnvironmentInfoPublicPlatform/index.jsp'",200);
		               }else if(data == 'wrong'){
		            	   alert('未知错误！');
		               }
		          }
		        },
		        error:function(msg){
		           alert('未知错误！');
		        },
		        complete: function() {       
		           $("#btn").attr("disabled",false);
		        }  
		     }); 
	}else{
		return false;
	}
}
</script>
</head>
<body>
<div class="bg1">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="topbg">
    <tr>
      <td align="right" valign="top" ></td>
    </tr>
    <tr>
      <td align="right" valign="bottom" class="bg107" title="${entUser.entId}">
        <font color="white" title="${entUser.entId}">
        	<a href="" onclick="window.open('<%=basePath%>updateEntUser?entUserId=${entUser.entUserId}','企业用户信息','width=550,height=180,location=no,menubar=no,status=no,scrollbars=no,resizable=no,top=300,left=500')">${entUser.entName}</a>
        </font>&nbsp;欢迎您，当前位置是：<a href="#">监控信息管理</a>&nbsp;|&nbsp;
        <a href="javascript:void(0)" onclick="logout();" color="white" id="btn">退出<span style="visibility: hidden">空</span></a>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td width="768" height="100%" valign="top">
      	<table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="230" height="90%" valign="top" id="frmTitle1"><table width="160" height="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td height="45"><img src="<%=basePath%>images/index_05.gif" width="220" height="45"></td>
                </tr>
                <tr>
                  <td height="90%" valign="top" id="left">
                    <iframe id="left" name="left" src="<%=basePath%>admin_left_menu.jsp" scrolling="no" frameborder="0" width="220" height="480" style="background: #e8f1f8;"></iframe>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
       </td>
      <td width="7" height="100%" align="left">&nbsp;</td>
      <td width="100%"  height="100%" valign="top">
       <iframe width="100%" height="500px" src="<%=basePath%>admin_entpriseinfo.jsp" scrolling="auto" frameborder="0" name="right" id="right" style="background:none;"></iframe>
      </td>
    </tr>
  </table>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="48" align="center"  style="background: #e6e6e6; color:#5d5d5d; line-height:16px; border-top:2px solid #FFF;">
    技术支持：湖州市环保局信息中心<br>版权所有：湖州市环保局</td>
  </tr>
</table>
</div>
</body>