<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
transitional.dtd">

<%-- <%@page import="youngPackage.security.YoungUser"%> --%>

<%@page import="com.tgb.web.controller.utils.*"%>
<html>
<%            
	String path = request.getContextPath();      
	String basepath = request.getScheme() + "://"  
			+ request.getServerName() + ":" + request.getServerPort() 
			+ path + "/";
%>
<head>
    <title>用户管理</title>
    <link href="<%=basepath%>js/ligerui/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <script src="<%=basepath%>js/ligerui/lib/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/ligerui.min.js" type="text/javascript"></script> 
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerLayout.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerTree.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerTab.js" type="text/javascript"></script>
    <script src="<%=basepath%>js/ligerui/lib/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

        <script type="text/javascript">
            $(function (){
                $("#layout1").ligerLayout({
                    minLeftWidth:80,
                    minRightWidth:80,
					leftWidth: 150,
					topHeight:30,
					bottomHeight:20
                });
				
				var height = $(".l-layout-center").height();

				//tab size
                $("#framecenter").ligerTab({ height: height});
				
				//set tab
				tab = $("#framecenter").ligerGetTabManager();
				tab.set('contextmenu', true);
				tab.set('dblClickToClose', true);
      
            var myaccount = '<%=basepath%>js/ligerui/lib/ligerUI/skins/icons/myaccount.gif';
            var memeber = '<%=basepath%>js/ligerui/lib/ligerUI/skins/icons/memeber.gif';
            $("#tree1").ligerTree({
			checkbox: false,
                data: [
				{ text: '用户管理', icon: memeber,url: "<%=basepath%>admin/user/userManager.jsp"},
                { text: '角色管理', icon: myaccount,url: "<%=basepath%>admin/user/roleManager.jsp"},
                { text: '权限管理', icon: myaccount,url: "<%=basepath%>admin/user/permissionManager.jsp"}
            ],
			onSelect: function (node)
                    { 
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        } 
                        f_addTab(tabid, node.data.text, node.data.url);
                    }
            });
        });

		function f_addTab(tabid,text, url)
		{ 
		
			tab.addTabItem({ tabid : tabid,text: text, url: url });
		} 
			
		//右下角提示
		function prompt() {
			var dialog = $.ligerDialog.tip({ title: '提示信息', content: '操作已成功完成！' });
			setTimeout(function () { dialog.close(); }, 3000);
		} 

     </script> 
 
<style type="text/css"> 
    body,html{height:100%;}
    body{ padding:0px; margin:0;   overflow:hidden;}  
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
    .l-link2{text-decoration:underline; color:white; margin-left:2px;margin-right:2px;}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    /* 顶部 */ 
    .l-topmenu{ margin:0; padding:0; height:31px; line-height:31px;  background:url('<%=basepath%>js/images/top.jpg') repeat-x bottom; background-color:#1D438B;  position:relative; border-top:1px solid #1D438B;  }
    .l-topmenu-logo{ color:#E7E7E7; padding-left:35px; line-height:26px;background:url('<%=basepath%>js/images/topicon.gif') no-repeat 10px 5px;}
    .l-topmenu-welcome{  position:absolute; height:24px; line-height:24px;  right:30px; top:2px;color:#070A0C;}
    .l-topmenu-welcome a{ color:#E7E7E7; text-decoration:underline} 

 </style>
</head>
<body style="padding:0px;background:#EAEEF5;">  
<div id="topmenu" class="l-topmenu">
    <div class="l-topmenu-logo"><font style="font-weight: bold"><%=Myutils.getProperty("SYSTEM_NAME")%></font> 用户管理模块</div>
</div>
  <div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; "> 
        <div position="left"  title="用户与权限" id="accordion1"> 
                     <div title="功能列表" class="l-scroll">
                         <ul id="tree1" style="margin-top:3px;">
                    </div>
        </div>
        <div position="center" id="framecenter"> 
            <div tabid="home" title="我的主页" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="<%=basepath%>/admin/user/welcome.jsp"></iframe>
            </div> 
        </div> 
       
    </div>
     <div  style="height:32px; line-height:32px; text-align:center;">
                   武汉市云升科技发展有限公司©2014版权所有
    </div>
</body>
</html>
