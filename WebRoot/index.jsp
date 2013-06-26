<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="struts" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <link rel="Shortcut Icon" href="<%=basePath%>/img/maintag/favicon.ico" /> 
  <base href="<%=basePath%>">
  <title>客户标签系统</title>
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
  <style type="text/css"></style>
  </head>
  <style>
* {
	font-family: "微软雅黑";
	font-size: 10pt;
}
html {
	height: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
}
body {
	height: 100%;
	width: 100%;
	margin: 0px;
	overflow-x: hidden;
	overflow-y: hidden;
}
#main_table {
	width: 100%;
	height: 100%;
	border: 0;
}
#navigation_bar {
	background: #094AB2;
	height: 40px;
	width: 100%;
	border: 0;
	cellspacing: 0;
	cellpadding: 0;
}
#navigation_bar td {
	color: #FFF;
	align: left;
	valign: middle;
}
#create_td {
	width: 88px;
	cursor: pointer;
}
#open_td {
	width: 88px;
	cursor: pointer;
}
#shared_td {
	width: 88px;
	cursor: pointer;
}
#manage_td {
	width: 88px;
	cursor: pointer;
}
.create_td_move {
	background: #09409b;
}
#logo_td {
	width: 180px;
}
#option_td img {
	padding-left: 10px;
}
#search_td {
	height: 30px;
	align: center;
	valign: middle;
	width: 120px;
}
#search_td div {
	border-color: #CCC;
	border-style: solid;
	border-width: 1px;
	height: 28px;
	background: #FFF;
}
#search_td input {
	width: 80px;
	height: 20px;
	border-width: 0px;
}
#left_menu_table {
	background: #F3F3F3;
	color: #000;
	valign: top;
	width: 120px;
/*	position: absolute;*/
	left:0px;
	height: 100%;
}
/*#iframe{
   position: absolute;
   top:40px;
   left:120px;
   width:91%;
}*/
#left_menu_table tr {
	cursor: pointer;
}
#create_div {
	border-color: #000;
	border-style: solid;
	border-width: 2px;
	background: #FFF;
	width: 380px;
	height: 250px;
	position: absolute;
	top: 45px;
	left: 50px;
	z-index: 2;
	visibility: hidden
}
#manage_div {
	border-color: #000;
	border-style: solid;
	border-width: 2px;
	background: #FFF;
	width: 100px;
	height: 130px;
	position: absolute;
	top: 40px;
	left: 465px;
	visibility: hidden
}
#manage_div table {
	font-size: 10pt;
	color: #000000;
	font-family: "微软雅黑";
}
#create_tag_date {
	z-index: 2;
}
#gray {
	background: #77887E;
	height: 100%;
	left: 0%;
	right: 0%;
	width: 100%;
	position: absolute;
	z-index: 1;
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
#create_tag_date {
	height: 25px;
	width: 170px;
}
#end_tag_date {
	height: 25px;
	width: 170px;
}
.line {
	height: 2px;
	font-size: 0px;
	background:#FFF;
	margin: 0px;
	padding: 0px;
	line-height: 2px;
	float: left;
	width:100%;
}
.title_div {
	float: left;
	line-height: 40px; margin-right:5px;
	 
}
.img_div{
		float: left;
	    line-height: 40px;
}
.block {
	width: 0px;
	height: 100%;
}
#serv_div{ float:left; width:100%; background:#1d1d1d; display:black; top:-300px; left:0px; position:absolute; padding:25px; }
.serv_img_div{ float:left; width:70px;color:#FFF;text-align: center; margin:2px; border:3px solid #1d1d1d; cursor:pointer;
}
#collapse{
  position: absolute;
  top:300px;
  left:110px
}
#appear{
 position: absolute;
 top:300px;
 left:0px;
 display:none;
}
</style>

<body id="index_body">
<div id="gray" style="display: none" ></div>
<table id="main_table" cellspacing="0" cellpadding="0"  border="0">
    <tr>
    <td colspan="2"  height="40px;" ><!-- 导航条
    ================================================== -->
        
        <table id="navigation_bar"   >
        <tr id="tr">
            <td id="logo_td" style="font-size:14pt
            ; font-weight:bold"  >&nbsp;&nbsp;<img src="img/maintag/LOGO.png" width="40" height="40" align="absmiddle">&nbsp;客户标签系统</td>


            <td id="option_td" align="right" style="font-weight:bold" > 您好,<s:property value='#session.userName'/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="./img/user.png" align="absmiddle"/></td>
          </tr>
      </table>
        
        <!-- END导航条
    ================================================== --></td>
  </tr>
    <tr>
    <td valign="top" width="120px" id="test" ><!-- 左侧菜单
    ================================================== -->
        
        <table id="left_menu_table" width="120px"  height="100%"  border="0"  cellpadding="5">
        <tr>
          <td id="search_td"><div>
                <input type="text"/>
                <img src="./img/search.png" width="16px"  height="16px" align="absmiddle"> </div></td>
          </tr>
        <tr style="background:#d4d4d4">
             <td>标&nbsp;签&nbsp;地&nbsp;图</td>
          </tr>
        <tr>
            <td>标&nbsp;签&nbsp;管&nbsp;理</td>
          </tr>
        <tr>
            <td>属&nbsp;性&nbsp;管&nbsp;理</td>
          </tr>
        <tr>
            <td>客&nbsp;户&nbsp;分&nbsp;群</td>
          </tr>
          <tr>
            <td>下&nbsp;载&nbsp;管&nbsp;理</td>
          </tr>
          <tr>
            <td>日&nbsp;志&nbsp;管&nbsp;理</td>
          </tr>
           <tr>
           <td></td>
           </tr>
          <tr>
      		<td>
      		<label id="tag_title"  style="padding-right:20px;display:none" >标准标签</label>
      		</td>
      		</tr> 
          <tr>
            <td>
          <div id="collapse"><img src="./img/left.png" width="5px"  height="12px" align="right"> </div>
            </td>   
          </tr>
        <tr>
            <td height="100%" width="100%" ></td>
          </tr>
      </table>
        
        <!-- END左侧菜单
    ================================================== --></td>
    <td height="100%" width="100%" valign="top" align="left"><table width="100%"  height="100%" border="0" cellspacing="0" cellpadding="0">
        <!-- 右侧主体显示标题
    ================================================== -->

        <!-- END右侧主体显示标题
    ================================================== --> 
        
        <!-- 右侧主体显示内容框
    ================================================== -->
        <tr>
         <td><div id="appear" style="cursor:pointer"><img src="./img/right.png" width="5px"  height="12px" align="left"> </div></td>
          <td height="100%" width="100%" id="ss2" >
          <iframe  id="iframe" name="ifrmname" frameborder="0" style="border:1px; " scrolling="auto" width="100%"  height="100%"  ></iframe>
          </td>
        </tr>
        <!-- END右侧主体显示内容框
    ================================================== -->
      </table></td>
  </tr>
  </table>
<div id='create_div'>
    <table width="100%" border="0" cellspacing="0" cellpadding="10" >
    <tr>
        <td colspan="2" style="font-size:12pt;">创建客户标签</td>
      </tr>
    <tr>
        <td colspan="2"><input name="" id="tag_name_txt" type="text"  value="标签1" style="width:100%; height:25px; border:1px solid  #CCC"  ></td>
      </tr>
    <tr>
        <td colspan="2"><input name="" id="tag_introduce" type="text"  value="标签简介" style="width:100%; height:25px; border:1px solid  #CCC"  ></td>
      </tr>
    <tr>
        <td>开始时间
        <input  id="create_tag_date"  style="font:9pt ;" class="easyui-datebox">
        </input></td>
        <td>结束时间
        <input  id="end_tag_date" class="easyui-datebox">
        </input></td>
      </tr>
    <tr>
        <td align="left"><a id="createTag_bt" href="#">创建</a></td>
        <td align="right"><a id="uncreateTag_bt" href="#">取消</a></td>
      </tr>
  </table>
  </div>

<div id="serv_div">
<div  class="serv_img_div" title="短信"><img src="img/maintag/duanxin.png" width="70" height="70"></div>
<div  class="serv_img_div" title="彩信"><img src="img/maintag/caixin.png" width="70" height="70"></div>
<div  class="serv_img_div" title="GPRS流量"><img src="img/maintag/shoujishangwang.png" width="70" height="70"></div>
<div  class="serv_img_div" title="飞信"><img src="img/maintag/feixin.png" width="70" height="70"></div>
<div  class="serv_img_div" title="彩铃"><img src="img/maintag/cailing.png" width="70" height="70"></div>
<div  class="serv_img_div" title="MM"><img src="img/maintag/MMbiaoqian.png" width="70" height="70"></div>
<div  class="serv_img_div" title="12580"><img src="img/maintag/12580.png" width="70" height="70"></div>
<div  class="serv_img_div" title="手机报"><img src="img/maintag/shoujibao.png" width="70" height="70"></div>
<div  class="serv_img_div" title="手机阅读"><img src="img/maintag/yuedu.png" width="70" height="70"></div>
<div  class="serv_img_div" title="手机游戏"><img src="img/maintag/youxi.png" width="70" height="70"></div>
<div  class="serv_img_div" title="手机视频"><img src="img/maintag/shoujishipin.png" width="70" height="70"></div>
<div  class="serv_img_div" title="手机动漫"><img src="img/maintag/shoujidongman.png" width="70" height="70"></div>
<div  class="serv_img_div" title="手机支付"><img src="img/maintag/zhifu.png" width="70" height="70"></div>
<div  class="serv_img_div" title="无线音乐"><img src="img/maintag/wuxianyinyue.png" width="70" height="70"></div>
<div  class="serv_img_div" title="手机邮箱"><img src="img/maintag/youxiang.png" width="70" height="70"></div>
<div  class="serv_img_div" title="手机导航"><img src="img/maintag/daohang.png" width="70" height="70"></div>
</div>  
  
  
  
  
<script type="text/javascript">

$(function(){

  var userId="<%=request.getAttribute("userId") %>";
   var userName="<%=request.getAttribute("userName")%>";
   var regionId="<%=request.getAttribute("regionId") %>";
   var regionName="<%=request.getAttribute("regionName")%>";
   $("#iframe").attr("src","initMainTagAction.action?serv_type=0&serv_name=0&serv_name_src=img/maintag/duanxin.png");
var left_menu_click_index=1;
var myDate = new Date();

$(".serv_img_div").hover(
function(){$(this).css("border","3px solid #666")},
function(){
	$(this).css("border","");
	$(this).css("border","3px solid #1d1d1d;");}
);

$(".serv_img_div").click(function(){
	var serv_name=$(this).attr("title");
	var src=$(this).children().attr("src");
    $("#iframe").attr("src","initMainTagAction.action?serv_type=0&serv_name="+encodeURI(encodeURI(serv_name))+"&serv_name_src="+src);

	// event.stopPropagation();

	
});

$("#index_body").click(function(){
	var top=$("#serv_div").css("top");
	if(top=="0px"){
 $("#serv_div").animate({top:"-300px"},500)};
});
$("#create_tag_date").datebox("setValue",myDate.toLocaleDateString());
$("#end_tag_date").datebox("setValue",myDate.toLocaleDateString());


$("#create_td").click(
	function(){
        $("#create_div").css("visibility","visible");
        $("#create_div").focus();	     
		});		
$("#manage_td").click(
	function(){
        $("#manage_div").css("visibility","visible");
        $("#manage_div").focus();

		});	
$("#manage_div").blur(
	function(){
        $("#manage_div").css("visibility","hidden");


		});			

$("#create_div").blur(
	function(){
		//$("#create_div").css("visibility","hidden");
	});

//格式代码
$("#create_td").mouseenter(
	function(){
		$("#create_td").addClass("create_td_move");
		});
		
$("#create_td").mouseleave(
	function(){
		$("#create_td").removeClass("create_td_move");
		});
		
		
$("#left_menu_table tr:gt(0):lt(4)").mouseenter(
	function(){
	    var index =($("#left_menu_table tr").index(this)); 
	    if(index!=left_menu_click_index){
			$(this).css("background","#e7e7e7");	
		}

		});

$("#left_menu_table tr:gt(0):lt(4)").mouseleave(
	function(){
	    var index =($("#left_menu_table tr").index(this)); 
	    if(index!=left_menu_click_index){
		$(this).css("background","");
		}
		});

$("#left_menu_table tr:gt(0):lt(6)").click(
	function(){
	     left_menu_click_index=($("#left_menu_table tr").index(this)); 
	    $("#left_menu_table tr:gt(0):lt(6)").css("background","");
		$(this).css("background","#d4d4d4");
		switch(left_menu_click_index)
			{
			case 1:
			$("#tag_title").text("标签地图");
			$("#iframe").attr("src","initMainTagAction.action?serv_type=0&serv_name=0&serv_name_src=img/maintag/duanxin.png");
            break;
            case 4: 
			$("#tag_title").text("我的标签"); 
			$("#iframe").attr("src","TaginfoAction.action?userId="+userId+"&regionId="+regionId+"&userName="+userName+"&regionName="+regionName);
            break;
            case 2:  
			$("#tag_title").text("标签管理");
			$("#iframe").attr("src","listtTgApproAction.action?jspmes=0&userId="+userId);
            break;						
            case 3:  
			$("#tag_title").text("属性管理");
			$("#iframe").attr("src","getAttrListAction.action");
            break;	
            case 5:  
			$("#tag_title").text("下载管理");
			$("#iframe").attr("src","querydown.action?userId="+userId);
            break;		
            case 6:  
			$("#tag_title").text("日志管理");
			$("#iframe").attr("src","findOperateLog.action?userName=&regionName=&columnName=&operateType=&operateName=&userId="+userId);
            break;		
            };

      document.getElementById("iframe").location.reload(true);
 
           
});	
    $("#createTag_bt").click(
	 function(){
		 $("#create_div").css("visibility","hidden");
		 document.getElementById("gray").style.display="none";
	 });		

$("#uncreateTag_bt").click(
	 function(){
		 $("#create_div").css("visibility","hidden");
		 document.getElementById("gray").style.display="none";
	 });
	 
	 /*格式化时间*/	 
function  myfomatter(date) {
	var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
//			return y+(m<10?('0'+m):m)+(d<10?('0'+d):d);
            return y+"年"+m+"月"+d+"日";
		};
		
$("#create_tag_date").datebox({
     formatter:myfomatter
});	
	
$("#end_tag_date").datebox({
     formatter:myfomatter
});					
		

$("#createTag_bt").click(
	function(){
			$.ajax({
    		type: 'POST',
    		url: 'addTagAction.action',
    		data:{tag_name:$("#tag_name_txt").val(),create_time:$("#create_tag_date").datebox("getValue"),end_time:$("#end_tag_date").datebox("getValue"),tag_introduce:$("#tag_introduce").val()},
    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    		success: function(data){  
	  var   iframeSrc = $("#iframe").attr("src");
            $("#iframe").attr("src", iframeSrc);

            },
   			error: function(data){
     		alert("json=" + data);
     		return false;
    		}
    	});	
		
	}
);

$("#collapse").click(
   function(){
//   alert('ss');
//var left =$("#left_menu_table").css("left");
//if(left=='0px'){
//   $("#collapse img").attr("src","./img/right.png");
//   $("#left_menu_table").animate({left:"-113px"},500);
  $("#left_menu_table").css("display","none");
  $("#appear").css("display","block");
   }
);
$("#appear").click(
   function(){
   $("#left_menu_table").css("display","block");
   $("#appear").css("display","none");
   }
)

		
});
</script>
</body>
</html>
