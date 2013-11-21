<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tologin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	width: 1024px;
    margin:0px auto;
	text-align:center;
	background:#FFF;
    overflow-x: hidden;

}
.styles{
    width: 1024px;
    height:auto;
    font-family: "微软雅黑";
    line-height:300px;
    overflow: hidden;
    font-size:14px;
}
</style>
  </head>
  
  <body>
  <div class="styles">
   登陆过期，请重新进入！
   </div>
  </body>
</html>
