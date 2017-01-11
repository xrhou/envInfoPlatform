<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看防治污染设施的建设和运行情况</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link href="${bathPath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-form.css" rel="stylesheet" type="text/css" />
    <script src="${bathPath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
	<script src="${bathPath}js/ajaxfileupload.js" type="text/javascript" ></script>
	<script src="${bathPath}js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <style type="text/css">
         body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
	    	
	<script type="text/javascript">
		function resetValue(){
			$("#facilityName").val('');
			$("#runTime").val('');
			$("#handleAbulity").val('');
			$("#operatorUnit").val('');
			$("#runStation").val('');
		}
		
		function formSubmit(){
			var entUserId=$("#entUserId").val();
			var facilityClass=$("#facilityClass").val();
			var facilityName=$("#facilityName").val();
			var runTime=$("#runTime").val();
			var handleAbulity=$("#handleAbulity").val();
			var operatorUnit=$("#operatorUnit").val();
			var runStation=$("#runStation").val();
			
			$.ajax({
				type: "POST",
				dataType:"text" ,
				data:"entUserId="+entUserId+"&facilityClass="+facilityClass+"&facilityName="+facilityName+"&runTime="+runTime+"&handleAbulity="+handleAbulity+
					"&operatorUnit="+operatorUnit+"&runStation="+runStation,
				url:"<%=request.getContextPath()%>/addConstructRunSituation", 
				isAjaxSubmit: true,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				success: function(data){
					if(data=="success"){
						alert("防治污染设施的建设和运行情况添加成功!");
						parent.$.ligerDialog.close(); //关闭弹出窗
						parent.window.initBaseInfoGrid();//调父窗口某个方法
						parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
					}else{
					    alert("添加防治污染设施的建设和运行情况失败!");
					}
				},
				error: function() {
					alert("服务器出错!请联系管理员.");
				},
			});
			return false;
		}
	</script>
</head>
<body style="padding:10px">
    <input name="entUserId" type="hidden" id="entUserId" value="${entprise.entUserId}"/>
     <table border="0" cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">单位名称:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="entName" type="text" id="entName" value="${entprise.entName}" disabled="disabled"/>
                </td>
                <td align="right" class="l-table-edit-td">组织机构代码:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="entUsercode" type="text" name="entUsercode" value="${entprise.entUsercode}" disabled="disabled"/>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">设施类别:</td>
                <td align="left" class="l-table-edit-td" width="320px" colspan="3">
	                <select name="facilityClass" id="facilityClass" disabled="disabled">
							<option value="${constructRunSituation.facilityClass}" selected ="selected">${constructRunSituation.facilityClass}</option>
						</select>
                </td>
            </tr>
            <tr>
             	<td align="right" class="l-table-edit-td">防治污染设施名称:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="facilityName" type="text" id="facilityName" value="${constructRunSituation.facilityName}" disabled="disabled"/>
                </td>
                <td align="right" class="l-table-edit-td">投运时间: </td>
                <td align="left" class="l-table-edit-td">
                    <input name="runTime" type="text" id="runTime" value="${constructRunSituation.runTime}" disabled="disabled" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">处理能力:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="handleAbulity" type="text" id="handleAbulity" value="${constructRunSituation.handleAbulity}" disabled="disabled"/>
                </td>
                <td align="right" class="l-table-edit-td">运维单位:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="operatorUnit" type="text" id="operatorUnit" value="${constructRunSituation.operatorUnit}" disabled="disabled"/>
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">运行情况:</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
                	<textarea id="runStation" rows="4" cols="60" name="runStation" disabled="disabled" >${constructRunSituation.runStation}</textarea>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td"> 
                <!-- <input type="button" value="添加" onclick="formSubmit()"/> 
				<input type="button" value="重置" onclick="resetValue()"/> -->
                </td><td align="left"></td>
            </tr>
        </table>
</body>
</html>