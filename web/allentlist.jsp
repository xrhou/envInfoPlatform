<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>湖州市企业事业单位环境信息公开平台</title>
<link href="${bathPath}css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	background-image: url(images/bjZL.jpg);
}
</style>
<!--bnner js-->
<script src="${bathPath}js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${bathPath}js/jquery.nav.js" type="text/javascript"></script>
<script src="${bathPath}js/framework.js" type="text/javascript" ></script>
<script type="text/javascript">
 function logon(){
	 $("#btn").attr("disabled", true);
     var entId = $("#entId").val();
     var password = $("#password").val();
     if(entId.length<=0){
        $("#msg").css("color","red");
        $("#msg").html("用户名不能为空！");
        $("#msg").css("visibility","visible");
        $("#entId").focus();
        $("#btn").attr("disabled",false);
        return;
     }
     if(password.length<=0){
        $("#msg").css("color","red");
        $("#msg").html("密码不能为空！");
        $("#msg").css("visibility","visible");
        $("#password").focus();
        $("#btn").attr("disabled",false);
        return;
     }
	$.ajax({
        type:"post",
        url:"${bathPath}entUserlogin",
        data:"entId=" + entId + "&password=" + password,
        success:function(data){
          if(isNaN(data) && data.length>1){
              if(data=='success'){
                  $("#msg").css("color","green");
                  $("#msg").html('登录成功');
                  $("#msg").css("visibility","visible");
                  setTimeout("location.href = '/EnvironmentInfoPublicPlatform/admin_index.jsp'",300);
               }else if(data == 'wrong'){
                  $("#msg").css("color","red");
                  $("#msg").html("用户名或密码错误！");
                  $("#msg").css("visibility","visible");
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
 }
</script>
</head>
<body onload="">
<div class="ding" >
  <div class="msg">
    <div class="left"><span>今天是
    	<script language="javascript" src="${basePath}js/date.js" type="text/javascript"></script>
    	&nbsp;湖州市企业事业单位环境信息公开平台！
    </span>
    </div>
    <div class="right">
    	<span>
			企业登录名: <input id="entId" name="entId"  type="text" style="width:110px;" placeholder="企业组织机构代码">
			密码: <input id="password" type="password" style="width:60px;">
			<a href="javascript:void(0)" onclick="logon()" id="btn" style="background:green;color:red;border:3px solid green;border-radius: 8px 8px 8px 8px;">登陆</a>
			<a id="msg" style="visibility:hidden;">用户名或密码错误!</a>
    	</span>
    </div>
  </div>
</div>
<div class=" block">
  <div class="top"><img src="${bathPath}images/top.jpg" width="1013" height="98" /></div>
  
  <div class="header">
    <div class="nav">
      <ul>
        <li><a href="${bathPath}index.jsp">首页</a></li>
       <!--  <li><a href="#">新闻动态</a></li> -->
        <li><a href="${bathPath}allentlist.jsp">污染源企业</a></li>
      </ul>
    </div>
  </div>
  <!--首页content-->
  <div style="width:1000px;height:475px;">
    <div>
      <div>
       <iframe width="100%" height="475" src="${bathPath}allListUser.jsp" scrolling="yes" frameborder="0" name="center" id="center" style="background:none;"></iframe>
      </div>
    </div>
  </div>
  <!--友情链接-->
  <div class="clear"></div>
  <div class="ljie">
    <ul>
      <li style=><img src="${bathPath}images/ljie.jpg" width="92" height="31" /></li>
      <li style="width:120px;"><a href="http://www.mep.gov.cn/">国家环保部</a></li>
      <li style="width:100px;"><a href="http://www.cenews.com.cn/">中国环境网</a> </li>
      <li style="width:120px;"><a href="http://www.zjepb.gov.cn/hbtmhwz/index.htm">浙江省环境保护厅</a></li>
      <li style="width:150px;"><a href="http://app.zjepb.gov.cn:8091/zxjc/">省环保厅自行监测平台</a></li>
      <li style="width:150px;"><a href="http://www.hzepb.gov.cn/">杭州市环境保护局</a></li>
      <li style="width:120px;"><a href="http://www.hzhbj.gov.cn/">湖州市环境保护局</a></li>
    </ul>
  </div>
</div>
 <jsp:include page="${bathPath}footer.jsp"></jsp:include>
</body>
</html>
