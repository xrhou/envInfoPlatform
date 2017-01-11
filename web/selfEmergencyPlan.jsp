<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String path=request.getContextPath();
String bathPath = request.getScheme() + "://"+ request.getServerName()+":"+request.getServerPort()+ path + "/";
%>
<html>
  <head>
    <title>环境突发应急预案</title>
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="${bathPath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
	<script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="${bathPath}js/json2.js" type="text/javascript" ></script>
	<script src="${bathPath}js/ajaxfileupload.js" type="text/javascript" ></script>
  	<style type="text/css">
  body {font-size:12px;padding:10px}
	.l-table-edit {
	}
	.l-table-edit-td {
		padding:4px;
		font-size:12px;
		border:#84a0c4 1px solid
	}
	.l-button-submit, .l-button-test {
		width:80px;
		float:left;
		margin-left:10px;
		padding-bottom:2px;
	}
  	</style>
  	
  	<script type="text/javascript">
  		$(function(){
  			$("form").ligerForm();
  			g=$("#maingrid").ligerGrid({
				columns:[
				{display:"配件名称",name:"pName",isAllowHide:false,align:"left",width:140,
					editor:{type:"string"}
				},
				{display:"配件品牌",name:"pBrand",isAllowHide:false,align:"left",width:120,
					editor:{
						type:"select",
						data:[{id:"1",text:"品牌一"},{id:"2",text:"品牌二"}],
						valueField :"id",
						textField:"text"
					},
					render:function(item){
						if(item.pBrand=='1'){
							return "品牌一";
						}else{
							return "品牌二";
						}
					}
				},
				{display:"配件型号",name:"pModel",isAllowHide:false,align:"left",width:140,
					editor:{type:"string"},
					totalSummary:{
						render:function(){
							return "<span id='heji'>合计:</span>";
						},
						align:"right"
					}
				},
				{display:"备注",name:"remarks",editor:{type:"text"},align:"left",width:250}
				],
				rownumbers:true,
				enabledEdit:true,
				isScroll:true,
				onBeforeEdit: f_onBeforeEdit,
				onAfterEdit: f_onAfterEdit,
				usePager:false,
				width:"99.7%"
			});
  		});
  	</script>
  </head>
  <body>
	<input type="hidden" name="entUserId" id="entUserId" value="${entprise.entUserId}"/>
 	<div style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span>${entUser.entName}</span><span id="local_span" style="color:red;">&nbsp;&nbsp;环境突发应急预案</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
  	<form name="form" id="form">
  	<br/>
		<table cellpadding="0" cellspacing="0" class="l-table-edit" style="width:99%">
			<tr>
				<td colspan="4" width="17%" height="10%" align="center" class="l-table-edit-td">
					<font style="font-weight:bold;font-size:20px;color:#F00" >突发环境事件应急预案</font>
				</td>
			</tr>
			<tr>
				<td width="17%" align="right" class="l-table-edit-td">
					<font color="#FF0000">*</font>备案部门：</td>
				<td align="left" class="l-table-edit-td">
					supplierName备案部门
				<td width="13%" align="right" class="l-table-edit-td">备案时间：</td>
				<td align="left" class="l-table-edit-td">
					备案时间
				</td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">
					主要内容：
				</td>
				<td align="left" class="l-table-edit-td" colspan="3">
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容<br/>
					主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容主要内容
					
				 </td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">应急预案名称：</td>
				<td align="left" class="l-table-edit-td" colspan="3">
					EmergencyPlanName
				 </td>
			</tr>
		</table>
		<br/> 
	</form>
  	<!-- <div id="maingrid" style="margin-top:20px"></div> -->
  </body>
</html>

