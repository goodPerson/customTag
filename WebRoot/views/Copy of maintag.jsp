<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="struts" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'maintag.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="css/themes/icon.css">
<!-- <script type="text/javascript" src="js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script> 
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/DD_roundies_min.js"></script>
</head>
<style>
* {
	font-family: "微软雅黑";
	font-size: 10pt;
}
html {
	overflow-x: hidden;
	overflow-y: auto;
}
body {
	width: 1024px;
    margin:0px auto;
	text-align:center;
	background:#FFF;
    overflow-x: hidden;
}

.line {
	height: 1px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 1px;
	float: left;
	margin-top:5px;
}
.tag_div {
	width: 70px;
	height:150px;
	float: left;
	margin: 5px;
	padding:0px;
	text-align: left;
	cursor:pointer;
	
}
.clear_div {
	clear: both;
}
.title_div {
	cursor: pointer;
	height: 40px;
	float: left;
	height:40px;
	line-height: 40px;
	text-align:left;
}

.img_div {
	height: 40px;
    width:40px;
	float: left;
	line-height: 40px;
}

.nav_bt_div{ float:left; cursor:pointer;
}
.tag_div img {padding-top:5px; padding-bottom:5px; border:1px #FFFFFF solid; margin-top:5px; margin-bottom:5px;}
.img_serv {
	
}
#taginfo_div{width:250px; height:100%;position:absolute; float:left; right:-270px; bottom:0px; border-left:2px solid #E8E8E8; border-top:1px solid #E8E8E8; background:#FFF; z-index:99;}
.taginfo_div_title{color:8d8f84;float:left;position:relative; width:70px; margin-left:28px; margin-top:10px; text-align:left;}
.taginfo_div_item{color:#000;float:left;position:relative; margin-top:10px;width:100px; text-align:left;}
#download_div{border-color:#000; border-style:solid;border-width:2px;
			background:#FFF; width:400px; height:210px;right:250px;
			position:absolute;z-index:100; top:0px; visibility:hidden; 
			/*display:none*/
			 }
#con_div {border-color:#000; border-style:solid;border-width:2px;
			background:#FFF; width:380px; height:200px;
			position:absolute;right:250px;z-index:100;
			display:none }
#collapse{
  cursor:pointer; 
 
}
#tag_url_div a {
	display: block;
	width: 80px;
	height: 28px;
	text-align: center;
	font-size: 10pt;
	line-height: 28px;	
}
#tag_url_div  a:link {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#tag_url_div  a:visited {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#tag_url_div  a:hover {
	text-decoration: none;
	background: #03F;
	color: #FFF;
}
#tag_url_div  a:active {
	text-decoration: none;
	background: #000;
	color: #FFF;
}
#download_div a {
	display: block;
	width: 80px;
	height: 28px;
	text-align: center;
	font-size: 10pt;
	line-height: 28px;	
}
#download_div  a:link {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#download_div  a:visited {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#download_div  a:hover {
	text-decoration: none;
	background: #03F;
	color: #FFF;
}
#download_div  a:active {
	text-decoration: none;
	background: #000;
	color: #FFF;
}
#left_menu_table {
	background: #F3F3F3;
	color: #000;
	valign: top;
	width: 120px;
	left:0px;
	height: 100%;
}
.label1{
	height:30px;
	line-height:30px;
	width:12.5%;
	text-align:center;
	float:left;
    cursor: pointer;
} 
 .line_in {
	height: 0px;
	font-size: 0px;
	background: #80beed;
	line-height: 0px;
	float: left;	
}
.label_in {
  color:#5ab4f9;
  text-align:center;  
}
.label_one{
	float: left;
	width: 12%;
	height: 30px; 
	font-family:"微软雅黑";
	cursor: pointer;
	text-align:center; line-height:30px; 
	color:#666;
}
.label_one_in{
   color:#5ab4f9;
}
.descripts{
	color:#F00;
}
</style>

<body id="maintag_body">
<!-- <div style="width:10%;height:100%;float:left;background:#F3F3F3;align:left;border:solid #094AB2 1px"></div>
  -->

   <table  id="chartTable_one" width="1024px" height="100%" border="0"  cellspacing="0" cellpadding="0">
	<tr>
	  <td width="24px" height="24px" style="background:url(./img/leftup.png)  ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  <td width="24px" style="background:url(./img/upborder.png)  "></td>
	  <td width="24px" height="24px" style="background:url(./img/rightup.png)  ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
	  <td  width="24px" style="background:url(./img/leftborder.png) "></td>
	  <td width="100%" valign="top">
	  <!--主要内容开始-->
       <div style="float:left;width:100%;align:center; border:1px solid #CCC;">
 <input type="hidden" id="req_user" value="<s:property value='#session.userId'/>"/>
  <input type="hidden" id="req_regionName" value="<s:property value='#session.regionName'/>"/>
  <input type="hidden" id="req_regionId" value="<s:property value='#session.regionId'/>"/>
<%--主要标签导航--%>
 <div id="left_menu" style="height:30px;border-bottom:1px solid #CCC;width:100%;">
<div class="label1" >基本类</div>
<div class="label1" >业务类</div>
<div class="label1" >渠道类</div>
<div class="label1" >终端类</div>
<div class="label1" >互联网类</div>
<div class="label1" >服务类</div>
<div class="label1" >消费价值类</div>
<div class="label1" >营销活动类</div>
</div>
<div class="line_in" style="width:100% ;border:solid #5ab4f9 1px;" >&nbsp;</div>
<div id="attr_one" style="float:left;width:100%; height:auto;border-bottom:1px solid #CCC; display:none;position:relative;">
<s:iterator value="bcg"  >
	<div class="label_one" ><s:property value="ywName"/></div>
</s:iterator>
<!-- 
<div class="label_one" >短信</div>
<div class="label_one" >彩信</div>
<div class="label_one" >GPRS流量</div>
<div class="label_one" >飞信</div>
<div class="label_one" >MM</div>
<div class="label_one" >手机视频</div>
<div class="label_one" >手机游戏</div>
<div class="label_one" >手机阅读</div>
<div class="label_one" >手机动漫</div>
<div class="label_one" >手机导航</div>
<div class="label_one" >手机邮箱</div>
<div class="label_one" >手机支付</div>
<div class="label_one" >无线音乐</div>
 -->
</div>
<%--应用分类标签，主要包括生命周期和时间偏好--%>
<div id="main_tag" style="width:100%; height:auto; border:0px solid #CCC; position:relative;">
<%--业务类--%>
  <s:if test="%{serv_type==1}"> 
  <script> var old_tag_class="0";</script>
  <s:iterator  value="mainTagList"   var="tag"> 
  <script>
  var new_tag_class="<s:property value='tag_class' />"; 
  if(old_tag_class!=new_tag_class){
 var tag_class_div="<div class='clear_div'></div><div style='margin:5px;background-image:url(./img/1113.png);width:195px;height:35px;padding-top:4px;padding-left:5px;color:#FFF;font-weight:boild;left:-20px;position:relative;'>&nbsp;&nbsp;&nbsp;&nbsp;"+new_tag_class+"</div>";

  document.write(tag_class_div);
  old_tag_class=new_tag_class;
  }
   </script>
  <div style="margin:5px;">
    <div class="tag_div">
    <s:if test="%{#tag['is_used']==0}" >
    <img src="./img/maintag/tag1.png" width="70" height="70" onClick="$.select_taginfo('<s:property value="tag_name" />'	 ,'<s:property value="tag_id" />','<s:property value="profile" />','<s:property value="tag_statement" />','<s:property value="subsCnt" />','<s:property value="tag_region" />','<s:property value="tag_creator" />','<s:property value="create_time" />','<s:property value="end_time" />','<s:property value="tag_url" />')">
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('<s:property value="tag_name" />'			 ,'<s:property value="tag_id" />','<s:property value="profile" />','<s:property value="tag_statement" />','<s:property value="subsCnt" />','<s:property value="tag_region" />','<s:property value="tag_creator" />','<s:property value="create_time" />','<s:property value="end_time" />','<s:property value="tag_url" />')">    
    </s:else>
    <div style=" padding-left:10px;"><s:property value="tag_name" /></div></div> 
  </div>
  </s:iterator> 
  </s:if>  
<%--业务结束--%> 
<%--基本类--%>
  <s:if test="%{serv_type==0}"> 
  <script> var old_tag_class="0";</script>
  <s:iterator  value="mainTagList"   var="tag"> 
  <script>
  var new_tag_class="<s:property value='tag_serv_type' />"; 
  if(old_tag_class!=new_tag_class){
 var tag_class_div="<div class='clear_div'></div><div style='margin:5px;background-image:url(./img/1113.png);width:195px;height:35px;padding-top:4px;padding-left:5px;color:#FFF;left:-20px;position:relative;'>&nbsp;&nbsp;&nbsp;&nbsp;"+new_tag_class+"</div>";

  document.write(tag_class_div);
  old_tag_class=new_tag_class;
  }
   </script>
  <div style="margin:0px;">
    <div class="tag_div">
    <s:if test="%{#tag['is_used']==0}" >
    <img src="./img/maintag/tag1.png" width="70" height="70"onClick="$.select_taginfo('<s:property value="tag_name" />'			 ,'<s:property value="tag_id" />','<s:property value="profile" />','<s:property value="tag_statement" />','<s:property value="subsCnt" />','<s:property value="tag_region" />','<s:property value="tag_creator" />','<s:property value="create_time" />','<s:property value="end_time" />','<s:property value="tag_url" />')" >
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('<s:property value="tag_name" />'			 ,'<s:property value="tag_id" />','<s:property value="profile" />','<s:property value="tag_statement" />','<s:property value="subsCnt" />','<s:property value="tag_region" />','<s:property value="tag_creator" />','<s:property value="create_time" />','<s:property value="end_time" />','<s:property value="tag_url" />')">    
    </s:else>
    <div style=" padding-left:10px;"><s:property value="tag_name" /></div></div>   
  </div>
  </s:iterator>   
  </s:if> 
<%--偏好类结束--%>
<%--事件类\客户类\终端类--%>
  <s:if test="%{serv_type==2 or serv_type==3 or serv_type==4 or serv_type==7  }"> 
  <script> var old_tag_class="0";</script>
  <s:iterator  value="mainTagList"   var="tag"> 
  <script>
  var new_tag_class="<s:property value='tag_serv_type' />"; 
  if(old_tag_class!=new_tag_class){
 var tag_class_div="<div class='clear_div'></div><div style='margin:5px;background-image:url(./img/1113.png);width:195px;height:35px;padding-top:4px;padding-left:5px;color:#FFF;left:-20px;position:relative;'>&nbsp;&nbsp;&nbsp;&nbsp;"+new_tag_class+"</div>";

  document.write(tag_class_div);
  old_tag_class=new_tag_class;
  }
   </script>
  <div style="margin:0px;">
    <div class="tag_div">
    <s:if test="%{#tag['is_used']==0}" >
    <img src="./img/maintag/tag1.png" width="70" height="70" onClick="$.select_taginfo('<s:property value="tag_name" />'			 ,'<s:property value="tag_id" />','<s:property value="profile" />','<s:property value="tag_statement" />','<s:property value="subsCnt" />','<s:property value="tag_region" />','<s:property value="tag_creator" />','<s:property value="create_time" />','<s:property value="end_time" />','<s:property value="tag_url" />')">
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('<s:property value="tag_name" />'			 ,'<s:property value="tag_id" />','<s:property value="profile" />','<s:property value="tag_statement" />','<s:property value="subsCnt" />','<s:property value="tag_region" />','<s:property value="tag_creator" />','<s:property value="create_time" />','<s:property value="end_time" />','<s:property value="tag_url" />')">    
    </s:else>
    <div style=" padding-left:10px;"><s:property value="tag_name" /></div></div>   
  </div>
  </s:iterator>   
  </s:if> 
<%--事件类\客户类\终端类结束--%>
<%--价值类\交往圈--%>
  <s:if test="%{serv_type==5  or serv_type==6 }"> 
  <script> var old_tag_class="0";</script>
  <s:iterator  value="mainTagList"   var="tag"> 
  <script>
 // var new_tag_class="<s:property value='tag_class' />"; 
  var new_tag_class="<s:property value='tag_serv_type' />"; 
  if(old_tag_class!=new_tag_class){
 var tag_class_div="<div class='clear_div'></div><div style='margin:5px;background-image:url(./img/1113.png);width:195px;height:35px;padding-top:4px;padding-left:5px;color:#FFF;left:-20px;position:relative;'>&nbsp;&nbsp;&nbsp;&nbsp;"+new_tag_class+"</div>";  
//  "<div class='line' style='width:5%;background:#094AB2;'>&nbsp;</div>"+
//  "<div class='line' style='width:95%;' >&nbsp;</div>"
  document.write(tag_class_div);
  old_tag_class=new_tag_class;
  }
   </script>
  <div style="margin:5px;">
    <div class="tag_div">
    <s:if test="%{#tag['is_used']==0}" >
    <img src="./img/maintag/tag1.png" width="70" height="70" onClick="$.select_taginfo('<s:property value="tag_name" />'			 ,'<s:property value="tag_id" />','<s:property value="profile" />','<s:property value="tag_statement" />','<s:property value="subsCnt" />','<s:property value="tag_region" />','<s:property value="tag_creator" />','<s:property value="create_time" />','<s:property value="end_time" />','<s:property value="tag_url" />')">
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('<s:property value="tag_name" />'			 ,'<s:property value="tag_id" />','<s:property value="profile" />','<s:property value="tag_statement" />','<s:property value="subsCnt" />','<s:property value="tag_region" />','<s:property value="tag_creator" />','<s:property value="create_time" />','<s:property value="end_time" />','<s:property value="tag_url" />')">    
    </s:else>
    <div style=" padding-left:10px;"><s:property value="tag_name" /></div></div>   
  </div>
  </s:iterator> 
  </s:if>   
  
  
</div>
<%--end left_menu--%>
</div>
	  
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
<%--标签信息框--%>
<div id="taginfo_div">
<div style="text-align:left; float:left"><img src="./img/maintag/tag.png" width="70" height="70"  style="margin-top:10px;"></div>
<div style="float:right"><img src="./img/right_menu1.png" id="collapse" align="right" style=" margin-right:5px; margin-top:10px"></div>
<div style="clear:both" />
<div style=" font-size:16pt;margin-top:10px;text-align:left;"><img src="./img/maintag/jiantou2.png" width="11" height="14" style="margin-left:10px; margin-top:30px;">&nbsp;信息</div>
<div class="taginfo_div_title">标签名称</div>
<div class="taginfo_div_item" id="tag_name_div">测试</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">标签简介</div>
<div class="taginfo_div_item" id="tag_profile_div">标签简介标签简介标签简介标签简介</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">标签口径</div>
<div class="taginfo_div_item" id="tag_statement_div">测试</div>
<div style="clear:both"></div>
<div class="taginfo_div_title" >标签人数</div>
<div class="taginfo_div_item" id="tag_subs_div" style="color:#00F; cursor:pointer;">测试</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">标签地市</div>
<div class="taginfo_div_item" id="tag_region_div">石家庄</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">创建人</div>
<div class="taginfo_div_item" id="tag_creator_div">郑声远</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">数据月份</div>
<div class="taginfo_div_item" id="data_month"><s:property value="mon" /></div>
<div style="clear:both"></div>
<div class="taginfo_div_title">有效时间</div>
<div class="taginfo_div_item" id="tag_end_time_div">20130525</div><input id="tag_id_flag" type="hidden" value=""/>  
<div style="clear:both"></div>
<div class="taginfo_div_item" id="tag_url_div" align="center"><a id="tag_url_div_bt"   href="javascript:void(0)" style="position:relative; left:60%"> 下载清单 </a> </div>
<!-- <div class="taginfo_div_item" id="consist_div" align="center"><a id="consist_div_bt"   href="javascript:voi(0)" style="position:relative; left:60px"> 构成分析 </a> </div> -->

</div>
<%--标签信息框结束--%>


<div id='download_div'>
<table width="100%" border="0" cellspacing="0" cellpadding="10" id="download_table">
  <tr>
    <td colspan="2" style="font-size:12pt;">下载信息</td>
    </tr>
   <tr>
    <td colspan="2">  
	     <label>地域&nbsp;&nbsp;:</label>&nbsp; <select id="down_region" class="easyui-combobox" name="state" style="width:286px;"></select><br/>
	     <s:if test='#session.regionId=="1"'>
	     	<lable style="color:#F00">说明：省与地市不可同时选择</lable>
	     </s:if>
	     <s:else>
	     	<lable style="color:#F00">说明：地市与区县不可同时选择</lable>
	     </s:else>
	     
	</td>
  </tr>

  <tr>
    <td valign="top"> <label>导出字段&nbsp;&nbsp;:</label></td>
    <td  style="padding-left:5px; width:100%;">
	  
      <input id="im_phone"  name="电话号码" type="checkbox" value="PHONE_NO"  id="check" />电话号码
      <input id="im_brand"  name="品牌" type="checkbox" value="E.BRAND_DESC"  id="check" />品牌
      <input id="im_city"  name="归属地市" type="checkbox" value="F.REGION_NAME"  id="check" />归属地市
      <input id="im_county"  name="归属县区" type="checkbox" value="B.REGION_NAME"  id="check" / >归属县区<br>  
      <input id="im_product"  name="主体产品" type="checkbox" value="C.PRIVNAME"  id="check" />主体产品
      <input id="im_channel"  name="创建渠道" type="checkbox" value="D.CHNL_NAME"  id="check" />创建渠道
      <input id="im_totalFee"  name="上月总消费" type="checkbox" value="A.DUE_FEE"  id="check" />上月总消费        
      <input id="im_GPRSFee"  name="GPRS计费流量(MB)" type="checkbox" value="A.GPRS_BILL_VOL"  id="check" />GPRS计费流量(MB)           
    </td>
  </tr>
  <tr>
    <td align="left"><a id="yes" href="javascript:void(0)">确定</a></td>
    <td align="right"><a id="no" href="javascript:void(0)">取消</a></td>
  </tr>
</table>
</div>

 <div id='con_div'>
<table width="100%" border="0" cellspacing="0" cellpadding="10" id="download_table">
  <tr>
    <td colspan="2" style="font-size:12pt;">构成纬度选择</td>
    </tr>
  <tr>
    <td colspan="2">
      <input name="性别" type="radio" value="PHONE_NO"  id="check">性别
      <input name="客户年龄" type="checkbox" value="E.BRAND_DESC"  id="check">客户年龄
      <input name="城乡用户" type="checkbox" value="F.REGION_NAME"  id="check">城乡用户
      <input name="通话时长" type="checkbox" value="B.REGION_NAME"  id="check">通话时长 
      <input name="点对点彩信通信量" type="checkbox" value="B.REGION_NAME"  id="check">点对点彩信通信量 <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="应收费" type="checkbox" value="C.PRIVNAME"  id="check">应收费
      <input name="品牌" type="checkbox" value="D.CHNL_NAME"  id="check">品牌
      <input name="智能手机" type="checkbox" value="D.CHNL_NAME"  id="check">智能手机
      <input name="GPRS计费流量" type="checkbox" value="D.CHNL_NAME"  id="check">GPRS计费流量
      <input name="用户在网时长" type="checkbox" value="A.DUE_FEE"  id="check">用户在网时长             
    </td>
  </tr>
  <tr>
    <td align="left"><a id="yes" href="javascript:void(0)">确定</a></td>
    <td align="right"><a id="no" href="javascript:void(0)">取消</a></td>
  </tr>
</table>
</div>  





<script>
$(function(){
	var userId=$("#req_user").val();	
	var regionName=$("#req_regionName").val();
	var regionId=$("#req_regionId").val();
	var count="";
	var t_name="";
	var id="";
	var type="<%=request.getAttribute("serv_type") %>";
	var type_se="<%=request.getAttribute("serv_name") %>";
	/*
	var session_region=$("#session_region").val();
	var text1="说明：省与地市不可同时选择";
	var text2="说明：地市与区县不可同时选择";
	if (session_region=="1"){
		$("#descript_l").text(text1);
	}else{
		$("#descript_l").text(text2);
	}
	*/
	  if(type!=1){
		  $(".label_one").css("display","none");
		  $("#line_n").css("display","none"); 
		  $("#attr_one").hide();
	  }else{
		  $("#attr_one").show();
	  }
	  $(".label_one").each(
			     function(){
			     var a=$(this).text();
			     if(type_se==a){
			   	  $(this).addClass("label_one_in");
			     }
			});
		$("#left_menu").children().each(function(){
		   var num=$("#left_menu").children().index(this);
		     if(num==parseInt(type)){
		       $("#left_menu").children(":eq("+num+")").addClass("label_in");     
		   }
		});
		$(".label_one").mouseenter(
			       function(){
			        var index=$(this).text();
			        if(type_se!=index){
			         $(this).addClass("label_one_in");
			         }
			    });
		 $(".label_one").mouseleave(
		       function(){
		        var index=$(this).text();
		         if(type_se!=index){
		         $(this).removeClass("label_one_in");
		         }
		    });
		  
		  $("#left_menu").children().mouseenter(
		       function(){
		       var text=$(this).index();
		        if(text!=type){
		        $(this).addClass("label_in");
		        }    
		    });
		    
		   $("#left_menu").children().mouseleave(
		     function(){
		     var text=$(this).index();
		      if(text!=type){
		      $(this).removeClass("label_in");
		      }
		  
		  });
		
			   $("#m0 tr").mouseenter(
				    function(){
				      if($(this).text()!=type_se)
				        $(this).css("background","#d4d4d4");
				});
				$("#m0 tr").mouseleave(
				    function(){
				    if($(this).text()!=type_se)
				        $(this).css("background","");
				});
				$(".label_one").click(
				    function(){
				       var type_sec=$(this).text();
				       $(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=1&serv_name="+encodeURI(encodeURI(type_sec)));    
				});	
				$(".label1").click(
						   function(){
						        var nav_title =$(this).text(); 
						        $(this).addClass("label_in");
						        if(nav_title=="基本类"){	
								$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=0&serv_name=0");
						    }else if(nav_title=="业务类"){
								$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=1&serv_name=0");	
							}else if(nav_title=="渠道类"){
								$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=2&serv_name=0");		
							}else if(nav_title=="终端类"){
								$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=3&serv_name=0");		
							}else if(nav_title=="互联网类"){
								$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=4&serv_name=0");		
							}else if(nav_title=="服务类"){
								$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=5&serv_name=0");		
							}else if(nav_title=="消费价值类"){		
								$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=6&serv_name=0");		
							}else if(nav_title=="营销活动类"){		
								$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=7&serv_name=0");		
							}        
						});
				
				//下载地域选择
			    $("#down_region").combobox({
							  url:'getDownRegion.action',
							  editable:true,
							  valueField:'id',
							  textField:'text',
							  panelHeight:100,
							  panelWidth:286,
							  editable:true,
							  multiple:true,
							  onSelect:function(){
							   var res=String($("#down_region").combobox('getValues')).split(",");
							     if(regionId==1){
									      for (i=0;i<res.length;i++){
										      if(res[i]==1 && res.length>1){
										       alert("省与地市不可同时选择，选择地市前请删除省");
										       $("#down_region").combobox("setValue","1");
										      }
									      }
							     }else{
										   for (i=0;i<res.length;i++){
										      if(res[i]==regionId && res.length>1){
										       alert("地市与区县不可同时选择，选择区县前请删除地市");
										       $("#down_region").combobox("setValue",regionId);
										      }
										  }
							     }
							  
							  }
					 });				
			    $("#down_region").combobox("setValue",regionId);


			    $("#taginfo_div").click(
			    function(){
			       $("#taginfo_div").css("right","0px");  
			    });	
			    $("#collapse").click(
			      function(){
			      $("#taginfo_div").animate({right:"-250px"},500);
			      });				
			  //导航条单击事件   此函数没有问题
			    $(".nav_bt_div").click(function(){	
			    	var nav_title=$.trim($(this).text());	

			    	if(nav_title=="业务类"){
			    		$(".img_div img:eq(0)").attr("src","./img/maintag/serv1.png");	
			    		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=0&serv_name=0");
			        }else if(nav_title=="消费价值类"){
			    		$(".img_div img:eq(1)").attr("src","./img/maintag/like1.png");
			    		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=1&serv_name=0");	
			    	}else if(nav_title=="渠道类"){
			    		$(".img_div img:eq(2)").attr("src","./img/maintag/event1.png");	
			    		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=2&serv_name=0");		
			    	}else if(nav_title=="终端类"){
			    		$(".img_div img:eq(3)").attr("src","./img/maintag/terminal1.png");
			    		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=3&serv_name=0");		
			    	}else if(nav_title=="互联网内容类"){
			    		$(".img_div img:eq(4)").attr("src","./img/maintag/kehu1.png");
			    		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=4&serv_name=0");		
			    	}else if(nav_title=="服务类"){
			    		$(".img_div img:eq(5)").attr("src","./img/maintag/jiazhi1.png");
			    		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=5&serv_name=0");		
			    	}else if(nav_title=="基本类"){
			    		$(".img_div img:eq(6)").attr("src","./img/maintag/jiaowangq1.png");		
			    		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=6&serv_name=0");		
			    	}
			    	else if(nav_title=="营销活动类"){
			    		$(".img_div img:eq(7)").attr("src","./img/maintag/yuyinlan.png");		
			    		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=7&serv_name=0");		
			    	}
			    	else if(nav_title=="位置类"){
			    		$(".img_div img:eq(8)").attr("src","./img/maintag/taocanlan.png");		
			    		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=8&serv_name=0");		
			    	}
			        event.stopPropagation();	

			    });
			  //此函数没有问题
			    $("#tag_url_div_bt").click( function(){
			       //$("#download_div").css("display","block");
			        $("#download_div").css("visibility","visible");
			    }); 
			    //此函数没有问题
			    $("#yes").click(
			     function(){
			    	 var im_phone   =$("#im_phone").attr("checked");
			    	 var im_brand   =$("#im_brand").attr("checked");
			    	 var im_city    =$("#im_city").attr("checked");
			    	 var im_county  =$("#im_county").attr("checked");
			    	 var im_product =$("#im_product").attr("checked");
			    	 var im_channel =$("#im_channel").attr("checked");
			    	 var im_totalFee=$("#im_totalFee").attr("checked");
			    	 var im_GPRSFee=$("#im_GPRSFee").attr("checked");
			     var checkFlag=im_phone+"_"+im_brand+"_"+im_city+"_"+im_county+"_"+im_product+"_"+im_channel+"_"+im_totalFee+"_"+im_GPRSFee;
			     if (checkFlag.indexOf("checked")<0){
			    	 alert("请选择导出字段！");
			    	 return;
			    	 }
			       var str="";
			       var col_name="";
			       var re="";
			       var regions=String($("#down_region").combobox('getValues')).split(",");
			    		
			    for (i=0;i<regions.length;i++){
			      if(i!=regions.length-1){
			          re+="'"+regions[i]+"'"+",";
			        //re+="a";
			      }else{
			          re+="'"+regions[i]+"'";
			      }
			    };
			      $("#download_table tr:eq(2)").find("input").each(function(){
			      str_index=this.value;
			      name=this.name;
			       if($(this).attr("checked")) {
			          str+= str_index+",";
			          col_name+=name+"	";
			          }          
			      });
			       $("#taginfo_div").animate({right:"0px"},500);
			       $("#download_div").css("display","none");
			           $.ajax({
			    		type: 'POST',
			    		url: 'downaddinfo.action',
			    		data:{tag_name:t_name,count:count,sql:"*****",id:id,col:str,col_desc:col_name,type:"tag_list",region_name:$("#down_region").combobox('getText'),regionId:re,flag:'0'},
			    		dataType:"text", 
			    		success: function(data){
			    		var href="querydown.action?userId="+userId;
			             window.location.href=href; 
			            },
			    		error: function(data){	
			     		return false;
			    		}
			    	});	
			       
			    $(window.parent.document).find("#left_menu_table tr:eq(1)").css("background","");	
			    $(window.parent.document).find("#left_menu_table tr:eq(5)").css("background","#d4d4d4");   
			     });
			  //标签详细说明  此函数没有问题
			    $.extend({'select_taginfo':function(tag_name,tag_id,tag_pro,tag_stment,tag_subs,tag_region,tag_creator,tag_time1,tag_time2,tag_url){
			    $("#tag_name_div").text(tag_name);	
			    $("#tag_profile_div").text(tag_pro);	
			    $("#tag_statement_div").text(tag_stment);	
			    $("#tag_subs_div").text(tag_subs);	
			    //alert(tag_region);
			    $("#tag_region_div").text($("#req_regionName").val());				    
			    $("#tag_creator_div").text(tag_creator);	
			    $("#tag_end_time_div").text(tag_time1+"-"+tag_time2);
                                           $("#tag_id_flag").val(tag_id);
			    $("#tag_url_div_bt").show();

			      var scroll  = document.body.scrollTop;
			      var a =parseInt(10)+parseInt(scroll);
			      var b = a+'px';
			      
			      var c =parseInt(scroll);
			      var d = c+'px';

			    $("#taginfo_div").css("top",b);
			    $("#taginfo_div").animate({right:"0px"},500);
			    count=tag_subs;
			    t_name=tag_name;
			    id=tag_id;
			    event.cancelBubble = true;		
			         $("#no").click(
			         function(){
			           //$("#download_div").css("display","none");
					   $("#download_div").css("visibility","hidden");
			         });			
			    }});

			    //ywz 20130801
			    $("#tag_subs_div").click(function(){
			    	var tag_name=$("#tag_name_div").html();
			    	var tag_id=$("#tag_id_flag").val();
			    	window.open("listRegionData.action?tagId="+ tag_id +"&tagName="+encodeURI(encodeURI(tag_name))+"&regionId=","","height=350,width=500,top=200,left=400,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
			    	});		
			    
		
});
</script>
</body>
</html>
