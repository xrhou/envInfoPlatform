<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加单位自行监测报告</title>
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
			$("#productDay").val('');
			$("#reportDate").val('');
			$("#reportName").val('');
			$("#monitorDay").val('');
		}
	
		function ajaxFileUpload() {
			var fileToUpload=$("#fileToUpload").val();
			if(fileToUpload.length<=0){
				parent.$.ligerDialog.warn('亲,[单位环境突发应急预案附件]不能为空!');
			}else{
				$.ajaxFileUpload({
					url : '/EnvironmentInfoPublicPlatform/addEmergencyPlan',
					secureuri : false,
					fileElementId : 'fileToUpload',
					dataType : 'json',
					data:{
						entUserId:$("#entUserId").val(),entName:$("#entName").val(),entUsercode:$("#entUsercode").val(),productDay:$("#productDay").val(),
						reportDate:$("#reportDate").val(),monitorDay:$("#monitorDay").val(),reportName:$("#reportName").val()
					},
					success : function(data, status) {
						var code = data['code'];
						var message = data['message'];
						alert(message);
						if (code==200) {
							parent.$.ligerDialog.waitting('正在保存中,请稍候...');
							parent.$.ligerDialog.close(); //关闭弹出窗
							//parent.window.initBaseInfoGrid();//调父窗口某个方法
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
	</script>
</head>
<body style="padding:10px">
    <input name="entUserId" type="hidden" id="entUserId" value="${entprise.entUserId}"/>
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
                    <input name="productDay" type="text" id="productDay"/>
                </td><td align="left"></td>
            </tr>  
            <tr>
                <td align="right" class="l-table-edit-td">监测天数:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="monitorDay" type="text" id="monitorDay"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">预案上传时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="reportDate" type="text" id="reportDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">应急预案名称:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="reportName" name="reportName" type="text" id="reportName"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">单位环境突发应急预案附件:</td>
                <td align="left" class="l-table-edit-td"> 
                	<input id="fileToUpload" type="file" name="file1"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td"> 
                <input type="button" value="提交" onclick="ajaxFileUpload()"/> 
				<input type="button" value="重置" onclick="resetValue()"/>
                </td><td align="left"></td>
            </tr>
        </table>
</body>
</html>