<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="com.tgb.web.controller.entity.EntMonitorReport"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	EntMonitorReport entMonitorReport = (EntMonitorReport)request.getAttribute("entMonitorReport");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新自我监测报告</title>
<link href="${basePath}css/yhxx.css" rel="stylesheet" type="text/css" />
<link href="${basePath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-form.css" rel="stylesheet"type="text/css" />
<link href="${basePath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<script src="${basePath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
<link href="${basePath}js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
<script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script>
<script src="${bathPath}js/ajaxfileupload.js" type="text/javascript" ></script>
<script src="${bathPath}js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
        parent.$(".l-dialog,.l-window-mask").show();
        function fromSubmit() {
        	$("#btn").attr("disabled","disabled"); 
        	var fileToUpload=$("#fileToUpload").val();
        	if(fileToUpload.length<=0){
				parent.$.ligerDialog.warn('亲, [自行监测报告附件] 不能为空!');
			}else{
	        	$.ajaxFileUpload({
					url : '/EnvironmentInfoPublicPlatform/updateReportById',
					secureuri : false,
					fileElementId : 'fileToUpload',
					dataType : 'json',
					data:{
						reportId:$("#reportId").val(),entName:$("#entName").val(),entUsercode:$("#entUsercode").val(),productDay:$("#productDay").val(),
						reportDate:$("#reportDate").val(),monitorDay:$("#monitorDay").val(),reportName:$("#reportName").val(),reportedUrl:$("#reportedUrl").val()
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
        }
        function closeWin() {
        	parent.$.ligerDialog.close(); //关闭弹出窗
			parent.window.initBaseInfoGrid();//调父窗口某个方法
			parent.$(".l-dialog,.l-window-mask").remove(); //关闭弹出层
        }
    </script>
    
    <style type="text/css">
         body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
</head>
<body style="padding:10px">
<form name="form1" id="form1">
  <input name="reportId" type="hidden" id="reportId" value="${entMonitorReport.reportId}"/>
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
                    <input id="entUsercode" type="text" name="entUsercode" disabled="disabled" value="${entprise.entUsercode}"/>
                </td>
                <td align="left"></td>
            </tr>   
            <tr>
                 <td align="right" class="l-table-edit-td">生产天数:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="productDay" type="text" id="productDay" value="${entMonitorReport.productDay}"/>
                </td><td align="left"></td>
            </tr>  
            <tr>
                <td align="right" class="l-table-edit-td">监测天数:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="monitorDay" type="text" id="monitorDay" value="${entMonitorReport.monitorDay}"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">报告时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="reportDate" type="text" value="${entMonitorReport.entReportDate}" id="reportDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">其他已公开的平台地址:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="reportedUrl" name="reportedUrl" type="text" value="${entMonitorReport.reportedUrl}" id="reportedUrl" placeholder="如:http://www.hzhbj.gov.cn"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">监测报告名称:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="reportName" name="reportName" type="text" id="reportName" value="${entMonitorReport.entReportFileName}"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">自行监测报告附件:</td>
                <td align="left" class="l-table-edit-td"> 
                	<input id="fileToUpload" type="file" name="file1"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td"> 
                <input type="button" value="修改" onclick="fromSubmit()"/> 
				<input type="button" value="关闭" onclick="closeWin()"/>
                </td><td align="left"></td>
            </tr>
        </table>
</form>	 
</body>
</html>