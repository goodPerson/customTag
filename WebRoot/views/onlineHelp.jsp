<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'onlineHelp.jsp' starting page</title>
    
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
	height: 100%;
	width: 1024px;
	text-align:center;
	margin:0px auto;
	font-family:"微软雅黑";
	font-size:12px;
	background-color:#FFF;	
}
  a  {
  display: block;
  width: 150px;
  height: 28px;
  text-align: center;
  font-size: 10pt;
  line-height: 28px;
  font-size:24px;
  font-weight:bold;
  }
  a:link {
  text-decoration: none;
  color: #FFF;
  }
  a:visited {
  text-decoration: none;
  color: #FFF;
  }
  a:hover {
  text-decoration: none;
  color: #FFF;
  }
  a:active {
  text-decoration: none;
  color: #FFF;
  }
  #doownload_help{
  position:absolute;
  top:40px;
  right:350px;  
  }
</style>
  </head>
  
  <body>
<table  id="chartTable_one"  width="1024"  height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td width="24px" height="24px"><img src="./img/leftup.png" width="24px" height="24px"></td>
	  <td width="100%" style="background:url(./img/upborder.png)  repeat-x"></td>
	  <td width="24px" height="24px"><img src="./img/rightup.png" width="24px" height="24px"></td>
	</tr>
	<tr>
	  <td  style="background:url(./img/leftborder.png) repeat-y"></td>
	  <td width="100%" valign="top">
					<!-- <div id="doownload_help"><a href="downHelpFile.action">使用手册下载</a></div> -->
	      <!--主要内容开始-->
	  			<img alt="" src="./img/online/online_home.png"><br/>&nbsp;<br/>
	  			<img alt="" src="./img/online/online_tagLib.png"><br/>&nbsp;<br/>
	  			<img alt="" src="./img/online/online_tagApp.png"><br/>&nbsp;<br/>
	  			<img alt="" src="./img/online/online_tagRequest.png"><br/>&nbsp;<br/>
	  			<img alt="" src="./img/online/online_condition.png"><br/>&nbsp;<br/>
	  			<img alt="" src="./img/online/online_creatgroup.png"><br/>&nbsp;<br/>
	  			<img alt="" src="./img/online/online_propertyMag.png"><br/>&nbsp;<br/>
	  			<img alt="" src="./img/online/online_proFilter.png"><br/>&nbsp;<br/>
	  	  <!--主要内容结束-->
	  </td>
	 <td  width="24px" style="background:url(./img/rightborder.png) "></td>
	</tr>
	<tr>
	  <td width="24px" height="24px" style="background:url(./img/leftdown.png)   ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  <td   height="24px"   style="background:url(./img/downborder.png)   "></td>
	  <td width="24px" height="24px"  style="background:url(./img/rightdown.png)   ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
  </table> 
  
  </body>
</html>
