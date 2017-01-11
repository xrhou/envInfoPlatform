<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>修改影响评价及其他环境保护行政许可情况</title>
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
			$("#buildingName").val('');
			$("#eiaUnits").val('');
			$("#eiaDate").val('');
			$("#eiaDocNumber").val('');
			$("#completedUnit").val('');
			$("#completedTime").val('');
			$("#completedDocNumber").val('');
			$("#otherSituation").val('');
		}
		
		function formSubmit(){
			var effectLicenseId=$("#effectLicenseId").val();
			var entUserId=$("#entUserId").val();
			var buildingName=$("#buildingName").val();
			var eiaUnits=$("#eiaUnits").val();
			var eiaDate=$("#eiaDate").val();
			var eiaDocNumber=$("#eiaDocNumber").val();
			var completedUnit=$("#completedUnit").val();
			var completedTime=$("#completedTime").val();
			var completedDocNumber=$("#completedDocNumber").val();
			var otherSituation=$("#otherSituation").val();
			if(buildingName.length<=0){
				parent.$.ligerDialog.warn("亲,建设项目名称 不能为空");
			}else{
				$.ajax({
					type: "POST",
					dataType:"text",
					data:"effectLicenseId="+effectLicenseId+"&entUserId="+entUserId+"&buildingName="+buildingName+"&eiaUnits="+eiaUnits+"&eiaDate="+eiaDate+"&eiaDocNumber="+eiaDocNumber+
						"&completedUnit="+completedUnit+"&completedTime="+completedTime+"&completedDocNumber="+completedDocNumber+"&otherSituation="+otherSituation,
					url:"<%=request.getContextPath()%>/updateEffectAppraiseAndLicense", 
					isAjaxSubmit: true,
					contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
					success: function(data){
						if(data=="success"){
							alert("影响评价及其他环境保护行政许可情况修改成功!");
							parent.$.ligerDialog.close(); //关闭弹出窗
							parent.window.initBaseInfoGrid();//调父窗口某个方法
							parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
						}else{
							parent.$.ligerDialog.warn("修改单位基本信息失败!");
						}
					},
					error: function() {
						alert("服务器出错!请联系管理员.");
					},
				});
				return false;
			}
		}
	</script>
</head>
<body style="padding:10px">
    <input name="entUserId" type="hidden" id="entUserId" value="${entprise.entUserId}"/>
     <input name="effectLicenseId" type="hidden" id="effectLicenseId" value="${effectAppraiseAndLicense.effectLicenseId}"/>
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
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">建设项目名称:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="buildingName" type="text"  id="buildingName" value="${effectAppraiseAndLicense.buildingName}"/>
                </td>
               <td align="right" class="l-table-edit-td">环评批复单位:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="eiaUnits" type="text" id="eiaUnits" value="${effectAppraiseAndLicense.eiaUnits}"  />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">环评批复时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="eiaDate" type="text" id="eiaDate" value="${effectAppraiseAndLicense.eiaDate}" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
                <td align="right" class="l-table-edit-td">环评批复文号:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="eiaDocNumber" type="text" value="${effectAppraiseAndLicense.eiaDocNumber}"  id="eiaDocNumber" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
            	<td align="right" class="l-table-edit-td">竣工验收时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="completedTime" type="text" id="completedTime"  value="${effectAppraiseAndLicense.completedTime}"  class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
                <td align="right" class="l-table-edit-td">竣工验收单位:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="completedUnit" type="text" value="${effectAppraiseAndLicense.completedUnit}" id="completedUnit"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">竣工验收文号:</td>
                <td align="left" class="l-table-edit-td" colspan="3">
                    <input name="completedDocNumber" type="text" value="${effectAppraiseAndLicense.completedDocNumber}" id="completedDocNumber"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">其他许可情况:</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
                	<textarea id="otherSituation" rows="5" cols="55" name="otherSituation">${effectAppraiseAndLicense.otherSituation}</textarea>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td"> 
                <input type="button" value="修改" onclick="formSubmit()"/> 
				<input type="button" value="重置" onclick="resetValue()"/>
                </td><td align="left"></td>
            </tr>
        </table>
</body>
</html>