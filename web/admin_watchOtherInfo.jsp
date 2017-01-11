<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加其他公开环境信息</title>
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
			$("#otherPollutionName").val('');
			$("#otherTime").val('');
			$("#otherPollutionDetail").val('');
		}
		
		function formSubmit(){
			var otherInfoId=$("#otherInfoId").val();
			var entUserId=$("#entUserId").val();
			var otherPollutionName=$("#otherPollutionName").val();
			var otherTime=$("#otherTime").val();
			var otherPollutionDetail=$("#otherPollutionDetail").val();
			$.ajax({
				type: "POST",
				dataType:"text" ,
				data:"otherInfoId="+otherInfoId+"&otherPollutionName="+otherPollutionName+"&otherTime="+otherTime+"&entUserId="+entUserId+"&otherPollutionDetail="+otherPollutionDetail,
				url:"<%=request.getContextPath()%>/updateOtherPublicInfo", 
				isAjaxSubmit: true,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				success: function(data){
					if(data=="success"){
						alert("其他其他信息修改成功!");
						parent.$.ligerDialog.close(); //关闭弹出窗
						parent.window.initBaseInfoGrid();//调父窗口某个方法
						parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
					}else{
					    alert("修改单位基本信息失败!");
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
    <input name="otherInfoId" type="hidden" id="otherInfoId" value="${otherPublicInfo.otherInfoId}"/>
     <table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">单位名称:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="entName" type="text" id="entName" value="${entprise.entName}" disabled="disabled"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">组织机构代码:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="entUsercode" type="text" name="entUsercode" value="${entprise.entUsercode}" disabled="disabled"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                 <td align="right" class="l-table-edit-td">其他应当公开<br/>的污染物名称:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="otherPollutionName" type="text"  value="${otherPublicInfo.otherPollutionName}" disabled="disabled" id="otherPollutionName"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">监测时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="otherTime" type="text" id="otherTime"  class="Wdate" value="${otherPublicInfo.otherTime}" disabled="disabled" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">污染物详情:</td>
                <td align="left" class="l-table-edit-td"> 
                	<textarea id="otherPollutionDetail" rows="13" cols="40"  disabled="disabled" name="otherPollutionDetail" >${otherPublicInfo.otherPollutionDetail}</textarea>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td"> 
               <!--  <input type="button" value="修改" onclick="formSubmit()"/>  -->
                </td><td align="left"></td>
            </tr>
        </table>
</body>
</html>