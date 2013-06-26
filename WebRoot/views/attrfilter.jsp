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
	height: 100%
}
body {
	height: 100%;
	width: 100%;
	font: 10pt "微软雅黑";
	margin: 0px;
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
			background:#FFF; width:380px; height:150px;
			position:absolute;top:55px;right:20px;z-index:2;
			display:none  }
</style>

<body>
<div id="wait_div" class="wait_div" >
</div>

<img id="load_div" src="./img/load/load.jpg" width="32" height="32" align="absmiddle" style="z-index:0s; position:absolute; left:50%;top:50%; display:none">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td width="200px"  align="right" valign="top">
        <div  class="attr_title_div" style="background:#094AB2; height:30px; color:#FFF; width:200px;	position: relative;left: 5px;top: 8px; line-height:30px;">
        <div class="attr_title_div" style="width:130px;" align="left">&nbsp;&nbsp;属性视图(903)</div>
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
      <div class="attr_title_div" style=" width:145px;" align="left">&nbsp;标签属性</div>
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
          <td width="16px" height="16px"><img src="./img/leftup.png" width="22" height="22"></td>
          <td width="100%" style="background:url(./img/upborder.png)  repeat-x"></td>
          <td width="16px" height="16px"><img src="./img/rightup.png" width="22" height="22"></td>
        </tr>
        <tr>
          <td height="100%" style="background:url(./img/leftborder.png) repeat-y"></td>
          
          <!-- 标签显示内容框
    ================================================== -->
          
          <td   valign="top"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td id="tag_name" class="title_td" align="center" width="100%"><s:property value="title" /><input type="hidden" id="tag_id"  value='<s:property value="id" />'/>
               </td>
                <td colspan="2" align="right"><a id="tag_detail_bt1" href="javascript:void(0)">清单导出</a></td>
              </tr>
              <tr>
                <td colspan="3"  valign="top" style=" font: bold; height:40px;">客户群基本属性</td>
              </tr>
              <tr>
                <td colspan="3" height="20px" style="padding-left:10px;" >用户地域：
                  <select id="cityName" class="easyui-combobox" name="region" style="width:120px; height:25px" >
                  </select>
                  <input type="hidden" id="req_reson" value="<s:property value='#session.regionId'/>"/>
                  <select id="countyName" class="easyui-combobox" name="state" style="width:120px;height:25px"> 
                  </select>
                  &nbsp; &nbsp; &nbsp;
                  用户状态：
                  <select id="userState" class="easyui-combobox" name="state" style="width:120px;height:25px">
                    <option value="ALL"   >全部</option>
                    <option value="US10" selected>正常使用</option>
                    <option value="US30">停机</option>
                    <option value="US34">欠费</option>
                    <option value="US2">离网</option>
                    <option value="US5">其他</option>   
                  </select>
                  &nbsp; &nbsp; &nbsp;
                  用户品牌：
                  <select id="userbrand" class="easyui-combobox" name="state" style="width:120px;height:25px">
                    <option value="ALL"  selected >全部</option>
                    <option value="BrandGotone"  >全球通</option>
                  	<option value="BrandMzone" >动感地带</option>
                  	<option value="BrandSzx">神州行</option>
                  	<option value="BrandTD">TD品牌</option>
                  	<option value="999">不详</option>
                  </select></td>
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
                <td style=" font: bold; height:40px;" colspan="3">自定义标签属性</td>
              </tr>
              <tr>
                <td valign="top" style="padding-left:10px; "  height="300px;"><table  width="600px" border="0" height="300px;" cellspacing="0" cellpadding="10">
                    <tr>
                      <td rowspan="3" align="left"><table id="attr_table_edit" width="600px;"  height="300px" border="1" cellspacing="0" cellpadding="0">
                          <tr height="25px;">
                            <td style="color:#FFF; background:#094AB2;font:bold;">&nbsp;属性值操作</td>
                          </tr>
                          <tr>
                            <td width="600px;" height="300px;"><div style="overflow:auto; height:300px; width:600px;">
                                <table id="attr_table_filter" width="580px" border="0" cellspacing="0" cellpadding="5">
                    
<input type="hidden"  value="<s:property value='attr_table' />" id="attr_table"    /> 
<input type="hidden"  value="<s:property value='jsonAttr' />" id="jsonAttr"    />                                        

                            </table>
                              </div></td>
                          </tr>
                        </table></td>
                      <td width="80px" align="center"><img src="./img/persons.png" width="66" height="146"></td>
                    </tr>
                    <tr>
                      <td align="center" id="persons_td"> <s:property value="tagUserCounts"/>人</td>
                    </tr>
                    <tr>
                      <td valign="bottom" ><div><a id="tag_detail_bt3" href="javascript:void(0)" >客户筛选</a></div><br/>                    
                      <div><a id="tag_detail_bt2" href="javascript:void(0)"  >条件保存</a></div></td>
                    </tr>
                  </table></td>
              </tr>

              
                           
            </table></td>
          
          <!-- END标签显示内容框
    ================================================== -->
          
          <td height="100%" style="background:url(./img/rightborder.png) repeat-y"></td>
        </tr>
        <tr>
          <td width="16px" height="16px"><img src="./img/leftdown.png" width="22" height="22"></td>
          <td  width="100%" style="background:url(./img/downborder.png)  repeat-x"></td>
          <td width="16px" height="16px"><img src="./img/rightdown.png" width="22" height="22"></td>
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
      <td height="100%" width="100%"  ><div  style="width:100%; height:100%; overflow:auto">
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
     var tag_sql="";  //客户群SQL
     var count="";    //客户群人数
     var regions="";
       var re="";
     var countys="";
     var con="";
     
   
     
     
/*   if(regionId!='1'){
       alert("sss");
       $("#countyName").css("display","none");
     };*/
//     alert(href);
/*     if(href=='not_already'){
     $("#tag_detail_bt1").css("background","gray");
     $("#tag_detail_bt1").click(function(){
          alert('文件正在生成中，暂不可下载。');
          
     })
     }else{
     $("#tag_detail_bt1").css("display","block");
      $("#tag_detail_bt1").attr("href",href);
     }*/
     $("#tag_detail_bt1").click(
     function(){
       if(count==0){
       alert("清单总人数为0，请查看！");
       }else{
       $("#download_div").css("display","block");
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
           $.ajax({
    		type: 'POST',
    		url: 'downaddinfo.action',
    		data:{tag_name:group_name,count:count,sql:tag_sql,id:id,col:str,col_desc:col_name,type:"group_list",region_name:$("#cityName").combobox('getText')},
    		dataType:"text", 
    		success: function(data){
    		var href="querydown.action?userId="+userId;
             window.location.href=href; 
            },
   			error: function(data){
     		
     		return false;
    		}
    	});	
    $(window.parent.document).find("#left_menu_table tr:eq(4)").css("background","");	
    $(window.parent.document).find("#left_menu_table tr:eq(5)").css("background","#d4d4d4");	
    	
          
     })
	//获取城市名称
	if(regionId!=1){
	 $("#cityName").combobox({
				  url:'getCityName.action?regionId='+regionId,
				  editable:true,
				  valueField:'id',
				  textField:'text',
				  panelHight:'auto',
				  panelWidth:100,
				  editable:true,
				  multiple:true,				  
				  onChange:function(newValues,oldValues){		  
		          $('#countyName').combobox({
		                
			                    url:'getCountyName.action?cityId='+newValues,
			                    valueField:'id',
			                    panelHeight:'200',
								editable:true,	
			                    textField:'text',
			                     multiple:true
			      });	
			      }
   });}else{
      $("#cityName").combobox({
				  url:'getCityName.action?regionId='+regionId,
				  editable:true,
				  valueField:'id',
				  textField:'text',
				  panelHight:'auto',
				  panelWidth:100,
				  editable:true,
				  multiple:true	
				  });
     $("#countyName").combobox("setValue","ALL"); 
     $("#countyName").combobox("disable","true");
    
   }


 
//过滤条件       				
 var jsonarry = $.parseJSON($("#jsonAttr").val());
 $.each(jsonarry, function(i,attr){ 

		var bt_id=attr.attr_id+"_tr";
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
		if(attr.attr_id=="BRAND_ID")
		{	   
			$("#userbrand").combobox("setValue",attr.attr_value1); 
;}			
						   
		  if (attr.attr_type=="连续型"){	
			         
				   $("#"+bt_id).children(" :eq(1)").find('select').combobox("setValue",attr.attr_value_type1);
				   $("#"+bt_id).children(":eq(2)").children().val(attr.attr_value1);	  		  
				   $("#"+bt_id).children(":eq(3)").find('select').combobox("setValue",attr.attr_value_type2);				                   $("#"+bt_id).children(":eq(4)").children().val(attr.attr_value2);		
	  
		  } else {
	         
				  if(attr.attr_type=="其他")
				  {
                   $("#"+bt_id).children(":eq(1)").children().val(attr.attr_value1);	
											  			 				  
				  }else
				  {
				   $("#"+bt_id).children(":eq(1)").find('select').combobox("setValue",attr.attr_value1);					   					   		
				  }
			 				 	
		  }  		  
 });
 


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



   
    //导出客户标签
    $("#tag_detail_bt1").click(function(){
		
    //$(window.parent.document).find("#iframe").attr("src","TaginfoAction.action?userId="+userId);	
 
    	///alert(tag_id);
//   		$.ajax({
//    		type: 'POST',
//    		url: "filterTagExport.action",
//    		data:{tag_id:tag_id},
//    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
 //   		success: function(downPath){     
 //   			if (downPath==""){
 //   				alert("无下载路径");
 //   			}else{
 //   				window.location.href=downPath;
 //   			}    			
  //          },
  // 			error: function(data){
  //   		alert("json=" + data);
   //  		return false;
   // 		}
   // 	});	
    });
   //群体筛选
   	$("#tag_detail_bt3").click(function(){	
	 //  $("#wait_div").show(); 
	    document.getElementById("wait_div").style.display="block";
	    document.getElementById("wait_div").style.filter="alpha(opacity=20)";
		var attrs= $.attr_build();
		$("#load_div").show();
		if(attrs==null){$("#wait_div").hide(); $("#load_div").hide(); }
		var sql =encodeURI(attrs[0]);
//			alert(sql);
//		alert(regions.length);
//	alert(re);
//		alert(con);
//		alert($("#cityName").combobox('getText'));
	  	 	$.ajax({
	    		type: 'POST',
	    		url: 'filterTagCounts.action',
	    		data:{sql:sql},
	    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
	    		success: function(data){  
	    		count=data; 
	    			$("#persons_td").text(data+'人'); 
					$("#wait_div").hide(); 
					$("#load_div").hide(); 
					re="";
					con="";
//			     sql="";
//				tag_sql="";   
	            },
	   			error: function(data){
	     		alert("客户群筛选失败"); 
				$("#wait_div").hide(); 
				$("#load_div").hide();  
	     		return false;
	    		}
	    	});	
		
	});

//群体条件保存	
   $("#tag_detail_bt2").click(function(){	
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
	    		data:{tag_id:$("#tag_id").val(),tag_attrs:encodeURI(b[2]),stamt:encodeURI(b[1]),persons:encodeURI($("#persons_td").text()),sql:sql},
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
		
			
	});
//文件上传
    $("#tag_uplod").click(function(){
	   var usertype=$("#usertype").combobox('getValue');
	   var filename=$("#file").val();
       var tag_id=$("#tag_id").val();
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
					table_str=table_str+("<td valign='top'><input id='"+td.attr_id+"_bt' type='checkbox' value=''  onClick=$.edit_attr(this.name) name='"+atrs+"' >"+td.attr_name+"</td>");  
					});
					table_str=table_str+("</tr>");										 
				});
			});	
			$("#attrs_list").html(table_str);	
			$("#attr_edit_div").css("display","block");				
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
		  var tag_attr_info_city=new Object();    //地市属性
		  var tag_attr_info_country=new Object(); //乡镇属性
		  var tag_attr_info_state=new Object();   //用户状态属性
		  var tag_attr_info_brand=new Object();   //用户品牌属性
		  var attrFlag=0;                         //标志属性选择是否正确 0表示正确，1表示不正确
		  var tag_id=$("#tag_id").val();//客户群标识
		  var tag_name=$("#tag_name").text();//客户群名称
		  var tag_attr_info_list = new Array();
		  tag_sql="";
		  var tag_stmat=""; //客户群口径
		$("#attr_table_filter tr").each(function (index, tr) { 		  
		  var attr_type=$(tr).attr('title').split(',')[0];
		  var attr_id=$(tr).attr('title').split(',')[2]; 
		  var attr_table=$(tr).attr('title').split(',')[3]; 
		  var attr_lvl=$(tr).attr('title').split(',')[1]; //0表示属性类型;//2表示属性标识;//3表示属性码表;//
		  if (attr_type=="连续型"){	
			    
	  			 var tag_attr_info=new Object();
				  tag_attr_info.tag_id=tag_id;
				  tag_attr_info.tag_name=tag_name;
				  tag_attr_info.attr_id=attr_id;
				  tag_attr_info.attr_table="00";
				  tag_attr_info.attr_lvl=attr_lvl;
				  tag_attr_info.attr_name=$(tr).children(":eq(0)").text(); 
				  tag_attr_info.attr_from="0";
				  tag_attr_info.attr_type=attr_type;
				  tag_attr_info.attr_value_type1=$(tr).children(":eq(1)").find('select').combobox("getValue");
				  tag_attr_info.attr_value1=$(tr).children(":eq(2)").children().val();	  		  
				  tag_attr_info.attr_value_type2=$(tr).children(":eq(3)").find('select').combobox("getValue");				  
				  tag_attr_info.attr_value2=$(tr).children(":eq(4)").children().val();		
		  		  if(tag_attr_info.attr_value1=="")   
				  {
					  alert("【"+tag_attr_info.attr_name+"】 属性值不能为空，请重新填写");
					  attrFlag=1;
					  return false;
				  }			      
				  else if(tag_attr_info.attr_value2=="")   
				  {
					  alert("【"+tag_attr_info.attr_name+"】 属性值不能为空，请重新填写");
					  attrFlag=1;
					  return false;
				  }			      				  			   
		  		  if(isNaN(new Number(tag_attr_info.attr_value1)))   
				  {
					  alert("【"+tag_attr_info.attr_name+"】 属性值不为数字，请重新填写");
					  attrFlag=1;
					  return false;
				  }
				  if(isNaN(new Number(tag_attr_info.attr_value2)))   
				  {
					  alert("【"+tag_attr_info.attr_name+"】 属性值不为数字，请重新填写");
					  attrFlag=1;
					  return false;
				  }	
				  
	                         
				  tag_stmat=tag_stmat+tag_attr_info.attr_name+tag_attr_info.attr_value_type1+tag_attr_info.attr_value1+"并且"+tag_attr_info.attr_value_type2+tag_attr_info.attr_value2+";";
	  
				  tag_sql=tag_sql+"a."+tag_attr_info.attr_id+tag_attr_info.attr_value_type1+tag_attr_info.attr_value1+" and "+"a."+tag_attr_info.attr_id+ tag_attr_info.attr_value_type2+tag_attr_info.attr_value2+" and ";
 
	             tag_attr_info_list.push(tag_attr_info);
	  
		  } else {
	  			 var tag_attr_info=new Object();
				  tag_attr_info.tag_id=tag_id;
				  tag_attr_info.tag_name=tag_name;
				  tag_attr_info.attr_id=attr_id;
				  tag_attr_info.attr_name=$(tr).children(":eq(0)").text(); 
				  tag_attr_info.attr_from="0";
				  tag_attr_info.attr_type=attr_type;
				  tag_attr_info.attr_value_type1="=";	
				  tag_attr_info.attr_lvl=attr_lvl;	  
				  if(attr_type=="其他")
				  {
					  tag_attr_info.attr_table="00";

                      tag_attr_info.attr_value1=$(tr).children(":eq(1)").children().val();	
					  tag_stmat=tag_stmat+tag_attr_info.attr_name+tag_attr_info.attr_value_type1+$(tr).children(":eq(1)").children().val()+ ";";	
					  if(tag_attr_info.attr_value1=="")   
				  		{
					  		alert("【"+tag_attr_info.attr_name+"】 属性值不能为空，请重新填写");
							attrFlag=1;
					  		return false;
				  		}
											  			 				  
				  }else
				  {
					  tag_attr_info.attr_table=attr_table;
				      tag_attr_info.attr_value1=$(tr).children(":eq(1)").find('select').combobox("getValue");
					  tag_stmat=tag_stmat+tag_attr_info.attr_name+tag_attr_info.attr_value_type1+$(tr).children(":eq(1)").find('select').combobox("getText")+ ";";	
					  if(tag_attr_info.attr_value1=="")   
				  		{
					  		alert("【"+tag_attr_info.attr_name+"】 属性值不能为空，请重新填写");
							attrFlag=1;
					  		return false;
				  		}					   					   		
				  }
			      tag_attr_info.attr_value_type2="--";
				  tag_attr_info.attr_value2="--";	
				  tag_sql=tag_sql+"a."+tag_attr_info.attr_id+tag_attr_info.attr_value_type1+"'"+tag_attr_info.attr_value1+"' and ";	
				  
	              tag_attr_info_list.push(tag_attr_info);				 				 	
		  }  		   		       
		});
		//attrFlag标志为0表示条件正常
		if(attrFlag==0){

			if($("#cityName").combobox('getValue')!="ALL"){
				  tag_attr_info_city.tag_id=tag_id;
				  tag_attr_info_city.tag_name=tag_name;
				  tag_attr_info_city.attr_id="CITY_ID";
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

			if($("#countyName").combobox('getValue')!="ALL"){
				  tag_attr_info_country.tag_id=tag_id;
				  tag_attr_info_country.tag_name=tag_name;
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
				  tag_attr_info_state.tag_name=tag_name;
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
			
				
			if($("#userbrand").combobox('getValue')!="ALL"){
				  tag_attr_info_brand.tag_id=tag_id;
				  tag_attr_info_brand.tag_name=tag_name;
				  tag_attr_info_brand.attr_id="BRAND_ID";
				  tag_attr_info_brand.attr_name="品牌"; 
				  tag_attr_info_brand.attr_table="MK_VGOP.T_DIM_BRAND";
				  tag_attr_info_brand.attr_lvl="状态属性"; 				  
				  
								  
				  tag_attr_info_brand.attr_from="0";
				  tag_attr_info_brand.attr_type="码表";
				  tag_attr_info_brand.attr_value_type1="=";		  
                  tag_attr_info_brand.attr_value1=$("#userbrand").combobox('getValue');	
			      tag_attr_info_brand.attr_value_type2="--";
				  tag_attr_info_brand.attr_value2="--";					  
				  tag_sql=tag_sql+"a."+tag_attr_info_brand.attr_id+tag_attr_info_brand.attr_value_type1+"'"+tag_attr_info_brand.attr_value1+"' and ";					  
				  
				  
				  tag_stmat=tag_stmat+tag_attr_info_brand.attr_name+tag_attr_info_brand.attr_value_type1+$("#userbrand").combobox('getText')+";";				  
				  			  	   
	              tag_attr_info_list.push(tag_attr_info_brand);						   
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
	$.extend({'edit_attr':function(atrs){		
	//if($(this).attr("checked")==true){

		var strs= new Array(); 
		strs=atrs.split("&");
		var checked=$("#"+strs[3]+"_bt").attr("checked");
		var edit_tr="#"+strs[3]+"_tr";
		if(checked=="checked"){
		var htmlconent;
		if(strs[0]=="连续型"){
		 htmlconent="<tr id='"+strs[3]+"_tr' title='"+strs[0]+","+strs[4]+","+strs[3]+","+strs[2]+"'><td width='80px'>"+strs[1]+"</td>"
                          +  "<td><select class='easyui-combobox' name='state' style='width:80px;height:25px'>"
                          +     "<option value='>' selected>大于</option>"
						  +     "<option value='>=' >大于等于</option>"
                          +      "<option value='<' >小于</option>"
						  +      "<option value='<=' >小于等于</option>"
                          +      "<option value='='>等于</option>"
                          +      "</select></td>"
                          +  "<td><input id='tag_name_txt' type='text'  value='0.00' style='width:100px; height:25px;border:1px solid  #CCC;'></td>"
                          +   "<td><select class='easyui-combobox' name='state' style='width:80px;height:25px'>"
                          +     "<option value='>' selected>大于</option>"
						  +     "<option value='>=' >大于等于</option>"
                          +      "<option value='<' >小于</option>"
						  +      "<option value='<=' >小于等于</option>"
                          +      "<option value='='>等于</option>"
                          +       "</select></td>"
                          +    "<td ><input id='tag_name_txt' type='text'  value='0.00' style='width:100px; height:25px;border:1px solid  #CCC;'></td>"
                          +    "<td width='80px'><label style='cursor: pointer;'  id='"+strs[3]+"&"+strs[0]+"'  onClick=$.consitAttr(this)>构成</label> <span id='"+strs[3]+"_dt' onClick=$.deletrAttr(this.id) style='cursor: pointer;'><lable id='"+strs[3]+"del' style='cursor: pointer;'>删除</label></span></td></tr>";
								  
} else if (strs[0]=="码表"){
       htmlconent="<tr id='"+strs[3]+"_tr' title='"+strs[0]+","+strs[4]+","+strs[3]+","+strs[2]+"'><td width='80px'>"+strs[1]+"</td>"
                        +  "<td colspan=4><select class='easyui-combobox' name='state' style='width:250px;height:25px' data-options='valueField:\"id\",textField:\"text\",url:\"getAttrTableAction.action?table_name="+strs[2]+"\" '></td>"
                         +  "<td width='80px'><label style='cursor: pointer;' id='"+strs[3]+"&"+strs[0]+"'  onClick=$.consitAttr(this)>构成</label> <span id='"+strs[3]+"_dt' onClick=$.deletrAttr(this.id) style='cursor: pointer;'><lable  style='cursor: pointer;'>删除</label></span></td></tr>"; 
} else if (strs[0]=="是否码表"){
        htmlconent="<tr id='"+strs[3]+"_tr' title='"+strs[0]+","+strs[4]+","+strs[3]+","+strs[2]+"'><td width='80px'>"+strs[1]+"</td>"
                        +  "<td colspan=4><select class='easyui-combobox' name='state' style='width:250px;height:25px'>"
                        +   "<option value='1' selected>是</option>"
                          +   "<option value='0' >否</option>"
                          +    "</select></td>"
                         +  "<td width='80px'><label style='cursor: pointer;' id='"+strs[3]+"&"+strs[0]+"'  onClick=$.consitAttr(this)>构成 </label><span id='"+strs[3]+"_dt' onClick=$.deletrAttr(this.id) style='cursor: pointer;'><lable  style='cursor: pointer;'>删除</label></span></td></tr>"; 
} else if (strs[0]=="其他"){
        htmlconent="<tr id='"+strs[3]+"_tr' title='"+strs[0]+","+strs[4]+","+strs[3]+","+strs[2]+"'><td width='80px'>"+strs[1]+"</td>"
                          + "<td colspan=4><input style='width:250px;height:25px' type='text'/></td>"
                           +  "<td width='80px'><span id='"+strs[3]+"_dt' onClick=$.deletrAttr(this.id) style='cursor: pointer;'><lable style='cursor: pointer;'>删除</label></span></td></tr>";  
}     

  $("#attr_table_filter").append(htmlconent);	
  $.parser.parse(edit_tr);
	}
	else{$(edit_tr).remove();}  		
}});
	
    $.extend({'deletrAttr':function(even){	
	            $("#"+even).parent().parent().remove();
				showAttrCounts();
		}});
	
//构成分析	
    $.extend({'consitAttr':function(even){	
                var attrIdArray=new Array();
				var attrId=$(even).attr("id");			
				attrIdArray=attrId.split("&");				
				var typeFlag=attrIdArray[1];
				if (typeFlag=="是否码表"){
					 $("#barchar").css("display","none");
					 $("#piebar").css("display","block");
				}else{
					 $("#barchar").css("display","block");
					 $("#piebar").css("display","none");
				}
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
function showAttrCounts(){
	var basicCounts=countSubstr($("#attr_table_filter").html(),"基本属性",true);     
 $("#baisc_id").text(basicCounts);
 var voiceCounts=countSubstr($("#attr_table_filter").html(),"语音属性",true);     
 $("#voice_id").text(voiceCounts);
 var flowCounts=countSubstr($("#attr_table_filter").html(),"流量属性",true);     
 $("#flow_id").text(flowCounts);
 var termalCounts=countSubstr($("#attr_table_filter").html(),"终端属性",true);     
 $("#termal_id").text(termalCounts);
 var groupCounts=countSubstr($("#attr_table_filter").html(),"集团属性",true);     
 $("#group_id").text(groupCounts);
 var smsmmsCounts=countSubstr($("#attr_table_filter").html(),"短信",true);     
 $("#smsmms_id").text(smsmmsCounts);
 var keysCounts=countSubstr($("#attr_table_filter").html(),"重点业务",true);     
 $("#keys_id").text(keysCounts);
 var busCounts=countSubstr($("#attr_table_filter").html(),"业务偏好",true);     
 $("#bus_id").text(busCounts);
 var contentCounts=countSubstr($("#attr_table_filter").html(),"内容偏好",true);     
 $("#content_id").text(contentCounts);
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
