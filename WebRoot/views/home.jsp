<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户标签Home</title>

<link rel="stylesheet" type="text/css" href="<%=path %>/css/home.css"> 
<script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.min.js"></script>
<style>
body {
	height: 100%;
	width: 100%;
	font-family: "微软雅黑";
	font-size: 10pt;
	margin: 0px;
	background-color:#E5ECF2;
	overflow-x : hidden;   
	overflow-y : hidden;  
    text-align:center; 
}
#iframe_p{
	position:relative;
	top:auto;
	margin:0px auto;
	/*width:1024px;*/
	height:1024px;
	/*background-color:#093;*/
	}	
	
	
	
</style>
</head>

<body>
<!--top begin-->
<div id="top" align="center"  >
    <div style="width:1024px;">
        <div id="logo"></div>
        <div id="sysName">客户标签系统</div>        
        <div id="menu">
      		  <s:property value='#session.userName'/>
      		  ，您好！   
      		  <!-- 
      		<s:iterator value="listCycle"  id="lcyle"   status="l">
      					<s:if test='%{dateType=="日"}'>
      					 		日周期为：
      					 </s:if>
      					 <s:else>
      					 		月周期为：
      					 </s:else>
      					 <s:property value="dateValue"/>      		
      		</s:iterator>
      		-->
        </div>
    </div>
</div>
<!--top end-->

<!--navi begin-->
<div id="navi_extends">
    <div id="navi">
        <div id="navis">	
            <s:if test='%{#session.right.indexOf("areaOrder")>=0}'>
            <div id="index" class="navi_menu_normal">首页</div>
            </s:if>
            <s:if test='%{#session.right.indexOf("initMainTagAction")>=0}'>
            <div id="index_tag_mange" class="navi_menu_normal">标签管理</div>
            </s:if>
            <s:if test='%{#session.right.indexOf("getAttrListAction")>=0}'>
            <div id="index_pro_mange" class="navi_menu_normal">属性管理</div>
            </s:if>
            <s:if test='%{#session.right.indexOf("TaginfoAction")>=0}'>
            <div id="index_group_mange" class="navi_menu_normal">群管理</div>
            </s:if>
            <s:if test='%{#session.right.indexOf("mainMethod")>=0}'>
            <div id="index_tag_count" class="navi_menu_normal">标签统计</div>
            </s:if>
            <s:if test='%{#session.right.indexOf("querydown")>=0}'>
            <div id="index_down_mange" class="navi_menu_normal">下载管理</div>
            </s:if>
            <s:if test='%{#session.right.indexOf("marRetlist")>=0}'>
            <div id="index_push_plan" class="navi_menu_normal">营销活动</div> 
            </s:if>
            <s:if test='%{#session.right.indexOf("onlineHelp")>=0}'>
            <div id="index_online_mange" class="navi_menu_normal">在线帮助</div>
            </s:if>
        </div>
    </div>
</div>
<!--navi end-->

<!--
<div id="nav_mage">

</div>
-->




<div id="iframe_p">
	<!--标签管理-->
	<div id="tag_mage">
		<div style="height:9px;"></div>
		<s:if test='%{#session.right.indexOf("initMainTagAction")>=0}'>
		<div id="create_apply" class="tag_mage_content">标&nbsp;签&nbsp;库</div>
		</s:if>
		<s:if test='%{#session.right.indexOf("myTagAction")>=0}'>
		<div id="my_tag" class="tag_mage_content">我&nbsp;的&nbsp;标&nbsp;签</div>
		</s:if>	
		<s:if test='%{#session.right.indexOf("access")>=0}'>
		<div id="hangdled_tag" class="tag_mage_content">标签/属性申请</div>
		</s:if>
		<s:if test='%{#session.right.indexOf("listtTgApproAction")>=0}'>
		<div id="pending_tag" class="tag_mage_content">标&nbsp;签&nbsp;审&nbsp;批</div>
		</s:if>	
	</div>
	
	<!--群管理-->
	<div id="group_mage" >
		<div style="height:9px;"></div>
		<s:if test='%{#session.right.indexOf("TaginfoAction")>=0}'>
		<div id="group_order" class="tag_mage_content">我&nbsp;的&nbsp;群</div>
		</s:if>
		<s:if test='%{#session.right.indexOf("TaginfoAction")>=0}'>
		<div id="group_mage_c" class="tag_mage_content">共&nbsp;享&nbsp;群</div>
		</s:if>
		<s:if test='%{#session.right.indexOf("initAttrTagAction")>=0}'>
		<div id="group_mage_d" class="tag_mage_content">创&nbsp;建&nbsp;群</div>
		</s:if>
	</div>
	<!--标签统计-->
	<div id="tag_count" >
		<div style="height:9px;"></div>	
		<s:if test='%{#session.right.indexOf("mainMethod")>=0}'>
		<div id="tag_count_circl" class="tag_mage_content">地&nbsp;市&nbsp;统&nbsp;计</div>	
		</s:if>
		<div id="tag_count_county" class="tag_mage_content">区&nbsp;县&nbsp;统&nbsp;计</div>
		<s:if test='%{#session.right.indexOf("getConutTag_tagsub")>=0}'>
		<div id="tag_count_detail" class="tag_mage_content">明&nbsp;细&nbsp;统&nbsp;计</div>
		</s:if>
		
	</div>
	 <div id="push_mage" >
	        <div style="height:9px;"></div>	        
	        <s:if test='%{#session.right.indexOf("plan_create")>=0}'>
	        <div id="create_plan" class="tag_mage_content">活&nbsp;动&nbsp;创&nbsp;建</div>
	        </s:if>	        
	        <s:if test='%{#session.right.indexOf("marRetlist")>=0}'>
	        <div id="plan_list" class="tag_mage_content">活&nbsp;动&nbsp;列&nbsp;表</div>
	        </s:if>
              </div>
	<!--navi_menu end-->
	<iframe  id="iframe" name="ifrmname" frameborder="0" style="border:0px; margin-bottom:0px;" scrolling="auto" width="100%"  align="middle"  ></iframe>
</div>




		<script type="text/javascript">
		$(function(){
			var userId="<%=session.getAttribute("userId") %>";
			var userName="<%=session.getAttribute("userName")%>";
			var regionId="<%=session.getAttribute("regionId") %>";
			var regionName="<%=session.getAttribute("regionName")%>";
			
			var index_tag_mange=$("#index_tag_mange");
			var index_group_mange=$("#index_group_mange");
			var index_pro_mange=$("#index_pro_mange");
			var index_tag_count=$("#index_tag_count");
			
			var bodyheight=$(document.body).height()-86;
			$("#iframe").css("height",bodyheight+"px");
			
			$("#iframe").attr("src","<s:property value='url'/>");
			$("#index").click(function() {
				$("#index").css("color", "#000");
				$("#index").addClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src", "areaOrder.action");
			});
			/*
			$("#index_tag_mange").mouseenter(function() {
				var offset = index_tag_mange.offset();
				$("#tag_mage").css({
					"visibility": "visible",
					"position": "absolute",
					"left": offset.left + "px"
				});
			});
			*/
			$("#index_tag_mange").mouseenter(function() {
				var offset = index_tag_mange.offset();
				$("#tag_mage").css({
					"visibility": "visible",
					"position": "absolute",
					"left": offset.left + "px"
				});
				$("#group_mage").css("visibility","hidden");
				$("#push_mage").css("visibility","hidden");
				$("#tag_count").css("visibility","hidden");
			});
			
			
			
			$("#push_mage").mouseleave(function() {
			   $("#push_mage").css("visibility", "hidden");
			});

			$("#tag_mage").mouseleave(function() {
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#attr_mage").css("visibility", "hidden");
			});
			$("#index_tag_mange").click(function() {
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#nav_mage").css("visibility", "visible");
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src", "initMainTagAction.action?serv_type=0&serv_name=0&serv_name_src=img/maintag/duanxin.png&tag_name=");
			});
			$("#property_mage").mouseleave(function() {
				$("#index_pro_mange").css("color", "#FFF");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
			});
			
			$("#index_push_plan").mouseenter(function() {
				var offset1 = $("#index_push_plan").offset();
				$("#push_mage").css({
					"visibility": "visible",
					"position": "absolute",
					"left": offset1.left + "px"
				});
				$("#tag_mage").css("visibility","hidden");
				$("#group_mage").css("visibility","hidden");
				$("#tag_count").css("visibility","hidden");
			});
			
			$(".tag_mage_content").mouseenter(function(){
			    $(this).css("color","#73B2E1");
			});
			
			$(".tag_mage_content").mouseleave(function() {
				$(this).css("color", "#666");
			});
			$("#index_pro_mange").click(function() {
				$("#index_pro_mange").css("color", "#000");
				$("#index_pro_mange").addClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#property_mage").css("visibility", "visible");
				$("#tag_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src", "getAttrListAction.action");
			});
			
			$("#index_push_plan").click(function() {
				$("#index_push_plan").css("color", "#000");
				$("#index_push_plan").addClass("navi_menu_heightLight");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#property_mage").css("visibility", "visible");
				$("#tag_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src","<%=basePath%>push/plan_create.jsp");
			});
			/*	
			$("#index_group_mange").mouseenter(function() {
				var offset1 = index_group_mange.offset();
				$("#group_mage").css({
					"visibility": "visible",
					"position": "absolute",
					"left": offset1.left + "px"
				});
			});
			*/
			$("#index_group_mange").mouseenter(function() {
				var offset1 = index_group_mange.offset();
				$("#group_mage").css({
					"visibility": "visible",
					"position": "absolute",
					"left": offset1.left + "px"
				});
				$("#tag_mage").css("visibility","hidden");
				$("#push_mage").css("visibility","hidden");
				$("#tag_count").css("visibility","hidden");
			});
			
			$("#index_push_plan").mouseenter(function() {
				var offset1 = $("#index_push_plan").offset();
				$("#push_mage").css({
					"visibility": "visible",
					"position": "absolute",
					"left": offset1.left + "px"
				});
			});
            /*
			$("#index_pro_mange").mouseenter(function() {
				var offset1 = index_pro_mange.offset();
				$("#attr_mage").css({
					"visibility": "visible",
					"position": "absolute",
					"left": offset1.left + "px"
				});
			});
            */

			$("#attr_request").click(function() {
				$("#index_group_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_pro_mange").addClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#000");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#attr_mage").css("visibility", "visible");
				$("#group_mage").css("visibility", "hidden");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#iframe").attr("src", "attrRequestForm_attr.action" );
			});
			$("#attr_request").mouseenter(function() {
				$("#attr_request").css("color", "#73B2E1");
			});
			$("#attr_request").mouseleave(function() {
				$("#attr_request").css("color", "#666");
			});

			$("#attr_list").click(function() {
				$("#index_group_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").addClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#000");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#attr_mage").css("visibility", "visible");
				$("#group_mage").css("visibility", "hidden");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#iframe").attr("src", "attrList_attr.action?attrType=1" );
		        $("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
			});
			$("#attr_list").mouseenter(function() {
				$("#attr_list").css("color", "#73B2E1");
			});
			$("#attr_list").mouseleave(function() {
				$("#attr_list").css("color", "#666");
			});


			$("#attr_approval").click(function() {
				$("#index_group_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").addClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#000");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#attr_mage").css("visibility", "visible");
				$("#group_mage").css("visibility", "hidden");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#iframe").attr("src", "attrWaitList_attr.action?attrType=0" );
			});
			$("#attr_approval").mouseenter(function() {
				$("#attr_approval").css("color", "#73B2E1");
			});
			$("#attr_approval").mouseleave(function() {
				$("#attr_approval").css("color", "#666");
			});

			$("#attr_mage").mouseleave(function() {
				$("#attr_mage").css("visibility", "hidden");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
			});

			$("#group_mage").mouseleave(function() {
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#attr_mage").css("visibility", "hidden");
			});
			$("#index_group_mange").click(function() {
				$("#index_group_mange").css("color", "#000");
				$("#index_group_mange").addClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#group_mage").css("visibility", "visible");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src", "TaginfoAction.action?userId=" + userId + "&regionId=" + regionId + "&userName=" + userName + "&regionName=" + regionName);
			});
			
			$("#index_down_mange").click(function() {
				$("#index_down_mange").css("color", "#000");
				$("#index_down_mange").addClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src", "querydown.action?userId=" + userId);
			});
			
			$("#index_tag_count").click(function() {
				$("#index_tag_count").css("color", "#000");
				$("#index_tag_count").addClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src", "mainMethod.action");
			});
			
			$("#index_tag_count").mouseenter(function(){
				var offset = index_tag_count.offset();
				$("#tag_count").css({
					"visibility": "visible",
					"position": "absolute",
					"left": offset.left + "px"
				});
				$("#tag_mage").css("visibility","hidden");
				$("#push_mage").css("visibility","hidden");
				$("#group_mage").css("visibility","hidden");
			});
			$("#tag_count").mouseleave(function(){
				$("#tag_count").css("visibility","hidden");
			});
			
			$("#tag_count_circl").click(function(){
				$("#index_tag_count").css("color", "#000");
				$("#index_tag_count").addClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src", "mainMethod.action");
			});
			
			$("#tag_count_detail").click(function(){
				$("#index_tag_count").css("color", "#000");
				$("#index_tag_count").addClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src", "getConutTag_tagsub.action");
			});

				$("#tag_count_county").click(function(){
				$("#index_tag_count").css("color", "#000");
				$("#index_tag_count").addClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#iframe").attr("src", "countyMethod.action");
			});
			
			$("#index_log_mange").mouseenter(function(){
				$("#index_log_mange").css("color","#000");
				$("#index_log_mange").addClass("navi_menu_heightLight");
				$("#tag_mage").css("visibility","hidden");
				$("#property_mage").css("visibility","hidden");
				$("#group_mage").css("visibility","hidden");
					});
			$("#index_log_mange").click(function(){
				$("#iframe").attr("src","findOperateLog.action?userName=&regionName=&columnName=&operateType=&operateName=&userId="+userId);
					});
			$("#index_online_mange").click(function() {
				$("#index_online_mange").css("color", "#000");
				$("#index_online_mange").addClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_active_push").css("color", "#FFF");
				$("#index_active_push").removeClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#iframe").attr("src", "onlineHelp.action");
			});

			$("#index_active_push").click(function() {
				$("#index_active_push").css("color", "#000");
				$("#index_active_push").addClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#iframe").attr("src", "");
			});			
			
			$("#create_apply").click(function() {
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#nav_mage").css("visibility", "visible");
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#iframe").attr("src", "initMainTagAction.action?serv_type=0&serv_name=0&serv_name_src=img/maintag/duanxin.png&tag_name=");
			});
			$("#create_apply").mouseenter(function() {
				$("#create_apply").css("color", "#73B2E1");
			});
			$("#create_apply").mouseleave(function() {
						$("#create_apply").css("color", "#666");
			});
			$("#hangdled_tag").click(function() {
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#nav_mage").css("visibility", "visible");
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#iframe").attr("src", "access.action");
			});
			$("#create_plan").click(function(){
			    $("#index_push_plan").css("color", "#000");
				$("#index_push_plan").addClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#group_mage").css("visibility", "hidden");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#iframe").attr("src", "<%=basePath%>push/plan_create.jsp");
			
			});
			
			$("#plan_list").click(function(){
			    $("#index_push_plan").css("color", "#000");
				$("#index_push_plan").addClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#group_mage").css("visibility", "hidden");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#iframe").attr("src", "<%=basePath%>push/marketlist.jsp");
			
			});
			
			$("#my_tag").mouseenter(function() {
				$("#my_tag").css("color", "#73B2E1");
			});
			$("#my_tag").mouseleave(function() {
						$("#my_tag").css("color", "#666");
			});
			$("#my_tag").click(function() {
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#nav_mage").css("visibility", "visible");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#iframe").attr("src", "myTagAction.action?userId=" + userId);
			});
			
			$("#hangdled_tag").mouseenter(function() {
				$("#hangdled_tag").css("color", "#73B2E1");
			});
			$("#hangdled_tag").mouseleave(function() {
						$("#hangdled_tag").css("color", "#666");
			});
			$("#pending_tag").click(function() {
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_group_mange").removeClass("navi_menu_heightLight");
				$("#index_group_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#property_mage").css("visibility", "hidden");
				$("#group_mage").css("visibility", "hidden");
				$("#nav_mage").css("visibility", "visible");
				$("#index_tag_mange").css("color", "#000");
				$("#index_tag_mange").addClass("navi_menu_heightLight");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#iframe").attr("src", "listtTgApproAction.action?jspmes=0&userId=" + userId);
			});
			$("#pending_tag").mouseenter(function() {
				$("#pending_tag").css("color", "#73B2E1");
			});
			$("#pending_tag").mouseleave(function() {
						$("#pending_tag").css("color", "#666");
			});
			/*标签统计*/
			$("#counts_tag").mouseenter(function() {
				$("#counts_tag").css("color", "#73B2E1");
			});
			$("#counts_tag").mouseleave(function() {
				$("#counts_tag").css("color", "#666");
			});
				
			$("#group_order").click(function() {
				$("#index_group_mange").css("color", "#000");
				$("#index_group_mange").addClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#group_mage").css("visibility", "visible");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#iframe").attr("src", "TaginfoAction.action?userId=" + userId + "&regionId=" + regionId + "&userName=" + userName + "&regionName=" + regionName);
			});
			$("#group_order").mouseenter(function() {
						$("#group_order").css("color", "#73B2E1");
			});
			$("#group_order").mouseleave(function() {
				$("#group_order").css("color", "#666");
			});
				
			
			$("#group_mage_c").click(function() {
				$("#index_group_mange").css("color", "#000");
				$("#index_group_mange").addClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#group_mage").css("visibility", "visible");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#iframe").attr("src", "TaginfoAction.action?custom_type=" + encodeURI(encodeURI(0)));
			});
			$("#group_mage_c").mouseenter(function() {
				$("#group_mage_c").css("color", "#73B2E1");
			});
			$("#group_mage_c").mouseleave(function() {
				$("#group_mage_c").css("color", "#666");
			});
			$("#group_mage_d").click(function() {
				$("#index_group_mange").css("color", "#000");
				$("#index_group_mange").addClass("navi_menu_heightLight");
				$("#index_tag_mange").css("color", "#FFF");
				$("#index_tag_mange").removeClass("navi_menu_heightLight");
				$("#index").removeClass("navi_menu_heightLight");
				$("#index").css("color", "#FFF");
				$("#index_pro_mange").removeClass("navi_menu_heightLight");
				$("#index_pro_mange").css("color", "#FFF");
				$("#index_down_mange").removeClass("navi_menu_heightLight");
				$("#index_down_mange").css("color", "#FFF");
				$("#index_online_mange").removeClass("navi_menu_heightLight");
				$("#index_online_mange").css("color", "#FFF");
				$("#index_tag_count").css("color", "#FFF");
				$("#index_tag_count").removeClass("navi_menu_heightLight");
				$("#group_mage").css("visibility", "visible");
				$("#tag_mage").css("visibility", "hidden");
				$("#property_mage").css("visibility", "hidden");
				$("#index_push_plan").removeClass("navi_menu_heightLight");
				$("#index_push_plan").css("color", "#FFF");
				$("#iframe").attr("src", "initAttrTagAction.action?title_name=" + "" + "&id=" + "" + "&userId=" + "<s:property value='#session.userId'/>" + "&regionId=" + "<s:property value='#session.regionId'/>" + "&href=&tag_introduce=&create_tag_date=&end_tag_date=&cityName=&countyName=&userState=&count=");
			});
			$("#group_mage_d").mouseenter(function() {
				$("#group_mage_d").css("color", "#73B2E1");
			});
			$("#group_mage_d").mouseleave(function() {
				$("#group_mage_d").css("color", "#666");
			});
			
		})
		</script>


</body>
</html>

