<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>查看影响评价及其他环境保护行政许可情况</title>
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
</head>
<body style="padding:10px">
    <input name="entUserId" type="hidden" id="entUserId" value="${entprise.entUserId}"/>
    <input name="EffectLicenseId" type="hidden" id="EffectLicenseId" value="${effectAppraiseAndLicense.effectLicenseId}"/>
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
                    <input name="BuildingName" type="text" disabled="disabled" id="BuildingName" value="${effectAppraiseAndLicense.buildingName}"/>
                </td>
               <td align="right" class="l-table-edit-td">环评批复单位:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="EiaUnits" type="text" id="EiaUnits" value="${effectAppraiseAndLicense.eiaUnits}" disabled="disabled" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">环评批复时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="EiaDate" type="text" id="EiaDate" value="${effectAppraiseAndLicense.eiaDate}" disabled="disabled" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
                <td align="right" class="l-table-edit-td">环评批复文号:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="EiaDocNumber" type="text" value="${effectAppraiseAndLicense.eiaDocNumber}" disabled="disabled" id="EiaDocNumber" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
            	<td align="right" class="l-table-edit-td">竣工验收时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="CompletedTime" type="text" id="CompletedTime"  value="${effectAppraiseAndLicense.completedTime}" disabled="disabled" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
                <td align="right" class="l-table-edit-td">竣工验收单位:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="CompletedUnit" disabled="disabled" type="text" value="${effectAppraiseAndLicense.completedUnit}" id="CompletedUnit"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">竣工验收文号:</td>
                <td align="left" class="l-table-edit-td" colspan="3">
                    <input name="CompletedDocNumber" disabled="disabled" type="text" value="${effectAppraiseAndLicense.completedDocNumber}" id="CompletedDocNumber"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">其他许可情况:</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
                	<textarea id="otherSituation" rows="5" cols="55" disabled="disabled" name="otherSituation">${effectAppraiseAndLicense.otherSituation}</textarea>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td"> 
                </td><td align="left"></td>
            </tr>
        </table>
</body>
</html>