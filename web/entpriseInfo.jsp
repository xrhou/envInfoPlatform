<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>湖州市企业事业单位环境信息公开平台</title>
<link href="${bathPath}css/yhxx.css" rel="stylesheet" type="text/css" />
</head>
<body style="font-size:12px;" >
<div class="conterright" >
	<div class="conterright_header" style="border:0; text-align: left; text-indent:1em;">
	当前位置：<span id="local_span" style="color:red;">企业基本信息</span>
	</div>
	<img src="${bathPath}images/neiyt.jpg" width="748" height="2" />
	<div id="conterright_table" >
    	<table id="big_table" border="0" class="conterright_table_body">
    		<tbody id="table_body">
    			<tr>
    				<td align="center" class="conterright_table_body_td1">单位名称:</td>
    				<td colspan="1" class="conterright_table_body_td2"><span style="font-size:12px;">${entprise.entName}</span></td>
    				<td align="center" class="conterright_table_body_td1">污染类型:</td>
    				<td colspan="2" class="conterright_table_body_td2">
    					<span style="font-size:10px;">${entprise.entType}
    					<!-- <label><input name="Fruit" type="checkbox" value="" />废水</label>
    					<label><input name="Fruit" type="checkbox" value="" />废气</label>
    					<label><input name="Fruit" type="checkbox" value="" />重金属 </label>
    					<label><input name="Fruit" type="checkbox" value="" />禽畜养殖</label>
    					<label><input name="Fruit" type="checkbox" value="" />危险废物</label> -->
    					</span>
    				</td>
    			</tr>
    			<tr>
    				<td class="conterright_table_body_td1">组织机构代码:</td>
    				<td class="conterright_table_body_td2" width="30%">${entprise.entUsercode}</td>
    				<td class="conterright_table_body_td1">法定代表人:</td>
    				<td class="conterright_table_body_td2" width="35%">${entprise.entReperson}</td>
    			</tr>
    			
    			<tr>
    				<td class="conterright_table_body_td1">生产地址:</td>
    				<td class="conterright_table_body_td2">${entprise.entAddress}</td>
    				<td class="conterright_table_body_td1">生产周期:</td>
    				<td class="conterright_table_body_td2">${entprise.entproductCycle}</td>
    			</tr>
    			<tr>
    				<td class="conterright_table_body_td1">所属行业:</td>
    				<td class="conterright_table_body_td2">${entprise.entBusiness}</td>
    				<td class="conterright_table_body_td1">联系电话:</td>
    				<td class="conterright_table_body_td2">${entprise.entPhone}</td>
    			</tr>
    			<tr>
    				<td class="conterright_table_body_td1" >生产经营和管理服务的主要内容: </td>
    				<td class="conterright_table_body_td2" colspan="3"><span style="font-size:12px;">${entprise.entProductAndManage}</span></td>
    			</tr>
    			<tr>
    				<td colspan="2" style="align:center;text-align: center;font-weight: bold;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">主要产品</td>
    				<td colspan="2" style="align:center;text-align: center;font-weight: bold;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">生产规模</td>
    			</tr>
    			<tr>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entProduct01}</td>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entScale01}</td>
    			</tr>
    			<tr>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entProduct02}</td>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entScale02}</td>
    			</tr>
    			<tr>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entProduct03}</td>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entScale03}</td>
    			</tr>
    			<tr>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entProduct04}</td>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entScale04}</td>
    			</tr>
    			<tr>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entProduct05}</td>
    				<td colspan="2" style="align:center;text-align: center;border-right: #dee0e3 1px solid;border-bottom: #dee0e3 1px solid;width: 120px;height:30px;">${entproduct.entScale05}</td>
    			</tr>
    			<tr>
    				<td class="conterright_table_body_td1">其他信息:</td>
    				<td colspan="3" class="conterright_table_body_td2"><span style="font-size:12px;">${entprise.entOtherInfo}</span></td>
    			</tr>
    		  </tbody>
    	  </table>
    </div>
</div>
</body>
</html>