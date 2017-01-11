<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();      
String basepath = request.getScheme() + "://"  
		+ request.getServerName() + ":" + request.getServerPort() 
		+ path + "/";
String yhm = (String)request.getAttribute("yhm"); %>
<body onload="init();">

</body>
<script>
	function init(){
		alert("用户更新成功！");
		var yhm = "<%=yhm%>";
		window.location.href="<%=basepath%>UserViewServlet?yhm="+encodeURIComponent(yhm)+"&index=view";
	}
</script>