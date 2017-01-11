<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String bathPath=request.getScheme()+"://"+request.getServerName()+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>左侧导航菜单</title>
<link href="${bathPath}js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	padding: 0px;margin: 0;font-size:12px;
}
#accordion1 {
	width: 200px;overflow: hidden;
}
a{
	background: #F2F2F2;color:#00f;
	font-weight: bold;display:block;
	text-decoration:none;margin:0;
	padding:12px; line-height:8px;
	font-size:12px; 
	list-style-type:none;
}
a:hover { background:#BFBFBF;}
</style>
<script src="${bathPath}js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="${bathPath}js/ligerui/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
<script src="${bathPath}js/ligerui/lib/ligerUI/js/plugins/ligerAccordion.js" type="text/javascript"></script>

<script type="text/javascript"> 
	$(function (){
         $("#accordion1").ligerAccordion({
			height: 438
         });
    });
</script>
<script>
function selectLink(n){//alert(n)
   $("#zone_"+n).css({"color":"red"});
   for(var i=1;i<=9;i++){
	   if(i==n){continue;}//alert( $("#sel_"+i).css("color"))
	   $("#zone_"+i).css({"color":"#0000FF"});
   }
}
 
function selectType(n){//alert(n)
	   $("#type_"+n).css({"color":"red"});
	   for(var i=1;i<=9;i++){
		   if(i==n){continue;}//alert( $("#sel_"+i).css("color"))
		   $("#type_"+i).css({"color":"#0000FF"});
	   }
}

function selectControl(n){//alert(n)
	   $("#qx_"+n).css({"color":"red"});
	   for(var i=1;i<=3;i++){
		   if(i==n){continue;}//alert( $("#sel_"+i).css("color"))
		   $("#qx_"+i).css({"color":"#0000FF"});
	   }
}
</script>

</head>
<body style="padding: 0px;font-size:12px;">
	<div id="accordion1">
		<div title="所属地区">
			<ul>
				<li onclick="selectLink('1')"><a href="${bathPath}right_index.jsp?flag=hz" target="right" style="text-decoration: none" id="zone_1" >湖州市</a></li>
				<li onclick="selectLink('2')"><a href="${bathPath}right_index.jsp?flag=cx" target="right" style="text-decoration: none" id="zone_2">长兴县</a></li>
				<li onclick="selectLink('3')"><a href="${bathPath}right_index.jsp?flag=dq" target="right" style="text-decoration: none" id="zone_3">德清县</a></li>
				<li onclick="selectLink('4')"><a href="${bathPath}right_index.jsp?flag=aj" target="right" style="text-decoration: none" id="zone_4">安吉县</a></li>
				<li onclick="selectLink('5')"><a href="${bathPath}right_index.jsp?flag=wx" target="right" style="text-decoration: none" id="zone_5">吴兴区</a></li>
				<li onclick="selectLink('6')"><a href="${bathPath}right_index.jsp?flag=nx" target="right" style="text-decoration: none" id="zone_6">南浔区</a></li>
				<li onclick="selectLink('7')"><a href="${bathPath}right_index.jsp?flag=kf" target="right" style="text-decoration: none" id="zone_7">开发区</a></li>
				<li onclick="selectLink('8')"><a href="${bathPath}right_index.jsp?flag=dj" target="right" style="text-decoration: none" id="zone_8">度假区</a></li>
			</ul>
		</div>
		<div title="企业类型">
			<ul><!--  水污染物  大气污染  固体废物  噪声    其他污染类型 -->
				<li onclick="selectType('1')"><a href="${bathPath}right_index.jsp?flag=s" target="right" style="text-decoration: none" id="type_1">水污染</a></li>
				<li onclick="selectType('2')"><a href="${bathPath}right_index.jsp?flag=q" target="right" style="text-decoration: none" id="type_2">大气污染</a></li>
				<li onclick="selectType('3')"><a href="${bathPath}right_index.jsp?flag=j" target="right" style="text-decoration: none" id="type_3">重金属</a></li>
				<li onclick="selectType('4')"><a href="${bathPath}right_index.jsp?flag=ws" target="right" style="text-decoration: none" id="type_4">污水处理厂</a></li>
				<li onclick="selectType('5')"><a href="${bathPath}right_index.jsp?flag=yz" target="right" style="text-decoration: none" id="type_5">规模化畜禽养殖场</a></li>
				<li onclick="selectType('6')"><a href="${bathPath}right_index.jsp?flag=gf" target="right" style="text-decoration: none" id="type_6">固体废物</a></li>
				<li onclick="selectType('7')"><a href="${bathPath}right_index.jsp?flag=wf" target="right" style="text-decoration: none" id="type_7">危废经营单位</a></li>
				<li onclick="selectType('8')"><a href="${bathPath}right_index.jsp?flag=sy" target="right" style="text-decoration: none" id="type_8">省级重点实验室</a></li>
				<li onclick="selectType('9')"><a href="${bathPath}right_index.jsp?flag=yy" target="right" style="text-decoration: none" id="type_9">二级以上医院</a></li>
			</ul>
		</div>
		<div title="其他">
			<ul>
				<li onclick="selectControl('1')"><a href="${bathPath}right_index.jsp?flag=gk" target="right" style="text-decoration: none" id="qx_1">国控企业</a></li>
				<li onclick="selectControl('2')"><a href="${bathPath}right_index.jsp?flag=sk" target="right" style="text-decoration: none" id="qx_2">省控企业</a></li>
				<li onclick="selectControl('3')"><a href="${bathPath}right_index.jsp?flag=qx" target="right" style="text-decoration: none" id="qx_3">市县区控企业</a></li>
			</ul>
		</div>
	</div>
	<div style="display: none;"></div>
</body>
</html>
