<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>属性申请</title>
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
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>
</head>
<style>
html{
	overflow-x: hidden;
	overflow-y: auto;
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
a {
	display: block;
	width: 80px;
	height: 28px;
	text-align: center;
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
#create_tag_date {
	height: 25px;
	width: 170px;
}
#end_tag_date {
	height: 25px;
	width: 170px;
}
#taginfo_table tr {
	cursor: pointer;
}
.title_td {
	color: #000;
	height: 20px;
	font-size:20pt;
}
#attr_div1 {
	background: #FFF;
	width: 200px;
	position: relative;
	left: 5px;
	top: 8px;
}
ul {
	list-style-type: none;
margin:0px padding:0px;
}
li {
	float: left;
	margin-left: 10px;
	height: 23px;
	line-height: 23px;
}
.attr_title {
	font: bold;
	cursor: pointer;
}
.attr_table {
	background: "";
}
.attr_item ul li{
	float:left;
	display:block;
	width:60px;
	margin-left:5px;	
}
.attr_item {
	font: 9pt;
	cursor: pointer;
}
.attr_tr {
	display: none; padding-left:5px;
}
#attr_table_edit {
	border: solid 1px #CCC;
	width: 80%;
	border-collapse: collapse;
}
#attr_edit_div {
	border-color: #000;
	border-style: solid;
	border-width: 2px;
	background: #FFF;
	width: 500px;
	height: 500px;
	position: absolute;
	top: 8px;
	left: 210px;
	display: none;
}
#consit{
  cursor: pointer;
}
#del{
  cursor: pointer;
}
#atti_con{
  visibility:hidden;
}
#atti_con1{ display:none;

}
#atti_con2{
  display:none;
}
#atti_con3{
  display:none;
}
#create_div {
	border-color: #000;
	border-style: solid;
	border-width: 2px;
	background: #FFF;
	width: 500px;
	height: 500px;
	position: absolute;
	top: 15px;
	left: 210px;
	display: none;
}
.bigClass{
	margin-right:20px;
	float:right;
	}
.blue_button{
	background-color:#094AB2;
	width:80px;
	height:20px;
	line-height:20px;
	color:#FFF;
	padding:5px;
	text-align:center;
	cursor:pointer;
}
.attr_title_div {
	float: left;
	line-height:30px; 
	text-align:left;
}
.attr_item_div {
	float: left;
	width: 60px;
	height: 22px; 
	cursor: pointer;
	text-align:left; color:#666;
	
}
#wait_div{
 background:#666; margin:0;
  width: 100%;  
  height:100%;
  position: absolute; 
  opacity:0.1; 
  z-index: 1;  
  display:none;} 
.attr_item_title_div{position: relative;left: 5px;top: 12px; height:30px;width:200px;cursor: pointer;}
.load_div {
	border-color: #000;
	border-style: solid;
	border-width: 2px;
	background: #FFF;
	width: 380px;
	height: 50px;
	position: relative;
	top: 40%;
	left: 40%;
	z-index: 2;
	display:none;
}
.span1{
width:60px;
padding:5px 5px 0px 5px;
}
#chartTable_one{
	text-align:center;
	margin:0px auto;
	width:1024px;
	}
.class_td{
	font-size:14px;
	height:40px;
}	
.input {
　width:120px;
　height:25px;
　line-height:20px}
</style>

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
	  <form id="formrequest" method="post" action="addAttrRequest_attr.action" onSubmit="return checkTrim();">
<table width="100%"  border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="100%"  align="right" valign="top">
			<table  id="chartTable" width="100%"  border="0" cellspacing="0" cellpadding="0">
				<tr>
					
					<!-- 标签申请
					================================================== -->
					
					<td width="1166"   valign="top" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td colspan="4"  id="tag_name" class="title_td" align="center">属性申请单</td>
						</tr>
						<tr>
							<td width="12%" valign="top" style="padding-top:10px;" class="class_td">属性名称：</td>
							<td colspan="3" valign="middle" >
								<input type="text" name="attrname" id="attrname" class="messager-input" size="35" />
								<input type="hidden" name="req_reson" value="<s:property value='#session.userName'/>"/>
								<span style="color:#FF0000; margin-left:10px">*</span>
							</td>
						</tr>
						<tr>
							<td  height="20px" class="class_td" >申请理由：</td>
							<td colspan="3">
								<textarea id="requestreson" name="requestreson" cols="60" rows="4"></textarea>
							<span style="color:#FF0000; margin-left:10px">*</span></td>
						</tr>
						<tr>
							<td class="class_td" >审批人：</td>
							<td colspan="3">
							<select id="verifier" name="verifier"  class="easyui-combobox" style="width:120px; height:25px" ></select>	<span style="color:#FF0000; margin-left:10px">*</span>
						</td>
					</tr>
					<tr>
						<td class="class_td" >备注：</td>
						<td colspan="3">
							<textarea id="remark" name="remark" cols="40" rows="4"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="height:40px; text-align:center" >
							<input type="submit" class="class_td" style=" width:80px;height:28px;font-family:'微软雅黑';background: #094AB2;  color:#FFF; line-height:28px;overflow:hidden; border:0px; font-size:16px;" value="提交申请"/>
							
						</td>
					</tr>
				</table>
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
   if ($("#attrname").val()==""){
    		alert("属性名称不能为空！");
    		$("#attrname").focus();
    		return false;
    }
    if ($("#requestreson").val()==""){
    		alert("申请理由不能为空！");
    		$("#requestreson").focus();
    		return false;
    }
   
 var verifier=$("#verifier").combobox("getValue");
  if (verifier=="") {
       		alert("审批人不能为空！");
       		$("#verifier").focus();
    		return false;
   }
   return true;
}
$(function() {
	//获取城市名称
	var verifier = $("#verifier").combobox("getValue");
	if (verifier == "") {
		$("#verifier").combobox("setValue", "-请选择-");
	}

	$("#verifier").combobox({
		url: 'getApproName_action.action',
		editable: true,
		valueField: 'id',
		textField: 'text',
		panelHight: 'auto',
		panelWidth: 100,
		editable: true,
		onSelect: function() {

		}
	});
});
</script>

</html>
