<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加单位水污染物排放信息</title>
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
	<script src="${bathPath}js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <style type="text/css">
         body{font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{}
        .l-button-submit,
        .l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
	    	
	<script type="text/javascript">
	function resetValue(){
		$("#accountTotalEmission").val('');
		$("#mgL").val('');
		$("#monitorDate").val('');
		$("#monitorMothod").val('');
		$("#pLocation").val('');
		$("#pMethod").val('');
		$("#pMouth").val('');
		$("#pName").val('');
		$("#standartMGL").val('');
		$("#totalEmission").val('');
	}
	
	function formSubmit(){
		var pollutionInfoId=$("#pollutionInfoId").val();
		var entUserId=$("#entUserId").val();
		var accountTotalEmission=$("#accountTotalEmission").val();
		var mgL=$("#mgL").val();
		var monitorDate=$("#monitorDate").val();
		var monitorMothod=$("#monitorMothod").val();
		var pLocation=$("#pLocation").val();
		var pMethod=$("#pMethod").val();
		var pMouth=$("#pMouth").val();
		var pName=$("#pName").val();
		var standartMGL=$("#standartMGL").val();
		var totalEmission=$("#totalEmission").val();
		var over=$("#over").val();
		$.ajax({
			type: "POST",
			dataType:"text" ,
			data:"pollutionInfoId="+pollutionInfoId+"&entUserId="+entUserId+"&accountTotalEmission="+accountTotalEmission+"&mgL="+mgL+"&monitorDate="+monitorDate+"&monitorMothod="+monitorMothod+
				"&pLocation="+pLocation+"&pMethod="+pMethod+"&pMouth="+pMouth+"&pName="+pName+"&standartMGL="+standartMGL+"&totalEmission="+totalEmission+"&over="+over,
			url:"<%=request.getContextPath()%>/updateConstructRunSituation", 
			isAjaxSubmit: true,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			success: function(data){
				if(data=="success"){
					alert("水污染物排放信息添加成功!");
					parent.$.ligerDialog.close(); //关闭弹出窗
					parent.window.initBaseInfoGrid();//调父窗口某个方法
					parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
				}else{
				    alert("添加水污染物排放信息失败!");
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
    <input name="pollutionInfoId" type="hidden" id="pollutionInfoId" value="${entPollutionInfo.pollutionInfoId}"/>
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
                <td align="right" class="l-table-edit-td">排放口编号或名称:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="pMouth" type="text" id="pMouth" value="${entPollutionInfo.pMouth}" disabled="disabled" />
                </td>
                <td align="right" class="l-table-edit-td">排放口位置:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="pLocation" type="text" name="pLocation" value="${entPollutionInfo.pLocation}" disabled="disabled"/>[经纬度]
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">排放方式:</td>
                <td align="left" class="l-table-edit-td" width="320px">
	                <select name="pMethod" id="pMethod" disabled="disabled">
						<option selected="selected">${entPollutionInfo.pMethod}</option>
					</select>
                </td>
                 <td align="right" class="l-table-edit-td">特征污染物名称: </td>
                <td align="left" class="l-table-edit-td">
                    <input name="pName" type="text" id="pName" value="${entPollutionInfo.pName}" disabled="disabled" />
                </td>
            </tr>
            <tr>
             	<td align="right" class="l-table-edit-td">排放浓度:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="mgL" type="text" id="mgL" value="${entPollutionInfo.mgL}" disabled="disabled"/>[mg/L]
                </td>
                <td align="right" class="l-table-edit-td">监测方式: </td>
                <td align="left" class="l-table-edit-td">
                  <input name="monitorMothod" type="text" id="monitorMothod" value="${entPollutionInfo.monitorMothod}" disabled="disabled"/>
                </td>
            </tr>
            <tr>
            	 <td align="right" class="l-table-edit-td">执行的污染物排放<br/>浓度标准浓度限值:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="standartMGL" type="text" id="standartMGL" value="${entPollutionInfo.standartMGL}" disabled="disabled"/>[mg/L]
                </td>
                <td align="right" class="l-table-edit-td">监测时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="monitorDate" type="text" id="monitorDate"  value="${entPollutionInfo.monitorDate}" disabled="disabled" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
            </tr>
            <tr>
            	<td align="right" class="l-table-edit-td">排放总量:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="totalEmission" type="text" id="totalEmission" value="${entPollutionInfo.totalEmission}" disabled="disabled"/>[Kg]
                </td>
                <td align="right" class="l-table-edit-td">核定的排放总量:</td>
                <td align="left" class="l-table-edit-td"> 
                	<input name="accountTotalEmission" type="text" id="accountTotalEmission" value="${entPollutionInfo.accountTotalEmission}" disabled="disabled"/>[Kg]
                </td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">是否超标:</td>
                <td align="left" class="l-table-edit-td" width="320px">
	                <select name="over" id="over" disabled="disabled">
						<option selected="selected">${entPollutionInfo.over}</option>
					</select>
                </td>
                <td align="left" class="l-table-edit-td"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td"> 
               <!--  <input type="button" value="修改" onclick="formSubmit()"/> 
				<input type="button" value="重置" onclick="resetValue()"/> -->
                </td><td align="left"></td>
            </tr>
        </table>
</body>
</html>