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
	font-size: 20pt;
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
.span1{
width:60px;
padding:5px 5px 0px 5px;
}
</style>

<body>
  <table  id="chartTable" width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td width="16px" height="16px"><img src="./img/leftup.png" width="22" height="22"></td>
	  <td width="100%" style="background:url(./img/upborder.png)  repeat-x"></td>
	  <td width="16px" height="16px"><img src="./img/rightup.png" width="22" height="22"></td>
	</tr>
	<tr>
	  <td height="100%" style="background:url(./img/leftborder.png) repeat-y"></td>
	  <td width="100%" >
	  <!--主要内容开始-->
	  <form id="formrequest" method="post" action="">
	  <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr>    
           <td width="100%" height="100%" align="right" valign="top">
		   <table  id="chartTable" width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>       
          
          <!-- 标签申请
    ================================================== -->
          
          <td width="1166"   valign="top"><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="4"  id="tag_name" class="title_td" align="center">标签申请表</td>               
              </tr>
              <tr>
                <td width="12%" valign="top" style=" font: bold; height:40px;">营销活动名称：</td>
				<td colspan="3" >
				
				<s:if test="%{tbrquestDel.req_name==''}">
				<input type="text" name="activename" id="activename" size="40" />
				</s:if>
				<s:else>
				<input type="text" name="activename" id="activename" value="<s:property value='tbrquestDel.tbrquestDel.req_name"/>' size="40" />
				</s:else>
				<span style="color:#FF0000; margin-left:10px">*</span>
				</td>
              </tr>
              <tr>
                <td  height="20px" style="font: bold; height:40px;" >申请理由:</td>
				<td colspan="3">
				<s:if test="%{tbrquestDel.req_resons==''}">
				<textarea id="requestreson" name="requestreson" cols="40" rows="4"></textarea>
				</s:if>
				<s:else>
				<textarea id="requestreson" name="requestreson" cols="40" rows="4"><s:property value="tbrquestDel.tbrquestDel.req_resons"/></textarea>
				</s:else>
				<span style="color:#FF0000; margin-left:10px">*</span></td>
              </tr>
              <tr>
                <td style=" font: bold; height:40px;">活动范围:</td>
                <td colspan="3">
               
				<input name="activescope" type="checkbox"  <s:if test="%{tbrquestDel.req_scope.indexOf('河北省')>=0}"> checked</s:if> value="河北省"> 河北省 
				<input name="activescope" type="checkbox" <s:if test="%{tbrquestDel.req_scope.indexOf('石家庄')>=0}"> checked</s:if> value="石家庄"> 石家庄
				<input name="activescope" type="checkbox" <s:if test="%{tbrquestDel.req_scope.indexOf('保定')>=0}"> checked</s:if> value="保定">  保定
                <input name="activescope" type="checkbox"  <s:if test="%{tbrquestDel.req_scope.indexOf('张家口')>=0}"> checked</s:if> value="张家口"> 张家口
				<input name="activescope" type="checkbox" <s:if test="%{tbrquestDel.req_scope.indexOf('承德')>=0}"> checked</s:if> value="承德"> 承德
				<input name="activescope" type="checkbox"  <s:if test="%{tbrquestDel.req_scope.indexOf('唐山')>=0}"> checked</s:if> value="唐山"> 唐山
				<input name="activescope" type="checkbox"  <s:if test="%{tbrquestDel.req_scope.indexOf('廊坊')>=0}"> checked</s:if> value="廊坊"> 廊坊
				<input name="activescope" type="checkbox"  <s:if test="%{tbrquestDel.req_scope.indexOf('沧州')>=0}"> checked</s:if> value="沧州"> 沧州
                <input name="activescope" type="checkbox" <s:if test="%{tbrquestDel.req_scope.indexOf('衡水')>=0}"> checked</s:if>  value="衡水"> 衡水
				<input name="activescope" type="checkbox"  <s:if test="%{tbrquestDel.req_scope.indexOf('邢台')>=0}"> checked</s:if> value="邢台"> 邢台
				<input name="activescope" type="checkbox"  <s:if test="%{tbrquestDel.req_scope.indexOf('邯郸')>=0}"> checked</s:if>value="邯郸"> 邯郸
				<input name="activescope" type="checkbox" <s:if test="%{tbrquestDel.req_scope.indexOf('秦皇岛')>=0}"> checked</s:if> value="秦皇岛"> 秦皇岛			
				
				</td>
              </tr>
              <tr>
                <td  height="40px" style="font: bold; height:40px;">活动期限:</td>
				<td width="43%">
				<s:property value=""/>
				<input type="hidden"  id="hdqx" value="<s:property value='%{tbrquestDel.req_time_limit}'/>"/>
				<input id="starttime" type="text" value="2001年5月15日" size="20" >				
				 至
				 <input id="endtime" type="text" value="2001年5月15日" size="20" >
			  	</td>
                <td width="7%" style="font: bold; height:40px;">客户需求数量</td>
				<td width="38%">
				
				<s:if test="%{tbrquestDel.cus_need_counts==''}">
				<input type="text" name="requirecounts" id="requirecounts" size="40" />万户
				</s:if>
				<s:else>
				<input type="text" name="requirecounts" id="requirecounts" value="<s:property value='%{tbrquestDel.cus_need_counts}"/>' size="40" />万户
				</s:else>		
				</td>
              </tr>
			  <tr>
                <td  height="40px" style="font: bold; height:40px;">目标市场:</td><td width="43%">
				<input name="market" type="checkbox"  <s:if test="%{tbrquestDel.req_target.indexOf('大众')>=0}"> checked</s:if> value="大众"> 大众
				<input name="market" type="checkbox"  <s:if test="%{tbrquestDel.req_target.indexOf('城市')>=0}"> checked</s:if> value="城市"> 城市
				<input name="market" type="checkbox" <s:if test="%{tbrquestDel.req_target.indexOf('农村')>=0}"> checked</s:if>  value="农村"> 农村
                <input name="market" type="checkbox" <s:if test="%{tbrquestDel.req_target.indexOf('校园')>=0}"> checked</s:if>  value="校园"> 校园
				<input name="market" type="checkbox"  <s:if test="%{tbrquestDel.req_target.indexOf('集团')>=0}"> checked</s:if> value="集团"> 集团
				<input name="market" type="checkbox"  <s:if test="%{tbrquestDel.req_target.indexOf('中高端')>=0}"> checked</s:if> value="中高端"> 中高端</td>
				<td width="7%" style="font: bold; height:40px;">客户品牌</td>
				<td width="38%">
				<input name="brank" type="checkbox"  <s:if test="%{tbrquestDel.cus_brand.indexOf('全品牌')>=0}"> checked</s:if>  value="全品牌"> 全品牌
				<input name="brank" type="checkbox"  <s:if test="%{tbrquestDel.cus_brand.indexOf('神州行')>=0}"> checked</s:if> value="神州行"> 神州行
				<input name="brank" type="checkbox"   <s:if test="%{tbrquestDel.cus_brand.indexOf('动感地带)>=0}"> checked</s:if> value="动感地带"> 动感地带
				<input name="brank" type="checkbox"  <s:if test="%{tbrquestDel.cus_brand.indexOf('全球通')>=0}"> checked</s:if> value="全球通"> 全球通</td>
              </tr>
              <tr>
                <td style=" font: bold; height:40px;" >数据提取方:</td>
				<td colspan="3">
				<input name="datagettype" type="checkbox"  <s:if test="%{tbrquestDel.req_getdata_type.indexOf('新提取')>=0}"> checked</s:if> value="新提取"> 新提取
				<input name="datagettype" type="checkbox"  <s:if test="%{tbrquestDel.req_getdata_type.indexOf('老客户过滤')>=0}"> checked</s:if> value="老客户过滤"> 老客户过滤    注：老客户过滤需提供过滤客户的号码清单				</td>
              </tr>   
			  <tr>
                <td style=" font: bold; height:40px;" >筛选条件:</td>
				<td colspan="3">
				
				<input id="sxtj"  type="hidden" value="<s:property value='%{tbrquestDel.screen_condition}'/>"/>
				<div><span class="span1">条件1</span><span><input id="contion1" type="text" value=""> </span><span class="span1">条件7</span><span><input id="contion7" type="text" value=""></span></div>
				<div><span class="span1">条件2</span><span><input id="contion2" type="text" value=""> </span><span class="span1">条件8</span><span><input id="contion8" type="text" value=""></span></div>
				<div><span class="span1">条件3</span><span><input id="contion3" type="text" value=""> </span><span class="span1">条件9</span><span><input id="contion9" type="text" value=""></span></div>
				<div><span class="span1">条件4</span><span><input id="contion4" type="text" value=""> </span><span class="span1">条件10</span><span><input id="contion10" type="text" value=""></span></div>
				<div><span class="span1">条件5</span><span><input id="contion5" type="text" value=""> </span><span class="span1">条件11</span><span><input id="contion11" type="text" value=""></span></div>
				<div><span class="span1">条件6</span><span><input id="contion6" type="text" value=""></span><span class="span1">条件12</span><span><input name="text" type="text" id="contion12" value=""></span></div>	
				<span style="color:#FF0000; margin-left:10px">*</span>	</td>
              </tr> 
			  <tr>
                <td style=" font: bold; height:40px;" >审批人：</td>
				<td colspan="3">
				    <s:property value='%{tbrquestDel.req_getdata_type}' />
				    <input id="spr" type="hidden" value=""/>
					<select id="verifier" >
					<option value="张三">张三</option>
					<option value="李四">李四</option>
					<option value="王五">王五</option>
					</select><span style="color:#FF0000; margin-left:10px">*</span>				
				</td>
              </tr>     
              <tr>
                <td style=" font: bold; height:40px;" >备注:</td>
				<td colspan="3">
				<s:if test="%{tbrquestDel.remark==''}"">				
				<textarea id="remark" name="requestreson" cols="40" rows="4"></textarea>	
				</s:if>
				<s:else>
				<textarea id="remark" name="requestreson" cols="40" rows="4"><s:property value="%{tbrquestDel.remark==''}" /></textarea>	
				</s:else>
				</td>
              </tr>  
              <tr>
                <td colspan="4" style=" font: bold; height:40px; text-align:center" >
				<input  id ="aaa"  type="button" value="提交申请">
				<input type="button" value="审批通过">
				<input type="button" value="驳回">
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
	 <td height="100%" style="background:url(./img/rightborder.png) repeat-y"></td>
	</tr>
	<tr>
	  <td width="16px" height="16px"><img src="./img/leftdown.png" width="22" height="22"></td>
	  <td  width="100%" style="background:url(./img/downborder.png)  repeat-x"></td>
	  <td width="16px" height="16px"><img src="./img/rightdown.png" width="22" height="22"></td>
    </tr>
  </table>
</div>
</body>
<script>
$(function () {
/*
   //活动期限审核
    if ($("hdqx").val()!=""){
       var hdqx=$("hdqx").val();
       var s=hdqx.split(",");
       var s1=s[0];
       var s2=s[1];
       $("#starttime").attr("value",s1);
       $("#endtime").attr("value",s2);    
    }
    
    if ($("#sxtj").val()!=""){
       var sxtj=$("sxtj").val();
       var a=sxtj.split(",");
       var a1=a[0];
       var a2=a[1];
       var a3=a[3];
       var a4=a[4];
       var a5=a[5];
       var a6=a[6];
       var a7=a[7];
       var a8=a[8];  
       var a8=a[9];
       var a10=a[10];
       var a11=a[11];
       var a12=a[12];
		$("#contion1").attr("value",a1);
		$("#contion2").attr("value",a2);    
		 $("#contion3").attr("value",a3);
		$("#contion4").attr("value",a4);    
		 $("#contion5").attr("value",a5);
		$("#contion6").attr("value",a6);    
		 $("#contion7").attr("value",a7);
		$("#contion8").attr("value",a8);    
		 $("#contion9").attr("value",a9);
		$("#contion10").attr("value",a10);    
		 $("#contion11").attr("value",a11);
		$("#contion12").attr("value",a12);    
    }
  */  
    
    
    
    
    
    
    
    $("#aaa").click(function(){
    /*
    if ($("#activename").val()==""){
    		alert("营销活动名称不能为空！");
    		return false;
    }
    if ($("#requestreson").val()==""){
    		alert("申请理由不能为空！");
    		return false;
    }
    
    var str="";  
    $("[name='activescope'][checked]").each(function(){ 
     str+=$(this).val()+",";  
    });
    
   if ($("#contion1").val()=="") {
       		alert("筛选条件不能为空！");
    		return false;
   }
   
  // alert($("#verifier option:selected").val());
  
   if ($("#verifier option:selected").val()=="''") {
       		alert("审批人不能为空！");
    		return false;
   }
   */
  //活动期限
   var req_time_limit="";
  req_time_limit=req_time_limit+$("#starttime").val()+","+$("#endtime").val();
   
   //用户需求数量
   var requirecounts=$("#requirecounts").val();
   //目标市场
   var market="";
    $("[name='market'][checked]").each(function(){ 
     market+=$(this).val()+",";  
    });
   // 品牌
   var brank="";
   $("[name='brank'][checked]").each(function(){ 
     brank+=$(this).val()+",";  
    });
    //数据提取方式
   var datagettype="";
   $("[name='datagettype'][checked]").each(function(){ 
     datagettype+=$(this).val()+",";  
    });
    //筛选条件
    var contion="";
    contion+=$("#contion1").val()+","+$("#contion2").val()+","+$("#contion3").val()+","+$("#contion4").val()+","+$("#contion5").val()+","+$("#contion6").val()+","+$("#contion7").val()+","+$("#contion8").val()+","+$("#contion9").val()+","+$("#contion10").val()+","+$("#contion11").val()+","+$("#contion12").val();
    //alert(contion);
    //审批人呢
   var verifier= $("#verifier option:selected").val();
   //备注
   var remark=$("#remark").val();
  // alert(remark);

   
   
      		$.ajax({
    		type: 'POST',
    		url: "filterTagExport.action",
    		data:{activename:$("#activename").val(),requestreson:$("#requestreson").val(),activescope:str,req_time_limit:req_time_limit,requirecounts:requirecounts,market:market,brank:brank,datagettype:datagettype,contion:contion,verifier:verifier,remark:remark},
    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    		success: function(data){     
			
            },
   			error: function(data){
     		alert("json=" + data);
     		return false;
    		}
    	});	

   });    
    
});

</script>

</html>
