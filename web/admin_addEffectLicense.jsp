<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>添加影响评价及其他环境保护行政许可情况</title>
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
			$("#BuildingName").val('');
			$("#EiaUnits").val('');
			$("#EiaDate").val('');
			$("#EiaDocNumber").val('');
			$("#CompletedUnit").val('');
			$("#CompletedTime").val('');
			$("#CompletedDocNumber").val('');
			$("#otherSituation").val('');
		}
		
		function formSubmit(){
			var entUserId=$("#entUserId").val();
			var BuildingName=$("#BuildingName").val();
			var EiaUnits=$("#EiaUnits").val();
			var EiaDate=$("#EiaDate").val();
			var EiaDocNumber=$("#EiaDocNumber").val();
			var CompletedUnit=$("#CompletedUnit").val();
			var CompletedTime=$("#CompletedTime").val();
			var CompletedDocNumber=$("#CompletedDocNumber").val();
			var otherSituation=$("#otherSituation").val();
			if(BuildingName.length<=0){
				parent.$.ligerDialog.warn('亲,[建设项目名称]不能为空!');
			}else{
				$.ajax({
					type: "POST",
					dataType:"text" ,
					data:"entUserId="+entUserId+"&BuildingName="+BuildingName+"&EiaUnits="+EiaUnits+"&EiaDate="+EiaDate+"&EiaDocNumber="+EiaDocNumber+
						"&CompletedUnit="+CompletedUnit+"&CompletedTime="+CompletedTime+"&CompletedDocNumber="+CompletedDocNumber+"&otherSituation="+otherSituation,
					url:"<%=request.getContextPath()%>/addEffectAppraiseAndLicense", 
					isAjaxSubmit: true,
					contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
					success: function(data){
						if(data=="success"){
							alert("影响评价及其他环境保护行政许可情况添加成功!");
							parent.$.ligerDialog.close(); //关闭弹出窗
							parent.window.initBaseInfoGrid();//调父窗口某个方法
							parent.$(".l-dialog,.l-window-mask").hide(); //关闭弹出层
						}else{
						    alert("添加单位基本信息失败!");
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
                    <input name="BuildingName" type="text" id="BuildingName"/>
                </td>
               <td align="right" class="l-table-edit-td">环评批复单位:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="EiaUnits" type="text" id="EiaUnits"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">环评批复时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="EiaDate" type="text" id="EiaDate" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
                <td align="right" class="l-table-edit-td">环评批复文号:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="EiaDocNumber" type="text" id="EiaDocNumber"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
            	<td align="right" class="l-table-edit-td">竣工验收时间:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="CompletedTime" type="text" id="CompletedTime" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
                <td align="right" class="l-table-edit-td">竣工验收单位:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="CompletedUnit" type="text" id="CompletedUnit"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">竣工验收文号:</td>
                <td align="left" class="l-table-edit-td" colspan="3">
                    <input name="CompletedDocNumber" type="text" id="CompletedDocNumber"/>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">其他许可情况:</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
                	<textarea id="otherSituation" rows="5" cols="55" name="otherSituation" ></textarea>
                </td><td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td"> 
                <input type="button" value="提交" onclick="formSubmit()"/> 
				<input type="button" value="重置" onclick="resetValue()"/>
                </td><td align="left"></td>
            </tr>
        </table>
</body>
</html>