<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>固体废物排放信息</title>
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
			$("#handleDirection").val('');
			$("#handleNumber").val('');
			$("#handleType").val('');
			$("#wasteName").val('');
		}
		
		function formSubmit(){
			var solidWasteId=$("#solidWasteId").val();
			var entUserId=$("#entUserId").val();
			var handleDirection =$("#handleDirection").val();  
			var handleNumber=$("#handleNumber").val();  
			var handleType=$("#handleType").val();
			var isDanger=$("#isDanger").val();
			var wasteName=$("#wasteName").val();
			if(wasteName.length<=0){
				parent.$.ligerDialog.warn("亲, [废物名称] 不能为空");
			}else{
				$.ajax({
					type: "POST",
					dataType:"text",
					data:"solidWasteId="+solidWasteId+"&entUserId="+entUserId+"&handleDirection="+handleDirection+"&handleNumber="+handleNumber
						+"&handleType="+handleType+"&isDanger="+isDanger+"&wasteName="+wasteName,
					url:"<%=request.getContextPath()%>/updateSolidWasteBySolidWasteId", 
					isAjaxSubmit: true,
					contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
					success: function(data){
						if(data=="success"){
							alert("固体废物排放信息修改成功!");
							parent.$.ligerDialog.close(); //关闭弹出窗
							parent.window.initBaseInfoGrid();//调父窗口某个方法
							parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
						}else{
						    alert("修改固体废物排放信息失败!");
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
    <input name="solidWasteId" type="hidden" id="solidWasteId" value="${solidWaste.solidWasteId}"/>
     <table border="0" cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">单位名称:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="entName" type="text" id="entName" value="${entprise.entName}" disabled="disabled"/>
                </td>
                <td align="left" class="l-table-edit-td"></td>
             </tr>
            <tr>
                <td align="right" class="l-table-edit-td">组织机构代码:</td>
                <td align="left" class="l-table-edit-td">
                    <input id="entUsercode" type="text" name="entUsercode" value="${entprise.entUsercode}" disabled="disabled"/>
                </td>
                <td align="left" class="l-table-edit-td"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">废物名称:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="wasteName" type="text" id="wasteName" value="${solidWaste.wasteName}" />
                </td>
                <td align="left" class="l-table-edit-td"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">是否危险废物:</td>
                <td align="left" class="l-table-edit-td">
	                <select name="isDanger" id="isDanger">
							<option value="是">是</option>
							<option value="否">否</option>
					</select>
                </td>
                <td align="left" class="l-table-edit-td"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">处理处置方式:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="handleType" type="text" id="handleType" value="${solidWaste.handleType}" />
                </td>
               <td align="left" class="l-table-edit-td"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">处理处置数量:</td>
                <td align="left" class="l-table-edit-td">
                	<input name="handleNumber" type="text" id="handleNumber" value="${solidWaste.handleNumber}" />[Kg]
                </td>
               <td align="left" class="l-table-edit-td"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">处置去向:</td>
                <td align="left" class="l-table-edit-td">
                	<textarea id="handleDirection" rows="4" cols="18" name="handleDirection" >${solidWaste.handleDirection}</textarea>
                </td>
                <td align="left" class="l-table-edit-td"></td>
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