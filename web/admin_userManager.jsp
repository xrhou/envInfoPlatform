<%@page import="com.tgb.web.controller.entity.EntUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.*"%>
<html>
<%            
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();      
	String basePath = request.getScheme() + "://"  
			+ request.getServerName() + ":" + request.getServerPort() 
			+ path + "/";
%>
<head>
    <title></title>
    <link href="<%=basePath%>js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
	<script src="<%=basePath%>js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script> 
	<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script> 
	<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
	<script type="text/javascript"> 
	var grid;
	function load(){//alert("load");
	var url = $("#url").val();
	$("#toptoolbar").ligerToolBar({
        sortOrder:null,
        root :'rows', //数据源字段名
        record:'Total',//数据源记录数字段名
        pageParmName :'page',//页索引参数名，(提交给服务器)
        pagesizeParmName:'size',//页记录数参数名，(提交给服务器)
        sortnameParmName:'sort', //页排序列名(提交给服务器)
        sortorderParmName:'order', //页排序方向(提交给服务器)
        rownumbers:true,
        items: [
                 { text: '增加', click: addInfo, icon:'add'},
                 { line:true },
                 { text: '删除', click: deleteInfo , icon:'busy'},
                 { line:true },
                 { text: '修改', click: updateInfo , icon:'config'},
     			 { line:true },
                 { text: '查看', click: watchInfo , icon:'pager'},
     			 { line:true },
                 { text: '查询', click: selectclick1 , icon:'search'},
     			 { line:true },
                 { text: '刷新', click: function(){grid.loadData(true);}, icon: 'refresh'}
             ]
             });
	    //selectLiger(url+"AjaxRequestForUserServlet");
	} 
	
	function selectLiger(url){
		  grid = $("#maingrid4").ligerGrid({
		       columns: [
		       { display: '用户名', name: 'CustomerID', width: '10%' },
		       { display: '真实姓名', name: 'CompanyName', width: '12%' },
		       { display: '状态', name: 'ContactName', width: '8%',
		    	   render:function(row){
		    	   var value = row.ContactName;
		    	   if(value=="0"){
		    		   return "<font color='blue'>启用</font>";
						}else{
		        	return "<font color='red'>禁用</font>";
		        	}
		           } }, 
		        { display: '部门', name: 'BM', width: '' },
		        { display: '职位', name: 'position', width: '' },
		        { display: '办公电话', name: 'BGDH', width: '' },
		        { display: '宅电', name: 'ZD', width: '' },
		        { display: '手机', name: 'phone', width: '' },
		        { display: '虚拟网', name: 'XNW', width: '' },
		        { display: '角色', name: 'City', width: '10%' }

			   ], 
				dataAction: 'local', 
				pageSize: 20,
		        url: url,
		       	parms:{BM:'<%=request.getParameter("BM")%>',roleId:'<%=request.getParameter("roleId")%>'},
		       sortName: 'CustomerID',
		       width: '100%', height: '99%',
		       selectRowButtonOnly: true,
		       usePager:true,
	           rownumbers:true,
	           //frozenRownumbers:true,   // 行序号是否在固定列中
			  pageSizeOptions :[20,50,100,300]
		   }); 
		}

	function initBaseInfoGrid() {
		grid.loadData(true);
		//window.location.reload();
	}
	
		function selectUser(userList){ //table
		}
		
		//得到选中行
		function getSelectedRow(){         
			var manager = $("#maingrid4").ligerGetGridManager();            
			return manager.getSelectedRow();     
		}
		
		//新增
		function addInfo(item){
			var yhm=document.getElementById("yhm").value;
			if(yhm=="admin"){
				var url = $("#url").val();
				var addDetail = $("#addDetail");
				$.ligerDialog.open({
					width: 420, height: 300,
					modal:false,
					//target: addDetail, 
					//url: url+'admin/user/addUser.jsp',
					url: url+'GotoUserAddServlet',
					isResize: true, top: 50
				});
			}else{
			  alert("您的权限不够进行此项操作");
			}
	   }
		
		//修改
		function updateInfo(item){
		var yhm=document.getElementById("yhm").value;
		//if(yhm=="docadmin"){
			var url = $("#url").val();
			var rowData = getSelectedRow();
			if(rowData!=null){
					var updateDetail = $("#updateDetail");
					window.winfilter = $.ligerDialog.open({
						width: 420, height: 300,
						//target: updateDetail,
						url: url+'UserViewServlet?yhm='+encodeURIComponent(rowData.CustomerID)+"&index=update",
						isResize: true, top: 50
					});
			}else{
				$.ligerDialog.warn('请选择一行数据。');
			}	
			//}else{
			 // alert("您的权限不够进行此项操作");
			//}
		}
		
		//查看
		function watchInfo(item){
			var url = $("#url").val();
			var rowData = getSelectedRow();
			if(rowData!=null){
					var showDetail = $("#showDetail");
					window.winfilter = $.ligerDialog.open({
						width: 400, height: 350,
						//target: showDetail, 
						url: url+'UserViewServlet?yhm='+encodeURIComponent(rowData.CustomerID)+"&index=view",
						isResize: true, top: 50,
						buttons: [
							{ text: '关闭', onclick: function (item, dialog) { dialog.hide(); } }
						]
					});
			}else{
				$.ligerDialog.warn('请选择一行数据。');
			}
		}

		
		//删除
		function deleteInfo(){
		var yhm=document.getElementById("yhm").value;
		//if(yhm=="docadmin"){
			var url = $("#url").val();
			var rowData = getSelectedRow();
			if(rowData!=null){
				$.ligerDialog.confirm('是否确定删除？', function (type)
	                     {
                   		if(type==true){
                   			 $.ajax({ 
                		      		type: "POST", 
                		      		dataType:"html" ,
                		      		data:"CustomerID="+encodeURIComponent(rowData.CustomerID),
                		      		url: url+"AjaxRequestForDelUser", 
                		      		isAjaxSubmit: true,
                		      		contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
                		      		success: function(data) { 
                		      		if (null!=data) {
                		      			if(data=="success"){
                		      				grid.loadData(true);
                		      				var manager = $.ligerDialog.waitting('删除成功！');
                		                     setTimeout(function (){
                		                         manager.close();grid.loadData(true);
                		                     }, 1000);
                    		      			}else if(data=="fail"){
                    		      				$.ligerDialog.warn('删除数据失败，请重试！');
                        		      		}
                		      	
                		      		} 
                		      		}
                		          }); 
			                  }
	                     });
			}else{
				$.ligerDialog.warn('请选择一行数据。');
			}
			//}else{
			  // alert("您的权限不够进行此项操作");
			//}
		 }
		
		//查询
        function selectclick1(){
				var filtercontainer = $("#filtercontainer") ;
                window.winfilter = $.ligerDialog.open({
                    width: 450, height: 200,
					target: filtercontainer, 
                    isResize: true, top: 50,
                    buttons: [
                        { text: '查询', onclick: function (item, dialog) { findUser();dialog.hide(); } },
                        { text: '取消', onclick: function (item, dialog) { dialog.hide(); } }
                    ]
                });
        };
		
		//右下角提示
		function prompt() {
			window.parent.prompt();
		} 
		
	function findUser(){
		var name = $("#SName").val();
		var description = $("#SDescription").val();
		var BM = $("#BM").val();
		var url = $("#url").val();
		url = url+"AjaxRequestForUserServlet?name="+encodeURIComponent(name)+"&description="+encodeURIComponent(description)+"&BM="+encodeURIComponent(BM);
		selectLiger(url);
	}
	
	function SetWinHeight(iframe)//自适应高度 在iframe中必须添加onload方法
	{
		 try {
	         //var iframe = document.getElementById("contentFrame"); //("contentFrame");
	         var idocumentElement = iframe.contentWindow.document.documentElement;
	         if (idocumentElement.scrollHeight > 850) {
	             iframe.height -= 5;
	             iframe.height = idocumentElement.scrollHeight;
	         }
	         else {
	             iframe.height = 850;
	         }
	     }
	     catch (e) {
	         window.status = 'Error: ' + e.number + '; ' + e.description;
	     }
	 }
</script>
   
</head>
<body style="padding:0px; overflow:hidden; " onload="load()"> 
<%
  EntUser user=(EntUser)request.getSession().getAttribute("entUser");
 %>
<input type="hidden" id="url" value="<%=basePath%>" />
<input type="hidden" id="yhm" value="<%=user.getEntId() %>" />
  <div id="toptoolbar"></div> 
  <div id="maingrid4" style="margin:0; padding:0"></div>
  <div id="filter" style="border:1px solid #d3d3d3; display:none; width:370px; height:120px;"></div>
  
	<div id="filtercontainer" style="display:none; width:400px; height:40px;" >
		<div style="width:100px;text-align: right;float: left;">用户名：</div>
		<div style="float: left;">
		
		<input type="text" id="SName" name="SName" value="" style="width:200px;" title="支持模糊查询"/>
		</div>
		<br>
		<div style="width:100px;text-align: right;float: left;">姓<span style="visibility: hidden">空</span>名：</div>
		<div style="float: left;">
		
		<input type="text" id="SDescription" name="SDescription" value="" style="width:200px;" title="支持模糊查询"/>
		</div>
		<br>
		<div style="width:100px;text-align: right;float: left;">部<span style="visibility: hidden">空</span>门：</div>
		<div style="float: left;">
		<%
		/* YoungRepository youngEM = (YoungRepository) request.getSession().getAttribute(com.system.utils.Myutils.getProperty("youngEM")); */
		//List listRole = (List) YoungUtils.SecurtiyList(youngEM);
		
		//部门
		/* DepartmentDAO departmentDAO=DepartmentDAO.getInstance();
		Map<String,String> departmentMap= departmentDAO.getAllDepartmentMap(youngEM);
		request.setAttribute("department", departmentMap); */
		//角色
		%>
		<select id="BM" name="BM" style="width: 205px">
		<option value="">---全部---</option>
		<%-- <%
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
	 
		 }%> --%>
		</div>
		<!--  
		<div style="width:100px;text-align: right;float: left;">组织机构代码</div>
		<div style="float: left;">
		<select id="carsZzjg" name="carsZzjg">
		<option value="volvo">等于</option>
		<option value="saab">like</option>
		</select>
		<input type="text" id="SZzjg" name="SZzjg" value="" style="width:200px;"/>
		</div>
		-->
	</div>
</body>
</html>