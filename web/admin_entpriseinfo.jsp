<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page import="java.util.*"%>
<%
String path=request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>企事业用户单位详细信息</title>
    <link href="${basePath}css/yhxx.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}js/ligerui/lib/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${basePath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script> 
    <link href="${basePath}js/ligerui/lib/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerToolBar.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${basePath}js/ligerui/lib/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
	<script src="${basePath}js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <style type="text/css">
         body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
        #errorLabelContainer{ padding:10px; width:300px; border:1px solid #FF4466; display:none; background:#FFEEEE; color:Red;}
    </style>  
        
	<script type="text/javascript">
	function onload(){
		var entType=$("#entType").val();
		var strs= new Array(); //定义一数组 
		strs=entType.split(","); //字符分割 
		for (var i=0;i<strs.length ;i++ ){ 
			if(strs[i]==($("#entType0").val())){
				$("#entType0").attr("checked", true);
			}
			if(strs[i]==($("#entType1").val())){
				$("#entType1").attr("checked", true);
			}
			if(strs[i]==($("#entType2").val())){
				$("#entType2").attr("checked", true);
			}
			if(strs[i]==($("#entType3").val())){
				$("#entType3").attr("checked", true);
			}
			if(strs[i]==($("#entType4").val())){
				$("#entType4").attr("checked", true);
			}
			if(strs[i]==($("#entType5").val())){
				$("#entType5").attr("checked", true);
			}
			if(strs[i]==($("#entType6").val())){
				$("#entType6").attr("checked", true);
			}
			if(strs[i]==($("#entType7").val())){
				$("#entType7").attr("checked", true);
			}
			if(strs[i]==($("#entType8").val())){
				$("#entType8").attr("checked", true);
			}
			if(strs[i]==($("#entType9").val())){
				$("#entType9").attr("checked", true);
			}
		}
		
		if(entType.length<=0){
			$.ligerDialog.warn('亲, [企业污染类型] 为空值,请补全单位基本信息!');
		}
		return false;
	}
	$(onload);///初始化判断企业类型是不是为空
	//企业污染类型选择
	function checkAllBox(obj){
		 var entType= document.getElementsByName("entType");
		 if(obj.checked==true){
			  for(var i=0;i<entType.length;i++){
				  entType[i].checked = true;
			  }
		 }else{
			  for(var i=0;i<entType.length;i++){
				  entType[i].checked = false;
			  }
		 }
	}
	
	//检查企业类型为必选
	function checkData(){ 
		 var entType= document.getElementsByName("entType");
		 var flag = false;
		 for(var i=0;i<entType.length;i++){
			  if(entType[i].checked == true){
			   flag = true;
			   break;
			  }
		 }
		 if(!flag){
			 alert('亲,[企业污染类型] 为必选项,不能为空!');
		 }
		 return flag;
	}
	
	function reload(){
		 var entUserId =$("#entUserId").val();
		 $.ajax({
				type: "POST", 
				dataType:"text",
				data:"entUserId="+entUserId,
				url:"<%=basePath%>reloadData", 
				isAjaxSubmit: true,
				contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
				success: function(data){
					if(data=="success"){
						window.location.href ='<%=basePath%>admin_entpriseinfo.jsp';
					}else{
						$.ligerDialog.warn('请退出重新登录!');
					}
				},
				error: function() {
					$.ligerDialog.warn('服务器出错,请联系 管理员!');
				}
			});
	}
	
	//检查用户提交数据
	function fromSubmit() {
		checkData();
        var entUserId =$("#entUserId").val();
        var entName =$("#entName").val();
        var entZone =$("#entZone").val(); 
        var entUsercode =$("#entUsercode").val(); 
        var entReperson =$("#entReperson").val();
        var entPhone =$("#entPhone").val(); 
        var entPhoneName =$("#entPhoneName").val();
        var entAddress =$("#entAddress").val();
        var entControl =$("#entControl").val();
        var entScale =$("#entScale").val();
        var entproductCycle =$("#entproductCycle").val();
        //var pollutionMethod =$("#pollutionMethod").val();
        var entTypeValues=[];
        $('input[name="entType"]:checked').each(
        		function(){//遍历每一个名字为entType的复选框，其中选中的执行函数  
        		entTypeValues.push($(this).val());//将选中的值添加到数组entTypeValues中 
        	}
        );
        var entBusiness =$("#entBusiness").val(); 
        //var createDate =$("#createDate").val(); 
        var entProductAndManage =$("#entProductAndManage").val();
        var entProduct01 =$("#entProduct01").val();
        var entProduct02 =$("#entProduct02").val();
        var entProduct03 =$("#entProduct03").val();
        var entProduct04 =$("#entProduct04").val();
        var entProduct05 =$("#entProduct05").val(); 
        var entProduct06 =$("#entProduct06").val();
        var entProduct07 =$("#entProduct07").val();
        var entProduct08 =$("#entProduct08").val();
        var entProduct09 =$("#entProduct09").val();
        var entProduct10 =$("#entProduct10").val();
        var entScale01 =$("#entScale01").val();
        var entScale02 =$("#entScale02").val();
        var entScale03 =$("#entScale03").val();
        var entScale04 =$("#entScale04").val();
        var entScale05 =$("#entScale05").val();
        var entScale06 =$("#entScale06").val();
        var entScale07 =$("#entScale07").val();
        var entScale08 =$("#entScale08").val();
        var entScale09 =$("#entScale09").val();
        var entScale10 =$("#entScale10").val();
        var entOtherInfo =$("#entOtherInfo").val();
        
        if(entName.length<=0){
        	alert('[单位名称] 不能为空！');
            return false;
        }
        if(entZone.length<=0){
        	$.ligerDialog.warn('企业所属地区不能为空！');
            return false;
        }
        if(entUsercode.length<=0){
        	$.ligerDialog.warn('组织机构代码不能为空！');
            return false;
        }
        if(entReperson==""&&isNull(entReperson)){
        	$.ligerDialog.warn('企业法定代表人不能为空！');
            return false;
        }
        if(entPhone==""&&isNull(entPhone)){
        	$.ligerDialog.warn('企业联系电话不能为空！');
            return false;
        }
        if(entAddress.length<=0){
        	$.ligerDialog.warn('企业地址不能为空！');
            return false;
        }
        if(entproductCycle.length<=0){
        	$.ligerDialog.warn('企业生产周期不能为空！');
            return false;
        }
        if(entBusiness.length<=0){
        	$.ligerDialog.warn('所属行业不能为空！');
            return false;
        }
       /*  if(createDate==""&&isNull(createDate)){
        	$.ligerDialog.warn('企业创建时间不能为空！');
            return false;
        } */
        if(entProductAndManage==""&&isNull(entProductAndManage)){
        	$.ligerDialog.warn('生产经营和管理服务主要内容不能为空！');
            return false;
        }
        if(entControl.length<=0){
        	$.ligerDialog.warn('企业控制类型不能为空！');
            return false;
        }
        /* if(pollutionMethod.length<=0){
        	$.ligerDialog.warn('排放方式不能为空！');
            return false;
        } */
        
    	if(!confirm("您确定要保存吗？")){
    		return false;
    	}
    	$("#btn").attr("disabled","disabled");
    	$.ajax({
			type: "POST", 
			dataType:"text",
			data:"entUserId="+entUserId+"&entName="+entName+"&entZone="+entZone+"&entUsercode="+entUsercode
			+"&entReperson="+entReperson+"&entPhone="+entPhone+"&entPhoneName="+entPhoneName
			+"&entAddress="+entAddress+"&entproductCycle="+entproductCycle
			+"&entTypeValues="+encodeURI(entTypeValues.toString())+"&entBusiness="+entBusiness
			+"&entProductAndManage="+entProductAndManage
			+"&entProduct01="+entProduct01+"&entProduct02="+entProduct02+"&entProduct03="+entProduct03+"&entProduct04="+entProduct04+"&entProduct05="+entProduct05
			+"&entProduct06="+entProduct06+"&entProduct07="+entProduct07+"&entProduct08="+entProduct08+"&entProduct09="+entProduct09+"&entProduct10="+entProduct10
			+"&entScale01="+entScale01+"&entScale02="+entScale02+"&entScale03="+entScale03+"&entScale04="+entScale04+"&entScale05="+entScale05
			+"&entScale06="+entScale06+"&entScale07="+entScale07+"&entScale08="+entScale08+"&entScale09="+entScale09+"&entScale10="+entScale10
			+"&entOtherInfo="+entOtherInfo+"&entControl="+entControl+"&entScale="+entScale,
			url:"<%=basePath%>BaseInfoUpdate", 
			isAjaxSubmit: true,
			contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			success: function(data){
				if(data=="success"){
					$.ligerDialog.warn('单位基本信息更改成功!');
					window.close(); //关闭弹出窗
					setTimeout('reload()',3000);
				}else{
					$.ligerDialog.warn('单位基本信息更改失败!');
				}
			},
			error: function() {
				$.ligerDialog.warn('服务器出错,请联系 管理员!');
			}
		});
    }  
	</script>
</head>
<body style="padding:10px">
	<input name="entType" type="hidden" id="entType" value="${entprise.entType}"></input>
 	<div style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span id="local_span">${entUser.entName}</span><span style="color:red;">&nbsp;&nbsp;单位基本信息</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" /><br/>
	
<div id="maingrid4" style="margin:5px 0px 5px 5px; padding:0">
   	 <form action="" name="form1" id="form1">
   	 	<input name="entUserId" type="hidden" id="entUserId" value="${entUser.entUserId}"></input>
        <table border="0"  cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>   
                <td align="right" class="l-table-edit-td">单位名称:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entName" type="text" id="entName" value="${entprise.entName}" />
                </td>
                <td align="right" class="l-table-edit-td">所属地区:</td>
                <td align="left" class="l-table-edit-td" style="width:180px">
                <select name="entZone" id="entZone" ltype="select">
					<option value="${entprise.entZone}" selected="selected">${entprise.entZone}</option>
					<option value="湖州市">湖州市</option>
					<option value="长兴县">长兴县</option>
					<option value="德清县">德清县</option>
					<option value="安吉县">安吉县</option>
					<option value="吴兴区">吴兴区</option>
					<option value="南浔区">南浔区</option>
					<option value="开发区">开发区</option>
					<option value="度假区">度假区</option>
				</select>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">组织机构代码:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                  <input name="entUsercode" type="text" id="entUsercode" value="${entprise.entUsercode}" ltype="text" validate="{required:true,minlength:3,maxlength:32}" />
                </td>
                <td align="right" class="l-table-edit-td" valign="top">法定代表人:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input name="entReperson" type="text" id="entReperson" value="${entprise.entReperson}" ltype="text" validate="{required:true,minlength:3,maxlength:10}" />
                </td>
                <td align="left"></td>
            </tr> 
            <tr>
               <td align="right" class="l-table-edit-td" valign="top">联系电话:</td>
                <td align="left" class="l-table-edit-td" style="width:100px">
                    <input name="entPhone" type="text" id="entPhone" value="${entprise.entPhone}" ltype="text" validate="{required:true,minlength:7,maxlength:15}" />
                </td>
                <td align="right" class="l-table-edit-td" valign="top">联系人姓名:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                    <input name="entPhoneName" type="text" id="entPhoneName" value="${entprise.entPhoneName}" ltype="text" validate="{required:true,minlength:3,maxlength:10}" />
                </td>
                <td align="left"></td>
            </tr> 
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">生产地址:</td>
                <td align="left" class="l-table-edit-td" style="width:220px">
                     <input name="entAddress" type="text" id="entAddress" value="${entprise.entAddress}" ltype="text" validate="{required:true,minlength:2,maxlength:255}" />
                </td>
                <td align="right" class="l-table-edit-td" valign="top">生产周期:</td>
                <td align="left" class="l-table-edit-td" style="width:100px">
                    <input name="entproductCycle" type="text" id="entproductCycle" value="${entprise.entproductCycle}" ltype="text" validate="{required:true,minlength:1,maxlength:10}" />天
                </td>
                <td align="left"></td>
            </tr>
            <tr>
           		<td align="right" class="l-table-edit-td" valign="top">生产规模:</td>
                <td align="left" class="l-table-edit-td" style="width:100px">
                    <input name="entScale" type="text" id="entScale" value="${entprise.entScale}" ltype="text" validate="{required:true,minlength:1,maxlength:10}" />
                </td>
                <!-- <td align="right" class="l-table-edit-td" valign="top">排放方式:</td>
                <td align="left" class="l-table-edit-td" style="width:180px">
                <select name="pollutionMethod" id="pollutionMethod" ltype="select">
                	<option value="">请选择方式</option> 
					<option value="连续排放方式">连续排放方式</option>
					<option value="间断排放方式">间断排放方式</option>
				</select>
                </td> -->
                <td align="left"></td>
            </tr>
            <tr>
            	<td align="right" class="l-table-edit-td" valign="top">被控类型:</td>
                <td align="left" class="l-table-edit-td" style="width:180px">
                <select name="entControl" id="entControl" ltype="select">
                	<option value="${entprise.entControl}">${entprise.entControl}</option> 
                	<option value="">请选择类型</option> 
					<option value="国控企业">国控企业</option>
					<option value="省控企业">省控企业</option>
					<option value="市县区控企业">市县区控企业</option>
				</select>
                </td>
                <td align="right" class="l-table-edit-td">所属行业:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entBusiness" type="text" id="entBusiness" value="${entprise.entBusiness}" />
                </td>
            </tr>  
            <%-- <tr>
                <td align="right" class="l-table-edit-td">企业创建时间:</td>
                <td align="left" class="l-table-edit-td" style="width:160px;">
                    <input name="createDate" type="text" id="createDate" value="<fmt:formatDate value="${entprise.createDate}" pattern="yyyy-MM-dd"/>" 
                    style="width:120px" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
                </td>
                <td align="left"></td> 
            </tr>--%>
            
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">企业污染类型:</td>
                <td colspan="3" align="left" class="l-table-edit-td" style="width:160px">
                     <input id="entType0" type="checkbox" name="entType" value="水污染"/>水污染
                     <input id="entType1" type="checkbox" name="entType" value="大气污染"/>大气污染
                     <input id="entType2" type="checkbox" name="entType" value="固体废物"/>固体废物
                     <input id="entType3" type="checkbox" name="entType" value="重金属"/>重金属
                     <input id="entType4" type="checkbox" name="entType" value="污水处理厂"/>污水处理厂
                     <input id="entType5" type="checkbox" name="entType" value="规模化畜禽养殖场"/>规模化畜禽养殖场<br/>
                     <input id="entType6" type="checkbox" name="entType" value="危废经营单位"/>危废经营单位
                     <input id="entType7" type="checkbox" name="entType" value="省级重点实验室"/>省级重点实验室
                     <input id="entType8" type="checkbox" name="entType" value="二级以上医院"/>二级以上医院
                     <input id="entType9" type="checkbox" name="entType" value="噪声"/>噪声
                     <input id="checkall" type="checkbox" name="checkall" value="0" onClick="checkAllBox(this);"/>全选&nbsp;
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">生产经营和管理<br/>服务的主要内容:</td>
                <td align="left" class="l-table-edit-td"  colspan="3"> 
                <textarea cols="130" rows="4" class="l-textarea" id="entProductAndManage" name="entProductAndManage" style="width:400px">${entprise.entProductAndManage}</textarea>
                </td> 
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">主要产品1:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct01" type="text" id="entProduct01" value="${entproduct.entProduct01}" />
                </td>
                <td align="right" class="l-table-edit-td">生产规模1:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale01" type="text" id="entScale01" value="${entproduct.entScale01}" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
               <td align="right" class="l-table-edit-td">主要产品2:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct02" type="text" id="entProduct02" value="${entproduct.entProduct02}"/>
                </td>
                <td align="right" class="l-table-edit-td">生产规模2:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale02" type="text" id="entScale02" value="${entproduct.entScale02}" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
               <td align="right" class="l-table-edit-td">主要产品3:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct03" type="text" id="entProduct03" value="${entproduct.entProduct03}"/>
                </td>
                <td align="right" class="l-table-edit-td">生产规模3:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale03" type="text" id="entScale03" value="${entproduct.entScale03}"/>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
               <td align="right" class="l-table-edit-td">主要产品4:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct04" type="text" id="entProduct04" value="${entproduct.entProduct04}" />
                </td>
                <td align="right" class="l-table-edit-td">生产规模4:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale04" type="text" id="entScale04" value="${entproduct.entScale04}" />
                </td>
                <td align="left"></td>
            </tr>
             <tr>
               <td align="right" class="l-table-edit-td">主要产品5:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct05" type="text" id="entProduct05" value="${entproduct.entProduct05}" />
                </td>
                <td align="right" class="l-table-edit-td">生产规模5:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale05" type="text" id="entScale05" value="${entproduct.entScale05}" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
               <td align="right" class="l-table-edit-td">主要产品6:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct06" type="text" id="entProduct06" value="${entproduct.entProduct06}" />
                </td>
                <td align="right" class="l-table-edit-td">生产规模5:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale06" type="text" id="entScale06" value="${entproduct.entScale06}" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
               <td align="right" class="l-table-edit-td">主要产品7:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct07" type="text" id="entProduct07" value="${entproduct.entProduct07}" />
                </td>
                <td align="right" class="l-table-edit-td">生产规模7:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale07" type="text" id="entScale07" value="${entproduct.entScale07}" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
               <td align="right" class="l-table-edit-td">主要产品8:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct08" type="text" id="entProduct08" value="${entproduct.entProduct08}" />
                </td>
                <td align="right" class="l-table-edit-td">生产规模8:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale08" type="text" id="entScale08" value="${entproduct.entScale08}" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
               <td align="right" class="l-table-edit-td">主要产品9:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct09" type="text" id="entProduct09" value="${entproduct.entProduct09}" />
                </td>
                <td align="right" class="l-table-edit-td">生产规模9:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale09" type="text" id="entScale09" value="${entproduct.entScale09}" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
               <td align="right" class="l-table-edit-td">主要产品10:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entProduct10" type="text" id="entProduct10" value="${entproduct.entProduct10}" />
                </td>
                <td align="right" class="l-table-edit-td">生产规模10:</td>
                <td align="left" class="l-table-edit-td" style="width:160px">
                	<input name="entScale10" type="text" id="entScale10" value="${entproduct.entScale10}" />
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">其他信息:</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
                <textarea cols="80" rows="2" class="l-textarea" id="entOtherInfo" name="entOtherInfo" style="width:400px">${entprise.entOtherInfo}</textarea>
                </td>
                <td align="left"></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td"></td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
	                <input type="submit" value="保存" onclick="fromSubmit()" id="btn" class="l-button l-button-submit" /> 
                </td>
                <td align="left"></td>
            </tr>
        </table>
   </form>
	<img src="${bathPath}images/neiyt.jpg" style="width:748; height:2;" />
</div>
<div style="display:none;"></div>
</body>
</html>
