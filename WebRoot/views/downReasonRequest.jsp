<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'downReasonRequest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style>
   *{
   font-family:"微软雅黑";
   }
   	body {
	height: 100%;
	width: 1024px;
	text-align:center;
	margin:0px auto;
	font-family:"微软雅黑";
	font-size:12px;
	background-color:#FFF;	
}
.title_td {
	color: #000;
	height: 20px;
	font-size:14pt;
}
.class_td{
	font-size:14px;
	height:40px;
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
	  <!--主要内容开始-->
	   <form id="formrequest" method="post" action="addReason.action"  onSubmit="return checkTrim();" >
	   			<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>    
           <td width="100%"  align="right" valign="top">
		   <table  id="chartTable" width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>       
          
          <!-- 标签申请
    ================================================== -->
      
          <td width="1166"   valign="top">
          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"  id="tag_name" class="title_td" align="center">下&nbsp;&nbsp;载&nbsp;&nbsp;原&nbsp;&nbsp;因</td>               
              </tr>
              <tr>
                <td height="20px" class="class_td" width = "120px">下载用户名称：</td>
				<td colspan="3" class="class_td">					
					<s:property value="#session.userName"/><input name="createTimeForm"  type="hidden"  value="<s:property value='createTime'/>"/>
				</td>
              </tr>
              <tr>
                <td  height="20px" class="class_td" width = "120px">下载文件名称：</td>
				<td colspan="3" class="class_td"><s:property value='fileName'/></td>
              </tr>
			  <tr>
                <td class="class_td" >下&nbsp;&nbsp;载&nbsp;&nbsp;&nbsp;原&nbsp;&nbsp;因：</td>
				<td colspan="3">			
				<textarea name="reasonForm"  id="reasonForm" cols="100" rows="4"></textarea><span style="color:#FF0000; margin-left:10px">*</span>	</td>
              </tr> 			  
              <tr>
                <td colspan="4" style=" height:40px; text-align:center" >
                <input type="submit" class="class_td" style="width:80px;height:28px;font-family:'微软雅黑';background: #094AB2;  color:#FFF; line-height:28px;overflow:hidden; border:0px; font-size:16px;" value="确认"/>
				</td>
              </tr>             
            </table></td>          
          <!-- END标签显示内容框
    ================================================== -->         
			        </tr>
			      </table></td>
			  </tr>
			</table>
	   </form>
	  
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
  <script>
  function checkTrim(){
	   if ($("#reasonForm").val()==""){
	    		alert("下载原因不能为空！");
	    		$("#reasonForm").focus();
	    		return false;
	    }  
	   return true;
	}
  </script>
</html>
