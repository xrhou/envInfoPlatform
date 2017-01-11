<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();      
String basepath = request.getScheme() + "://"  
		+ request.getServerName() + ":" + request.getServerPort() 
		+ path + "/";
String data = (String)request.getAttribute("data"); %>
<body onload="init();"></body>
<script>
	function init(){
		var data = '<%=data%>';
		window.parent.grid.loadData(true);
		window.parent.$.ligerDialog.hide();
		if(data=="success"){
		alert("用户删除成功！");
			//var manager =window.parent.$.ligerDialog.waitting('删除成功！');
			// setTimeout(function (){
			//	manager.close();
   		    //                }, 1000);
		}else{
			alert("用户删除失败！");
			//var manager =window.parent.$.ligerDialog.waitting('删除失败！');
			//setTimeout(function (){
			//	 manager.close();
  		   //                 }, 1000);
		}	
	}
</script>