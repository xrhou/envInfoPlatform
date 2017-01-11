<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
transitional.dtd">
<%@page import="com.tgb.web.controller.utils.Myutils"%>
<html>
<head>
    <title></title>


    <style type="text/css">
    
        p.l-log-content
        {
            margin: 0;
            padding: 0;
            padding-left: 20px;
            line-height: 22px;
            font-size: 12px;
        }

    </style>
</head>
<body style="background: white; font-size: 15px;"> 
    <center style="margin-top: 50px">
        <h3>欢迎使用：<%=Myutils.getProperty("SYSTEM_NAME")%></h3>
    </center>
</body>
</html>
