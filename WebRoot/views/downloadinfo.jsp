<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="struts" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DownloadInfo.jsp' starting page</title>
   <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/themes/gray/easyui.css">  
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css">  
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script> 

  </head>
  <style>
  *{font-family: "微软雅黑";font-size: 10pt;
}
html{
	height:100%;
	overflow-x: hidden;
	overflow-y: hidden;
	}
body{
	height:100%;
	width:100%;
	font:10pt "微软雅黑" ;
	margin-bottom: 0px;
	margin-top: 0px;
	margin-right: 0px;
	overflow-x: hidden;
	overflow-y: auto;
	}
	.line {
	height: 1px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 1px;
	float: left;
}
#taginfo_table tr{
    cursor:pointer;
   }


  </style>
  <body>
   <div style="float:left;margin-top:10px;margin-bottom:10px">下载列表：</div>
     <div class="line" style="width:100%;" >&nbsp;</div>
     <!------------------------ 内容table---------------------------------------- -->
  <table id="taginfo_table" width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td style="color:#030;" width="15%">文件名称</td>
    <td style="color:#030;" width="10%">创建时间</td>
    <td style="color:#030;" width="10%">文件类型</td>
    <td style="color:#030;" width="10%">人数</td>
    <td style="color:#030;" width="10%">目标客户归属</td>
 <!-- <td style="color:#030;" width="10%">状态</td> -->
    <td style="color:#030;" width="10%">操作人</td>
    <td style="color:#030;" width="10%">下载</td>
  </tr>
  <s:iterator  value="listDown"   var="DownloadInfo">  	     	
 	     <tr>
    		<td style="color:#666" width="15%"><s:property value="file_name" /></td>
    		<td style="color:#666" width="10%"><s:property value="create_time" /></td>
    		<td style="color:#666" width="10%"><s:property value="file_type" /></td>
    		<td style="color:#666" width="10%"><s:property value="count" />人</td>
    		<td style="color:#666;" width="10%"><s:property value="region_name" /></td>
   <!--  	<td style="color:#666;" width="10%" ><s:property value="status" /></td> -->
    		<td style="color:#666" width="10%"> <s:property value="manager" /></td>
    		 <s:if test="%{#DownloadInfo['custlist_path']=='none'}" >
   			<td style="color:#666 ">文件生成中</td>
            </s:if>
            <s:else>
               			<td style="color:#666 "><a href="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/${DownloadInfo['custlist_path']}" >下载</a></td>
            </s:else>
    	<!-- <td style="color:#666" width="10%"> <s:property value="custlist_path" /></td>  -->	
  		</tr>  	    	    	 
</s:iterator> 
  </table>
  <script type="text/javascript">
   $("#taginfo_table tr:gt(0)").mouseenter(
	function(){	
        var index =($("#taginfo_table tr").index(this));
         // alert(str); //此处是选择的li 标签下的选中的 checkbox 
           if(!$(this).find("input").attr("checked")) {
              $(this).css("background","#e7e7e7");
              }        
		});
$("#taginfo_table tr:gt(0)").mouseleave(
	function(){
	    var index =($("#taginfo_table tr").index(this));     
	   if(!$(this).find("input").attr("checked")){	
		$(this).css("background","");
		}
		});
  </script>
  </body>
  
</html>
