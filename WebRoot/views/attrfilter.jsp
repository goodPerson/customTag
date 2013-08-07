<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<%@ taglib prefix="struts" uri="/struts-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'attrfilter.jsp' starting page</title>
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
	font: 10pt "微软雅黑";
	margin: 0px auto;
	background:#FFF;
	overflow-x: hidden;
	overflow-y: auto;
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
#taginfo_table tr {
	cursor: pointer;
}
.title_td {
	color: #000;
	font-size:14pt;
	height: 20px;
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
	font-size:12px;
	margin-left:5px;	
}
.attr_item {
	font: 9pt;
	cursor: pointer;
}
.attr_tr {
	display: none; padding-left:5px; float:left;
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
    float:left;
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
	font-size:14px;
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
	font-size:9pt; 
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
.attr_item_title_div{position: relative;left: 5px;top: 12px; height:30px;width:200px;cursor: pointer; }
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
.line {
	height: 1px;
	font-size: 0px;
	background:#006;
	line-height: 1px;
}
#serch_attr_div{
position:absolute;left:10px; top:62px; width:393px;border-bottom:solid #CCC 1px; border-left:solid #CCC 1px; border-right:solid #CCC 1px; display:block; background:#FFF; height:200px; overflow:auto; display:none;	
}
.attr_tishi_div{
margin:5px;color:#CCC;cursor:pointer;
}
#download_div{border-color:#000; border-style:solid;border-width:2px;
			background:#FFF; width:400px; height:150px;
			position:absolute;top:200px;right:100px;z-index:2;
			display:none  }
#close_struct{	
	width:50px;
	height:30px;
	line-height:30px;
	font-size:14px;
	font-weight:bold;	
	}
#line_struct{
	z-index:-5;
	visibility:hidden;
	}
#struct_condition {
	width: auto;
	height: 400px;
	/*position: absolute;
	top: 100px;
	left:300px;
    float:left;
	visibility:hidden;
	z-index:-5;*/
}	
</style>

<body>
<div id="wait_div" class="wait_div" >
</div>
<input type="hidden" id="req_reson" value="<s:property value='#session.regionId'/>"/>
<input type="hidden" id="req_userId" value="<s:property value='#session.userId'/>"/>
<img id="load_div" src="./img/load/load.jpg" width="32" height="32" align="absmiddle" style="z-index:0s; position:absolute; left:50%;top:50%; display:none">
<table width="1024px" height="100%" border="0" cellspacing="0" cellpadding="0" align="center" id="main_attr_table">
  <tr>
    <td width="200px"  align="right" valign="top">
        <div  class="attr_title_div" style="background:#094AB2; height:30px; color:#FFF; width:200px;	position: relative;left: 5px;top: 8px; line-height:30px;">
        <div class="attr_title_div" style="width:130px;" align="left">&nbsp;&nbsp;属性视图</div>
        <div class="attr_title_div" style="width:30px; height:30px;"><img id="hidde_bt1" src="./img/bt10.png"  style="cursor:pointer;"></div>
        <div  class="attr_title_div" style="width:30px; height:30px;"><img id="hidde_bt2" src="./img/bt11.png"  style="cursor:pointer;"></div>
      </div>
      <!--基本属性-->
      <div style="clear:both"></div>
      <div class="attr_item_title_div">
      <div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;基本属性</div>
      <div class="attr_title_div"></div>
      <div style="clear:both"></div>
      <div class="attr_tr">
      <s:iterator value="baisAttr"  id="bais">
       <div class="attr_item_div" title="<s:property value='bais'/>">
         <s:if test="%{#bais.length()>4}">
         	<s:property value="%{#bais.substring(0,4)+'...'}" escape="false" />
         </s:if>
         <s:else>
        	 <s:property value="#bais"/>
         </s:else>
       </div>                         
      </s:iterator>
      </div>
      </div>
      <!--END基本属性-->
      
      <!--流量属性-->           
      <div style="clear:both"></div>
      <div class="attr_item_title_div"  style="background:#EAEAEA; ">
      	<div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      	<div class="attr_title_div" style=" width:145px;" align="left">&nbsp;语音属性</div>
      	<div class="attr_title_div"></div>
      	<div style="clear:both"></div>
      	<div class="attr_tr">
      	 	<s:iterator value="voiceAttr"  id="flow">
	       		<div class="attr_item_div"  title="<s:property value='flow'/>" >
             	<s:if test="%{#flow.length()>4}">
                	<s:property value="%{#flow.substring(0,4)+'...'}"   escape="false"/>
             	</s:if>
             	<s:else>
              		<s:property value="#flow"/>
             	</s:else>
           		</div>
	      </s:iterator>        
      </div>
      </div>
      <!--END流量属性--> 
      
      <!--流量属性--> 
      <div style="clear:both"></div>
      <div class="attr_item_title_div">
      <div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;流量属性</div>
      <div class="attr_title_div"></div>
      <div style="clear:both"></div>
      <div class="attr_tr">
      <s:iterator value="flowAttr"  id="bais">
       <div class="attr_item_div"  title="<s:property value='bais'/>">
         <s:if test="%{#bais.length()>4}">
         	<s:property value="%{#bais.substring(0,4)+'...'}" escape="false" />
         </s:if>
         <s:else>
        	 <s:property value="#bais"/>
         </s:else>
       </div>                         
      </s:iterator>
      </div>     
      </div>
      <!--END流量属性--> 

      <!--短/彩信属性--> 
      <div style="clear:both"></div>
      <div class="attr_item_title_div" style="background:#EAEAEA;">
      <div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;短/彩信属性</div>
      <div class="attr_title_div"></div>
      <div style="clear:both"></div>
      <div class="attr_tr">
      <s:iterator value="smsMmsAttr"  id="bais">
       <div class="attr_item_div"  title="<s:property value='bais'/>">
         <s:if test="%{#bais.length()>4}">
         	<s:property value="%{#bais.substring(0,4)+'...'}" escape="false" />
         </s:if>
         <s:else>
        	 <s:property value="#bais"/>
         </s:else>
       </div>                         
      </s:iterator>
      </div>     
      </div>
      <!--END短/彩信属性-->     
 
      <!--业务属性--> 
      <div style="clear:both"></div>
      <div class="attr_item_title_div">
      <div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;业务属性</div>
      <div class="attr_title_div"></div>
      <div style="clear:both"></div>
      <div class="attr_tr">
      <s:iterator value="servAttr"  id="bais">
       <div class="attr_item_div"  title="<s:property value='bais'/>">
         <s:if test="%{#bais.length()>4}">
         	<s:property value="%{#bais.substring(0,4)+'...'}" escape="false" />
         </s:if>
         <s:else>
        	 <s:property value="#bais"/>
         </s:else>
       </div>                         
      </s:iterator>
      </div>     
      </div>
      <!--END业务属性-->      

      <!--终端属性--> 
      <div style="clear:both"></div>
      <div class="attr_item_title_div" style="background:#EAEAEA;">
      <div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;终端属性</div>
      <div class="attr_title_div"></div>
      <div style="clear:both"></div>
      <div class="attr_tr">
      <s:iterator value="terminalAttr"  id="bais">
       <div class="attr_item_div"  title="<s:property value='bais'/>">
         <s:if test="%{#bais.length()>4}">
         	<s:property value="%{#bais.substring(0,4)+'...'}" escape="false" />
         </s:if>
         <s:else>
        	 <s:property value="#bais"/>
         </s:else>
       </div>                         
      </s:iterator>
      </div>     
      </div>
      <!--END终端属性--> 
      
      <!--集团属性--> 
      <div style="clear:both"></div>
      <div class="attr_item_title_div" >
      <div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;集团属性</div>
      <div class="attr_title_div"></div>
      <div style="clear:both"></div>
      <div class="attr_tr">
      <s:iterator value="groupAttr"  id="bais">
       <div class="attr_item_div"  title="<s:property value='bais'/>">
         <s:if test="%{#bais.length()>4}">
         	<s:property value="%{#bais.substring(0,4)+'...'}" escape="false" />
         </s:if>
         <s:else>
        	 <s:property value="#bais"/>
         </s:else>
       </div>                         
      </s:iterator>
      </div>     
      </div>
      <!--END集团属性-->      
      
      <!--区域属性--> 
      <div style="clear:both"></div>
      <div class="attr_item_title_div" style="background:#EAEAEA;">
      <div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;区域属性</div>
      <div class="attr_title_div"></div>
      <div style="clear:both"></div>
      <div class="attr_tr">

      </div>     
      </div>
      <!--END区域属性-->          


      <!--渠道属性--> 
      <div style="clear:both"></div>
      <div class="attr_item_title_div">
      <div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;渠道属性</div>
      <div class="attr_title_div"></div>
      <div style="clear:both"></div>
      <div class="attr_tr">
      <s:iterator value="qudaoAttr"  id="bais">
       <div class="attr_item_div"  title="<s:property value='bais'/>">
         <s:if test="%{#bais.length()>4}">
         	<s:property value="%{#bais.substring(0,4)+'...'}" escape="false" />
         </s:if>
         <s:else>
        	 <s:property value="#bais"/>
         </s:else>
       </div>                         
      </s:iterator>
      </div>     
      </div>
      <!--END渠道属性-->   


      <!--标签属性--> 
      <div style="clear:both"></div>
      <div class="attr_item_title_div" style="background:#EAEAEA;">
      <div class="attr_title_div"><img src="./img/attr10.png" align="absmiddle" ></div>
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;标签</div>
      <div class="attr_title_div"></div>
      <div style="clear:both"></div>
      <div class="attr_tr">
      <s:iterator value="tagAttr"  id="bais">
       <div class="attr_item_div"  title="<s:property value='bais'/>">
         <s:if test="%{#bais.length()>4}">
         	<s:property value="%{#bais.substring(0,4)+'...'}" escape="false" />
         </s:if>
         <s:else>
        	 <s:property value="#bais"/>
         </s:else>
       </div>                         
      </s:iterator>
      </div>     
      </div>
      <!--END标签属性-->   
    
    
    
    
    
    </td>
    <td width="100%" height="100%" align="right" valign="top"><table  id="chartTable" width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="24px" height="24px" style="background:url(./img/leftup.png)">&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td width="100%" style="background:url(./img/upborder.png)  repeat-x"></td>
          <td width="24px" height="24px" style="background:url(./img/rightup.png)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td height="100%" style="background:url(./img/leftborder.png) repeat-y"></td>
          
          <!-- 标签显示内容框
    ================================================== -->
          
          <td   valign="top"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td id="tag_name" class="title_td" align="center" width="100%"><s:property value="title" /><input type="hidden" id="tag_id"  value='<s:property value="id" />'/>
               </td>
                <td colspan="2" align="right"></td>
              </tr>
             <s:if test="%{type==1}">
              <tr class="tag_info" style="display:none;">
                <td colspan="3"  valign="top" style=" font: bold; height:30px;">客户群基本信息</td>
              </tr>
              <tr class="tag_info" style="display:none;">
               <td colspan="3" height="20px" style="padding-left:10px;" >
                <div style="float:left;margin-left:5px;margin-right:5px">                                 
                 <label>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px">
                    <input name="" id="tag_name_text" type="text"  value="请输入客户群名称" style="width:400px; height:25px; border:1px solid  #CCC;"onfocus="if (value =='请输入客户群名称'){value =''}" onBlur="if (value ==''){value='请输入客户群名称';}" onKeyDown="{this.style.color='#000'}" >
                  </div>
                  </td>
              </tr>
               <tr class="tag_info" style="display:none;">
               <td colspan="3" height="30px" style="padding-left:10px;" valign="middle" >
                <div style="float:left;margin-left:5px;margin-right:5px;">                                 
                 <label>简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px">
                    <input name="" id="tag_introduce" type="text"  value="客户群简介" style="width:400px; height:25px; border:1px solid  #CCC;"onfocus="if (value =='客户群简介'){value =''}" onBlur="if (value ==''){value='客户群简介';}" onKeyDown="{this.style.color='#000'}" >
                  </div>
                  </td>
              </tr>
               <tr class="tag_info" style="margin-bottom:5px;display:none;">
               <td colspan="3" height="30px" style="padding-left:10px;" valign="middle" >
                <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;">                                 
                 <label>有效时间：</label>
                 </div>
                  <div style="float:left; padding-left:2px;margin-left:6px;margin-right:5px;margin-bottom:5px;height:30px">
                     <input  id="create_tag_date"  style="font:9pt;width:192px;" class="easyui-datebox"></input>
                     --<input  id="end_tag_date" style="font:9pt;width:192px;" class="easyui-datebox"></input>
                  </div>
                  </td>
              </tr>
               <tr class="tag_info" style="margin-bottom:5px;display:none;">
               <td colspan="3" height="20px" style="padding-left:10px;" >
                <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;">                                 
                 <label>数据月份：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;height:30px">
                      <s:property value="mon" />
                  </div>
                  </td>
              </tr>
              </s:if>
              <s:else>
               <tr class="tag_info">
                <td colspan="3"  valign="top" style=" font: bold; height:30px;">客户群基本信息</td>
              </tr>
              <tr class="tag_info">
               <td colspan="3" height="20px" style="padding-left:10px;" >
                <div style="float:left;margin-left:5px;margin-right:5px">                                 
                 <label>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px">
                    <input name="" id="tag_name_text" type="text"  value="请输入客户群名称" style="width:400px; height:25px; border:1px solid  #CCC;"onfocus="if (value =='请输入客户群名称'){value =''}" onBlur="if (value ==''){value='请输入客户群名称';}" onKeyDown="{this.style.color='#000'}" >
                  </div>
                  </td>
              </tr>
               <tr class="tag_info">
               <td colspan="3" height="30px" style="padding-left:10px;" valign="middle" >
                <div style="float:left;margin-left:5px;margin-right:5px;">                                 
                 <label>简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px">
                    <input name="" id="tag_introduce" type="text"  value="客户群简介" style="width:400px; height:25px; border:1px solid  #CCC;"onfocus="if (value =='客户群简介'){value =''}" onBlur="if (value ==''){value='客户群简介';}" onKeyDown="{this.style.color='#000'}" >
                  </div>
                  </td>
              </tr>
               <tr class="tag_info" style="margin-bottom:5px">
               <td colspan="3" height="30px" style="padding-left:10px;" valign="middle" >
                <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;">                                 
                 <label>有效时间：</label>
                 </div>
                  <div style="float:left; padding-left:2px;margin-left:6px;margin-right:5px;margin-bottom:5px;height:30px">
                     <input  id="create_tag_date"  style="font:9pt;width:192px;" class="easyui-datebox"></input>
                     --<input  id="end_tag_date" style="font:9pt;width:192px;" class="easyui-datebox"></input>
                  </div>
                  </td>
              </tr>
               <tr class="tag_info" style="margin-bottom:5px">
               <td colspan="3" height="20px" style="padding-left:10px;" >
                <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;">                                 
                 <label>数据月份：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;height:30px">
                      <s:property value="mon" />
                  </div>
                  </td>
              </tr>
              </s:else>
              <tr>
                <td colspan="3"  valign="top" style=" font: bold; height:30px;margin-top:5px;">客户群基本属性</td>
              </tr>
              <tr>
                <td colspan="3" height="20px" style="padding-left:10px;" >
                 <div style="float:left;margin-left:5px;margin-right:5px">                                 
                 <label>用户地域：</label>
                 </div>
                 <s:if test="%{#session.regionId==1}">
                 <div style="float:left;margin-left:5px;margin-right:5px">
                  <select id="cityName" class="easyui-combobox" name="region" style="width:240px; height:25px" ></select><br/>
				  <span style="color:#FF0000">说明：省与地市不可同时选择</span>
                  </div>
                 <div style="float:left;margin-left:5px;margin-right:5px;display:none">
                  <select id="countyName" class="easyui-combobox" name="state" style="width:120px;height:25px"> 
                  </select>
                  </div> 
                  </s:if>
                  <s:else>
                  <div style="float:left;margin-left:5px;margin-right:5px;display:none">
                  <select id="cityName" class="easyui-combobox" name="region" style="width:120px; height:25px" ></select>
                  </div>
                 <div style="float:left;margin-left:5px;margin-right:5px">
                  <select id="countyName" class="easyui-combobox" name="state" style="width:240px;height:25px;" > 
                  </select>
				  <br/>
				  <span style="color:#FF0000">说明：地市与所属区县不可同时选择</span>
                  </div> 
                  </s:else>             
                  <div style="float:left;margin-left:5px;margin-right:5px">
                  <label>用户状态：</label>
                  </div>
                  <div style="float:left;margin-left:5px;margin-right:5px">
                  <select id="userState" class="easyui-combobox" name="state" style="width:120px;height:25px" panelHeight="auto">
                    <option value="ALL">全部</option>
                    <option value="US10" selected>正常使用</option>
                    <option value="US30">停机</option>
                    <option value="US34">欠费</option>
                    <option value="US2">离网</option>
                    <option value="US5">其他</option>   
                  </select>
                  </div>
                  </td>
              </tr>
 <!--             <tr style="display:none">
                <td style=" font: bold; height:40px;" colspan="3">过滤名单</td>
              </tr>
              <tr>
                <td colspan="3"  height="40px" style="padding-left:10px; "  >    
                <form   method="post" id="form1" enctype="multipart/form-data" name="form1" >            
                <table width="100%" border="0" cellspacing="0" cellpadding="2">
                    <tr style="display:none">
                      <td width="65px;">名单类型：</td>
                      <td width="120px"><select id="usertype" class="easyui-combobox" name="state" style="width:120px;height:25px">
                          <option value="白名单">白名单</option>
                          <option value="黑名单" >黑名单</option>
                          <option value="红名单">红名单</option>
                        </select></td>
                      <td width="200px"><input  id="file" type="file" name="file" onChange="filecheckmethod(this)"   value="选择上传文件" style="width:200px; height:25px;border:1px solid  #CCC;"></td>
                      <td  width="80px"><a id="tag_uplod" href="javascript:void(0)" >上传</a> <!--<span id="tag_uplod" class="blue_button" >上传</span</td>
                      <td  align="left">&nbsp;</td>
                    </tr>
                  </table>
                  </form>
                  </td>
              </tr> >-->
              <tr>
                <td style=" font: bold; height:30px;" colspan="3">自定义标签属性</td>
              </tr>
              <tr>
                <td valign="top" style="padding-left:10px; "  height="300px;"><table  width="700px" border="0" height="300px;" cellspacing="0" cellpadding="10">
                    <tr>
                      <td rowspan="3" align="left"><table id="attr_table_edit" width="700px;"  height="300px" border="1" cellspacing="0" cellpadding="0" >
                          <tr height="25px;">
                            <td style="color:#FFF; background:#094AB2;font:bold;">&nbsp;属性编辑</td>
                          </tr>
                          <tr>
                            <td width="700px;" height="300px;"><div id="attr_table_filter" style="overflow:auto; height:300px; width:700px;;">
<!-- 属性编辑条件框-->                            
                            




</div>





                            
                                <table id="attr_table_filter1" width="680px" border="0" cellspacing="0" cellpadding="5">
<input type="hidden"  value="<s:property value='jsonAttr' />" id="jsonAttr"    />                    
                                        

                            </table>
                              </div>
                              </td>
                          </tr>
                        </table>
                        
                        
                        
                        
                        </td>
                      <td width="80px" align="center"><img src="./img/persons.png" width="66" height="146"></td>
                    </tr>
                    <tr>
                      <td align="center" id="persons_td"> <s:property value="count"/>人</td>
                    </tr>
                    <tr>
                      <td valign="bottom" ><div><a id="tag_detail_bt3" href="javascript:void(0)" >客户筛选</a></div><br/>                    
                      <div><a id="tag_detail_bt2" href="javascript:void(0)">条件保存</a>
                      </div><br/> 
                      <div><a id="tag_detail_bt1" href="javascript:void(0)">清单导出</a></div></td>
                    </tr>
                  </table>

</td>
              </tr>


              
                           
            </table>
            
          </td>
          
          <!-- END标签显示内容框
    ================================================== -->
          
          <td height="100%" style="background:url(./img/rightborder.png) repeat-y"></td>
        </tr>
        <tr>
          <td width="24px" height="24px" style="background:url(./img/leftdown.png)"></td>
          <td  width="100%" style="background:url(./img/downborder.png)  repeat-x"></td>
          <td width="24px" height="24px" style="background:url(./img/rightdown.png)"></td>
        </tr>
      </table></td>
  </tr>
</table>
<!--
<!-- 属性标签显示边框
    ================================================== -->
<div id="attr_edit_div">
  <div id="serch_attr_div"></div>
  <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="5">
    <tr>
      <td>属性选择：</td>
    </tr>
    <tr><td style="padding-left:10px"><div style=" float:left; padding-right:10px; border:solid #CCC 1px; height:28px"><input id="attr_text" type="text" style=" width:383px;border-width: 0px;"></div><div style="float:left"><a id="attr_serch_bt" href="javascript:void(0)">搜索</a></div>
</td></tr>
    <tr><td><div class="line" style="width:100%" >&nbsp;</div></td></tr>
    <tr>
      <td height="100%" width="100%"  ><div  style="width:100%; height:320px; overflow:auto">
          <table id="attrs_list" width="100%" height="100%" border="0" cellspacing="0" cellpadding="5">
          </table>
        </div></td>
    </tr>
    <tr>
      <td align="right" style=" padding-right:10px"><a id="close_bt" href="javascript:void(0)" >关闭</a></td>
    </tr>
  </table>

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
    <td valign="top" width="65px"><label>导出字段&nbsp;&nbsp;:</label></td>
    <td style=" padding-left:2px;"; align="left"> 
      <input name="电话号码" type="checkbox" value="PHONE_NO"  id="check">电话号码
      <input name="品牌" type="checkbox" value="E.BRAND_DESC"  id="check">品牌
      <input name="归属地市" type="checkbox" value="F.REGION_NAME"  id="check">归属地市
      <input name="归属县区" type="checkbox" value="B.REGION_NAME"  id="check">归属县区  <br>
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

</body>
<script>
$(function(){


    $("#attr_table_filter").append($("#attr_table").val());	
	$.parser.parse($("#attr_table_filter"));
	var userId="<%=request.getAttribute("userId") %>";
    var regionId=$("#req_reson").val();
    var href="<%=request.getAttribute("hre") %>";
    var group_name="<%=request.getAttribute("title") %>";
    var id="<%=request.getAttribute("id") %>";
    var lvl_id="<%=request.getAttribute("lvl_id") %>";
    var starttime="<%=request.getAttribute("starttime") %>";
    var endtime="<%=request.getAttribute("endtime") %>";
    var group_type="<%=request.getAttribute("type") %>";
    var tag_sql="";  //客户群SQL
    var list_count="";    //客户群人数
    var tag_id;
    var regions="";
    var re="";
    var countys="";
    var con="";
    var html_start="";
    var html_body="";
    var html_end=""; 
    var html_tr_body="";
    var tag_id="";
    var tag_name="";
  /*if($.trim($("#tag_name").text()).length<=1){
     $(".tag_info").css("display","block");
 }else{
     $(".tag_info").css("display","none"); 
 }*/
 	
	

	
	
 //    alert(regionId);

   function  myfomatter(date) {
	        var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+(m<10?('0'+m):m)+(d<10?('0'+d):d);
 //           return y+"年"+m+"月"+d+"日";
		};
var myDate = new Date();
 var yesterday_milliseconds=myDate.getTime()-1000*60*60*24;
 var yesterday = new Date();
 yesterday.setTime(yesterday_milliseconds);
 var year = myDate.getFullYear();
			var mon = myDate.getMonth()+1;
			var day = myDate.getDate();
			var value = year+(mon<10?('0'+mon):mon)+(day<10?('0'+day):day);

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
   
    	//获取城市名称
$("#cityName").combobox({
				  url:'getCityName.action',
				  editable:true,
				  valueField:'id',
				  textField:'text',
				  panelHight:'auto',
				  panelWidth:120,
				  editable:true,
				  multiple:true,
				  onSelect:function(){
				   //
				/*   if($("#cityName").combobox("getValue")==1){
				      alert("省与地市不可同时选择，选择地市前请删除省");
				      $("#cityName").combobox("setValue","1");
				   }*/
				  var resTexts=$("#cityName").combobox("getText");
				  var resText_Array=resTexts.split(",");
				  var lengths=resTexts.length-3;
				  if (resText_Array.length=1 && resText_Array[0]=="河北省"){
				     var resTemp0=resTexts.replace("河北省,","");
				  	 $("#cityName").combobox("setText",resTemp0);
				  }else if (resTexts.indexOf("河北省")<lengths){
				      var resTemp=resTexts.replace("河北省,","");
				     $("#cityName").combobox("setText",resTemp);
					 
				  }else if (resTexts.indexOf("河北省")==lengths  ){
				      var resTemp1=resTexts.replace(",河北省","");
				     $("#cityName").combobox("setText",resTemp1);
				  }else{
				  	 var resTemp2=resTexts.replace("河北省,","");
				     $("#cityName").combobox("setText",resTemp2);
				  }
				  
				   /*
				 var res=String($("#cityName").combobox('getValues')).split(",");
				 
				
				  for (i=0;i<res.length;i++){
				      if(res[i]!=1){
				       //alert("省与地市不可同时选择，选择地市前请删除省");
				       
				      }else{
					 	//$("#cityName").combobox("setValue","1");
					  }
				  };*/
				  // $("#cityName").combobox("setValue",Text);
				  }
				  
		  
				 });
$("#cityName").combobox("setValue",regionId);
 //$("#cityName").combobox("setText","河北省");				 

				 		  
$("#countyName").combobox({
				url:'getCountyName.action',
				valueField:'id',
				panelHeight:'200',
				editable:true,	
				textField:'text',
				multiple:true,
				onSelect:function(){
			            var cuys=String($("#countyName").combobox('getValues')).split(",");
			            for (i=0;i<cuys.length;i++){
				             if(cuys[i]==regionId ){
				                 alert("地市与所属区县不可同时选择，选择区县前请删除地市");
				                 $("#countyName").combobox("setValue",regionId);
				              }
				        };
						
						/*
					  var resTexts=$("#countyName").combobox("getText");
					  var resText_Array=resTexts.split(",");
					  
					  var lengths=resTexts.length-3;
					  if (resText_Array.length=1 && resText_Array[0]=="河北省"){
						 var resTemp0=resTexts.replace("河北省,","")
						 $("#cityName").combobox("setText",resTemp0);
					  }else if (resTexts.indexOf("河北省")<lengths){
						  var resTemp=resTexts.replace("河北省,","")
						 $("#cityName").combobox("setText",resTemp)
						 alert("2");
					  }else if (resTexts.indexOf("河北省")==lengths  ){
						 alert("3");
						  var resTemp1=resTexts.replace(",河北省","")
						 $("#cityName").combobox("setText",resTemp1)
					  }else{
						alert("4");
						 var resTemp2=resTexts.replace("河北省,","")
						 $("#cityName").combobox("setText",resTemp2)
					  }
					  */
			    }
          });	
 $("#countyName").combobox("setValue",regionId);

////////////////////////////////////
      $("#tag_detail_bt1").click(
     function(){
       if(list_count==0){
       alert("请重新筛选用户！");
       }else if(tag_id=="null" || tag_id.length==0)
       {
        alert("导出前请保存条件！")
         } else{
       	var offset1 = $("#tag_detail_bt1").offset();
  //     	alert(offset1.left);
 //      $("#download_div").css("display","block");
       $("#download_div").css({
			 "display":"block",
	         "left":(parseInt(offset1.left)-440)+"px",
	         "top":(parseInt(offset1.top)-120)+"px"			 
			 });
     }
     }); 
     $("#no").click(
     function(){
       $("#download_div").css("display","none");
     });
       $("#yes").click(
     function(){
       var str="";
       var col_name="";
  //     alert(list_count);
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
       $("#download_div").css("display","none");
       
      
        id=tag_id;
        if(userId==""){
           userId= $("#req_userId").val();
        }
        
           group_name=tag_n;
        

           $.ajax({
    		type: 'POST',
    		url: 'downaddinfo.action',
    		data:{tag_name:group_name,count:list_count,sql:tag_sql,id:id,col:str,col_desc:col_name,type:"group_list",region_name:$("#cityName").combobox('getText'),flag:'1'},
    		dataType:"text", 
    		success: function(data){
    		var href="querydown.action?userId="+userId;
             window.location.href=href; 
             $("#wait_div").show(); 
             $("#load_div").show();
            },
   			error: function(data){
     		
     		return false;
    		}
    	});	
    $(window.parent.document).find("#left_menu_table tr:eq(4)").css("background","");	
    $(window.parent.document).find("#left_menu_table tr:eq(5)").css("background","#d4d4d4");	
    	
          
     })
/////////////////////////////////////////

//活动htmlbody
$.extend({'gethtmlbody':function(type,attrs_table){	
var body_html="";
if(type==0){
body_html=	"<div style='float:left; padding-left:5px;line-height:32px; margin-top:3px; '>"
+			"<select class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+                                "<option value='>=' selected>大于等于</option>"
+                                "<option value='<=' >小于等于</option>"
+                                "<option value='<' >小于</option>"
+                                "<option value='>' >大于</option>"
+                                "<option value='='>等于</option>"
+                        "</select></div>"
+	           "<div style='float:left;padding-left:5px;line-height:32px; margin-top:2px; '><input id='tag_name_txt' type='text'  value='0.00' style='width:140px; height:25px;border:1px solid  #CCC; '></div>";	
}
else if(type==1){
body_html="<div style='float:left; padding-left:5px; margin-top:3px; '>"
+			"<select class='easyui-combobox' name='state' style='width:225px;height:25px' panelHeight='100'"
+       " data-options='valueField:\"id\",textField:\"text\",url:\"getAttrTableAction.action?table_name="+attrs_table+"\" ' >"
+                        "</select></div>";	

}
else if(type==2){
body_html=	"<div style='float:left; padding-left:5px; margin-top:3px;'>"
+			"<select class='easyui-combobox' name='state' style='width:225px;height:25px' panelHeight='auto' >"
+                                "<option value='1' selected>是</option>"
+                                "<option value='0' >否</option>"
+                        "</select></div>";
	
}
else if(type==3){
body_html="<div style='float:left; padding-left:5px; margin-top:3px;'>"
+			"<select class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+                                "<option value='like' selected>模糊</option>"
+                                "<option value='=' >等于</option>"
+                        "</select></div>"
+	           "<div style='float:left;padding-left:5px; margin-top:3px;'><input id='tag_name_txt' type='text'  value='' style='width:140px; height:25px;border:1px solid  #CCC; '></div>";	
}

return body_html;
		}}); 
///////////////////////////////		
//添加同类属性事件
$.extend({'addSameAttr':function(attr_tr){ 
		var strs= new Array(); 
		strs=attr_tr.replace("_tr","").split("&"); 
		var attrs_id=strs[0];	
	    var attrs_name=strs[1];	
	    var attrs_type=strs[2];	
	    var attrs_table=strs[3];
		var attrs_group=strs[4];	
		var attrs_tr=(attrs_group).replace("group","tr");
		var html_body="";
			if(attrs_type=="连续型"){html_body=$.gethtmlbody(0,attrs_table);}
			if(attrs_type=="码表"){html_body=$.gethtmlbody(1,attrs_table);}
			if(attrs_type=="是否码表"){html_body=$.gethtmlbody(2,attrs_table);}
			if(attrs_type=="其他"){html_body=$.gethtmlbody(3,attrs_table);}	
		

						
var html_tr_body="<div  style='height:32px; line-height:32px; padding-left:5px;'>"
+                "<div style='float:left;width:280px;color:#094AB2' title='"+attrs_id+"'>"+attrs_name+"</div>"
+ html_body
+                "<div style='float:left;line-height:32px; margin-top:3px;  padding-left:5px; visibility:hidden;'><select class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+			"<option value='and' selected>并且</option>"
+			"<option value='or' >或者</option>"
+                  "</select></div>"
+	 "<div style='float:left; width:70px;'><img src='./img/attrs/add2.png' title='添加同类条件' style='cursor:pointer;' width='32px' height='32px' onClick='$.addSameAttr(\""+attrs_id+"&"+attrs_name+"&"+attrs_type+"&"+attrs_table+"&"+attrs_group+"_tr\")'><img id='"+attrs_id+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合' onClick='$.deletrAttr(this,0,\""+attrs_type+"\",\""+attrs_group+"\")' style='cursor:pointer;' ></div></div><div style='clear:both'></div>"  
;		        
            if($("#"+attrs_tr).children().size()>0){
				if(attrs_type=="连续型" || attrs_type=="其他"){
				$("#"+attrs_tr).children(":last").prev().children(":eq(3)").css("visibility","visible");
				$("#"+attrs_tr).children(":last").prev().children(":eq(3)").find('select').combobox("setValue","and");}
				else{
			   	$("#"+attrs_tr).children(":last").prev().children(":eq(2)").css("visibility","visible");
				$("#"+attrs_tr).children(":last").prev().children(":eq(2)").find('select').combobox("setValue","and");	
				}
                 
			}

			   $("#"+attrs_tr).append(html_tr_body);
			   $.parser.parse($("#"+attrs_tr)); 
		}});
/////////////////////////////


		
	
//读取筛选条件   
 var old_attr_id="0";
 var old_group_tr_id="0";
 var old_attr_name="";
 var old_attr_type="";
 var old_attr_table="--";
 var old_value_type="";
 var old_attr_value="";
 var body_attr=""; 
 var edit_tr="";   				
 var jsonarry = $.parseJSON($("#jsonAttr").val());

 $.each(jsonarry, function(i,attr){ 

		var bt_id=attr.attr_tr_id;
		if(attr.attr_id=="CITY_ID")
		{ 
			$("#cityName").combobox("setValues",attr.attr_value1);	
;}		
	    if(attr.attr_id=="COUNTY_ID")
		{	  
		
			$("#countyName").combobox("setValues",attr.attr_value1);	
;}
		if(attr.attr_id=="SUBS_STAT")
		{	   
			$("#userState").combobox("setValue",attr.attr_value1);	
;}			
			
/////////////////////////////////////////////////////////////////////////////////////////////////						   
		  if (attr.attr_id!="CITY_ID"&&attr.attr_id!="COUNTY_ID"&&attr.attr_id!="SUBS_STAT"&&attr.attr_id!="BRAND_ID"){	
			   if(old_group_tr_id!=attr.group_id){
				     old_group_tr_id=attr.group_id;
				 	 old_attr_id=attr.attr_id;
					 old_attr_name=attr.attr_name;
					 old_attr_type=attr.attr_type;
					 old_attr_table=attr.attr_table;
html_start="<div id='"+attr.group_id+ "' title='"+attr.attr_id+"_group'  style='float:left;'>"                                                    
+    "<div style='margin-left:5px;  margin-top:5px; width:675px;  border-top:1px solid #CCC;border-left:1px solid #CCC;border-right:1px solid #CCC; height:32px; line-height:32px;'>"
+	 "<div style='float:left; padding-left:5px; width:520px'>条件组合</div>"
+	 "<div style='float:left;width:80px; line-height:32px; margin-top:3px; visibility:hidden;'>"
+	      "<select class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+                      "<option value='and' selected>并且</option>"
+                      "<option value='or' >或者</option>"
+              "</select></div>"
+	 "<div style='float:left; width:70px;'><img id='"+old_attr_id+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attrs_type+"\",\""+attrs_name+"\")'><img id='"+old_attr_id+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\""+attr.group_id+"\")'></div>"     
+     "</div>"                     

+     "<div style=' float:left;  margin-left:5px; width:675px;  border:1px solid #CCC' >"
+        "<div id='"+attr.attr_tr_id+"' title='"+old_attr_name+"&"+old_attr_type+"&"+old_attr_table+"' style='float:left;   width:100%;'>"
+             "<div  style='height:32px;line-height:32px;padding-left:5px;'>"
+                "<div style='float:left;width:280px;color:#094AB2' title='"+old_attr_id+"'>"+old_attr_name+"</div>";
	
html_end="<div style='float:left;line-height:32px; margin-top:3px; padding-left:5px;visibility:hidden;'><select class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+			"<option value='and' selected>并且</option>"
+			"<option value='or' >或者</option>"
+                  "</select></div>"
+	 "<div style='float:left; width:70px;'><img src='./img/attrs/add2.png' title='添加同类条件' style='cursor:pointer;' width='32px' height='32px' onClick='$.addSameAttr(\""+old_attr_id+"&"+old_attr_name+"&"+old_attr_type+"&"+old_attr_table+"&"+attr.group_id+"_tr\")'><img id='"+old_attr_id+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合' onClick='$.deletrAttr(this,0,\""+old_attr_type+"\",\""+attr.group_id+"\")'  style='cursor:pointer;' ></div>"   

+	      "</div><div style='clear:both'></div>"
+         "</div>"
+     "</div>"
+"</div>"
+"<div style='clear:both'></div>";

if(old_attr_type=="连续型"){
body_attr=$.gethtmlbody(0,"--");			
}
if(old_attr_type=="其他"){
body_attr=$.gethtmlbody(3,"--");		
}
if(old_attr_type=="码表"){
body_attr=$.gethtmlbody(1,old_attr_table);		
}
if(old_attr_type=="是否码表"){
body_attr=$.gethtmlbody(2,"--");	
}
if(old_attr_id!="0"){
  $("#attr_table_filter").append(html_start+body_attr+html_end);	
  $.parser.parse("#"+attr.group_id);}				   
			   }else{

  $.addSameAttr(old_attr_id+"&"+old_attr_name+"&"+old_attr_type+"&"+old_attr_table+"&"+attr.group_id+"_tr");
				   
			   }				 	  
		  } 			  
///////////////////////////////////////////////////////////////////////////////////////////////		  		  
 });
//生成读取条件的值
old_attr_id="0";
old_group_tr_id="0";
var tr_index=0;
var jsonarry1 = $.parseJSON($("#jsonAttr").val());

 $.each(jsonarry1, function(i,attr){  
	if(attr.attr_id!="CITY_ID"&&attr.attr_id!="COUNTY_ID"&&attr.attr_id!="SUBS_STAT"&&attr.attr_id!="BRAND_ID"){
 	if(old_group_tr_id!=attr.group_id){
		             old_group_tr_id=attr.group_id;
				 	 old_attr_id=attr.attr_id;
					 old_attr_name=attr.attr_name;
					 old_attr_type=attr.attr_type;
					 old_attr_table=attr.attr_table;
					 edit_tr=attr.group_id;
					 var attr_from=$.trim(attr.attr_from);
					 if(attr_from=="and"||attr_from=="or"){
						 $("#"+attr.group_id).children(":eq(0)").children(":eq(1)").find('select').combobox("setValue",attr_from);
						 $("#"+attr.group_id).children(":eq(0)").children(":eq(1)").css("visibility","visible");}
					  var tr_child=$("#"+attr.group_id).children(":eq(1)").children(":eq(0)");
					  var element=$(tr_child).children(":eq(0)"); 
					  var attr_lvl=$.trim(attr.attr_lvl);
					  if(old_attr_type=="连续型"){						  
						  if(attr_lvl=="and"||attr_lvl=="or"){
							element.children(":eq(3)").css("visibility","visible");}
							element.children(":eq(3)").find('select').combobox("setValue",attr_lvl);
							element.children(":eq(1)").find('select').combobox("setValue",$.trim(attr.attr_value_type1));
							element.children(":eq(2)").children().val(attr.attr_value1);
					  }
					  if(old_attr_type=="其他"){
						  if(attr_lvl=="and"||attr_lvl=="or"){
							element.children(":eq(3)").css("visibility","visible");}															                            element.children(":eq(3)").find('select').combobox("setValue",attr_lvl);
							element.children(":eq(1)").find('select').combobox("setValue",$.trim(attr.attr_value_type1));
							element.children(":eq(2)").children().val(attr.attr_value1.replace("'","").replace("%","").replace("'","").replace("%",""));  
						  
					  }						 
					  if(old_attr_type=="码表"){
						  if(attr_lvl=="and"||attr_lvl=="or"){
							element.children(":eq(2)").css("visibility","visible");}						                            element.children(":eq(2)").find('select').combobox("setValue",attr_lvl);                  
							element.children(":eq(1)").find('select').combobox("setValue",attr.attr_value1.replace("'","").replace("'",""));           
						  
					  }
					  if(old_attr_type=="是否码表"){
						  if(attr_lvl=="and"||attr_lvl=="or"){
							element.children(":eq(2)").css("visibility","visible");}						                            element.children(":eq(2)").find('select').combobox("setValue",attr_lvl);                  
							element.children(":eq(1)").find('select').combobox("setValue",attr.attr_value1.replace("'","").replace("'","")); 
					  }
			  		  tr_index=2;		 
					
	  }else{
		              var tr_child=$("#"+attr.group_id).children(":eq(1)").children(":eq(0)");
					  var element=$(tr_child).children(":eq("+tr_index+")"); 
					  var attr_lvl=$.trim(attr.attr_lvl);
					  if(old_attr_type=="连续型"){						  
						  if(attr_lvl=="and"||attr_lvl=="or"){
							element.children(":eq(3)").css("visibility","visible");}
							element.children(":eq(3)").find('select').combobox("setValue",attr_lvl);
							element.children(":eq(1)").find('select').combobox("setValue",$.trim(attr.attr_value_type1));
							element.children(":eq(2)").children().val(attr.attr_value1);
					  }
					  if(old_attr_type=="其他"){
						  if(attr_lvl=="and"||attr_lvl=="or"){
							element.children(":eq(3)").css("visibility","visible");}															                            element.children(":eq(3)").find('select').combobox("setValue",attr_lvl);
							element.children(":eq(1)").find('select').combobox("setValue",$.trim(attr.attr_value_type1));
							element.children(":eq(2)").children().val(attr.attr_value1.replace("'","").replace("%",""));  
						  
					  }						 
					  if(old_attr_type=="码表"){
						  if(attr_lvl=="and"||attr_lvl=="or"){
							element.children(":eq(2)").css("visibility","visible");}						                            element.children(":eq(2)").find('select').combobox("setValue",attr_lvl);                  
							element.children(":eq(1)").find('select').combobox("setValue",attr.attr_value1);           
						  
					  }
					  if(old_attr_type=="是否码表"){
						  if(attr_lvl=="and"||attr_lvl=="or"){
							element.children(":eq(2)").css("visibility","visible");}						                            element.children(":eq(2)").find('select').combobox("setValue",attr_lvl);                  
							element.children(":eq(1)").find('select').combobox("setValue",attr.attr_value1); 
					  }	
		 tr_index=tr_index+2; 
	  }
	}
 });
 ////////////////////////////////////////////////////////////////////////////////////////// //条件组合赋值
     $.extend({'readattr':function(index){

		 	
}});
 
   	var initCityName=$("#cityName").combobox("getValue");
	var initCountyName=$("#countyName").combobox("getText");
	if (initCityName==""){
		$("#cityName").combobox("setValue","ALL");	
	}
	if(initCountyName==""){
	
		$("#countyName").combobox("setValue","ALL");
	}	


//属性查询事件
var oldtext="";
$("#attr_text").keyup(function(){
	if($(this).val()!=oldtext){
  		//alert($(this).val());
		//oldtext=$(this).val();
		
	  var type1="";//一级属性类
	  var type2=encodeURI($("#attr_text").val());//二级属性类
	  var type11="";  		
	  $.third_attr_panel_tishi('2',type1,type2,type11);	
  
	}	
});

//属性组合keup事件
$("#grouptext").keyup(function(event){



	 //sel = document.selection.createRange();
	  
     //sel.text = "ssss"; 
	
});

//属性组合框单属性点击事件
$.extend({'attr_click':function(even){
	    $("#group_text_div").hide();
		var html="<div style='float:left; height:40px;width=100px;margin-left:5px;border:1px soild;'>"+$(even).text()+"</div>";
		$("#grouptext").append(html);
		//$("#grouptext").focus();		
		//sel = document.selection.createRange();	 
       // sel.text = $(even).text(); 
	
}});
 
 
    //导出客户标签
    $("#tag_detail_bt1").click(function(){
    });
   //群体筛选
   	$("#tag_detail_bt3").click(function(){	

	    document.getElementById("wait_div").style.display="block";
	    document.getElementById("wait_div").style.filter="alpha(opacity=20)";

		var attrs= $.attr_build();
		$("#load_div").show();

		if(attrs==null){$("#wait_div").hide(); $("#load_div").hide(); }
		var sql =encodeURI(attrs[0]);

	  	 	$.ajax({
	    		type: 'POST',
	    		url: 'filterTagCounts.action',
	    		data:{sql:sql},
	    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
	    		success: function(data){  
	    		list_count=data; 
	    			$("#persons_td").text(data+'人'); 
					$("#wait_div").hide(); 
					$("#load_div").hide(); 
					re="";
					con="";
					regions="";

	            },
	   			error: function(data){
	     		alert("客户群筛选失败"); 
				$("#wait_div").hide(); 
				$("#load_div").hide(); 
				re="";
			    con=""; 
	     		return false;
	    		}
	    	});	
		
	});

//群体条件保存	
      $("#tag_detail_bt2").click(function(){
    var start =$("#create_tag_date").datebox("getValue");
	var end =$("#end_tag_date").datebox("getValue");
	//alert(start);
	//alert($("#tag_name").text().length);
/*	if(start.length==0 || end.length==0 ){
	alert("时间均不能为空");
	}else{*/
            var myDate = new Date();
            var year = myDate.getFullYear();
			var mon = myDate.getMonth()+1;
			var day = myDate.getDate();
			var hour= myDate.getHours();
			var minute= myDate.getMinutes();
			var second= myDate.getSeconds();
			var value = year+(mon<10?('0'+mon):mon)+(day<10?('0'+day):day)+(hour<10?('0'+hour):hour)+(minute<10?('0'+minute):minute)+(second<10?('0'+second):second);		
   		    if(group_type!=1){
   		    tag_id=value+$("#req_userId").val();
   		        }else{
   		     tag_id=id;   
   		      }

   		   if(group_type!=1){
		    tag_n=$("#tag_name_text").val();
		   }else{
		     tag_n=$("#tag_name").text();
		   }

		   if(group_type==1){
		          start=starttime;
		   }else{
		          start=$("#create_tag_date").datebox("getValue");
		   }

		   if(group_type==1){
		          end=endtime;
		   }else{
		          end=$("#end_tag_date").datebox("getValue");
		   }

	//	   alert(start);
		 if(start==null || end==null || start.length==0 || end.length==0){
		      alert("请选择起始时间!")
		 }else if(tag_n=='请输入客户群名称'){
		      alert("请输入客户群名称！")
		 }else{

   		var b= $.attr_build();	
        var sql =encodeURI(b[0]);
   	    document.getElementById("wait_div").style.display="block";
	    document.getElementById("wait_div").style.filter="alpha(opacity=20)"; 
		$("#load_div").show();
		var subs_count =$.trim($("#persons_td").text());
	    if(subs_count!="人"){
		if(b==null){$("#wait_div").hide(); $("#load_div").hide(); }
				$.ajax({
	    		type: 'POST',
	    		url: 'updateGroupTag.action',
	    		data:{tag_id:tag_id,tag_attrs:encodeURI(b[2]),stamt:encodeURI(b[1]),persons:encodeURI($("#persons_td").text()),sql:sql,create_time:start,end_time:end,tag_introduce:encodeURI($("#tag_introduce").val()),tag_name:encodeURI(tag_n),type:((group_type==1)?1:0),share:((group_type==0)?0:1)},
	    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
	    		success: function(data){ 
				    $("#wait_div").hide();   
				    $("#load_div").hide(); 
	    			alert("客户群筛选条件保存成功");  
	//				$(window.parent.document).find("#iframe").attr("src","TaginfoAction.action?userId="+userId);	          
	            },
	   			error: function(data){
	     		alert("客户群筛选条件保存失败");
				$("#wait_div").hide(); 
				$("#load_div").hide();    
	     		return false;
	    		}
	    	});
			}
				else{
					alert("请筛选客户群人数");
					$("#wait_div").hide(); 
				    $("#load_div").hide();
			}	
		
			}
	});
//文件上传
    $("#tag_uplod").click(function(){
	   var usertype=$("#usertype").combobox('getValue');
	   var filename=$("#file").val();
 //      var tag_id=$("#tag_id").val();
       alert(usertype);
  	   if (filename==""){
	   alert('上传文件不能为空');
	   return false;		  
       }   
       
	 $.ajaxFileUpload({	

	  url:"importUser.action?list_type="+encodeURI(encodeURI(usertype))+"&tag_id="+tag_id,
	  secureuri:false,
	  fileElementId:'file',//input框的ID
	  dataType: 'text',//返回数据类型
	  beforeSend:function(){//上传前需要处理的工作，如显示Loading...

	  },
	  success: function (data, status){//上传成功	    
	      alert('上传成功！');//从data中获取数据，进行处理	   
	  }
	});   

	});
	
	var index_img=1;
	$(".attr_table:odd").css("background","#EAEAEA");
    $("#hidde_bt1").click(function(){
		
		  if(index_img==1){
		 $("#hidde_bt1").attr("src","./img/bt20.png");
		 $("#hidde_bt2").attr("src","./img/bt21.png");
		 $(".attr_tr").css("display","block");
		 index_img=2;
		 }
		 else{
		 $("#hidde_bt1").attr("src","./img/bt10.png");
		 $("#hidde_bt2").attr("src","./img/bt11.png");
		 $(".attr_tr").css("display","none");
		 index_img=1;			 			 
		 }
	});
	
	$("#hidde_bt2").click(function(){
		  if(index_img==1){
		 $("#hidde_bt1").attr("src","./img/bt20.png");
		 $("#hidde_bt2").attr("src","./img/bt21.png");
		 $(".attr_tr").css("display","block");
		 index_img=2;
		 }
		 else{
		 $("#hidde_bt1").attr("src","./img/bt10.png");
		 $("#hidde_bt2").attr("src","./img/bt11.png");
		 $(".attr_tr").css("display","none");
		 index_img=1;			 			 
		 }
	});

//生成三级属性面板内容
    $.extend({'third_attr_build':function(data,type11){		    
		    var table_str=""; 		  
			$("#attrs_list").children().remove();			
			$.each(data,function(i,table){				
				$.each(table,function(l,tr){
				    table_str=table_str+("<tr>");
				  $.each(tr,function(k,td){
					//atrs 说明 0 属性类型   1 属性名称  2 属性   3 属性id  4 一级属性
					var atrs=td.attr_type+"&"+td.attr_name+"&"+td.attr_table+"&"+td.attr_id+"&"+type11;		
						
					table_str=table_str+("<td valign='top' style='cursor: pointer;'  onClick=$.edit_attr('"+atrs+"')  ><img src='./img/jiaattr.png' width='16' height='16' style='cursor: pointer;'> "+td.attr_name+"</td>");  
					});
					table_str=table_str+("</tr>");										 
				});
			});	
			$("#attrs_list").html(table_str);
			var set=$("#main_attr_table").offset();	
			$("#attr_edit_div").css({
				"display":"block",
				"left":(parseInt(set.left)+210)+"px",
				"top":(parseInt(set.top)+10)+"px"
				});				
		}
      });
//生成三级属性面板
    $.extend({'third_attr_panel_build':function(value_type,type1,type2,type11){	  	
	  $.ajax({
    		type: 'POST',
    		url: 'listAttrTagAction.action',
    		data:{type_1:value_type,type_2:type2},
    		dataType:'json', 
    		success: function(data){ 
            $.third_attr_build(data,type11);
            },
   			error: function(data){
            alert(data);
     		return false;
    		}
    	});			
		
	}
	});

//生产三级属性查询提示框面板
    $.extend({'third_attr_panel_tishi':function(value_type,type1,type2,type11){	
	  $.ajax({
    		type: 'POST',
    		url: 'listAttrTagAction.action',
    		data:{type_1:value_type,type_2:type2},
    		dataType:'json', 
    		success: function(data){ 
		    var table_str=""; 		    
			$("#serch_attr_div").children().remove();			
			$.each(data,function(i,table){				
				$.each(table,function(l,tr){
				  $.each(tr,function(k,td){
					//atrs 说明 0 属性类型   1 属性名称  2 属性   3 属性id  4 一级属性		
					table_str=table_str+"<div class='attr_tishi_div' onClick='$.attr_tishi(this)' onMouseover='$.attr_tishi_over(this)' onMouseOut='$.attr_tishi_out(this)'  >"+td.attr_name+"</div> ";  
					});								 
				});
			});	

			$("#serch_attr_div").html(table_str);
			$("#serch_attr_div").css("display","block");	

            },
   			error: function(data){
            alert(data);
     		return false;
    		}
    	});			
		
	}
	});
//提示框点击事件
    $.extend({'attr_tishi':function(evet){	
	  $("#attr_text").val($(evet).text());
	  $("#serch_attr_div").hide();
	
	}});
//提示框移出移入变化
    $.extend({'attr_tishi_over':function(evet){	
	  $(evet).css('color','#06F');	
	}});
	
    $.extend({'attr_tishi_out':function(evet){	
	  $(evet).css('color','#CCC');	
	}});
	  	
//生成三级属性事件   
	$(".attr_item_div").click(function(){
      var type1=encodeURI($(this).parent().children(":eq(1)").text());//一级属性类
	  var type2=encodeURI($(this).attr("title"));//二级属性类
	  var type11=$.trim($(this).parent().children(":eq(1)").text());  		
	  $.third_attr_panel_build('1',type1,type2,type11);	
	});

//生成搜索三级属性事件
	$("#attr_serch_bt").click(function(){
	  var type1="";//一级属性类
	  var type2=encodeURI($("#attr_text").val());//二级属性类
	  var type11="";
	  $("#serch_attr_div").hide();  		
	  $.third_attr_panel_build('2',type1,type2,type11);	
	  
});
	
	//鼠标覆盖元素  ywz  20130521
	$(".attr_item_div").mouseenter(function(){		 
		 $(this).css({
			'color':'#000', 
			'cursor':'pointer'
		 });
	});
	//鼠标离开元素  ywz  20130521
	$(".attr_item_div").mouseleave(function(){		 
		 $(this).css({
			'color':'#666'			
		 });
	});
	
	
	//客户群属性生成
    $.extend({'attr_build':function(){
		  var attr_index=0;
		  var tag_attr_info_city=new Object();    //地市属性
		  var tag_attr_info_country=new Object(); //乡镇属性
		  var tag_attr_info_state=new Object();   //用户状态属性
		  var tag_attr_info_brand=new Object();   //用户品牌属性
		  var attrFlag=0;                         //标志属性选择是否正确 0表示正确，1表示不正确
//		  var tag_id=$("#tag_id").val();//客户群标识
           if($("#tag_name").text().length!=1){
		   tag_name=$("#tag_name").text();//客户群名称
		   }else{
		   tag_name=$("#tag_name_text").val();
		   }
		  var tag_attr_info_list = new Array();
          tag_sql="";
		  var tag_stmat=""; //客户群口径
		  var group_lvl=""; //条件组合逻辑
		$("#attr_table_filter").children(":even").each(function (index, table) {
			

			

		  	var group_id=$(table).attr('id');
			var group_name="条件组合"+$(table).attr('id');
			var attr_id=$(table).attr('title'); 
		  	var attr_lvl="--"; //0表示属性类型;//2表示属性标识;//3表示属性码表;//
			if($(table).children(":eq(0)").children(":eq(1)").css("visibility")=="visible"){           

			    	group_lvl=" "+$(table).children(":eq(0)").children(":eq(1)").find('select').combobox("getValue")+" ";
				}else{
					group_lvl=" ";
				}
			tag_sql=tag_sql+group_lvl+"( ";
			tag_stmat=tag_stmat+group_lvl+"( ";	
			
		  	var tr=$(table).children(":eq(1)").children(":eq(0)");

		  	var attr_name=$(tr).attr('title').split('&')[0];
	      	var attr_type=$(tr).attr('title').split('&')[1];
		  	var attr_table=$(tr).attr('title').split('&')[2]; 
		    $(tr).children(":even").each(function(index, element) {
	
				attr_index++;
                var value_text="";
				var tag_attr_info=new Object();
				  tag_attr_info.tag_id=tag_id;
				  tag_attr_info.tag_name=tag_name;
				  tag_attr_info.group_id=group_id;
				  tag_attr_info.group_name=attr_index;
				  tag_attr_info.attr_tr_id=$(element).parent().attr("id");
				  tag_attr_info.attr_id=attr_id.replace("_group","");
				  tag_attr_info.attr_name=attr_name; 
				  tag_attr_info.attr_from=group_lvl;
				  tag_attr_info.attr_type=attr_type;
			  if (attr_type=="连续型" || attr_type=="其他" ){   
			      tag_attr_info.attr_table="--";
				  if($(element).children(":eq(3)").css("visibility")=="visible"){
				  	tag_attr_info.attr_lvl=" "+$(element).children(":eq(3)").find('select').combobox("getValue")+" "; 
				  }else{
					tag_attr_info.attr_lvl=" "; 
				  }				 
				  tag_attr_info.attr_value_type1=" "+$(element).children(":eq(1)").find('select').combobox("getValue")+" ";
				  if(attr_type=="其他"){
					  if(tag_attr_info.attr_value_type1==" like "){
						  tag_attr_info.attr_value1="'%"+$(element).children(":eq(2)").children().val()+"%'";
					  }
					  else{
						  tag_attr_info.attr_value1="'"+$(element).children(":eq(2)").children().val()+"'";  
					  }	  
				  }else{
				   tag_attr_info.attr_value1=$(element).children(":eq(2)").children().val();		
				  }
				    		  	      
		  		  if(tag_attr_info.attr_value1=="")   
				  {
					  alert("【"+tag_attr_info.attr_name+"】 属性值不能为空，请重新填写");
					  attrFlag=1;
					  return false;
				  }			      
		      				  			   
		  		  if(isNaN(new Number(tag_attr_info.attr_value1)) && attr_type=="连续型")   
				  {
					  alert("【"+tag_attr_info.attr_name+"】 属性值不为数字，请重新填写");
					  attrFlag=1;
					  return false;
				  }      
				  tag_stmat=tag_stmat+tag_attr_info.attr_name+tag_attr_info.attr_value_type1+$(element).children(":eq(2)").children().val()+tag_attr_info.attr_lvl;	
				  tag_sql=tag_sql+"a."+tag_attr_info.attr_id+tag_attr_info.attr_value_type1+tag_attr_info.attr_value1+tag_attr_info.attr_lvl;
                 
	             tag_attr_info_list.push(tag_attr_info);
		  } else {

			      tag_attr_info.attr_value_type1="=";
				  if($(element).children(":eq(2)").css("visibility")=="visible"){
				  	tag_attr_info.attr_lvl=" "+$(element).children(":eq(2)").find('select').combobox("getValue")+" "; 
				  }else{
					tag_attr_info.attr_lvl=" "; 
				  }	

				  if(attr_type=="码表"){
					   		tag_attr_info.attr_table=attr_table;
							tag_attr_info.attr_value1="'"+$(element).children(":eq(1)").find('select').combobox("getValue")+"'";
							value_text=$(element).children(":eq(1)").find('select').combobox("getText");
				  	   }else{
					   		tag_attr_info.attr_table="--";
                            tag_attr_info.attr_value1="'"+$(element).children(":eq(1)").find('select').combobox("getValue")+"'";	
							value_text=$(element).children(":eq(1)").find('select').combobox("getText");						
				  		}
			      tag_stmat=tag_stmat+tag_attr_info.attr_name+tag_attr_info.attr_value_type1+value_text+tag_attr_info.attr_lvl;
				  	
				  tag_sql=tag_sql+"a."+tag_attr_info.attr_id+tag_attr_info.attr_value_type1+tag_attr_info.attr_value1+tag_attr_info.attr_lvl;
					 if(tag_attr_info.attr_value1=="")   
				  		{
					  		alert("【"+tag_attr_info.attr_name+"】 属性值不能为空，请重新填写");
							attrFlag=1;
					  		return false;
				  		}											  			 					
	              tag_attr_info_list.push(tag_attr_info);	
	 				 	
		  }  		   		        
        });
		tag_sql=tag_sql+" ) ";
		tag_stmat=tag_stmat+" ) ";
		
	});
	    if(tag_sql!=""){
			tag_sql=tag_sql+" and ";
			tag_stmat=tag_stmat+" and ";
		}
		//attrFlag标志为0表示条件正常
		if(attrFlag==0){
			if($("#cityName").combobox('getValue')!="1"){
				  tag_attr_info_city.tag_id=tag_id;
				  tag_attr_info_city.tag_name=tag_name;
				  tag_attr_info_city.group_id="--";
				  tag_attr_info_city.group_name=attr_index;
				  tag_attr_info_city.attr_tr_id="--";
				  if(lvl_id==3){
				  tag_attr_info_city.attr_id="COUNTY_ID";
				  }else{
				  tag_attr_info_city.attr_id="CITY_ID";
				  }
				  tag_attr_info_city.attr_name="地市";
				  tag_attr_info_city.attr_table="00";
				  tag_attr_info_city.attr_lvl="--"; 
				  tag_attr_info_city.attr_from="0";
				  tag_attr_info_city.attr_type="码表";
				  tag_attr_info_city.attr_value_type1=" in";		  
                  tag_attr_info_city.attr_value1=$("#cityName").combobox('getValues');	
			      tag_attr_info_city.attr_value_type2="--";
				  tag_attr_info_city.attr_value2="--";	
				  regions=String($("#cityName").combobox('getValues')).split(",");				
				  for (i=0;i<regions.length;i++){
				  if(i!=regions.length-1){
				      re+="'"+regions[i]+"'"+",";
				    //re+="a";
				  }else{
				      re+="'"+regions[i]+"'";
				  }
				  };
				  tag_sql=tag_sql+"a."+tag_attr_info_city.attr_id+tag_attr_info_city.attr_value_type1+"("+re+") and ";									  
				  tag_stmat=tag_stmat+tag_attr_info_city.attr_name+"="+$("#cityName").combobox('getText');+" ;";					  			  	   
	              tag_attr_info_list.push(tag_attr_info_city);						   
				}

			if($("#countyName").combobox('getValue')!=regionId){
				  tag_attr_info_country.tag_id=tag_id;
				  tag_attr_info_country.tag_name=tag_name;
				  tag_attr_info_country.group_id="--";
				  tag_attr_info_country.group_name=attr_index;
				  tag_attr_info_country.attr_tr_id="--";
				  tag_attr_info_country.attr_id="COUNTY_ID";
				  tag_attr_info_country.attr_name="乡镇";
				  tag_attr_info_country.attr_table="00";
				  tag_attr_info_country.attr_lvl="--"; 				   
				  tag_attr_info_country.attr_from="0";
				  tag_attr_info_country.attr_type="码表";
				  tag_attr_info_country.attr_value_type1=" in";		  
                  tag_attr_info_country.attr_value1=$("#countyName").combobox('getValues');	
			      tag_attr_info_country.attr_value_type2="--";
				  tag_attr_info_country.attr_value2="--";
				  countys=String($("#countyName").combobox('getValues')).split(",");
				
				  for (i=0;i<countys.length;i++){
				  if(i!=countys.length-1){
				      con+="'"+countys[i]+"'"+",";
				    //re+="a";
				  }else{
				      con+="'"+countys[i]+"'";
				  }
				  };	
				  
				  tag_sql=tag_sql+"a."+tag_attr_info_country.attr_id+tag_attr_info_country.attr_value_type1+"("+con+") and ";	
				  				  
				  tag_stmat=tag_stmat+tag_attr_info_country.attr_name+"="+$("#countyName").combobox('getText')+" ;";				  				  			  	   
	              tag_attr_info_list.push(tag_attr_info_country);			   
				}
			if($("#userState").combobox('getValue')!="ALL"){
				  tag_attr_info_state.tag_id=tag_id;
				  tag_attr_info_state.tag_name="--";
				  tag_attr_info_state.group_id="--";
				  tag_attr_info_state.group_name=attr_index;
				  tag_attr_info_state.attr_tr_id="--";
				  tag_attr_info_state.attr_id="SUBS_STAT";
				  tag_attr_info_state.attr_name="用户状态"; 
				  tag_attr_info_state.attr_table="MK_VGOP.T_DIM_SUBS_STAT";
				  tag_attr_info_state.attr_lvl="状态属性"; 				  
				  				  
				  tag_attr_info_state.attr_from="0";
				  tag_attr_info_state.attr_type="码表";
				  tag_attr_info_state.attr_value_type1="=";	  
                  tag_attr_info_state.attr_value1=$("#userState").combobox('getValue');	 
			      tag_attr_info_state.attr_value_type2="--";
				  tag_attr_info_state.attr_value2="--";	
				  
				  tag_sql=tag_sql+"a."+tag_attr_info_state.attr_id+tag_attr_info_state.attr_value_type1+"'"+tag_attr_info_state.attr_value1+"' and ";					  
				  
				  
				  tag_stmat=tag_stmat+tag_attr_info_state.attr_name+tag_attr_info_state.attr_value_type1+$("#userState").combobox('getText')+";";				  				    
	              tag_attr_info_list.push(tag_attr_info_state);						  
				}
			

			var b = JSON.stringify(tag_attr_info_list); 

            var attrs = new Array();
			attrs.push(tag_sql+"  1=1 ");
			attrs.push(tag_stmat);
			attrs.push(b);
			return attrs;}		
		
	}	
	});	
	
	
	//属性弹出框内容
	var group_index=0;		
	$.extend({'edit_attr':function(atrs){		
    //初始化参数 		//atrs 说明 0 属性类型   1 属性名称  2 属性   3 属性id  4 一级属性

		var strs= new Array(); 
		strs=atrs.split("&");
		var attrs_id=strs[3];   //属性标识
		var attrs_type=strs[0]; //属性类型
		var attrs_name=strs[1]; //属性名称
		var attrs_table=strs[2]; //属性码表
		var distinct_flag=0;    //表示重复属性添加标志；0表示没有重复，1表示有重复
       
	
		var edit_tr=attrs_id+"_group";
       //判断重复条件组
        var value="";
	   $("#attr_table_filter div").each(function (index, tr) {
			var oldId=$(tr).attr("id");
	        if(oldId==edit_tr){
				group_index++;
				var myDate = new Date();
            	var year = myDate.getFullYear();
				var mon = myDate.getMonth()+group_index;
				var day = myDate.getDate();
				var hour= myDate.getHours();
				var minute= myDate.getMinutes();
				var second= myDate.getSeconds();
				 value = year+(mon<10?('0'+mon):mon)+(day<10?('0'+day):day)+(hour<10?('0'+hour):hour)+(minute<10?('0'+minute):minute)+(second<10?('0'+second):second);	
            edit_tr=attrs_id+value+"_group";	//组ID
			}		
	   	});
			
			
			
			
			


	    if(distinct_flag==1)
		{
			return false;
		}
		else{
			
			if(attrs_type=="连续型"){html_body=$.gethtmlbody(0,"--");}
			if(attrs_type=="码表"){html_body=$.gethtmlbody(1,attrs_table);}
			if(attrs_type=="是否码表"){html_body=$.gethtmlbody(2,"--");}
			if(attrs_type=="其他"){html_body=$.gethtmlbody(3,"--");}		
		}

html_start="<div id='"+edit_tr+"' title='"+attrs_id+"_group' style='float:left;'>"                                                    
+    "<div style='margin-left:5px;  margin-top:5px; width:675px;  border-top:1px solid #CCC;border-left:1px solid #CCC;border-right:1px solid #CCC; height:32px; line-height:32px;'>"
+	 "<div style='float:left; padding-left:5px; width:520px'>条件组合</div>"
+	 "<div style='float:left;width:80px; line-height:32px; margin-top:3px; visibility:hidden;'>"
+	      "<select class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+                      "<option value='and' selected>并且</option>"
+                      "<option value='or' >或者</option>"
+              "</select></div>"
+	 "<div style='float:left; width:70px;'><img id='"+attrs_id+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attrs_type+"\",\""+attrs_name+"\")'><img id='"+attrs_id+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\""+edit_tr+"\")'></div>"     
+     "</div>"                     

+     "<div style=' float:left;  margin-left:5px; width:675px;  border:1px solid #CCC' >"
+        "<div id='"+attrs_id+value+"_tr' title='"+attrs_name+"&"+attrs_type+"&"+attrs_table+"' style='float:left;   width:100%;'>"
+             "<div  style='height:32px;line-height:32px;padding-left:5px;'>"
+                "<div style='float:left;width:280px;color:#094AB2' title='"+attrs_id+"'>"+attrs_name+"</div>";
		
html_end="<div style='float:left;line-height:32px; margin-top:3px; padding-left:5px;visibility:hidden;'><select class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+			"<option value='and' selected>并且</option>"
+			"<option value='or' >或者</option>"
+                  "</select></div>"
+	 "<div style='float:left; width:70px;'><img src='./img/attrs/add2.png' title='添加同类条件' style='cursor:pointer;' width='32px' height='32px' onClick='$.addSameAttr(\""+attrs_id+"&"+attrs_name+"&"+attrs_type+"&"+attrs_table+"&"+edit_tr+"_tr\")'><img id='"+attrs_id+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合' onClick='$.deletrAttr(this,0,\""+attrs_type+"\",\""+edit_tr+"\")' style='cursor:pointer;' ></div>"   

+	      "</div><div style='clear:both'></div>"
+         "</div>"
+     "</div>"
+"</div>"
+"<div style='clear:both'></div>";		


  $("#attr_table_filter").append(html_start+html_body+html_end);
   if($("#attr_table_filter").children().size()>2){
	  $("#attr_table_filter").children().last().prev().children(":eq(0)").children(":eq(1)").css("visibility","visible");
  }	
  $.parser.parse("#"+edit_tr);		
}});






//属性编辑框删除	
    $.extend({'deletrAttr':function(even,type,attr_type,attr_group){
	var tr_id =$(even).attr("id").replace("_tr_del","");
	
	if(type==0) //条件行删除
	{

	      if($(even).parent().parent().parent().children().size()<=2){
			 $("#"+attr_group).next().remove(); 
		  if($("#"+attr_group).children(":eq(0)").children(":eq(1)").css("visibility")=="hidden"){		
			 $("#"+attr_group).next().next().children(":eq(0)").children(":eq(1)").css("visibility","hidden");} 			 
			 $("#"+attr_group).remove();
		    }
	      else{
			  $(even).parent().parent().next().remove();
			  if(attr_type=="连续型" ||attr_type=="其它"){
				  if($(even).parent().parent().children(":eq(3)").css("visibility")=="hidden"){
				  	 $(even).parent().parent().prev().prev().children(":eq(3)").css("visibility","hidden");}   
				}else{
				  if($(even).parent().parent().children(":eq(2)").css("visibility")=="hidden"){
				  	 $(even).parent().parent().prev().prev().children(":eq(2)").css("visibility","hidden");}
				}
		  	  $(even).parent().parent().remove();
		  }
	}
	else{//条件组删除
        $("#"+attr_group).next().remove(); 
		 if($("#"+attr_group).children(":eq(0)").children(":eq(1)").css("visibility")=="hidden"){		 
			 $("#"+attr_group).next().children(":eq(0)").children(":eq(1)").css("visibility","hidden");  } 
		$("#"+attr_group).remove();
	}
		}});
	
//构成分析	
    $.extend({'consitAttr':function(even,attr_type,attrs_name){
	            //alert(attrs_name+"_"+attr_type);
	            window.open("buildContion.action?attrType="+encodeURI(attr_type)+"&attrName="+encodeURI(attrs_name),"","height=500,width=700,top=200,left=400,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
	            /*
				$.ajax({
					type: 'POST',
					url: 'buildContion.action',
					data:{attrType:encodeURI(attr_type)},
					dataType:"text", 
					success: function(msg){						
						if (msg.indexOf("连续型")<10 && msg.indexOf("连续型")!=-1){
							alert("连续型");
							alert(msg.indexOf("连续型"));
						}else if (msg.indexOf("是否码表")<10 && msg.indexOf("是否码表")!=-1){
						    alert("是否码表");
						    alert(msg.indexOf("是否码表"));
						}else if(msg.indexOf("码表")<10 && msg.indexOf("码表")!=-1){
							alert("码表");
						}else{
							alert("其他");
						}
					
					},
					error: function(data){
					
					return false;
					}
				});	 
	            */
	}});
		
		
	$(".attr_item_title_div").mouseenter(function(){
			$(this).children(".attr_tr").css("display","block");			
	});
	
    $(".attr_item_title_div").mouseleave(function(){
			$(this).children(".attr_tr").css("display","none");			
	});
	
		
	$("#close_bt").click(function(){
		
       $("#attr_edit_div").css("display","none");	
	});
	
			
});



//判断子字符串在父字符串中的次数
function countSubstr(str,substr,isIgnore){ 
     var count; 
     var reg=""; 
     if(isIgnore==true){ 
         reg="/"+substr+"/gi"; 
     }else{ 
         reg="/"+substr+"/g"; 
     } 
         reg=eval(reg); 
     if(str.match(reg)==null){ 
         count=0; 
     }else{ 
         count=str.match(reg).length; 
     } 
     return count; 
}

//上传文件检查
function filecheckmethod(){
				if($('#file').val()=="" || $('#file')==null){
					$.messager.alert('提示',"请输入要上传的文件!");
					return false;
				}
				
				var fileValue = $('#file').val();
			
				if(fileValue.substring(fileValue.length-4,fileValue.length)!=".txt"){
					fileValue = "";
					alert("请选择以'.txt'结尾的文件");
					
					return false;
				}
				
				
				return true;	
			}

</script>
</html>
