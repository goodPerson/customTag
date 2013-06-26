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
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
</head>
<style>
* {
	font-family: "微软雅黑";
	font-size: 10pt;
}
html {
	height: 100%;
	overflow-x: hidden;
	overflow-y: auto;
}
body {
	height: 100%;
	width: 100%;
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
.tag_div {
	width: 70px;
	height:150px;
	float: left;
	margin: 5px;
	padding:0px;
	text-align: center;
	cursor:pointer;
}
.clear_div {
	clear: both;
}
.title_div {
	cursor: pointer;
	height: 40px;
	float: left;
	width:60px;
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
#taginfo_div{width:250px; height:100%;position:absolute; float:left; top:40px; right:-250px; bottom:0px; border-left:2px solid #E8E8E8; border-top:1px solid #E8E8E8; background:#FFF; z-index:99}
.taginfo_div_title{color:8d8f84;float:left; width:70px; margin-left:28px; margin-top:10px;}
.taginfo_div_item{color:#000;float:left; margin-top:10px;width:100px;}
#download_div{border-color:#000; border-style:solid;border-width:2px;
			background:#FFF; width:380px; height:150px;
			position:absolute;right:20px;z-index:100;
			display:none  }
#collapse{
  position: absolute;
  top:250px;
  right:240px;
  cursor:pointer
}
a {
	display: block;
	width: 80px;
	height: 28px;
	text-align: center;
	font-size: 10pt;
	line-height: 28px;
}
a:link {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
a:visited {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
a:hover {
	text-decoration: none;
	background: #03F;
	color: #FFF;
}
a:active {
	text-decoration: none;
	background: #000;
	color: #FFF;
}
</style>

<body id="maintag_body">
 <input type="hidden" id="req_user" value="<s:property value='#session.userId'/>"/>
  <input type="hidden" id="req_regionName" value="<s:property value='#session.regionName'/>"/>
<%--主要标签导航--%>
<div class="nav_bt_div" >
<div  class="img_div" ><img src="${url0}" width="40px" height="40px" /></div>
<div class="title_div">业务类</div>
</div>

<div class="nav_bt_div"  >
<div class="img_div"><img src="${url1}" width="40px" height="40px" /></div>
<div class="title_div">偏好类</div>
</div>

<div class="nav_bt_div" >
<div class="img_div"><img src="${url2}" width="40px" height="40px" /></div>
<div class="title_div" >事件类</div>
</div>

<div class="nav_bt_div" >
<div class="img_div"><img src="${url3}" width="40px" height="40px"  /></div>
<div class="title_div" >终端类</div>
</div>

<div class="nav_bt_div" >
<div class="img_div"><img src="${url4}" width="40px" height="40px"  /></div>
<div class="title_div" >身份类</div>
</div>

<div class="nav_bt_div" >
<div class="img_div"><img src="${url5}" width="40px" height="40px"  /></div>
<div class="title_div" >价值类</div>
</div>

<div class="nav_bt_div" >
<div class="img_div"><img src="${url6}" width="40px" height="40px"  /></div>
<div class="title_div">交往圈类</div>
</div>
<div class="nav_bt_div" >
<div class="img_div"><img src="${url7}" width="40px" height="40px"  /></div>
<div class="title_div">语音类</div>
</div>
<div class="nav_bt_div" >
<div class="img_div"><img src="${url8}" width="40px" height="40px"  /></div>
<div class="title_div">位置类</div>
</div>
<div class="clear_div"></div>
<div style=" width:100%;" class="line">&nbsp;</div>
<%--应用分类标签，主要包括生命周期和时间偏好--%>
<div id="main_tag">
<%--业务类--%>
  <s:if test="%{serv_type==0}"> 
  <div style="margin:10px; width:70px; height:70px"> <img id="serv_select_bt" src="${serv_name_src}" width="70" height="70" style="cursor:pointer; border:3px solid #FFF"> 
  
 <div  align="center"   style=" width:8px; height:8px;position:relative; top:-20px; float:left; right:-58px;color:1d75a5; font-weight:bold;"><img src="./img/maintag/jiahao.png" width="8" height="8"></div></div>
  <script> var old_tag_class="0";</script>
  <s:iterator  value="mainTagList"   var="tag"> 
  <script>
  var new_tag_class="${tag['tag_class']}"; 
  if(old_tag_class!=new_tag_class){
  var tag_class_div="<div class='clear_div'></div><div style='margin:5px;'>"+new_tag_class+"</div>"+
  "<div class='line' style='width:5%;background:#094AB2;'>&nbsp;</div>"+
  "<div class='line' style='width:95%;' >&nbsp;</div>"
  document.write(tag_class_div);
  old_tag_class=new_tag_class;
  }
   </script>
  <div style="margin:5px;">
    <div class="tag_div">
    <s:if test="%{#tag['tag_url']==null}" >
    <img src="./img/maintag/tag1.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'	 ,''${tag['tag_id']}',${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,'${tag['tag_id']}','${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">    
    </s:else>
    <s:property value="tag_name" /></div> 
  </div>
  </s:iterator> 
  </s:if>  
<%--业务结束--%> 
<%--偏好类--%>
  <s:if test="%{serv_type==1}"> 
  <script> var old_tag_class="0";</script>
  <s:iterator  value="mainTagList"   var="tag"> 
  <script>
  var new_tag_class="${tag['tag_serv_type']}"; 
  if(old_tag_class!=new_tag_class){
  var tag_class_div="<div class='clear_div'></div><div style='margin:5px;'>"+new_tag_class+"</div>"+
  "<div class='line' style='width:5%;background:#094AB2;'>&nbsp;</div>"+
  "<div class='line' style='width:95%;' >&nbsp;</div>"
  document.write(tag_class_div);
  old_tag_class=new_tag_class;
  }
   </script>
  <div style="margin:5px;">
    <div class="tag_div">
    <s:if test="%{#tag['tag_url']==null}" >
    <img src="./img/maintag/tag1.png" width="70" height="70"onClick="$.select_taginfo('${tag['tag_name']}'			 ,''${tag['tag_id']}',${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')" >
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,''${tag['tag_id']}',${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">    
    </s:else>
    <s:property value="tag_name" /></div>   
  </div>
  </s:iterator>   
  </s:if> 
<%--偏好类结束--%>
<%--事件类\客户类\终端类--%>
  <s:if test="%{serv_type==2 or serv_type==3 or serv_type==4 or serv_type==7  }"> 
  <script> var old_tag_class="0";</script>
  <s:iterator  value="mainTagList"   var="tag"> 
  <script>
  var new_tag_class="${tag['tag_serv_type']}"; 
  if(old_tag_class!=new_tag_class){
  var tag_class_div="<div class='clear_div'></div><div style='margin:5px;'>"+new_tag_class+"</div>"+
  "<div class='line' style='width:5%;background:#094AB2;'>&nbsp;</div>"+
  "<div class='line' style='width:95%;' >&nbsp;</div>"
  document.write(tag_class_div);
  old_tag_class=new_tag_class;
  }
   </script>
  <div style="margin:5px;">
    <div class="tag_div">
    <s:if test="%{#tag['tag_url']==null}" >
    <img src="./img/maintag/tag1.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,''${tag['tag_id']}',${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,'${tag['tag_id']}','${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">    
    </s:else>
    <s:property value="tag_name" /></div>   
  </div>
  </s:iterator>   
  
  </s:if> 
<%--事件类\客户类\终端类结束--%>
<%--价值类\交往圈--%>
  <s:if test="%{serv_type==5  or serv_type==6  or serv_type==8  }"> 
  <script> var old_tag_class="0";</script>
  <s:iterator  value="mainTagList"   var="tag"> 
  <script>
  var new_tag_class="${tag['tag_class']}"; 
  if(old_tag_class!=new_tag_class){
  var tag_class_div="<div class='clear_div'></div><div style='margin:5px;'>${tag['tag_type']}</div>"+
  "<div class='line' style='width:5%;background:#094AB2;'>&nbsp;</div>"+
  "<div class='line' style='width:95%;' >&nbsp;</div>"
  document.write(tag_class_div);
  old_tag_class=new_tag_class;
  }
   </script>
  <div style="margin:5px;">
    <div class="tag_div">
    <s:if test="%{#tag['tag_url']==null}" >
    <img src="./img/maintag/tag1.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,'${tag['tag_id']}','${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,''${tag['tag_id']}',${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">    
    </s:else>
    <s:property value="tag_name" /></div>   
  </div>
  </s:iterator> 
  </s:if> 
<%--价值类\交往圈结束--%>
<%--身份类--%>
  <s:if test="%{serv_type==9}"> 
  <div style="margin:5px; width:100%">身份类</div>
  <div class="line" style="width:5%;background:#094AB2;">&nbsp;</div>
  <div class="line" style="width:95%;" >&nbsp;</div>
  <div style="margin:5px;">
    <s:iterator  value="mainTagList"   var="tag">   
    <div class="tag_div">
    <s:if test="%{#tag['tag_url']==null}" >
    <img src="./img/maintag/tag1.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,''${tag['tag_id']}',${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,''${tag['tag_id']}',${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">    
    </s:else>
    <br><s:property value="tag_name" /></div> 
    </s:iterator> 
  </div>  
  
  </s:if> 
<%--身份类结束--%>
<%--价值类--%>
  <s:if test="%{serv_type==9}"> 
  <div style="margin:5px; width:100%">价值类</div>
  <div class="line" style="width:5%;background:#094AB2;">&nbsp;</div>
  <div class="line" style="width:95%;" >&nbsp;</div>
  <div style="margin:5px;">
    <s:iterator  value="mainTagList"   var="tag">   
    <div class="tag_div">
    <s:if test="%{#tag['tag_url']==null}" >
    <img src="./img/maintag/tag1.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,''${tag['tag_id']}',${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">
    </s:if>
    <s:else>
    <img src="./img/maintag/tag.png" width="70" height="70" onClick="$.select_taginfo('${tag['tag_name']}'			 ,''${tag['tag_id']}',${tag['profile']}','${tag['tag_statement']}','${tag['count_subs']}','${tag['tag_region']}','${tag['tag_creator']}','${tag['create_time']}','${tag['end_time']}','${tag['tag_url']}')">    
    </s:else>
    <br><s:property value="tag_name" /></div> 
    </s:iterator> 
  </div>  
  
  </s:if> 
<%--价值类结束--%>

<%--标签信息框--%>
<div id="taginfo_div">
<div><img src="./img/maintag/tag.png" width="70" height="70"></div>
<div style=" font-size:16pt"><img src="./img/maintag/jiantou2.png" width="11" height="14" style="margin-left:10px; margin-top:30px;">&nbsp;信息</div>
<div class="taginfo_div_title">标签名称</div>
<div class="taginfo_div_item" id="tag_name_div">测试</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">标签简介</div>
<div class="taginfo_div_item" id="tag_profile_div">标签简介标签简介标签简介标签简介</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">标签口径</div>
<div class="taginfo_div_item" id="tag_statement_div">测试</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">标签人数</div>
<div class="taginfo_div_item" id="tag_subs_div">测试</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">标签地市</div>
<div class="taginfo_div_item" id="tag_region_div">石家庄</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">创建人</div>
<div class="taginfo_div_item" id="tag_creator_div">郑声远</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">创建时间</div>
<div class="taginfo_div_item" id="tag_create_time_div">20130524</div>
<div style="clear:both"></div>
<div class="taginfo_div_title">结束时间</div>
<div class="taginfo_div_item" id="tag_end_time_div">20130525</div>
<div style="clear:both"></div>
<div class="taginfo_div_item" id="tag_url_div" align="center"><a id="tag_url_div_bt"   href="javascript:voi(0)" style="position:relative; left:60%"> 下载用户清单 </a> </div>
<div id="collapse"><img src="./img/right_menu1.png" width="7px"  height="10px" align="left"> </div>
</div>

<%--标签信息框结束--%>
</div>
<!--------------------------------------------------- 下载选择框----------------------------->
 <div id='download_div'>
<table width="100%" border="0" cellspacing="0" cellpadding="10" id="download_table">
  <tr>
    <td colspan="2" style="font-size:12pt;">下载信息</td>
    </tr>
<!--   <tr>
    <td colspan="2"> <label>地域&nbsp;&nbsp;:</label>&nbsp; <select id="down_region" class="easyui-combobox" name="state" style="width:286px;"></select></td>
  </tr>
 -->  
  <tr>
    <td colspan="2"> <label>导出字段&nbsp;&nbsp;:</label>
      <input name="电话号码" type="checkbox" value="PHONE_NO"  id="check">电话号码
      <input name="品牌" type="checkbox" value="E.BRAND_DESC"  id="check">品牌
      <input name="归属地市" type="checkbox" value="F.REGION_NAME"  id="check">归属地市
      <input name="归属县区" type="checkbox" value="B.REGION_NAME"  id="check">归属县区  <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input name="主体产品" type="checkbox" value="C.PRIVNAME"  id="check">主体产品
      <input name="创建渠道" type="checkbox" value="D.CHNL_NAME"  id="check">创建渠道
      <input name="上月总消费" type="checkbox" value="A.DUE_FEE"  id="check">上月总消费             
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
//窗口导航标志图片初始化
var userId=$("#req_user").val();	
var regionName=$("#req_regionName").val();
var count="";
var t_name="";
var id="";
	
	
	
//主窗口点击事件
$("#maintag_body").click(function(){
	var top=$(window.parent.document).find("#serv_div").css("top");
	if(top=="0px"){
 $(window.parent.document).find("#serv_div").animate({top:"-300px"},500)	
	}
/*	var right=$("#taginfo_div").css("right");
	if(right=="0px"){
	$("#taginfo_div").animate({right:"-250px"},500);
	}*/
});	

$("#taginfo_div").click(
function(){
   $("#taginfo_div").css("right","0px");  
});	
$("#collapse").click(
  function(){
  $("#taginfo_div").animate({right:"-250px"},500);
  });
	
//导航条单击事件
$(".nav_bt_div").click(function(){	
	$(".img_div img:eq(0)").attr("src","./img/maintag/serv2.png");
	$(".img_div img:eq(1)").attr("src","./img/maintag/like2.png");
	$(".img_div img:eq(2)").attr("src","./img/maintag/event2.png");
	$(".img_div img:eq(3)").attr("src","./img/maintag/terminal2.png");
	$(".img_div img:eq(4)").attr("src","./img/maintag/kehu2.png");
	$(".img_div img:eq(5)").attr("src","./img/maintag/jiazhi2.png");
    $(".img_div img:eq(6)").attr("src","./img/maintag/jiaowangq2.png");
	var nav_title=$.trim($(this).text());	

	if(nav_title=="业务类"){
		$(".img_div img:eq(0)").attr("src","./img/maintag/serv1.png");	
		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=0&serv_name=0");
    }else if(nav_title=="偏好类"){
		$(".img_div img:eq(1)").attr("src","./img/maintag/like1.png");
		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=1&serv_name=0");	
	}else if(nav_title=="事件类"){
		$(".img_div img:eq(2)").attr("src","./img/maintag/event1.png");	
		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=2&serv_name=0");		
	}else if(nav_title=="终端类"){
		$(".img_div img:eq(3)").attr("src","./img/maintag/terminal1.png");
		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=3&serv_name=0");		
	}else if(nav_title=="身份类"){
		$(".img_div img:eq(4)").attr("src","./img/maintag/kehu1.png");
		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=4&serv_name=0");		
	}else if(nav_title=="价值类"){
		$(".img_div img:eq(5)").attr("src","./img/maintag/jiazhi1.png");
		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=5&serv_name=0");		
	}else if(nav_title=="交往圈类"){
		$(".img_div img:eq(6)").attr("src","./img/maintag/jiaowangq1.png");		
		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=6&serv_name=0");		
	}
	else if(nav_title=="语音类"){
		$(".img_div img:eq(7)").attr("src","./img/maintag/yuyinlan.png");		
		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=7&serv_name=0");		
	}
	else if(nav_title=="位置类"){
		$(".img_div img:eq(8)").attr("src","./img/maintag/taocanlan.png");		
		$(window.parent.document).find("#iframe").attr("src","initMainTagAction.action?serv_type=8&serv_name=0");		
	}
    event.stopPropagation();	

});

//业务选择按钮
$("#serv_select_bt").click(function(){
 
 $(window.parent.document).find("#serv_div").animate({top:"0px"},500);	
 event.stopPropagation();
});

//标签按钮覆盖事件
$(".tag_div img").hover(
function(){$(this).css("border","1px solid #666")},
function(){
	$(this).css("border","");
	$(this).css("border","1px solid #FFF");}
);
 $("#tag_url_div_bt").click(
     function(){
     /*if(count==0){
     alert("标签暂未生成！");
     $("#taginfo_div").animate({right:"-250px"},500);
     }else{*/
       $("#download_div").css("display","block");
 //    }
     }); 
     $("#yes").click(
     function(){
       var str="";
       var col_name="";
//       sql =encodeURI(tag_sql);
          $("#download_table tr:eq(1)").find("input").each(function(){
          str_index=this.value;
          name=this.name;
           if($(this).attr("checked")) {
              str+= str_index+",";
              col_name+=name+"	";
              }
              
          });
       //   alert(str);
       //   alert(col_name);
       $("#taginfo_div").animate({right:"0px"},500);
       $("#download_div").css("display","none");
           $.ajax({
    		type: 'POST',
    		url: 'downaddinfo.action',
    		data:{tag_name:t_name,count:count,sql:"*****",id:id,col:str,col_desc:col_name,type:"tag_list",region_name:regionName},
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
//业务选择变化
$("#serv_select_bt").hover(
function(){$(this).css("border","3px solid  #CCCCCC ")},
function(){
	$(this).css("border","3px solid #FFF");
}
);
//标签详细说明
$.extend({'select_taginfo':function(tag_name,tag_id,tag_pro,tag_stment,tag_subs,tag_region,tag_creator,tag_time1,tag_time2,tag_url){
$("#tag_name_div").text(tag_name);	
$("#tag_profile_div").text(tag_pro);	
$("#tag_statement_div").text(tag_stment);	
$("#tag_subs_div").text(tag_subs);	
$("#tag_region_div").text(tag_region);	
$("#tag_creator_div").text(tag_creator);	
$("#tag_create_time_div").text(tag_time1);	
$("#taginfo_div_title").text(tag_time2);
//var url =$("#tag_url_div_bt").attr("href");

/*if(tag_url==""){
	$("#tag_url_div_bt").hide();
}
else{*/
	$("#tag_url_div_bt").show();
//$("#tag_url_div_bt").attr("href",url+tag_url);
//}


  var scroll  = document.body.scrollTop;
  var a =parseInt(40)+parseInt(scroll);
  var b = a+'px';
  var c =parseInt(460)+parseInt(scroll);
  var d = c+'px';
$("#download_div").css("top",d);  
$("#taginfo_div").css("top",b);
$("#taginfo_div").animate({right:"0px"},500);
//event.stopPropagation();	
count=tag_subs;
t_name=tag_name;
id=tag_id;
event.cancelBubble = true;		
//alert(name);
     $("#no").click(
     function(){
       $("#download_div").css("display","none");
       $("#taginfo_div").animate({right:"-250px"},500);
     });
			
	}});
//end
});
</script>
</body>
</html>
