<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<%request.setAttribute("MENU_INDEX", "ldrc");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>湖州市企业事业单位环境信息公开平台</title>
<link href="${bathPath}css/yhxx.css" rel="stylesheet" type="text/css" />

</head>
<body style="background-image:url(${bathPath}images/bjZL.jpg);">
  <jsp:include page="${bathPath}top.jsp"></jsp:include>
  <div class="conter">
    <div class="conterleft">
      <div class="conterleft_top">监测企业详情</div>
      <div class="conterleft_in">
	      <div class="conterleft_in_in">
	      	<a href="${bathPath}list_detail.jsp" target="right" style="text-decoration: none">企业基本信息</a>
	      </div>
	       <div class="conterleft_in_in" >
	      	<a href="${bathPath}ent_pollution_info.jsp"  target="right" style="text-decoration: none">企业排污信息</a>
	      </div>
	      <div class="conterleft_in_in" >
	      	<a href="${bathPath}list_detail_selfplan.jsp"  target="right" style="text-decoration: none">自行监测方案</a>
	      </div>
	      <div class="conterleft_in_in">
	      	<a href="${bathPath}pollution_facility.jsp"  target="right" style="text-decoration: none">污染设施情况</a>
	      </div>
	      <div class="conterleft_in_in">
	      	<a href="${bathPath}list_detail_check.jsp"  target="right" style="text-decoration: none">自行监测情况</a>
	      </div>
	       <div class="conterleft_in_in">
	      	<a href="${bathPath}ent_emergency_plan.jsp"  target="right" style="text-decoration: none">突发应急预案</a>
	      </div>
		  <div class="conterleft_in_in">
		  	<a href="${bathPath}list_detail_year_report.jsp" target="right" style="color:red;text-decoration: none">年度自行监测报告</a>
		  </div>
      </div>
    </div>
  	
  	<div class="conterright">
    	<div class="conterright_header" style="border:0; text-align: left; text-indent:1em;">当前位置：
    		<a href="${bathPath}list_detail.jsp" style="color:#06c;">污染源企业</a>>
    		<span style="color:red;">年度自行监测报告</span>
    	</div>
    	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
    	<div class="conterright_table">
	    	<table class="conterright_table_body">
	    		<tbody>
	    			<tr>
	    				<td class="conterright_table_body_td1">企业名称：</td>
	    				<td class="conterright_table_body_td2">云浮发电厂（B厂）有限公司</td>
	    			</tr>
	    			<tr>
	    				<td class="conterright_table_body_td1">组织机构代码：</td>
	    				<td class="conterright_table_body_td2">XXBB!@#123345567890</td>
	    			</tr>
	    			<tr>
	    				<td class="conterright_table_body_td1">法人代表：</td>
	    				<td class="conterright_table_body_td2">陈沃良</td>
	    			</tr>
	    			<tr>
	    				<td class="conterright_table_body_td1">所属行业：</td>
	    				<td class="conterright_table_body_td2">4411|火力发电</td>
	    			</tr>
	    			<tr>
	    				<td class="conterright_table_body_td1">主要检查项目：</td>
	    				<td class="conterright_table_body_td2">污染物1|污染物2</td>
	    			</tr>
	    			<tr>
	    				<td class="conterright_table_body_td1">企业地址：</td>
	    				<td class="conterright_table_body_td2">湖州云浮云城河口街光明路68号</td>
	    			</tr>
	    		  </tbody>
	    	  </table>
	    	</div>
    </div>
    
   </div>
  <jsp:include page="${bathPath}footer.jsp"></jsp:include>
</body>
</html>