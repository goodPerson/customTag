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
    <title>My JSP 'taginfo.jsp' starting page</title>  
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
     <script type="text/javascript" src="<%=basePath%>/js/event-0.6.js" charset="utf-8"></script>
   
    </head>
  <style>
*{font-family: "微软雅黑";font-size: 10pt;
}  
html{
	height:100%;
	overflow-x: hidden;
	overflow-y: auto;
	}
body{
	height:100%;
	width:1024px;
	font:10pt "微软雅黑" ;
	margin:0px auto;
	text-align:center;
	background:#FFF;

	}
td {color:#000}
#taginfo_table {
  display : none;
}
#create_div{border-color:#000; border-style:solid;border-width:2px;
			background:#FFF; width:380px; height:250px;
			position:absolute;top:40px;left:60px;z-index:2;
			display:none}
#no_data {
  display:none;
  font:12pt "微软雅黑" ;
  color: #A9A9A9; 
}
#menu_div{
background:#fff; width:1024px; height:30px;
}
#create_tg{
cursor:pointer; float:left;
}
#tag_type{
width:8%;cursor:pointer; float:left;
}
#taginfo_table tr{ cursor:pointer;}
 .skin {
        width : 110px;
        border-color:#000; border-style:solid;border-width:2px;
		background:#FFF;
        padding : 2px;
        visibility : hidden;
        position : absolute;
        }
div.menuitems {
            margin : 1px 0;
              }
div.menuitems a {
            font-size:10pt;
            color:#000000;
            font-family:"微软雅黑";
            font-weight: 550;
            text-decoration : none;
                 }
#mana_div a {
            font-size:10pt;
            color:#000000;
            font-family:"微软雅黑";
            font-weight: 550;
            text-decoration : none;
                 }
#order_div a{
            font-size:10pt;
            color:#000000;
            font-family:"微软雅黑";
            font-weight: 550;
            text-decoration : none;
}
div.menuitems:hover {
            background-color : #c0c0c0;
                    }
#order_div{border-color:#000; border-style:solid;border-width:2px;
			background:#FFF; width:100px; height:100px;
			position:absolute;top:33px;left:440px; 
			visibility : hidden;z-index:2;padding-top:10px;}
#mana_div{border-color:#000; border-style:solid;border-width:2px;
			background:#FFF; width:100px; height:60px;
			position:absolute;top:33px;left:335px; 
			visibility : hidden;z-index:2;padding-top:10px;}
#create_div a{ display:block; width:80px; height:28px; text-align:center; font-size:10pt; line-height:28px;}			
#create_div a:link{text-decoration:none ; background:#094AB2; color:#FFF ;}
#create_div a:visited {text-decoration:none ; background:#094AB2; color:#FFF ;}
#create_div a:hover {text-decoration:none ; background:#03F; color:#FFF ;}
#create_div a:active {text-decoration:none ;background:#000; color:#FFF ;}
#find a{ display:block; width:50px; height:22px; text-align:center; font-size:10pt; line-height:22px;}			
#find a:link{text-decoration:none ; background:#094AB2; color:#FFF ;}
#find a:visited {text-decoration:none ; background:#094AB2; color:#FFF ;}
#find a:hover {text-decoration:none ; background:#03F; color:#FFF ;}
#find a:active {text-decoration:none ;background:#000; color:#FFF ;} 
#create_tag_date {height:25px; width:170px;}
#end_tag_date {height:25px; width:170px;}  
#order_div_table tr{
cursor:pointer;
}
#mana_div_table tr{
cursor:pointer;
}
#gray{
 background:gray;
  height: 90%;  
  left: 0%;  
  right: 0%;  
  width: 100%;  
  position: absolute; 
  opacity:0.1; 
  z-index: 1;  }  
  .line {
	height: 1px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 1px;
	float: left;
}
 .line1 {
	height: 0px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 0px;
	float: left;
	
}
.title_div {
	cursor: pointer;
	height: 40px;
	float: left;
	line-height: 40px;
	margin-right: 35px;	
}
.img_div {
	height: 40px;
	float: left;
	line-height: 40px;
} 
.nav_bt_div{ float:left; cursor:pointer;
}            
</style>
  <body>
  <!------------------------ 灰层---------------------------------------- -->
  <div id="gray" style="display:none"></div>
<!------------------------ 导航条---------------------------------------- -->
<input type="hidden" id="region_n" value="<s:property value='#session.regionName'/>"/>

   <%--          END导航内容         --%>
   <table  id="chartTable_one" width="1024px"  height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td width="24px" height="24px" style="background:url(./img/leftup.png)  ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  <td width="24px" style="background:url(./img/upborder.png)  "></td>
	  <td width="24px" height="24px" style="background:url(./img/rightup.png)  ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
	  <td  width="24px" style="background:url(./img/leftborder.png) "></td>
	  <td width="100%" valign="top">


  <!--主要内容开始-->
       
 
  <div id="select_option"style="height:23px;float:left;margin-top:0px;margin-bottom:5px;margin-left:10px;display:none">
<label>客户群选择：</label>&nbsp; <select id="cust_group" class="easyui-combobox" name="state" style="width: 100px;margin-bottom:5px;"></select> 
 </div>
  <div style="float:left;margin-top:0px;height:18px;margin-bottom:5px;cursor:pointer;display:none;" id="find"><img  src="./img/find.png"  id="query" style="float:left;margin-left:10px"></div>
 <div id="line" class="line1" style="width:100%;border:solid #5ab4f9 1px;display:none;" >&nbsp;</div>
 <div id="no_data" >没有该类型的客户群</div>
 <table id="taginfo_table" width="1024px" border="0" cellspacing="0" cellpadding="5" >
  <tr >
    <td><input name="" type="checkbox" value="" onClick="check_all(this)" id="check"> </td>
    <td style="color:#030;  ">客户群名称</td>
    <td style="color:#030;  ">简介</td>
    <td style="color:#030;  ">人数</td>
    <td style="color:#030;  ">口径</td>
    <td style="color:#030;display:none">开始时间</td>
    <td style="color:#030; display:none ">结束时间</td>
    <td style="color:#030;">有效时间</td>
    <td style="color:#030;  ">创建人</td>
    <td style="color:#030;  ">地市</td>
    <td style="display:none">id</td>
    <td style="color:#030;  ">数据月份</td>
<!--     <td style="color:#030;  ">状态</td>
    <td style="color:#030;  ">下载</td> -->
  </tr>
 
  <s:iterator  value="listTag"   var="tag">  	     	
 	     <tr id="table_text" height="40px;"  valign="top">
  			<td><input name="subBox" type="checkbox" /></td>
    		<td style="color:#000099"> <img src="./img/tag.png" width="15" height="15"><s:property value="tag_name" /></td>
    		<td style="color:#666"width="70px" title="<s:property value="profile" />">
    		  <s:if test="%{profile.length()>10}">
         	<s:property value="%{profile.substring(0,10)+'...'}" escape="false" />
            </s:if>
            <s:else>
        	 <s:property value="profile"/>
            </s:else>
    		</td>
    		<td style="color:#666"><s:property value="count_subs" />人</td>
    		<td width="300px" style="color:#666" title="<s:property value="tag_statement" />">
    		<s:if test="%{tag_statement.length()>45}">
         	<s:property value="%{tag_statement.substring(0,44)+'...'}" escape="false" />
            </s:if>
            <s:else>
        	 <s:property value="tag_statement"/>
            </s:else>
    		</td>
    		<td style="color:#666;display:none" ><s:property value="create_time" /></td>
    		<td style="color:#666;display:none"><s:property value="end_time" /></td>
   			<td style="color:#666"><s:property value="create_time" />-<s:property value="end_time" /></td>
   			<td style="color:#666"><s:property value="tag_creator" /></td>
   			
   			<td style="color:#666 "><s:property value="tag_region" /></td>
   			<td style="display:none"><s:property value="tag_id" /></td>
   			<td style="color:#666 "><s:property value="mon" /></td>
 <!--   			<td style="color:#666 "><s:property  value="tag_status"/></td>
            <s:if test="%{#tag['custlist_path']==''}" >
   			<td style="color:#666 ">文件生成中</td>
            </s:if>
            <s:else>
               			<td style="color:#666 "><a href="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/home/bea/bass_file1/khbq/${tag['custlist_path']}" >下载</a></td>
            </s:else> -->
  		</tr>  	    	    	 
</s:iterator>  

</table>
 <!------------------------ 内容table---------------------------------------- -->	  
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
  
  
  
  

 


<!------------------------ 创建标签对话框---------------------------------------- -->
<%-- <div id='create_div'>
<table width="100%" border="0" cellspacing="0" cellpadding="10" >
  <tr>
    <td colspan="2" style="font-size:12pt;">创建客户群</td>
    </tr>
  <tr>
  <td colspan="2"><input name="" id="tag_name_txt" type="text"  value="请输入客户群名称" style="width:100%; height:25px; border:1px solid  #CCC;color:gray;"onfocus="if (value =='请输入客户群名称'){value =''}" onBlur="if (value ==''){value='请输入客户群名称';this.style.color='gray'}" onKeyDown="{this.style.color='#000'}" ></td>
  </tr>
  <tr>
   <td colspan="2"><input name="" id="tag_introduce" type="text"  value="客户群简介" style="width:100%; height:25px; border:1px solid  #CCC;color:gray;"onfocus="if (value =='客户群简介'){value =''}" onBlur="if (value ==''){value='客户群简介';this.style.color='gray'}" onKeyDown="{this.style.color='#000'}" ></td>
  </tr>
  <tr>
    <td>开始时间 <input  id="create_tag_date"  style="font:9pt ;" class="easyui-datebox"></input>  </td>
    <td>结束时间 <input  id="end_tag_date" class="easyui-datebox"></input> </td>
  </tr>
  <tr>
    <td align="left"><a id="createTag_bt" href="javascript:void(0)">创建</a></td>
    <td align="right"><a id="uncreateTag_bt" href="javascript:void(0)">取消</a></td>
  </tr>
</table>
</div>

<!------------------------ 排序窗口显示 ---------------------------------------- -->
<div id="order_div">
<div id="t_name"><a  href="javascript:void(0);">&nbsp;&nbsp;客&nbsp;户&nbsp;群&nbsp;名&nbsp;称&nbsp;</a></div>
<hr/>
<div id="t_date"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;创&nbsp;建&nbsp;日&nbsp;期&nbsp;</a></div>
<hr>
<div id="t_number"><a href="javascript:void(0);">&nbsp;&nbsp;客&nbsp;户&nbsp;群&nbsp;人&nbsp;数&nbsp;</a></div>

</div>

<!------------------------ 管理窗口显示---------------------------------------- -->
<div id="mana_div">
<div id="t_del"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;删&nbsp;除&nbsp;</a></div>
<hr/>
<div id="t_clear"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;&nbsp;清除选定内容&nbsp;</a></div>

</div>
<!------------------------ 右键窗口定义---------------------------------------- -->
  <div id="menu" class="skin">
        <div class="menuitems" id="open" >
             <a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;打&nbsp;开</a>
        </div>
        <div></div>
         <hr id="hr1"/>
       <div></div>
        <div class="menuitems" id="rename">
             <a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;重&nbsp;命&nbsp;名</a>
        </div>
        <div></div>
        <div class="menuitems" id="delete">
             <a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;删&nbsp;除</a>
        </div>
         <hr id="hr"/>
        <div></div>
        <div class="menuitems" id="attribute">
            <a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;属&nbsp;性</a>
        </div>
        <div></div>
        <div class="menuitems" id="clear">
            <a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;清除选定内容</a>
        </div>
        <div></div>

    </div> --%>

<script type="text/javascript">

$(function(){
//根据查到是否有tag来判断显示
//alert(document.body.clientHeight);
var userId="<%=request.getAttribute("userId") %>";
var userName="<%=request.getAttribute("userName") %>";
var regionId="<%=request.getAttribute("regionId") %>";
var regionName=$("#region_n").val();
var judge ="<%=request.getAttribute("custom_type") %>";
//alert(judge);
if(judge=="我的客户群"){
   $("#select_option").css("display","none");
   $("#find").css("display","none");
   $("#line").css("display","none");
}else{
    $("#select_option").css("display","block");
   $("#find").css("display","block");
   $("#line").css("display","block");
}
var size="<%=request.getAttribute("a") %>";
if(size!=0){
   $("#taginfo_table").show();
         }else{
      $("#no_data").show();   
  }

 var tr_index=0;
// alert( $(window.parent.document).find("#tag_title").text());
$("#my_tg").text($(window.parent.document).find("#tag_title").text());
$("#open_t").click(
   function(){
    var str="";
          $("#taginfo_table tr:gt(0)").each(function(){
          str_index=($("#taginfo_table tr").index(this)); 
           if($(this).find("input").attr("checked")) {
              str+= str_index+",";
              }
          });
          var s = str.split(",");
      if(tr_index==0){
      alert("请选择要打开的客户群！");
      }else if (s.length>2){
      alert("只能选择一个打开！")
      }      
      else{
       window.$("#open").click();} 
 });
 $("#share_t").click(
     function(){
      if(tr_index==0){
      alert("请选择要共享的标签！");
      document.getElementById("gray").style.display="none";
       $("#mana_div").css("visibility","hidden");
      }else{
         window.$("#share").click();} 
 });
 $("#t_rename").click(
   function(){
    var str="";
          $("#taginfo_table tr:gt(0)").each(function(){
          str_index=($("#taginfo_table tr").index(this)); 
           if($(this).find("input").attr("checked")) {
              str+= str_index+",";
              }
          });
          var s = str.split(",");
      if(tr_index==0){
      alert("请选择要重命名的客户群！");
      }else if (s.length>2){
      alert("只能选择一个重命名！")
      }else{  
     window.$("#rename").click();} 
 //    $("#mana_div").css("visibility","hidden");
 });
  $("#t_del").click(
   function(){
     if(tr_index==0){
      alert("请选择要删除的客户群！");
      document.getElementById("gray").style.display="none";
      $("#mana_div").css("visibility","hidden");
      }else{
     window.$("#delete").click(); 
     $("#mana_div").css("visibility","visible");}
 });
  $("#t_clear").click(
   function(){
     window.$("#clear").click(); 
     document.getElementById("gray").style.display="none";
     $("#mana_div").css("visibility","hidden");
 });

var check_index="";
var order_index=0;
var str="";
var s="";

$("#create_tg").click(
	function(){
        $("#create_div").css("visibility","visible");
        $("#create_div").focus();
		document.getElementById("gray").style.display="block";
	    document.getElementById("gray").style.filter="alpha(opacity=20)";	     
		});	
$("#createTag_bt").click(
	function(){
	var start =$("#create_tag_date").datebox("getValue");
	var end =$("#end_tag_date").datebox("getValue");
	//alert(start);
	//alert(start.length);
	if(start.length==0 || end.length==0 ){
	alert("时间均不能为空");
	}else{
	     $("#create_div").css("visibility","hidden");
		 document.getElementById("gray").style.display="none";
			$.ajax({
    		type: 'POST',
    		url: 'addTagAction.action',
    		data:{tag_name:$("#tag_name_txt").val(),create_time:$("#create_tag_date").datebox("getValue"),end_time:$("#end_tag_date").datebox("getValue"),tag_introduce:$("#tag_introduce").val(),userId:userId,userName:userName,regionName:regionName},
    		dataType:"text", 
    		success: function(data){ 
    		var href="TaginfoAction.action?userId="+userId;
          window.location.href=href; 
            },
   			error: function(data){
     		
     		return false;
    		}
    	});	
		
	}}
);
$("#order").click(
	function(){
        $("#order_div").css("visibility","visible");
        $("#order_div").focus();
        document.getElementById("gray").style.display="block";
	    document.getElementById("gray").style.filter="alpha(opacity=20)";	
		});
$("#mana_t").click(
	function(){
        $("#mana_div").css("visibility","visible");
        $("#mana_div").focus();
        document.getElementById("gray").style.display="block";
	    document.getElementById("gray").style.filter="alpha(opacity=20)";
		});	

$("#order_div a").click(
	function(){ 
	  //  alert(order_index);
	    order_index=($("#order_div a").index(this)); 
	 //  alert(order_index);
		switch(order_index)
			{
			case 0:
			$("#order_t").text("标签名称");
            break;
            case 1: 
			$("#order_t").text("创建日期"); 
            break;
            case 2:  
			$("#order_t").text("标签人数");
            break;								
            };
         $("#order_div").css("visibility","hidden");
         var a ="TaginfoAction.action?ordername="+ encodeURI(encodeURI($("#order_t").text()))+"&userId="+userId ;
  //        +"&mes="+encodeURI(encodeURI($(window.parent.document).find("#tag_title").text()));
         window.location.href=a; 
});	
 var myDate = new Date();
 var yesterday_milliseconds=myDate.getTime()-1000*60*60*24;
 var yesterday = new Date();
 yesterday.setTime(yesterday_milliseconds);
 var year = myDate.getFullYear();
			var mon = myDate.getMonth()+1;
			var day = myDate.getDate();
			var value = year+(mon<10?('0'+mon):mon)+(day<10?('0'+day):day);

$("#create_tag_date").datebox("setValue","请选择开始时间");
$("#end_tag_date").datebox("setValue","请选择结束时间");
	 /*格式化时间*/	 
function  myfomatter(date) {
	        var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+(m<10?('0'+m):m)+(d<10?('0'+d):d);
 //           return y+"年"+m+"月"+d+"日";
		};
		
$("#create_tag_date").datebox({
     formatter:myfomatter,
      onSelect:function(date){
       // alert(date); 
        var myDate = new Date();
        //alert(myDate) ;l  
        if(date<yesterday){
        alert("起始日期不能小于今天");
        $("#create_tag_date").datebox("setValue","");
        } 
     }
});	
	
$("#end_tag_date").datebox({
     formatter:myfomatter,
     onSelect:function(date){
      /*  var myDate = new Date();
        if(date<=myDate){
        alert("结束日期不能小于今天");
        $("#create_tag_date").datebox("setValue","");
        } */
      var start =$("#create_tag_date").datebox("getValue");
	var s = parseInt(start);
	var end =$("#end_tag_date").datebox("getValue");
	var e = parseInt(end);
	if(s>e){
	alert("开始时间不能大于结束时间");
	 $("#end_tag_date").datebox("setValue","");
	}
     }
});					
	

$("#uncreateTag_bt").click(
	 function(){
		 $("#create_div").css("visibility","hidden");
		  document.getElementById("gray").style.display="none";
	 });
	 
	 $("#uncreateTag_bt").click(
	 function(){
		 $("#create_div").css("visibility","hidden");
		  document.getElementById("gray").style.display="none";
	 });
$("#taginfo_table tr:gt(0) input").click(
	function(){
	    a=($("#taginfo_table tr:gt(0) input").index(this)); 
	    var tr= a+1;
	 //   alert(tr);
	    
	    if($("#taginfo_table tr:eq("+tr+")").find("input").attr("checked")){
	  //  $("#taginfo_table tr:eq("+a+")").find("input").attr("checked",false);
     $("#taginfo_table tr:eq("+tr+")").find("input").attr("checked",false);
    $("#taginfo_table tr:eq("+tr+")").css("background","#0033CC");
    $("#taginfo_table tr:eq("+tr+") td").css("color","#FFFFFF");
   }else{//未选中的行，进行选中
      $("#taginfo_table tr:eq("+tr+")").find("input").attr("checked",true);
     $("#taginfo_table tr:eq("+tr+")").css("background","");
    $("#taginfo_table tr:eq("+tr+") td:gt(1)").css("color","#666");
    $("#taginfo_table tr:eq("+tr+") td:eq(1)").css("color","#000099");
    
   } 
		});		 
	 
$("#taginfo_table tr:gt(0)").live("click",function (){
   tr_index=($("#taginfo_table tr").index(this));
     
    if($(this).find("input").attr("checked")){//已选中的行 取消选中
    $(this).find("input").attr("checked",false);
    $(this).css("background","");
    $("#taginfo_table tr:eq("+tr_index+") td:gt(1)").css("color","#666");
    $("#taginfo_table tr:eq("+tr_index+") td:eq(1)").css("color","#000099");
   }else{//未选中的行，进行选中
    $(this).find("input").attr("checked",true);
    $(this).css("background","#0033CC");
    $("#taginfo_table tr:eq("+tr_index+") td").css("color","#FFFFFF");
   } 
});
if(judge!=""){
 $("#taginfo_table tr:gt(0)").dblclick(
  function(){
   var hre="";
    var text=$("#taginfo_table tr:eq("+tr_index+") td:eq(12)").text();
    if(text=="文件生成中"){
      hre="not_already";
//      alert("ssss");
    }else{
      hre=$("#taginfo_table tr:eq("+tr_index+") td:eq(12)").find("a").attr("href");
    }
    var title_name=$("#taginfo_table tr:eq("+tr_index+") td:eq(1)").text();
    var id=$("#taginfo_table tr:eq("+(tr_index)+") td:eq(10)").text();
    var count=$("#taginfo_table tr:eq("+(tr_index)+") td:eq(3)").text();
    var startime=$("#taginfo_table tr:eq("+(tr_index)+") td:eq(5)").text();
    var endtime=$("#taginfo_table tr:eq("+(tr_index)+") td:eq(6)").text();
//  $(window.parent.document).find("#iframe").attr("src","initAttrTagAction.action?title_name="+ encodeURI(encodeURI(title_name)));
    if(judge=="我的客户群"){
    var a ="initAttrTagAction.action?title_name="+ encodeURI(encodeURI(title_name))+"&id="+id+"&userId="+userId+"&regionId="+regionId+"&href="+hre+"&starttime="+startime+"&endtime="+endtime+"&count="+count+"&type="+1;
    }else{
    var a ="initAttrTagAction.action?title_name="+""+"&id="+id+"&userId="+userId+"&regionId="+regionId+"&href="+hre+"&starttime="+startime+"&endtime="+endtime+"&count="+count+"&type="+0;
    }
    document.location.href= a;
    });
    }else{
     for (i=1;i<$("#taginfo_table tr").length;i++){
   $("#taginfo_table tr:eq("+i+") td:eq(11)").text("没有权限");  
    }
    }

 $("#menu").children().mouseenter(
     function(){
       var index =($("#menu").children().index(this)); 
       $(this).css("background","#d4d4d4");
       });		
$("#menu").children().mouseleave(
     function(){
       var index =($("#menu").children().index(this)); 
       $(this).css("background","");
       });
 $("#mana_div").children().mouseenter(
     function(){
       var index =($("#mana_div").children().index(this)); 
       $(this).css("background","#d4d4d4");
       });		
$("#mana_div").children().mouseleave(
     function(){
       var index =($("#mana_div").children().index(this)); 
       $(this).css("background","");
       });
//全选
  check_all =function (obj){
   $("input[type='checkbox']").attr("checked",obj.checked);
   if(obj.checked){
     $("#taginfo_table tr:gt(0)").css("background","#0033CC");
    $("#taginfo_table  tr:gt(0) td").css("color","#FFFFFF");
   }else{
    $("#taginfo_table tr:gt(0)").css("background","");
    $("#taginfo_table  tr:gt(0) td").css("color","#666");
   for (i=1;i<$("#taginfo_table tr").length;i++){
   //  alert($("#taginfo_table tr").length);
    $("#taginfo_table tr:eq("+i+") td:eq(1)").css("color","#000099");
   }
   }
  }
$("#clear").click(
    function(){
    $("#taginfo_table :checkbox").attr("checked",false);
    $("#taginfo_table tr:gt(0)").css("background","");
    $("#taginfo_table tr td:gt(2)").css("color","#666");
   
    for (i=1;i<$("#taginfo_table tr").length;i++){
   //  alert($("#taginfo_table tr").length);
    $("#taginfo_table tr:eq("+i+") td:eq(1)").css("color","#000099");
   }
    });
$("#open").click(
    function(){
    var str="";
          $("#taginfo_table tr:gt(0)").each(function(){
          str_index=($("#taginfo_table tr").index(this)); 
           if($(this).find("input").attr("checked")) {
              str+= str_index+",";
              }
          });
          var s = str.split(",");
    if(s[0]>0){
     var hre="";
    var text=$("#taginfo_table tr:eq("+s[0]+") td:eq(12)").text();
    if(text=="文件生成中"){
      hre="not_already";
//      alert("ssss");
    }else{
      hre=$("#taginfo_table tr:eq("+tr_index+") td:eq(12)").find("a").attr("href");
    }
 //   alert(hre);
    var title_name=$("#taginfo_table tr:eq("+s[0]+") td:eq(1)").text();
     var id=$("#taginfo_table tr:eq("+s[0]+") td:eq(10)").text();
//  $(window.parent.document).find("#iframe").attr("src","initAttrTagAction.action?title_name="+ encodeURI(encodeURI(title_name)));
    var a ="initAttrTagAction.action?title_name="+ encodeURI(encodeURI(title_name))+"&id="+id+"&userId="+userId+"&regionId="+regionId+"&href="+hre;
    document.location.href= a;
    }}
    );
 
 $("#delete").click(
	function(){
	 var str="";
          $("#taginfo_table tr:gt(0)").each(function(){
          str_index=($("#taginfo_table tr").index(this)); 
           if($(this).find("input").attr("checked")) {
              str+= str_index+",";
              }
          });
          var s = str.split(",");
	    var tag_id="";
	    for(i=0;i<s.length-1;i++){
	       tag_id+=$("#taginfo_table tr:eq("+s[i]+") td:eq(10)").text()+",";
	    }
			$.ajax({
    		type: 'POST',
    		url: 'delTagAction.action',
    		data:{tag_id:tag_id},
    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    		success: function(data){  
            document.location.reload();
            },
   			error: function(data){
     		alert("json=" + data);
     		return false;
    		}
    	});	
		
	}
);
 $("#share").click(
	function(){
	 var str="";
          $("#taginfo_table tr:gt(0)").each(function(){
          str_index=($("#taginfo_table tr").index(this));
         // alert(str); //此处是选择的li 标签下的选中的 checkbox 
           if($(this).find("input").attr("checked")) {
              str+= str_index+",";
              }
          });
           // alert(str);
          var s = str.split(",");
	    var tag_id="";
	    for(i=0;i<s.length-1;i++){
	       tag_id+=$("#taginfo_table tr:eq("+s[i]+") td:eq(10)").text()+",";
	    }
	  //  alert(tag_id);
	   var a =$("#taginfo_table tr:eq("+tr_index+") td:eq(10)").text();
			$.ajax({
    		type: 'POST',
   		url: 'shareTagAction.action',
   		data:{tag_id:tag_id},
    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    		success: function(data){  
            document.location.reload();
            },
   			error: function(data){
     		alert("json=" + data);
     		return false;
    		}
    	});	
		
	}
);
$("#rename").click(
     function(){
     var str="";
          $("#taginfo_table tr:gt(0)").each(function(){
          str_index=($("#taginfo_table tr").index(this)); 
           if($(this).find("input").attr("checked")) {
              str+= str_index+",";
              }
          });
          var s = str.split(",");
      var td = $("#taginfo_table tr:eq("+s[0]+") td:eq(1)");
      var text = td.text(); 
       td.html("");
       var input = $("<input>");
       input.attr("value",text);
        input.keyup(function(event){  
            var myEvent = event || window.event;  
            var key = myEvent.keyCode;  
            if(key == 13){  
                var inputNode = $(this);                
                var inputText = inputNode.val();            
                inputNode.parent().html(inputText);                   
                td.click(tdclick);  
            }  
        }); 
        input.dblclick(function(){  
            var inputNode = $(this);  
            var inputText = inputNode.val();  
            inputNode.parent().html(inputText);  
//            td.click(tdclick);
           $.ajax({
    		type: 'POST',
    		url: 'renameTagAction.action',
    		data:{name:inputText ,id:$("#taginfo_table tr:eq("+(tr_index)+") td:eq(10)").text()},
    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    		success: function(data){  
             document.location.reload();
            },
   			error: function(data){
     		//alert("json=" + data);
     		return false;
    		}
    	});	  
        });  
         td.append(input);  
         td.unbind("click");  
      
     
     }
);
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



var custom_type="";
$("#cust_group").combobox({
         valueField:'id',
	     textField:'text', 
	     panelHeight:'200',
	     editable: false,
	     data: [{   id: '省公司',
					text: '省公司'
				   },{
					id: '石家庄',
					text: '石家庄'
				   },{
					id: '保定',
					text: '保定'
				   },{
					id: '张家口',
					text: '张家口'
				   },{
					id: '承德',
					text: '承德'
				   },{
					id: '唐山',
					text: '唐山'
				   },{
					id: '廊坊',
					text: '廊坊'
				   },{
					id: '沧州',
					text: '沧州'
				   },{
					id: '衡水',
					text: '衡水'
				   },{
					id: '邢台',
					text: '邢台'
				   },{
					id: '邯郸',
					text: '邯郸'
				   },{
					id: '秦皇岛',
					text: '秦皇岛'
				   }],
			onChange: function(newValue,oldValue){
			     //alert(newValue);
			      //alert(oldValue);
			      custom_type=newValue;
			      //var href="TaginfoAction.action?custom_type="+ encodeURI(encodeURI(custom_type));
			      // +"&mes="+encodeURI(encodeURI($(window.parent.document).find("#tag_title").text()));
			      //window.location.href=href;
			} 
});
$("#find").click(
   function(){
   var custom_type=$("#cust_group").combobox("getValue");
//   alert(custom_type);
    var href="TaginfoAction.action?custom_type="+ encodeURI(encodeURI(custom_type));
    // +"&mes="+encodeURI(encodeURI($(window.parent.document).find("#tag_title").text()));
       window.location.href=href;
    }
);

var judge ="<%=request.getAttribute("custom_type") %>";
//alert(judge);
if(judge==0){
  $("#cust_group").combobox("setValue","全部");
}else{
$("#cust_group").combobox("setValue",judge);
}
if(judge=="我的客户群"){
//alert("sss");
}else{
$("#open_t").css("display","none");
$("#create_tg").css("display","none");
$("#img_rename").css("display","none");
$("#t_rename").css("display","none");
$("#img_ma").css("display","none");
$("#mana_t").css("display","none");
$("#img_order").css("display","none");
$("#order").css("display","none");
}
});

window.onload = function() {		
    var container = document.getElementById('taginfo_table');
//     var container = $("#taginfo_table");
//    var container1 = $(".test");
    var menu = document.getElementById('menu');
    var bodyHeight =document.body.clientHeight; 
   //  alert(container.height);
    /*显示菜单*/
    function showMenu() {
          var str="";  
          $("#taginfo_table tr:gt(0)").each(function(){
          str_index=($("#taginfo_table tr").index(this)); 
           if($(this).find("input").attr("checked")) {
              str+= str_index+",";
              }
          });
          var s = str.split(",");
         // alert(s);
         // alert(s.length);
	   if(s.length>2){
	    $("#hr1").css("display","none");
        $("#open").css("display","none");
        $("#rename").css("display","none");
        $("#attribute").css("display","none");
    }else{
    $("#open").css("display","block");
    $("#rename").css("display","block");
    $("#attribute").css("display","block");
    };	
 var judge ="<%=request.getAttribute("custom_type") %>";
/*   if(judge=="我的客户群"){
   
  }else{ 
    $("#open").css("display","none");
  $("#hr1").css("display","none");
   $("#hr").css("display","none");
  $("#rename").css("display","none");
  $("#share").css("display","none");
  $("#delete").css("display","none");
  }*/
    var evt = window.event || arguments[0];
     /*获取当前鼠标右键按下后的位置，据此定义菜单显示的位置*/
        var rightedge = container.clientWidth-evt.clientX;
        var bottomedge = container.clientHeight-evt.clientY;
        var a = document.body.scrollTop;
//        alert(container.scrollTop);
        /*如果从鼠标位置到容器右边的空间小于菜单的宽度，就定位菜单的左坐标（Left）为当前鼠标位置向左一个菜单宽度*/
        if (rightedge < menu.offsetWidth)                
            menu.style.left = container.scrollLeft + evt.clientX - menu.offsetWidth + "px";             
        else
       /*否则，就定位菜单的左坐标为当前鼠标位置*/
          menu.style.left = container.scrollLeft + evt.clientX  + "px";
        /*如果从鼠标位置到容器下边的空间小于菜单的高度，就定位菜单的上坐标（Top）为当前鼠标位置向上一个菜单高度*/
        if (bottomedge < menu.offsetHeight && evt.clientY > menu.offsetHeight && container.clientHeight>bodyHeight)
            menu.style.top = container.scrollTop + evt.clientY - menu.offsetHeight + a + "px";
       else
        /*否则，就定位菜单的上坐标为当前鼠标位置*/
            menu.style.top = container.scrollTop + evt.clientY + a + "px";            
        /*设置菜单可见*/
        menu.style.visibility = "visible";              
//        LTEvent.addListener(menu,"contextmenu",LTEvent.cancelBubble);
        E.on(container, "contextmenu", function(){}, {stopEvent: true});
    }
    /*隐藏菜单*/
    function hideMenu() {
       menu.style.visibility = 'hidden';
    }                                
 E.on(container, "contextmenu", function(){}, {stopEvent: true});
 E.on(container, "contextmenu",showMenu);
 E.on(document, "click", hideMenu);  		                     
}


</script>
 
  </body>
</html>
