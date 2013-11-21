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
*{
font-family:"微软雅黑";
}
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
	font-size:14pt;
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
.border {
   border:1px solid #D3D3D3;
}
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
	  <form id="formrequest" method="post" action="addTabRequestDelt.action" onSubmit="return checkTrim();">
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>    
           <td width="100%"  align="right" valign="top">
		   <table  id="chartTable" width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>       
          
          <!-- 标签申请
    ================================================== -->
          
          <td width="1166"   valign="top" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"  id="tag_name" class="title_td" align="center">标签/属性申请单</td>               
              </tr>
              <tr>
                <td width="12%" valign="top" style="padding-top:10px;" class="class_td">标签/属性名称：</td>
				<td colspan="3" valign="middle" >					
				<input type="text" name="activename" id="activename" class="border "  size="35" />
				<input type="hidden" name="req_reson" value="<s:property value='#session.userName'/>"/>
				<span style="color:#FF0000; margin-left:10px">*</span>
				</td>
              </tr>
              <tr>
                <td  height="20px" class="class_td" >申请理由：</td>
				<td colspan="3">				
				<textarea id="requestreson" name="requestreson"  class="border "  cols="60" rows="4"></textarea>
				<span style="color:#FF0000; margin-left:10px">*</span></td>
              </tr>
              <tr>
                <td class="class_td">标签/属性范围：</td>
                <td colspan="3" class="class_td">
               
				<input name="activescope" type="checkbox"   value="河北省"> 河北省 
				<input name="activescope" type="checkbox"  value="石家庄"> 石家庄
				<input name="activescope" type="checkbox"  value="保定">  保定
                <input name="activescope" type="checkbox"   value="张家口"> 张家口
				<input name="activescope" type="checkbox"  value="承德"> 承德
				<input name="activescope" type="checkbox"   value="唐山"> 唐山
				<input name="activescope" type="checkbox"   value="廊坊"> 廊坊
				<input name="activescope" type="checkbox"   value="沧州"> 沧州
                <input name="activescope" type="checkbox"   value="衡水"> 衡水
				<input name="activescope" type="checkbox"   value="邢台"> 邢台
				<input name="activescope" type="checkbox"  value="邯郸"> 邯郸
				<input name="activescope" type="checkbox"  value="秦皇岛"> 秦皇岛			
				
				</td>
              </tr>
              <tr>
                <td  height="40px" class="class_td">标签/属性期限：</td>
				<td width="43%" class="class_td">				
				<input id="starttime" name="starttime" type="text" value=""  class="easyui-datebox" size="20" >				
				 至
				 <input id="endtime" name="endtime" type="text" value=""  class="easyui-datebox" size="20" >
			  	</td>
                <td width="7%" style=" height:40px;"></td>
				<td width="38%">
				
				</td>
              </tr>
			  <tr>
                <td  height="40px" class="class_td">目标市场：</td><td width="43%" class="class_td">
				<input name="market" type="checkbox"   value="大众"> 大众
				<input name="market" type="checkbox"   value="城市"> 城市
				<input name="market" type="checkbox"   value="农村"> 农村
                <input name="market" type="checkbox"   value="校园"> 校园
				<input name="market" type="checkbox"   value="集团"> 集团
				<input name="market" type="checkbox"   value="中高端"> 中高端</td>
				<td width="7%" style=" height:40px;"></td>
				<td width="38%">
				</td>
              </tr>  
              	<tr>
                <td  height="40px" class="class_td">客户品牌：</td>
                <td width="43%" class="class_td">
                                                    <input id="all_brank" name="all_brank" type="checkbox"     value="全品牌"> 全品牌
				<input name="brank" type="checkbox"  class="brankclass"   value="神州行"> 神州行
				<input name="brank" type="checkbox"  class="brankclass"   value="动感地带"> 动感地带
				<input name="brank" type="checkbox"  class="brankclass"  value="全球通"> 全球通
				</td>
				<td width="7%" style=" height:40px;"></td>
				<td width="38%">
				</td>
              </tr> 
			  <tr>
                <td class="class_td" >筛选条件：</td>
				<td colspan="3">			
				<textarea name="contion" id="contion1" class="border "  cols="60" rows="4"></textarea><span style="color:#FF0000; margin-left:10px">*</span>	</td>
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
				<textarea id="remark" name="remark" class="border "  cols="40" rows="4"></textarea>		
				</td>
              </tr>  
              <tr>
                <td colspan="4" style="height:40px; text-align:center" >
                <input type="submit" class="class_td" style=" width:80px;height:28px;font-family:'微软雅黑';background: #094AB2;  color:#FFF; line-height:28px;overflow:hidden; border:0px; font-size:16px;" value="提交申请"/>             
                
				</td>
              </tr>             
            </table></td>          
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
</div>
</body>
<script>

function checkTrim(){
   if ($("#activename").val()==""){
    		alert("标签名称不能为空！");
    		$("#activename").focus();
    		return false;
    }
    if ($("#requestreson").val()==""){
    		alert("申请理由不能为空！");
    		$("#requestreson").focus();
    		return false;
    }
    if ($("#contion1").val()=="") {
       		alert("筛选条件不能为空！");
       		$("#contion1").focus();
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
$(function(){	
	String.prototype.replaceAll = function(reallyDo, replaceWith, ignoreCase) {
		if (!RegExp.prototype.isPrototypeOf(reallyDo)) {
			return this.replace(new RegExp(reallyDo, (ignoreCase ? "gi" : "g")), replaceWith);
		} else {
			return this.replace(reallyDo, replaceWith);
		}
	}
             
             $(".brankclass").click(function(){
             	if ($("#all_brank").attr("checked")) {
			alert("全品牌不能与其他品牌同时选中！");
			 $(".brankclass").removeAttr("checked");

	             }
             });

             $("#all_brank").click(function(){
             	if ($(".brankclass").attr("checked")) {
             		alert("全品牌不能与其他品牌同时选中！");
			 $(".brankclass").removeAttr("checked");
             	};
             });

             $("#starttime").datebox({
             	onSelect:function(date){
             		var dates=date.getTime();             		
             		var yesday=new Date().getTime()-1000*60*60*24;             		
             		if (date<yesday) {
             			alert("开始日期不能小于今天！");
             			$("#starttime").datebox("setValue","");
             		};
             	}
             });

             $("#endtime").datebox({
             	onSelect:function(date){
             		var s=parseInt($("#starttime").datebox("getValue").replace(new RegExp("-","gm"),""));
             		var e=parseInt($("#endtime").datebox("getValue").replace(new RegExp("-","gm"),""));
             		if (e<s) {
             			alert("开始日期不能大于结束日期");
             			$("#endtime").datebox("setValue","");
             		};
             	}
             });

	//获取城市名称
	var verifier=$("#verifier").combobox("getValue");
	if (verifier==""){
		$("#verifier").combobox("setValue","-请选择-");	
	}
	/* $("#verifier").combobox({
				  url:'getAppro.action',
				  editable:true,
				  valueField:'id',
				  textField:'text',
				  panelHight:'auto',
				  panelWidth:100,
				  editable:true 
		   });
	*/
	 $("#verifier").combobox({
		  url:'getAppro.action',
		  editable:true,
		  valueField:'id',
		  textField:'text',
		  panelHight:'auto',
		  panelWidth:100,
		  editable:true,
		  onSelect:function(){	  

		  } 
		 });
	 
	 
});
</script>

</html>
