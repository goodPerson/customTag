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
	width: 80%;
	border-collapse: collapse;
}
#attr_edit_div {
	border-color: #000;
	border-style: solid;
	border-width: 2px;
	background: #FFF;
	width: 500px;
	height: 360px;
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
.label{
	width: 25px;
	text-align: center;
	font-size: 10pt;
	font-weight:bold;
	color:#FFF;
	background-color:#094AB2;
	cursor:pointer;
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
        <div class="attr_title_div" style="width:110px;" align="left">&nbsp;&nbsp;属性视图</div>
        <div class="attr_title_div" style="width:20px;height:30px;" ><img id="enlarger_col" src="./img/enlarger.png" style="cursor:pointer; margin-top:8px"></div>
        <div class="attr_title_div" style="width:30px; height:30px;"><img id="hidde_bt1" src="./img/bt10.png"  style="cursor:pointer;"></div>
        <div  class="attr_title_div" style="width:30px; height:30px;"><img id="hidde_bt2" src="./img/bt11.png"  style="cursor:pointer;"></div>
      </div><%--
      <div  class="attr_title_div" style=" height:30px; color:#FFF; width:200px; position: relative;left: 5px;top: 8px; line-height:30px;border:1px solid  #CCC; padding-top:2px;">
                &nbsp;&nbsp;<input type="text" id="attrseachval"  style="width:150px; height:20px; border:1px solid  #CCC;">&nbsp;&nbsp;<img id="enlarger" src="./img/enlarger.png" style="cursor:pointer;">
      </div>
      --%><!--基本属性-->
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
              <s:iterator value="regionAttr"  id="bais">
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
                <td id="tag_name" class="title_td" align="center" width="100%">
                  <s:if test='tagIntroduce==""'>
                     <s:property value="title_name" />
                  </s:if>
                  <input type="hidden" id="tag_id"  value='<s:property value="id" />'/>
                   <input id="attrName" name="attrName" type="hidden" value="">
                 </td>
                <td colspan="2" align="right"></td>
              </tr>
             <s:if test="%{groupType==1}">
              <tr class="tag_info" style="display:none;">
                <td colspan="3"  valign="top" style=" font: bold; height:30px;">客户群基本信息 </td>
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
                 <label>月属性时间：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;height:30px">
                      <s:property value="months" />                      
                  </div>
                  </td>
              </tr>
               <tr class="tag_info" style="margin-bottom:5px;display:none;">
               <td colspan="3" height="20px" style="padding-left:10px;" >
                <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;">                                 
                 <label>日属性时间：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;height:30px">                      
                      <s:property value="days"/>
                  </div>
                  </td>
              </tr>
              </s:if>
              <s:else>
               <tr class="tag_info">
                <td colspan="3"  valign="top" style=" font: bold; height:30px;">客户群基本信息 </td>
              </tr>
              <tr class="tag_info">
               <td colspan="3" height="20px" style="padding-left:10px;" >
                <div style="float:left;margin-left:5px;margin-right:5px">                                 
                 <label>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px">
                     <s:if test='title_name!=""'>
                     	<input name="" id="tag_name_text" type="text"  value="<s:property value='title_name'/>" style="width:400px; height:25px; border:1px solid  #CCC;"onfocus="if (value =='请输入客户群名称'){value =''}" onBlur="if (value ==''){value='请输入客户群名称';}" onKeyDown="{this.style.color='#000'}" >
                     </s:if>
                     <s:else>
                     	<input name="" id="tag_name_text" type="text"  value="请输入客户群名称" style="width:400px; height:25px; border:1px solid  #CCC;"onfocus="if (value =='请输入客户群名称'){value =''}" onBlur="if (value ==''){value='请输入客户群名称';}" onKeyDown="{this.style.color='#000'}" >
                     </s:else>
                  </div>
                  </td>
              </tr>
               <tr class="tag_info">
               <td colspan="3" height="30px" style="padding-left:10px;" valign="middle" >
                <div style="float:left;margin-left:5px;margin-right:5px;">                                 
                 <label>简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;介：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px">
                     <s:if test='tagIntroduce!=""'>
                     	<input name="" id="tag_introduce" type="text"  value="<s:property value='tagIntroduce'/>" style="width:400px; height:25px; border:1px solid  #CCC;"onfocus="if (value =='客户群简介'){value =''}" onBlur="if (value ==''){value='客户群简介';}" onKeyDown="{this.style.color='#000'}" >
                     </s:if>
                     <s:else>
                     	<input name="" id="tag_introduce" type="text"  value="客户群简介" style="width:400px; height:25px; border:1px solid  #CCC;"onfocus="if (value =='客户群简介'){value =''}" onBlur="if (value ==''){value='客户群简介';}" onKeyDown="{this.style.color='#000'}" >
                     </s:else>
                    
                  </div>
                  </td>
              </tr>
               <tr class="tag_info" style="margin-bottom:5px">
               <td colspan="3" height="30px" style="padding-left:10px;" valign="middle" >
                <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;">                                 
                 <label>有效时间：</label>
                 </div>
                  <div style="float:left; padding-left:2px;margin-left:6px;margin-right:5px;margin-bottom:5px;height:30px">
                     <s:if test='createTagDate!=""'>
                    	 <input  id="create_tag_date"  style="font:9pt;width:192px;" class="easyui-datebox"  value="<s:property value='createTagDate'/>"></input>
                     </s:if>
                     <s:else>
                     	<input  id="create_tag_date"  style="font:9pt;width:192px;" class="easyui-datebox"></input>
                     </s:else>
                     
                     --
                     <s:if test='endTagDate!=""'>
                     	<input  id="end_tag_date" style="font:9pt;width:192px;" class="easyui-datebox" value="<s:property value='endTagDate'/>"></input>
                     </s:if>
                     <s:else>
                     	<input  id="end_tag_date" style="font:9pt;width:192px;" class="easyui-datebox"></input>
                     </s:else>
                     
                  </div>
                  </td>
              </tr>
               <tr class="tag_info" style="margin-bottom:5px">
               <td colspan="3" height="20px" style="padding-left:10px;" >
                <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;">                                 
                 <label>月属性时间：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;height:30px">
                      <s:property value="months" /> 
                  </div>
                  </td>
              </tr>
                             <tr class="tag_info" style="margin-bottom:5px">
               <td colspan="3" height="20px" style="padding-left:10px;" >
                <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;">                                 
                 <label>日属性时间：</label>
                 </div>
                  <div style="float:left;margin-left:5px;margin-right:5px;margin-bottom:5px;height:30px">
                      <s:property value="days" /> 
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
                    <%--<option value="US2">离网</option>
                    --%>
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
                      <td rowspan="3" align="left"><table id="attr_table_edit" width="700px;"  height="300px" border="0" cellspacing="0" cellpadding="0" >
                          <tr height="25px;">
                            <td><div id="commform" style="width:80px; height:25px; background-image:url(./img/group_gray.png);float:left; margin-left:10px; margin-top:3px; line-height:25px; text-align:center; color:#FFFFFF;cursor:pointer;  ">常规构成</div>  <div id="advanceform" style="width:80px; height:25px; background-image:url(./img/group_light.png);float:left; margin-left:10px; margin-top:3px; line-height:25px; text-align:center; color:#FFFFFF; ">高级构成</div> 
                            </td>
                          </tr>
                          <tr height="25px;" style="border-bottom-style:none;">
                            <td style=" width:700px; height:30px; background-image:url(./img/attr_ground.png); border-bottom-style:none;border-left:solid 1px #CCC;border-right:solid 1px #CCC;"><div style="float:left;">&nbsp;属性编辑</div>
                             <div style="float:right;">
                                &nbsp;&nbsp;<label id="leftbrack" class="label">&nbsp;(&nbsp;</label> &nbsp;&nbsp; <label id="rightbrack" class="label">&nbsp;)&nbsp;</label>   &nbsp;&nbsp;
                               <label id="condition_and" class="label"> and </label>  &nbsp;&nbsp; <label id="condition_or" class="label"> or</label>   &nbsp;&nbsp; 
                             </div>
                            </td>
                          </tr>
                          <tr>
                            <td width="700px;" height="300px;" style="border: solid 1px #CCC;"><div id="attr_table_filter" style="overflow:auto; height:295px; width:700px;;">                            <!--  <textarea id="textarea" cols="113" rows="15"></textarea>           -->  
</div>





                            
                                <table id="attr_table_filter1" width="680px" border="0" cellspacing="0" cellpadding="5">
<input type="hidden"  value="<s:property value='jsonarray' />"   id="jsonAttr"    />
                   
                                        

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
      <td height="100%" width="100%"  ><div  style="width:100%; height:180px; overflow:auto">
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
      <input id="im_GPRSFee"  name="GPRS计费流量(MB)" type="checkbox" value="A.GPRS_BILL_VOL"  id="check" />GPRS计费流量(MB)                  
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
	var regionId=$("#req_reson").val();                           //区域Id
	var regionLevl="<%=request.getAttribute("regionLevl") %>";    //地区级别
	var group_type="<%=request.getAttribute("groupType") %>";     //群类别 共享群0 我的群 
	//alert(group_type);
  var id = "<%=request.getAttribute("groupId ") %>"; //群ID
  var starttime = "<%=request.getAttribute("starttime ") %>"; //开始时间  我的群功能有值
  var endtime = "<%=request.getAttribute("endtime ") %>"; //结束时间  我的群功能有值
  var tag_id = "<%=request.getAttribute("groupId ") %>"; //群ID 本页被赋值
	//alert(tag_id);
	var tag_n;                                                    //标签名称
	var list_count="";                                            //客户群人数
	var userId="<%=request.getAttribute("userId") %>";            //用户Id
	var group_name="<%=request.getAttribute("title_name") %>";         //群名称
	var cityNamep="<s:property value='cityName'/>";    //参数城市名称编码
	var countyNamep="<s:property value='countyName'/>";   //参数区县编码
	var userStatep="<s:property value='userState'/>";    //参数用户状态编码
	

      if (userStatep!="") {
              $("#userState").combobox("setValue",userStatep);
      };
	
	//属性视图栏搜索按钮
  //属性视图栏搜索按钮
  $("#enlarger_col").click(function() {
    var set = $("#main_attr_table").offset();
    $("#attr_edit_div").css({
      "display": "block",
      "left": (parseInt(set.left) + 210) + "px",
      "top": (parseInt(set.top) + 10) + "px"
    });
  });
//属性视图栏搜索按钮
  $("#enlarger").click(function() {
    if ($.trim($("#attrseachval").val())=="") {
      alert("属性搜索框不能为空！");
      $("#attrseachval").focus();
      return false;
    };
    var set = $("#main_attr_table").offset();
    $("#attr_edit_div").css({
      "display": "block",
      "left": (parseInt(set.left) + 210) + "px",
      "top": (parseInt(set.top) + 10) + "px"
    });
    var type1 = ""; //一级属性类
    var type2 = encodeURI($("#attrseachval").val()); //二级属性类
    var type11 = "";
    $.ajax({
      type: 'POST',
      url: 'getAttrPath.action',
      data: {
        attrName: type2
      },
      dataType: "text",
      success: function(data) {
        $("#attrName").val(data);
        type11 = $("#attrName").val();
        $("#serch_attr_div").hide();
        $.third_attr_panel_build('2', type1, type2, type11);
      },
      error: function(data) {
        return false;
      }
    });
  });

  //属性搜索框点击事件
  $("#attrseachval").click(function() {
    var set = $("#main_attr_table").offset();
    $("#attr_edit_div").css({
      "display": "block",
      "left": (parseInt(set.left) + 210) + "px",
      "top": (parseInt(set.top) + 10) + "px"
    });
  });
   //属性搜索框键盘事件
   var oldtextnew = "";
  $("#attrseachval").keyup(function() {  
    if ($(this).val() != oldtextnew) {
      //alert($(this).val());
      //oldtext=$(this).val();
      var type1 = ""; //一级属性类
      var type2 = encodeURI($("#attrseachval").val()); //二级属性类
      var type11 = "";
      $.attr_view_panel_tishi('2', type1, type2, type11);
    }
  });
   
	//属性视图鼠标覆盖
	$(".attr_item_title_div").mouseenter(function(){
			$(this).children(".attr_tr").css("display","block");			
	});
	//属性视图鼠标离开
    $(".attr_item_title_div").mouseleave(function(){
			$(this).children(".attr_tr").css("display","none");			
	});
	//属性视图展开
	var index_img=1;
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
	//属性视图收起
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
	//生成三级属性事件   
	$(".attr_item_div").click(function(){
		
        var type1=encodeURI($.trim($(this).parent().parent().children(":eq(1)").text()));//一级属性类
	  var type2=encodeURI($(this).attr("title"));//二级属性类
	  var type11=$.trim($(this).parent().parent().children(":eq(1)").text())+"/"+$.trim($(this).attr("title"));
	  $.third_attr_panel_build('1',type1,type2,type11);	
	});
	//生成三级属性面板
    $.extend({'third_attr_panel_build':function(value_type,type1,type2,type11){	 
		
	  $.ajax({
    		type: 'POST',
    		url: 'listAttrTagAction.action',
    		data:{type_1:value_type,type_2:type2,type3:type1},
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
	
	//生成三级属性面板内容
    $.extend({'third_attr_build':function(data,type11){	
                 var table_str = "<tr><td valign='top'  colspan='4'  style='height:25px;'>属性路径："+type11+"<td></tr>";	    
		   // var table_str=""; 		
		   // alert(type11);
			$("#attrs_list").children().remove();			
			$.each(data,function(i,table){				
				$.each(table,function(l,tr){
				    table_str=table_str+("<tr>");
				  $.each(tr,function(k,td){
					//atrs 说明 0 属性类型   1 属性名称  2 属性   3 属性id  4 一级属性
					var atrs=td.attr_type+"&"+td.attr_name+"&"+td.attr_table+"&"+td.attr_id+"&"+type11;		
					//alert(atrs);	
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
	 //三级属性面板关闭按钮
	$("#close_bt").click(function(){		
       $("#attr_edit_div").css("display","none");	
	});
  //生成搜索三级属性事件
  $("#attr_serch_bt").click(function() {
    if ($.trim($("#attr_text").val())=="") {
      alert("属性搜索框不能为空！");
      $("#attr_text").focus();
      return false;
    };
    var type1 = ""; //一级属性类
    var type2 = encodeURI($("#attr_text").val()); //二级属性类
    var type11 = "";
    $.ajax({
      type: 'POST',
      url: 'getAttrPath.action',
      data: {
        attrName: type2
      },
      dataType: "text",
      success: function(data) {
        $("#attrName").val(data);
        type11 = $("#attrName").val();
        $("#serch_attr_div").hide();
        $.third_attr_panel_build('2', type1, type2, type11);
      },
      error: function(data) {
        return false;
      }
    });
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
                        if($("#cityName").combobox("getText").indexOf("河北省")>0 ){
                                alert("省与地市不可同时选择，选择地市前请删除省");
                                $("#cityName").combobox("setValue","1");
                        }
                       

                         if($("#cityName").combobox("getValue")==1){
                           alert("省与地市不可同时选择，选择地市前请删除省");
                           $("#cityName").combobox("setValue","1");
                          }                                   



		    	   /*
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
					  }*/
				  }
				  
		  
		 });

               if (cityNamep!=""){                                           
                     $("#cityName").combobox("setValue",cityNamep);              
              }else{
                     $("#cityName").combobox("setValue",regionId);                            
              }
        
		//获取区县名称		 		  
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
			    }
          });	
         
              if (countyNamep!=""){                                           
                    $("#countyName").combobox("setValue",countyNamep);         
              }else{
                    $("#countyName").combobox("setValue",regionId);                        
              }
		 //格式时间
  function myfomatter(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    if (m<10) {
      m='0'+m;
    };
     if (d<10) {
      d='0'+d;
    };
    return y+""+m+""+d;
   // return y + (m < 10 ? ('0' + m) : m) + (d < 10 ? ('0' + d) : d);
    //           return y+"年"+m+"月"+d+"日";
  };
  var myDate = new Date();
  var yesterday_milliseconds = myDate.getTime() - 1000 * 60 * 60 * 24;
  var yesterday = new Date();
  yesterday.setTime(yesterday_milliseconds);
  var year = myDate.getFullYear();
  var mon = myDate.getMonth() + 1;
  var day = myDate.getDate();
  var value = year + (mon < 10 ? ('0' + mon) : mon) + (day < 10 ? ('0' + day) : day);

  $("#create_tag_date").datebox({
   formatter: myfomatter,
   // formatter: function(date){ return date.getFullYear()+(date.getMonth()+1)+date.getDate(); }
    onSelect: function(date) {
      //alert("开始时间：" + date);
      var myDate = new Date();
      //alert(myDate) ;l  
      if (date < yesterday) {
        alert("起始日期不能小于今天");
        $("#create_tag_date").datebox("setValue", "");
      }
    }
  });
	
  $("#end_tag_date").datebox({
    formatter: myfomatter,
    onSelect: function(date) {
      //alert(“结束时间：”+date);
      /*  var myDate = new Date();
      if(date<=myDate){
      alert("结束日期不能小于今天");
      $("#create_tag_date").datebox("setValue","");
      } */
      var start = $("#create_tag_date").datebox("getValue");
      var s = parseInt(start);
      var end = $("#end_tag_date").datebox("getValue");
      var e = parseInt(end);
      //alert("开始时间："+s+"结束时间:"+e);
      if (s > e) {
        alert("开始时间不能大于结束时间");
        $("#end_tag_date").datebox("setValue", "");
      }
    }
  });
	
	//属性弹出框内容	
	$.extend({'edit_attr':function(atrs){		
    //初始化参数 		//atrs 说明 0 属性类型   1 属性名称  2 属性   3 属性id  4 一级属性
         
		var strs= new Array(); 
		strs=atrs.split("&");
		var attrs_id=strs[3];   //属性标识
		var attrs_type=strs[0]; //属性类型
		var attrs_name=strs[1]; //属性名称
		var attrs_table=strs[2]; //属性码表
		var distinct_flag=0;    //表示重复属性添加标志；0表示没有重复，1表示有重复
       // alert(attrs_type+"---"+attrs_name+"属性码表:"+attrs_table);

		var body_html="";
		if (attrs_type=="连续型"){
			body_html="<div class='bore' title='"+attrs_type+"' style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+			"<div style='float:left;width:280px;color:#094AB2' title='"+attrs_id+"'>"+attrs_name+"</div>"
+			"<div style='float:left; padding-left:5px;line-height:32px; margin-top:3px; '>"
+			"<select class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+                                "<option value='>=' selected>大于等于</option>"
+                                "<option value='<=' >小于等于</option>"
+                                "<option value='<' >小于</option>"
+                                "<option value='>' >大于</option>"
+                                "<option value='='>等于</option>"
+                        "</select></div>"
+	           "<div style='float:left;padding-left:5px;line-height:32px; margin-top:2px; '><input id=\"tag_name_txt_"+attrs_table+"\" type='text'  value='0.00' style='width:140px; height:25px;border:1px solid  #CCC;   ' onfocus=\"if (value !=''){value='';}\"></div>"
+            "<div style='float:left; width:70px;'><img id='"+attrs_id+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attrs_type+"\",\""+attrs_name+"\")'><img id='"+attrs_id+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\""+attrs_id+"\")'></div>"
+                     "</div>";        
		}else if (attrs_type=="其他"){
			body_html="<div class='bore' title='"+attrs_type+"' style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+			"<div style='float:left;width:280px;color:#094AB2' title='"+attrs_id+"'>"+attrs_name+"</div>"
+"<div style='float:left; padding-left:5px; margin-top:3px;'>"
+			"<select class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+                                "<option value='like' selected>模糊</option>"
+                                "<option value='=' >等于</option>"
+                        "</select></div>"
+	           "<div style='float:left;padding-left:5px; margin-top:3px;'><input id=\"tag_name_txt_"+attrs_name+"\" type='text'  value='' style='width:140px; height:25px;border:1px solid  #CCC;  ' onfocus=\"if (value !=''){value='';}\" ></div>"	
+            "<div style='float:left; width:70px;'><img id='"+attrs_id+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attrs_type+"\",\""+attrs_name+"\")'><img id='"+attrs_id+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\""+attrs_id+"\")'></div>"		
+			          "</div>";
var url="getModel.action?attrName="+encodeURI(encodeURI(attrs_name));
          $.ajax({
    		type: 'POST',
    		url: url,
    		dataType:"text", 
    		success: function(data){
    		    var point=data.indexOf("<!DOCTYPE")
				var datavalue=data.substring(0,point);
				var tagname=$.trim("#tag_name_txt_"+attrs_name);
				//alert(tagname);
				//alert($(tagname).val());
				if ($(tagname).val()==""){
					$(tagname).val("格式："+datavalue);
				}			    
				
            },
   			error: function(data){
     		
     		return false;
    		}
    	});
		}else if (attrs_type=="码表"){
	
			body_html="<div  class='bore' title='"+attrs_type+"'  style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+			"<div style='float:left;width:280px;color:#094AB2' title='"+attrs_id+"'>"+attrs_name+"</div>"
+           "<div id='"+$.trim(attrs_id)+"_div'  style='float:left; padding-left:5px; margin-top:3px; '>"
+			"<select title='"+attrs_table+"' class='easyui-combobox' name='state' style='width:225px;height:25px' panelHeight='100'"
+       " data-options='valueField:\"id\",textField:\"text\",url:\"getAttrTableAction.action?table_name="+attrs_table+"\" ' >"
+                        "</select></div>"	

+           "<div style='float:left; width:70px;'><img id='"+attrs_id+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attrs_type+"\",\""+attrs_name+"\")'><img id='"+attrs_id+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\""+attrs_id+"\")'></div>"		
+		          "</div>";

		}else if (attrs_type=="是否码表"){
			body_html="<div  class='bore' title='"+attrs_type+"'  style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+			"<div style='float:left;width:280px;color:#094AB2' title='"+attrs_id+"'>"+attrs_name+"</div>"
+           "<div style='float:left; padding-left:5px; margin-top:3px;'>"
+			"<select class='easyui-combobox' name='state' style='width:225px;height:25px' panelHeight='auto' >"
+                   "<option value='1' selected>是</option>"
+                   "<option value='0' >否</option>"
+           "</select></div>"	
+          "<div style='float:left; width:70px;'><img id='"+attrs_id+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attrs_type+"\",\""+attrs_name+"\")'><img id='"+attrs_id+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\""+attrs_id+"\")'></div>"		
+			          "</div>";	  		
		}

        $("#attr_table_filter").append(body_html);
	
	 $.parser.parse($("#attr_table_filter")); 
        //if (attrs_type=="码表") {
            //$.parser.parse($("#"+$.trim(attrs_id)+"_div"));
        //};


	}});
	//左括号事件
	$("#leftbrack").click(function(){
	  var body_coutent=$("#leftbrack").text();
	      body_html="<div  class='logic' style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+                    "<div style='float:left;padding-left:5px; margin-top:3px;'><input id='leftbrackcontent' type='text'  value='"+ body_coutent+" ' style='width:140px; height:25px;border:1px solid  #CCC;' ></div>"	
+           "<div style='float:left; width:70px;'><img id='_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\"11\")'></div>"	  
+                   "</div>";		  
	  $("#attr_table_filter").append(body_html);
	});
	//右括号事件
	$("#rightbrack").click(function(){
	  var body_coutent=$("#rightbrack").text();
	      body_html="<div class='logic' style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+                    "<div style='float:left;padding-left:5px; margin-top:3px;'><input id='rightbrackcontent' type='text'  value='"+ body_coutent+" ' style='width:140px; height:25px;border:1px solid  #CCC;' ></div>"	
+           "<div style='float:left; width:70px;'><img id='_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\"11\")'></div>"		  
+                   "</div>";		  
	  $("#attr_table_filter").append(body_html);
	});
	//and条件
	$("#condition_and").click(function(){
	  var body_coutent=$("#condition_and").text();
	      body_html="<div class='logic'  style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+                    "<div style='float:left;padding-left:5px; margin-top:3px;'><input id='condition_andcontent' type='text'  value='"+ body_coutent+" ' style='width:140px; height:25px;border:1px solid  #CCC;' ></div>"
+           "<div style='float:left; width:70px;'><img id='_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\"11\")'></div>"			  
+                   "</div>";		  
	  $("#attr_table_filter").append(body_html);
	});
	//or条件
	$("#condition_or").click(function(){
	  var body_coutent=$("#condition_or").text();
	      body_html="<div class='logic'  style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+                    "<div style='float:left;padding-left:5px; margin-top:3px;'><input id='condition_orcontent' type='text'  value='"+ body_coutent+" ' style='width:140px; height:25px;border:1px solid  #CCC;' ></div>"
+           "<div style='float:left; width:70px;'><img id='_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\"11\")'></div>"			  
+                   "</div>";		  
	  $("#attr_table_filter").append(body_html);
	});
  //属性编辑框删除	
    $.extend({'deletrAttr':function(even,type,attr_type,attr_group){
		 $(even).parent().parent().remove();	   
	}});
	//构成分析	
    $.extend({'consitAttr':function(even,attr_type,attrs_name){
	            //alert(attrs_name+"_"+attr_type);
	            window.open("buildContion.action?attrType="+encodeURI(encodeURI(attr_type))+"&attrName="+encodeURI(encodeURI(attrs_name)),"","height=500,width=700,top=200,left=400,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no");
	}});
   //群体筛选
   	$("#tag_detail_bt3").click(function(){
   	var bodylength=$(document.body).height();	
        var hight=document.body.scrollTop;
        var he=parseInt(bodylength)+parseInt(hight);
        $("#wait_div").css({
             "height":he+"px",
             "display":"block"
        });
	//    document.getElementById("wait_div").style.display="block";
	    document.getElementById("wait_div").style.filter="alpha(opacity=20)";
	    $("#load_div").show();
        
		var attrs= $.attr_build();
		//alert(attrs[0]);
		
        
		//if(attrs==null){$("#wait_div").hide(); $("#load_div").hide(); }
		var sql =encodeURI(attrs[0]);
        //alert(attrs[0]);
	  	 	$.ajax({
	    		type: 'POST',
	    		url: 'filterTagCounts.action',
	    		data:{sql:sql},
	    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
	    		success: function(data){  
				//alert(data);
	    		list_count=data; 
	    		    if (data<0){
	    		    	alert("筛选时间过长，请重新筛选");
	    		    }else{
	    		    	$("#persons_td").text(data+'人'); 
	    		    }
	    			
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
	//客户群属性生成
    $.extend({'attr_build':function(){
		  var attr_index=0;
		  var tag_attr_info_city=new Object();    //地市属性
		  var tag_attr_info_country=new Object(); //乡镇属性
		  var tag_attr_info_state=new Object();   //用户状态属性
		  var tag_attr_info_brand=new Object();   //用户品牌属性
		  var attrFlag=0;                         //标志属性选择是否正确 0表示正确，1表示不正确
               var sessioncityid="<s:property value='#session.regionId'/>";
		  //获取城市编码和名称
		  var city_value=String($("#cityName").combobox("getValues"));		
               //alert("city_value:"+city_value);
               var citysql="";	    
		  if (city_value.indexOf(",")!=-1){	
			  var citysvalue=new Array();
			      citysvalue=city_value.split(",");				  
			  for (i=0;i<citysvalue.length;i++){				  
				  if(i!=citysvalue.length-1){
					  citysql+="'"+citysvalue[i]+"'"+",";
				  }else{
					  citysql+="'"+citysvalue[i]+"'";
				  }
			  }	
		  }else{
		     citysql="'"+city_value+"'";
		  }
		  
	      var city_text=$("#cityName").combobox("getText");
		  //获取区县编码或名称
		  var county_value=String($("#countyName").combobox("getValues"));
		  
		  
		  if (county_value.indexOf(",")>1){
			  var countysql="";
			  var countysvalue=new Array();
			      countysvalue=county_value.split(",");			  
			  for (i=0;i<countysvalue.length;i++){
				  if(i!=countysvalue.length-1){
					  countysql+="'"+countysvalue[i]+"'"+",";
					//re+="a";
				  }else{
					  countysql+="'"+countysvalue[i]+"'";
				  }
			  }	
			  	  
		  }else{
		     countysql="'"+county_value+"'";
		  }		  
		  
		 // alert(countysql);
		 // alert(citysql);
	        var county_text=$("#countyName").combobox("getText"); 
		 //获取用户状态
		  var userstate_value=$("#userState").combobox("getValue");
		  var userstate_text=$("#userState").combobox("getText");		  		
               var group_base_attr_sql="";               
               if ($("#cityName").combobox("getValues")=='1') {
            	   group_base_attr_sql+="    a.SUBS_STAT='"+ userstate_value +"'";
               }else if ($("#cityName").combobox("getValues")!='1' && countysql!=citysql){
                      if ($("#req_reson").val()=='1' ){
                          group_base_attr_sql+="  a.CITY_ID in ("+ citysql +")";
                          group_base_attr_sql+="  and  a.SUBS_STAT='"+ userstate_value +"'";
                      }else{
                          group_base_attr_sql+="  a.COUNTY_ID in ("+ countysql +")";
                          group_base_attr_sql+="  and  a.SUBS_STAT='"+ userstate_value +"'";
                      }
                     //alert("group_base_attr_sql:"+group_base_attr_sql);
		       }else{
                     group_base_attr_sql+="  a.CITY_ID in ("+ citysql +")";
                     group_base_attr_sql+="  and  a.SUBS_STAT='"+ userstate_value +"'";
               }
		      // alert("group_base_attr_sql:"+group_base_attr_sql);
		  var group_base_attr_bro="";
          /*
		  if (sessioncityid=='1'){
		  	 group_base_attr_bro+=" 地市 ="+ city_text ;
		  }else{
			  group_base_attr_bro+=" 地市 ="+ city_text ;
		         group_base_attr_bro+=" 区县 ="+ county_text;
		  }
          */
          if ($("#cityName").combobox("getValues")=='1') {
        	     group_base_attr_bro+=" 地市 ="+ city_text ;
      	  }else if ($("#cityName").combobox("getValues")!='1' && countysql!=citysql){
              if ($("#req_reson").val()=='1' ){
            	  group_base_attr_bro+=" 地市 ="+ city_text ;
              }else{
            	  group_base_attr_bro+=" 区县 ="+ county_text;
              }
      	   }else{
      		      group_base_attr_bro+=" 地市 ="+ city_text ;
     	   }
		  
		  
		  
		  
               //alert("group_base_attr_bro:"+group_base_attr_bro);
		  group_base_attr_bro+=" 用户状态 ="+ userstate_text;
		  var tag_attr_info_list = new Array();    //标签
		  var sql=""; //sql组合
		  var bro=""; //口径组合
		  var condition_table="";  //条件表
               if (sessioncityid!='1') {
                  condition_table+="baseattr@"+countysql+"@"+county_text+"@COUNTY_ID@--@--@--$";   //地区(县)
               };
		  
		  condition_table+="baseattr@"+citysql+"@"+ city_text+"@CITY_ID@--@--@--$";   //地区(市)
		  condition_table+="baseattr@"+userstate_value+"@"+userstate_text+"@UserState@--@--@--$";  //用户状态
		  var classname="";
		  //遍历attr_table_filter下面的元素
		  $("#attr_table_filter").children().each(function (index, table) {
			   classname=$(table).attr("class");  //class名称
			  if (classname=="logic"){
				  var brack=$.trim($(table).children().children("input").val());
				  //alert(brack);
				  sql=sql+" "+brack+" ";
				  bro=bro+" "+brack+" ";
				  condition_table+="operate@--@--@--@--@"+brack+"@--$";
			  }else if (classname=="bore"){
				  var titlename=$(table).attr("title");
				  if (titlename=="连续型"){
					  var attrname=$(table).children(":eq(0)").text();
					  var attrid=  $(table).children(":eq(0)").attr("title");
					  var opertvalue=$(table).children(":eq(1)").children().combobox("getValue");
					  var operttext=$(table).children(":eq(1)").children().combobox("getText"); 
					  var value=$(table).children(":eq(2)").children().val();
					  sql=sql+" a."+attrid+" "+opertvalue+" "+value;
					  bro=bro+" "+attrname+" "+operttext+" "+value;
					  condition_table+="attr@"+attrid+"@"+attrname+"@"+titlename+"@"+operttext+"@"+opertvalue+"@"+value+"$";
				  }else if (titlename=="其他"){
					  var attrname=$(table).children(":eq(0)").text();
					  var attrid=  $(table).children(":eq(0)").attr("title");
					  var opertvalue=$(table).children(":eq(1)").children().combobox("getValue");
					  var operttext=$(table).children(":eq(1)").children().combobox("getText"); 
					  var value=$(table).children(":eq(2)").children().val();	
					  if(opertvalue=="like"){
						  sql=sql+" a."+attrid+" "+opertvalue+" '%"+value+"%'";
					  }else{
						  sql=sql+" a."+attrid+" "+opertvalue+" '"+value+"'";
					  }				  
					  
					  bro=bro+" "+attrname+" "+operttext+" "+value;
					  condition_table+="attr@"+attrid+"@"+attrname+"@"+titlename+"@"+operttext+"@"+opertvalue+"@"+value+"$";
				  }else if (titlename=="码表"){
					  var attrname=$(table).children(":eq(0)").text();
					  var attrid=  $(table).children(":eq(0)").attr("title");
					  var opertvalue=$(table).children(":eq(1)").children().combobox("getValue");
					  var operttext=$(table).children(":eq(1)").children().combobox("getText"); 
					  var tabletext=$(table).children(":eq(1)").children().attr("title");
					  //alert(tabletext);
					  //alert("operttext:"+operttext+"opertvalue:"+opertvalue);		  
					  sql=sql+" a."+attrid+" = '"+opertvalue+"' ";
					  bro=bro+" "+attrname+" = "+operttext+" "; 
					  condition_table+="attr@"+attrid+"@"+attrname+"@"+titlename+"@"+tabletext+"@"+operttext+"@"+opertvalue+"$";
					  
				  }else if (titlename=="是否码表"){
					  var attrname=$(table).children(":eq(0)").text();
					  var attrid=  $(table).children(":eq(0)").attr("title");
					  var opertvalue=$(table).children(":eq(1)").children().combobox("getValue");
					  var operttext=$(table).children(":eq(1)").children().combobox("getText"); 				
					  sql=sql+" a."+attrid+" = '"+opertvalue+"' ";
					  bro=bro+" "+attrname+" = "+operttext+" ";	
					  condition_table+="attr@"+attrid+"@"+attrname+"@"+titlename+"@--@"+operttext+"@"+opertvalue+"$";  
				  }				
				  sql+=" ";
			  }
			  	
		  });
		    
			if (classname!=""){
				sql=group_base_attr_sql+"  and "+sql;
			}else{
			    sql+=""+group_base_attr_sql;
			}
			
		    bro=" "+group_base_attr_bro+" "+bro;
						
	        //alert("sql:"+sql);
	        //alert("bro:"+bro);
		  
		  
		var attrs = new Array();
		attrs.push(sql);
		attrs.push(bro);
		attrs.push(condition_table);
		return attrs;
		  
		  
	}});	
	
	 //读取筛选条件
	 var jsonarry = $.parseJSON($("#jsonAttr").val());
	// alert(jsonarry);
	String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
    }
	var body_html_condition="";
	//alert("jsonarry:"+jsonarry);
	//alert("jsonAttr值："+$("#jsonAttr").val());

if (jsonarry!=""){
	 $.each(jsonarry, function(i,attr){ 
	    var body_html_condition="";
           //alert(attr.attrId);
	    //设置市区属性
	 	if (attr.attrType=="CITY_ID"){
			//alert("attr.attrType:"+attr.attrType+"attr.attrId:"+attr.attrId);
                    $("#cityName").combobox("setValues",attr.attrId);	
		}
		//设置区县属性
		
		if (attr.attrType=="COUNTY_ID"){
			//alert("attr.attrType:"+attr.attrType+"attr.attrId:"+attr.attrId);
			$('#countyName').combobox('setValues',attr.attrId);	
		}
		//设置用户状态
		if(attr.attrType=="UserState")
		{	   
			$("#userState").combobox("setValue",attr.attrId);	
        }
    	if (attr.operateFlag=="operate"){			    
		   	body_html_condition="<div  class='logic' style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+                    "<div style='float:left;padding-left:5px; margin-top:3px;'><input id='leftbrackcontent' type='text'  value='"+ attr.operateSign+" ' style='width:140px; height:25px;border:1px solid  #CCC;' ></div>"	
+           "<div style='float:left; width:70px;'><img id='_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\"11\")'></div>"	  
+                   "</div>";	
		}
		
	   if (attr.attrType=="连续型" && attr.operateFlag=="attr"){
		    //$("#"+attr.attrId+"_"+i).combobox("setValue",attr.operateSign);
			//alert("$(#"+attr.attrId+"_"+i+")___"+attr.operateSign);
			body_html_condition+="<div class='bore' title='"+attr.attrType+"' style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+			"<div style='float:left;width:280px;color:#094AB2' title='"+attr.attrId+"'>"+attr.attrName+"</div>"
+			"<div style='float:left; padding-left:5px;line-height:32px; margin-top:3px; '>"
+			"<select id='"+attr.attrId+"_"+i+"' class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+                                "<option value='"+attr.operateSign+"' selected>"+attr.attrTable+"</option>"
+                                "<option value='>='>大于等于</option>"
+                                "<option value='<=' >小于等于</option>"
+                                "<option value='<' >小于</option>"
+                                "<option value='>' >大于</option>"
+                                "<option value='='>等于</option>"
+                        "</select></div>"
+	           "<div style='float:left;padding-left:5px;line-height:32px; margin-top:2px; '><input id=\"tag_name_txt_"+attr.attrName+"\" type='text'  value='"+attr.operateValue+"' style='width:140px; height:25px;border:1px solid  #CCC;   ' onfocus=\"if (value !=''){value='';}\"></div>"
+            "<div style='float:left; width:70px;'><img id='"+attr.attrId+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attr.attrType+"\",\""+attr.attrName+"\")'><img id='"+attr.attrId+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\"\")'></div>"
+                     "</div>";  
	   }	
	   if (attr.attrType=="其他" && attr.operateFlag=="attr"){
			body_html_condition+="<div class='bore' title='"+attr.attrType+"' style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+			"<div style='float:left;width:280px;color:#094AB2' title='"+attr.attrId+"'>"+attr.attrName+"</div>"
+"<div style='float:left; padding-left:5px; margin-top:3px;'>"
+			"<select id='"+attr.attrId+"_"+i+"' class='easyui-combobox' name='state' style='width:80px;height:25px' panelHeight='auto' >"
+                                "<option value='"+attr.operateSign+"' selected>"+attr.attrTable+"</option>"
+                                "<option value='like'>模糊</option>"
+                                "<option value='=' >等于</option>"
+                        "</select></div>"
+	           "<div style='float:left;padding-left:5px; margin-top:3px;'><input id=\"tag_name_txt_"+attr.attrName+"\" type='text'  value='"+attr.operateValue+"' style='width:140px; height:25px;border:1px solid  #CCC;  ' onfocus=\"if (value !=''){value='';}\" ></div>"	
+            "<div style='float:left; width:70px;'><img id='"+attr.attrId+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attr.attrType+"\",\""+attr.attrName+"\")'><img id='"+attr.attrId+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\"\")'></div>"		
+			          "</div>";
	   }
	   if (attr.attrType=="码表" && attr.operateFlag=="attr"){
		  // +                         "<option value='"+attr.operateValue+"' selected>"+attr.attrTable+"</option>"
			body_html_condition+="<div class='bore' title='"+attr.attrType+"'  style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+			"<div style='float:left;width:280px;color:#094AB2' title='"+attr.attrId+"'>"+attr.attrName+"</div>"	
+          "<div style='float:left; padding-left:5px; margin-top:3px; '>"
+			"<select id='"+attr.attrId+"_"+i+"' class='easyui-combobox' name='state' style='width:225px;height:25px' panelHeight='100'"
+       " data-options='valueField:\"id\",textField:\"text\",url:\"getAttrTableAction.action?table_name="+attr.attrTable+"\" ' >"
+                        "<option value='"+attr.operateValue+"' selected>"+attr.operateSign+"</option>"
+                        "</select></div>"
+           "<div style='float:left; width:70px;'><img id='"+attr.attrId+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attr.attrType+"\",\""+attr.attrName+"\")'><img id='"+attr.attrId+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\"\")'></div>"		
+		          "</div>";	
			
	   }
	
	   if (attr.attrType=="是否码表" && attr.operateFlag=="attr"){
			body_html_condition+="<div  class='bore' title='"+attr.attrType+"'  style='height:32px; line-height:32px; margin-left:5px; margin-right:5px; margin-top:5px; padding-left:5px; border: #CCC solid 1px;'>"
+			"<div style='float:left;width:280px;color:#094AB2' title='"+attr.attrId+"'>"+attr.attrName+"</div>"
+           "<div style='float:left; padding-left:5px; margin-top:3px;'>"
+			"<select id='"+attr.attrId+"_"+i+"' class='easyui-combobox' name='state' style='width:225px;height:25px' panelHeight='auto' >"
+                   "<option value='"+attr.operateValue+"' >"+attr.operateSign+"</option>"
+                   "<option value='1' >是</option>"
+                   "<option value='0' >否</option>"
+           "</select></div>"	
+          "<div style='float:left; width:70px;'><img id='"+attr.attrId+"_tr_struct' src='./img/attrs/goucheng2.png' title='构成分析' style='cursor:pointer;' width='32px' height='32px' onClick='$.consitAttr(this,\""+attr.attrType+"\",\""+attr.attrName+"\")'><img id='"+attr.attrId+"_tr_del' src='./img/attrs/delete2.png' width='32px' height='32px' title='删除条件组合'  style='cursor:pointer;' onClick='$.deletrAttr(this,1,0,\"\")'></div>"		
+			          "</div>";	  		
			
	   }
	  // alert("body_html_condition:"+body_html_condition);
		$("#attr_table_filter").append(body_html_condition);
		$.parser.parse($("#attr_table_filter")); 
		//$.parser.parse($("#"+attr.attrId)); 
		
		
	 });
}
	 
	//条件保存
	$("#tag_detail_bt2").click(function(){	   
	  var start =$("#create_tag_date").datebox("getValue");  //有效期开始时间
	  var end =$("#end_tag_date").datebox("getValue");       //有效期结束时间
	  var myDate = new Date();
	  var year = myDate.getFullYear();
	  var mon = myDate.getMonth()+1;
	  var day = myDate.getDate();
	  var hour= myDate.getHours();
	  var minute= myDate.getMinutes();
	  var second= myDate.getSeconds();
	  //var saveFlag=;
	  //alert(saveFlag);
	  //群id
	  var creategroupid = year+""+(mon<10?('0'+mon):mon)+""+(day<10?('0'+day):day)+""+(hour<10?('0'+hour):hour)+""+(minute<10?('0'+minute):minute)+""+(second<10?('0'+second):second);	

	  if(group_type!=1){ //我的群 1  共享群 0
		tag_id=creategroupid+$("#req_userId").val();
	  }else{
		tag_id=id;   
	  }
	   if($.trim(group_type)!="1"){
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
	  
	   if(start==null || end==null || start.length==0 || end.length==0){
		      alert("请选择起始时间!")
	   }else if(tag_n=='请输入客户群名称'){
		      alert("请输入客户群名称！")
	   }else{  
	      	 var condition= $.attr_build();	  //组合条件
             var sql =encodeURI(condition[0]);
			 //alert(condition[2]);
   	         document.getElementById("wait_div").style.display="block";
	         document.getElementById("wait_div").style.filter="alpha(opacity=20)"; 
			 $("#load_div").show();
		     var subs_count =$.trim($("#persons_td").text());   //获取筛选人数
			 //alert(subs_count);
			 if(subs_count!="人"){
					if(condition==null){$("#wait_div").hide(); $("#load_div").hide(); }										
					$.ajax({
							type: 'POST',
							url: 'updateAdvanceGroupTag.action',
							data:{tag_id:tag_id,stamt:encodeURI(condition[1]),tag_attrs:encodeURI(condition[2]),persons:encodeURI($("#persons_td").text().replace("人","")),sql:sql,create_time:start,end_time:end,tag_introduce:encodeURI($("#tag_introduce").val()),tag_name:encodeURI(tag_n),type:((group_type==1)?1:0),share:group_type},
							dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
							success: function(data){ 
							  						   
							   var saveFlag=data.substring(0,1);
							    //alert(saveFlag);	
							    if (saveFlag=="1"){
									$("#wait_div").hide();   
									$("#load_div").hide(); 
									alert("客户群筛选条件保存成功"); 								
								}else{
									$("#wait_div").hide();   
									$("#load_div").hide();									
									alert("客户群名称重复，请重新命名！");
								}

				//				$(window.parent.document).find("#iframe").attr("src","TaginfoAction.action?userId="+userId);	          
							},
							error: function(data){
							alert("客户群筛选条件保存失败");
							$("#wait_div").hide(); 
							$("#load_div").hide();    
							return false;
							}
					});
											
			}else{
					alert("请筛选客户群人数");
					$("#wait_div").hide(); 
				    $("#load_div").hide();
			}
	   
	   }
	  		
	});
	
	//清单导出
	 $("#tag_detail_bt1").click(function(){
        if(tag_id=="null" || tag_id.length==0)
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
	 
	 
	 //取消按钮
	 $("#no").click(
     function(){
       $("#download_div").css("display","none");
     });
	 //确定导出按钮
  $("#yes").click(function() {
    var list_count = $("#persons_td").text().replace("人", "");
    var tag_sql = $.attr_build()[0];
    var str = "";
    var col_name = "";
    $("#download_table tr:eq(1)").find("input").each(function() {
      str_index = this.value;
      name = this.name;
      if ($(this).attr("checked")) {
        str += str_index + ",";
        col_name += name + "  ";
      }
    });

    if (str == "" || col_name == "") {
      alert("请选择导出字段！");
      return;
    }
    $("#download_div").css("display", "none");
    //id=tag_id;
    if (userId == "") {
      userId = $("#req_userId").val();
    }
    
    if (group_name == "" || group_name=="请输入客户群名称") {
      group_name = $("#tag_name_text").val();
      if (group_name=="请输入客户群名称") {
            alert("请输入客户群名称！");
            return;
      };
    }
var condition_sq= $.attr_build();
var tag_sql =encodeURI(condition_sq[0]);
    $.ajax({
      type: 'POST',
      url: 'downaddinfo.action',
      data: {
        tag_name: group_name,
        count: list_count,
        sql: tag_sql,
        id: tag_id,
        col: str,
        col_desc: col_name,
        type: "group_list",
        region_name: $("#cityName").combobox('getText'),
        flag: '1'
      },
      dataType: "text",
      success: function(data) {
        var href = "querydown.action?userId=" + userId;
        window.location.href = href;
        $("#wait_div").show();
        $("#load_div").show();
      },
      error: function(data) {
        return false;
      }
    });
    $(window.parent.document).find("#left_menu_table tr:eq(4)").css("background", "");
    $(window.parent.document).find("#left_menu_table tr:eq(5)").css("background", "#d4d4d4");
  });
  
  $("#commform").click(function(){
    window.location.href="initAttrTagAction.action?title_name="+ encodeURI(encodeURI($("#tag_name_text").val())) +"&id=&userId="+userId+"&regionId="+regionId+"&href=&tag_introduce="+encodeURI(encodeURI($("#tag_introduce").val()))+"&create_tag_date="+encodeURI(encodeURI($("#create_tag_date").combobox("getText")))+"&end_tag_date="+encodeURI(encodeURI($("#end_tag_date").combobox("getText")))+"&cityName="+encodeURI(encodeURI($("#cityName").combobox("getValue")))+"&countyName="+encodeURI(encodeURI($("#countyName").combobox("getValue")))+"&userState="+encodeURI(encodeURI($("#userState").combobox("getValue")))+"&count=";
  });

  //属性视图提示
  $.extend({
    'attr_view_panel_tishi': function(value_type, type1, type2, type11) {
      $.ajax({
        type: 'POST',
        url: 'listAttrTagAction.action',
        data: {
          type_1: value_type,
          type_2: type2
        },
        dataType: 'json',
        success: function(data) {
          var table_str = "";
          $("#serch_attr_div").children().remove();
          $.each(data, function(i, table) {
            $.each(table, function(l, tr) {
              $.each(tr, function(k, td) {
                //atrs 说明 0 属性类型   1 属性名称  2 属性   3 属性id  4 一级属性
                table_str = table_str + "<div class='attr_tishi_div' onClick='$.attr_tishi(this)' onMouseover='$.attr_tishi_over(this)' onMouseOut='$.attr_tishi_out(this)'  >" + td.attr_name + "</div> ";
              });
            });
          });
          $("#serch_attr_div").html(table_str);
          $("#serch_attr_div").css("display", "block");
        },
        error: function(data) {
          alert(data);
          return false;
        }
      });
    }
  });

  //提示框点击事件
  $.extend({
    'attr_tishi': function(evet) {
      $("#attr_text").val($(evet).text());
      $("#attrseachval").val($(evet).text());
      $("#serch_attr_div").hide();
    }
  });
//提示框移出移入变化
$.extend({'attr_tishi_over':function(evet){
$(evet).css('color','#06F');
}});
$.extend({'attr_tishi_out':function(evet){
$(evet).css('color','#CCC');
}});

  //属性查询事件
  var oldtext = "";
  $("#attr_text").keyup(function() {
    if ($(this).val() != oldtext) {
      //alert($(this).val());
      //oldtext=$(this).val();
      var type1 = ""; //一级属性类
      var type2 = encodeURI($("#attr_text").val()); //二级属性类
      var type11 = "";
      $.third_attr_panel_tishi('2', type1, type2, type11);
    }
  });

  //生产三级属性查询提示框面板
  $.extend({
    'third_attr_panel_tishi': function(value_type, type1, type2, type11) {
      $.ajax({
        type: 'POST',
        url: 'listAttrTagAction.action',
        data: {
          type_1: value_type,
          type_2: type2,
          type3:type1
        },
        dataType: 'json',
        success: function(data) {
          var table_str = "";
          $("#serch_attr_div").children().remove();
          $.each(data, function(i, table) {
            $.each(table, function(l, tr) {
              $.each(tr, function(k, td) {
                //atrs 说明 0 属性类型   1 属性名称  2 属性   3 属性id  4 一级属性
                table_str = table_str + "<div class='attr_tishi_div' onClick='$.attr_tishi(this)' onMouseover='$.attr_tishi_over(this)' onMouseOut='$.attr_tishi_out(this)'  >" + td.attr_name + "</div> ";
              });
            });
          });
          $("#serch_attr_div").html(table_str);
          $("#serch_attr_div").css("display", "block");
        },
        error: function(data) {
          alert(data);
          return false;
        }
      });
    }
  });

});
</script>
</html>
