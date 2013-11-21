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
    
    <title>分区域显示标签数据</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
function show(tagName,tagId,regionId){
	//alert(tagName+"_"+tagId+"_"+regionId);
	window.open("listRegionData.action?tagId="+ tagId +"&tagName="+encodeURI(encodeURI(tagName))+"&regionId="+regionId,"","height=450,width=500,top=200,left=400,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no");
}
</script>
 <style type="text/css">
 body {
	height: 100%;
	width: 100%;
	text-align:center;
	margin:0px auto;
	font-family:"微软雅黑";
	font-size:12px;
	background-color:#FFF;	
}
#chartTable_one{
	text-align:center;
	margin:0px auto;
	width:100%;
}
.region{
	float:left;
	margin-left:10px;
	margin-right:10px;
	margin-top:10px;
	width:120px;
	height:50px;
	line-height:25px;
	border:#CCC solid 1px;
}
.regionContext{
	float:left;
	width:120px;
	height:25px;
	line-height:25px;
	text-align:center;
	font-family:"微软雅黑";
	font-size:12px;
}
.publics{
}
.tagName{
	width:100%;
	height:30px;
	font-size:20px;
	font-weight:bold;
	text-align:center;
	
}
a:link{	
	text-decoration:none; 
	color:#00F;
	}   
 
a:visited{
	text-decoration:underline; 
	color:#00F;
	}    
 
a:hover{
	text-decoration:underline; 
	color:#00F;
	}     
 
a:active{
	text-decoration:underline; 
	color:#00F;
}   
 </style>
  </head>
  
  <body>
   <table  id="chartTable_one"  width="100%"  height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td width="24px" height="24px"><img src="./img/leftup.png" width="24px" height="24px"></td>
	  <td width="100%" style="background:url(./img/upborder.png)  repeat-x"></td>
	  <td width="24px" height="24px"><img src="./img/rightup.png" width="24px" height="24px"></td>
	</tr>
	<tr>
	  <td  style="background:url(./img/leftborder.png) repeat-y"></td>
	  <td width="100%" valign="middle">
		  <!--主要内容开始-->
           <div class="tagName"><s:property value="tagName"/>--标签人数</div>  
           <s:iterator value="listRegion" status="l">
	  		   <div class="region">
	           		<div class="regionContext" ><s:property value="regionName"/></div>
	                <div class="regionContext" style="color:#00F; cursor:pointer;"><a href="javascript:void(0)" onClick="show('<s:property value='tag_name'/>','<s:property value='tag_id'/>','<s:property value='regionId'/>')"><s:property value="subsCnt"/></a></div>
	           </div>         
           </s:iterator>	  
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
