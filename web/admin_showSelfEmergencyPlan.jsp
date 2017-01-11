<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>show单位突发应急预案</title>
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
         body{font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
	    	
	<script type="text/javascript">
		function resetValue(){
			$("#planDept").val('');
			$("#planTime").val('');
			$("#planContent").val('');
			$("#EmergencyPlanName").val('');
		}
	
		function ajaxFileUpload() {
			$.ajaxFileUpload({
				url : '/EnvironmentInfoPublicPlatform/updateEmergencyPlanByEmergencyPlanId',
				secureuri : false,
				fileElementId : 'fileToUpload',
				dataType : 'json',
				data:{
					entUserId:$("#entUserId").val(),planDept:$("#planDept").val(),planTime:$("#planTime").val(),EmergencyPlanName:$("#EmergencyPlanName").val(),
					planContent:$("#planContent").val(),emergencyPlanId:$("#emergencyPlanId").val()
				},
				success : function(data, status) {
					var code = data['code'];
					var message = data['message'];
					alert(message);
					if (code==200) {
						parent.$.ligerDialog.waitting('正在保存中,请稍候...');
						parent.$.ligerDialog.close(); //关闭弹出窗
						parent.window.initBaseInfoGrid();//调父窗口方法
						parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
					}else{
						alert("处理异常！");
					}
				},
				error : function(data, status, e) {
					alert("上传发生异常");
				}
			});
			return false;
		}
	</script>
</head>
<body style="padding:10px">
    <input name="entUserId" type="hidden" id="entUserId" value="${entprise.entUserId}"/>
    <input name="emergencyPlanId" type="hidden" id="emergencyPlanId" value="${emergencyPlan.emergencyPlanId}"/>
     <table cellpadding="0" cellspacing="0" class="l-table-edit" >
             <tr>
                <td align="right" class="l-table-edit-td">单位名称:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="entName" type="text" id="entName" value="${entprise.entName}" disabled="disabled"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">备案部门:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="planDept" type="text" id="planDept" value="${emergencyPlan.planDept}" disabled="disabled"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">报告时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="planTime" type="text" id="planTime" value="${emergencyPlan.planTime}" disabled="disabled" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">突发应急预案名称:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="EmergencyPlanName" name="EmergencyPlanName" value="${emergencyPlan.emergencyPlanName}" disabled="disabled" type="text"/>
                </td><td align="left"></td>
            </tr>
             <tr>
                <td align="right" class="l-table-edit-td">应急预案主要内容:</td>
                <td align="left" class="l-table-edit-td"> 
                	<textarea id="planContent"  rows="8" cols="40" name="planContent" disabled="disabled">${emergencyPlan.planContent}</textarea>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td">
               <!--  <input type="button" value="修改" onclick="ajaxFileUpload()"/> 
				<input type="button" value="重置" onclick="resetValue()"/> -->
                </td><td align="left"></td>
            </tr>
        </table>
</body>
</html>