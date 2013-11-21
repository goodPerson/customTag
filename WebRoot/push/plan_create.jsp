<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<title>营销活动创建</title>
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
	overflow-x: hidden;
	overflow-y: auto;
}
body {
	height: 100%;
	width: 1024px;
	text-align: center;
	margin: 0px auto;
	font-family: "微软雅黑";
	font-size: 15pt;
	background-color: #FFF;
}
.title {
	font-size: 13pt;
	font-weight: bold;
	color: #105C90;
	align: center;
}
.border {
	border: 1px solid #D3D3D3;
	margin-left: 20px;
	width: 180px;
}
.border1 {
	border: 1px solid #95B8E7;
}
.line {
	height: 0px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 0px;
	float: left;
}
#gray {
	background: gray;
	height: 90%;
	left: 0%;
	right: 0%;
	width: 100%;
	position: absolute;
	opacity: 0.1;
	z-index: 1;
}
#create_div a {
	display: block;
	width: 80px;
	height: 28px;
	text-align: center;
	font-size: 10pt;
	line-height: 28px;
}
#create_div a:link {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#create_div a:visited {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#create_div a:hover {
	text-decoration: none;
	background: #03F;
	color: #FFF;
}
#create_div a:active {
	text-decoration: none;
	background: #03e;
	color: #FFF;
}
#import_div a {
	display: block;
	width: 40px;
	height: 21px;
	text-align: center;
	font-size: 10pt;
	line-height: 21px;
}
#import_div a:link {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#import_div a:visited {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#import_div a:hover {
	text-decoration: none;
	background: #03F;
	color: #FFF;
}
#import_div a:active {
	text-decoration: none;
	background: #03e;
	color: #FFF;
}
#choose_pro_div a {
	display: inline-block;
	width: 40px;
	height: 21px;
	text-align: center;
	font-size: 10pt;
	line-height: 21px;
}
#choose_pro_div a:link {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#choose_pro_div a:visited {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#choose_pro_div a:hover {
	text-decoration: none;
	background: #03F;
	color: #FFF;
}
#choose_pro_div a:active {
	text-decoration: none;
	background: #03e;
	color: #FFF;
}
#choose_pro_pre_div a{ display:inline-block; width:40px; height:21px; text-align:center; font-size:10pt; line-height:21px;}			
#choose_pro_pre_div a:link{text-decoration:none ; background:#094AB2; color:#FFF ;}
#choose_pro_pre_div a:visited {text-decoration:none ; background:#094AB2; color:#FFF ;}
#choose_pro_pre_div a:hover {text-decoration:none ; background:#03F; color:#FFF ;}
#choose_pro_pre_div a:active {text-decoration:none ;background:#03e; color:#FFF ;}
</style>
<body>
<input id="saveFlag" type="hidden" name="saveFlag" value="0" />
<input type="hidden" id="req_userId" value="<s:property value='#session.userId'/>"/>
<input type="hidden" id="custid" value="<s:property value='custid'/>"/>
<input type="hidden" id="custname" value="<s:property value='custname'/>"/>
<input type="hidden" id="custtype" value="<s:property value='custtype'/>"/>
<div id="gray" style="display:none"></div>
<img id="load_div" src="./img/load/load.jpg" width="32" height="32" align="absmiddle" style="z-index:0s; position:absolute; left:49%;top:40%; display:none">
<table  id="chartTable_one"  width="1024"  height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="24px" height="24px"><img src="./img/leftup.png" width="24px" height="24px"></td>
    <td width="100%" style="background:url(./img/upborder.png)  repeat-x"></td>
    <td width="24px" height="24px"><img src="./img/rightup.png" width="24px" height="24px"></td>
  </tr>
  <tr>
    <td  style="background:url(./img/leftborder.png) repeat-y"></td>
    <td width="100%" valign="top"><!--主要内容开始-->
      
      <div  class="title" >营销活动创建</div>
      <div class="line" style="width:100%;border:solid #CCC 0px;margin-top:10px; color: #CCC;height: 1px;" >&nbsp;</div>
      <div style="margin:10px;valign:middle;height:30px;">
        <label style="float:left">营销活动名称：</label>
        <div style="margin-left:10px;valign:middle;height:30px;">
          <input type="text" class="border judge" style="margin-left:12px" id="input_planname">
          <label style="color: red;margin-left:15px;">*</label>
        </div>
      </div>
      <div style="margin:10px;valign:middle;height:30px;">
        <label style="float:left">营销活动时间：</label>
        <div style="float:left;margin-left:25px;">
          <input  style="width:180px;" class="easyui-datebox judge" id="start_date">
          </input>
          -
          <input  style="width:180px;" class="easyui-datebox judge" id="end_date">
          </input>
          <label style="color: red;margin-left:15px;">*</label>
        </div>
      </div>
      <div style="clear:both"></div>
      <div style="margin:10px;valign:middle;height:30px;">
        <label style="float:left">活动类型选择：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <div style="float:left;margin-left:0px;">
          <select id="slt_acttype" class="easyui-combobox"  panelHeight="auto"  style="width:180px;">
            <option value="yewubanli" selected>业务办理类</option>
            <option value="guanhuai">关怀/提醒类</option>
          </select>
          <label style="color: red;margin-left:15px;">*</label>
        </div>
      </div>
      <div style="clear:both"></div>
      <div style="margin:10px;valign:middle;height:30px;" id="choose_pro_div">
        <label style="float:left">产品选择：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
        <input type="text" class="border judge" disabled="disabled" id="input_product" value0="" value1="" value2="" value="请点击右侧按钮进行选择">
        <label style="color: red;margin-left:15px;">*</label>
        <a id="product_choose" href="javascript:void(0)" hidefocus="true" >选择</a> </div>
      <div style="clear:both"></div>
      <div style="margin:10px;valign:middle;height:30px;display:none" id="choose_pro_pre_div">
	  <label style="float:left">对应优惠选择：   </label>
		<input type="text" class="border judge" disabled="disabled" id="input_previlege" value1="" value="1">
		 <label style="color: red;margin-left:15px;">*</label>
         <a id="pro_pre_choose" href="javascript:void(0)" hidefocus="true" style="display:none;">选择</a>
	  </div>
	  
	  <div style="clear:both"></div>
      <div style="margin:10px;valign:middle;height:100px;">
        <label style="float:left;margin-top:20px;">营销推荐语：&nbsp;</label>
        <div style="margin:10px;valign:middle;float:left;">
          <textarea rows="4" cols="60" style="border:1px solid #D3D3D3;margin-left:15px;width:364px;" id="inp_plan_comment" class="judge"></textarea>
          <label style="color: red;margin-left:15px;">*(最多输入300字)</label>
        </div>
      </div>
      <div style="clear:both"></div>
      <div style="margin:10px;valign:middle;height:30px;">
        <label style="float:left">推送渠道选择：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <div style="float:left;margin-left:0px;">
          <select id="slt_chnl" class="easyui-combobox"  panelHeight="auto"  style="width:180px;">
            <!-- <option value="ALL" >所有渠道</option> -->
            <option value="bsacHal" selected>营业厅</option>
            <!--<option value="IntAtsv">自助终端</option>
		 <option value="IntNetB">网厅</option>
		 <option value="bsacSms">短信</option> -->
            <option value="bsacKF">客服人工台</option>
          </select>
          <label style="color: red;margin-left:15px;">*</label>
        </div>
      </div>
      <div style="clear:both"></div>
      <div style="margin:10px;valign:middle;height:30px;">
        <label style="float:left">目标客户选择：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
        <div style="float:left;margin-left:0px;">
          <div style="float:left;">
            <select id="slt_cust_type" class="easyui-combobox" panelHeight="auto" style="width:180px;">
              <!-- <option value="GROUP" selected>客户群用户清单</option>
		 <option value="TAG">标签用户清单</option>-->
              <option value="UPLOAD">自助上传</option>
              <option value="downloadlist">下载清单</option>
            </select>
          </div>
          <div style="float:left; display:none;">
            <input type="text" class="border"  style="display:none;float:left"  id="input_cust" title="" value1="" value="">
          </div>
          <label style="color: red;margin-left:15px;">*</label>
        </div>
      </div>
      <div style="clear:both"></div>
      
      <!--  <div style="margin:15px;valign:middle;height:30px;">
	  <label style="float:left;">上传文件：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	  <div id="import_div">
	  <form   method="post" id="form1" enctype="multipart/form-data" name="form1" >	 
	  <input type="file" id="file" name="file" style="border:1px solid #D3D3D3; margin-left:20px;width:200px;" onchange="filecheckmethod();">
	  <input type="text" id="input1" onclick="file.click();"style="border:1px solid #D3D3D3; margin-left:20px;display:none"onchange="filecheckmethod(this)">--> 
      <a href="javascript:void(0)" hidefocus="true" style="margin-left:10px;display:none;" id="import_buton">上传</a> 
      <!-- </form>
	  </div>
	  </div>-->
      
      <iframe  id="iframe" name="ifrmname" frameborder="0" style="border:1px solid #fff;display:block; " scrolling="auto" width="100%"  height="200px"  src="<%=basePath%>push/upload.jsp"></iframe>
      <div id = "cust_div" style="display:none;">
        <fieldset style="height:150px;width:100%;border:1px solid #D3D3D3;">
          <legend style="border:1px solid #D3D3D3;font-size:10pt">目标客户列表</legend>
          <div style="margin:10px 10px 10px 10px">
            <div id="datagrid" style="position: absolute; right:5px;" ></div>
          </div>
        </fieldset>
      </div>
      <div id="create_div"> <a href="javascript:void(0)" hidefocus="true" style="float: left;margin-left:10px;display:none"id="create_plan">保存活动</a> <a href="javascript:void(0)" hidefocus="true" style="float: left;margin-left:10px;"id="update_plan">生成活动</a> </div>
      
      <!--主要内容结束--></td>
    <td  width="24px" style="background:url(./img/rightborder.png) "></td>
  </tr>
  <tr>
    <td width="24px" height="24px" style="background:url(./img/leftdown.png)   ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
    <td   height="24px"   style="background:url(./img/downborder.png) "></td>
    <td width="24px" height="24px"  style="background:url(./img/rightdown.png)   ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table>
<script>
  $(function () {
    window.parent.$("#index_push_plan").css("color", "#000");
	window.parent.$("#index_push_plan").addClass("navi_menu_heightLight");
	window.parent.$("#index_pro_mange").removeClass("navi_menu_heightLight");
	window.parent.$("#index_pro_mange").css("color", "#FFF");
	window.parent.$("#index_tag_mange").css("color", "#FFF");
	window.parent.$("#index_tag_mange").removeClass("navi_menu_heightLight");
	window.parent.$("#index").removeClass("navi_menu_heightLight");
	window.parent.$("#index").css("color", "#FFF");
	window.parent.$("#index_group_mange").removeClass("navi_menu_heightLight");
	window.parent.$("#index_group_mange").css("color", "#FFF");
	window.parent.$("#index_down_mange").removeClass("navi_menu_heightLight");
	window.parent.$("#index_down_mange").css("color", "#FFF");
	window.parent.$("#index_online_mange").removeClass("navi_menu_heightLight");
	window.parent.$("#index_online_mange").css("color", "#FFF");
	window.parent.$("#index_tag_count").css("color", "#FFF");
	window.parent.$("#index_tag_count").removeClass("navi_menu_heightLight");
	window.parent.$("#property_mage").css("visibility", "visible");
	window.parent.$("#tag_mage").css("visibility", "hidden");
	window.parent.$("#group_mage").css("visibility", "hidden");
	window.parent.$("#index_active_push").css("color", "#FFF");
	window.parent.$("#index_active_push").removeClass("navi_menu_heightLight"); 
  var custid=$("#custid").val();
  var custname=$("#custname").val();
  var custtype=$("#custtype").val(); 
  $("#input_cust").attr("value",custname);
  $("#input_cust").attr("value1",custtype);
  $("#input_cust").attr("title",custid);
  if(custname!=""&&custname!=null){
  	  $("#slt_cust_type").combobox("select","downloadlist");
  	  $("#slt_cust_type").combobox("setValue","downloadlist");
	  $("#slt_cust_type").combobox("setText","下载清单");
	  $("#iframe").css("display","none");
      $("#cust_div").css("display","block");
      $('#datagrid').datagrid({
		       url:"selectedcustlist.action",
		       queryParams:{custid:custid,custname:custname},
		       height: 100, 
		       title : '',
		       pagination:false, 
		       rownumbers:true,
		       fitColumns:true,
		       columns : [[{
						field : 'filename',
						title : '清单名称',
						width: 200,
						align : 'left'
					}, {
						field : 'id',
						title : 'id',
						width: 100,
						align : 'center',
						hidden:true
					}, {
						field : 'time',
						title : '创建时间',
						width: 120,
						align : 'center'
					}, {
						field : 'type',
						title : '清单类型',
						width: 100,
						align : 'left'
					}, {
						field : 'count',
						title : '人数（人）',
						width: 100,
						align : 'center'
					}, {
						field : 'region',
						title : '归属地域',
						width: 170,
						align : 'center'
					}]]
			}); 
  }else{
	  $("#slt_cust_type").combobox("setValue","UPLOAD");
	  $("#slt_cust_type").combobox("setText","自助上传"); 
  }
  
    var plan_id="";
    var userId=$("#req_userId").val();
    
    $(".border :eq(0)").focus(function(){
      $(this).addClass("border1");
    });
    $(".border :eq(0)").blur(function(){
      $(this).removeClass("border1");
    });
     $(".border :eq(1)").focus(function(){
     if($(this).attr("value")=="请点击右侧按钮进行选择"){
       $(this).attr("value","");
     }
      $(this).addClass("border1");
    });
    $(".border :eq(1)").blur(function(){
      if($(this).attr("value")==""){
      $(this).attr("value","请点击右侧按钮进行选择");
      }
      $(this).removeClass("border1");
    });
    $("#inp_plan_comment").focus(function(){
      $(this).css("border","1px solid #95B8E7");
    });
    $("#inp_plan_comment").blur(function(){
      $(this).css("border","1px solid #D3D3D3");
    });
    $("#inp_plan_comment").keyup(function(){
      var comment=$("#inp_plan_comment").val();
      if(comment.length>300){  
        //$("#inp_plan_comment").attr("disabled",true);
        alert("字数不能超过300个"); 
        //$("#inp_plan_comment").attr("disabled",false);
        $("#inp_plan_comment").val(comment.substring(0,300));
      }
    
    });
    $(".judge").focus(function(){
      var index=$(".judge").index(this);
      if(index==2){
        $(this).next().text("*(最多输入300字)");
      }else{
      $(this).next().text("*");
      }
    });
    $("#create_plan").click(function(){
      var a=0;
      for(var i=0;i<$(".judge").length;i++){
      		var value="";
       		if (i==1||i==2) {
				value=$(".judge :eq("+i+")").datebox("getValue");
			}else{
				value=$(".judge :eq("+i+")").val();
			}
	        if(value==""||value=="请点击右侧按钮进行选择"){
		        //$(".judge :eq("+i+")").next().text("(内容不能为空)");
		        alert("所填内容不符合要求。"); 
		        break;
	        }else{
	        	a++;
	      	}
      }
      if(a>=$(".judge").length){
        var bodylength=$(document.body).height();	
        var hight=document.body.scrollTop;
        var he=parseInt(bodylength)+parseInt(hight);
        $("#gray").css({
             "height":he+"px"
        });
	    document.getElementById("gray").style.filter="alpha(opacity=20)";
	    $("#gray").show();
	    $("#load_div").show();
       if(plan_id==""){
	       var myDate = new Date();
	       var year = myDate.getFullYear();
		   var mon = myDate.getMonth()+1;
		   var day = myDate.getDate();
		   var hour= myDate.getHours();
		   var minute= myDate.getMinutes();
		   var second= myDate.getSeconds();
		   var value = year+""+(mon<10?('0'+mon):mon)+""+(day<10?('0'+day):day)+""+(hour<10?('0'+hour):hour)+""+(minute<10?('0'+minute):minute)+""+(second<10?('0'+second):second);
		   plan_id=value+userId;
       }else{
       	  plan_id=plan_id;
       }
       var planname=$("#input_planname").val();
       var start_date=$("#start_date").datebox("getValue");
       var arrA = start_date.split("-");
       var star="";
       for(i = 0; i < arrA.length; i++){
           // alert(arrA[i])       
               star=star+arrA[i];
        } 
        var end_date=$("#end_date").datebox("getValue");
        var arrB=end_date.split("-");
        var end="";
        for(i = 0; i < arrB.length; i++){
            //alert(arrB[i])       
               end=end+arrB[i];
        } 
            //alert(end);
        var product=$("#input_product").val();
        var custtype="";
        if($("#slt_cust_type").combobox("getValue")=="UPLOAD"){
          	custtype="UPLOAD";
        }else{
          	custtype=$("#input_cust").attr("value1");
        }
          //var custid=$("#slt_cust").combobox("getValue");
         
        var custid=$("#input_cust").attr("title");
        var chnl=$("#slt_chnl").combobox("getValue");
        var comment=$("#inp_plan_comment").val();
        var type=$("#input_product").attr("value0");
        var value1=$("#input_product").attr("value1");
        var value2=$("#input_product").attr("value2");
        var value1Pri=$("#input_previlege").attr("value1");
         //alert("plan_id:"+plan_id+" planname:"+planname+" end_date:"+end_date+" product:"+product+" custid:"+custid+" chnl:"+chnl+" comment:"+comment);
        $.ajax({
    		type: 'POST',
    		url: 'addPlanAction.action',
    		data:{id:plan_id,planname:planname,start_date:star,end_date:end,product:product,custtype:custtype,custid:custid,chnl:chnl,comment:comment,type:type,value1:value1,value2:value2,value1Pri:value1Pri},
    		dataType:"text", 
    		success: function(data){
    		     // $("#gray").hide();
    		     // $("#load_div").hide();
    		     // alert( '活动创建成功');
            },
   			error: function(data){     		
     		   return false;
    		}
    	});	  
      }      
      
    
    });
    
    var alertflag="";
    
    $("#update_plan").click(function(){
       var saveFlag = document.getElementById("saveFlag");
       saveFlag.value="1"; 
       alertflag="";
       var type=$("#slt_cust_type").combobox("getValue");
       if(type!="UPLOAD"){          
	      var a=0;
	      for(var i=0;i<$(".judge").length;i++){
	        var value="";
	        if (i==1||i==2) {
				value=$(".judge :eq("+i+")").datebox("getValue");
			}else{
				value=$(".judge :eq("+i+")").val();
			}
	        if(value==""||value=="请点击右侧按钮进行选择"){
		        //$(".judge :eq("+i+")").next().text("(内容不能为空)");
		        alert("所填内容不符合要求。");
		        alertflag="saveFlag";  
		        break;
	        }else{
	        	a++;
	      	}
	     }
	      
         if(a>=$(".judge").length){
	        var bodylength=$(document.body).height();	
	        var hight=document.body.scrollTop;
	        var he=parseInt(bodylength)+parseInt(hight);
	        $("#gray").css({
	             "height":he+"px"
	        });
		    document.getElementById("gray").style.filter="alpha(opacity=20)";
		    $("#gray").show();
		    $("#load_div").show();
		    if(plan_id==""){
			    var myDate = new Date();
			    var year = myDate.getFullYear();
			    var mon = myDate.getMonth()+1;
			    var day = myDate.getDate();
			    var hour= myDate.getHours();
				var minute= myDate.getMinutes();
				var second= myDate.getSeconds();
				var value = year+""+(mon<10?('0'+mon):mon)+""+(day<10?('0'+day):day)+""+(hour<10?('0'+hour):hour)+""+(minute<10?('0'+minute):minute)+""+(second<10?('0'+second):second);
				plan_id=value+userId;
		      }else{
		       	plan_id=plan_id;
		     }
	         var planname=$("#input_planname").val();
	         var start_date=$("#start_date").datebox("getValue");
	         var arrA = start_date.split("-");
	         var star="";
	         for(i = 0; i < arrA.length; i++){	                
	             star=star+arrA[i];
	         } 
	         var end_date=$("#end_date").datebox("getValue");
	         var arrB=end_date.split("-");
	         var end="";
	         for(i = 0; i < arrB.length; i++){   
	             end=end+arrB[i];
	         } 
          
             var product=$("#input_product").val();
          
             var custtype="";
	         if($("#slt_cust_type").combobox("getValue")=="UPLOAD"){
	         	custtype="UPLOAD";
	         }else{
	         	custtype=$("#input_cust").attr("value1");
	         }
         
	         var custid=$("#input_cust").attr("title");
	         var chnl=$("#slt_chnl").combobox("getValue");
	         var comment=$("#inp_plan_comment").val();
	         var type=$("#input_product").attr("value0");
	         var value1=$("#input_product").attr("value1");
	         var value2=$("#input_product").attr("value2");
	         var value1Pri=$("#input_previlege").attr("value1");
             //alert("plan_id:"+plan_id+" planname:"+planname+" end_date:"+end_date+" product:"+product+" custid:"+custid+" chnl:"+chnl+" comment:"+comment);
 
	         if (custid!="") {
				
			 
	         $.ajax({
	    		type:"POST",
	    		url: "addPlanAction.action",
	    		data:{id:plan_id,planname:planname,start_date:star,end_date:end,product:product,custtype:custtype,custid:custid,chnl:chnl,comment:comment,type:type,value1:value1,value2:value2,value1Pri:value1Pri},
	    		dataType:"text", 
	    		success: function(data){
	    			if (data=="ok") {
						window.location.href="<%=basePath%>updatePlanAction.action?plan_id="+plan_id;
					}else {
						alert("生成活动失败,请重试!");
						alertflag="saveFlag";
						$("#gray").hide();
		   				$("#load_div").hide();
					}
	            },
	   			error: function(data){
	     		    return false;
	    		}
	    	 });
	    	 }else{
	    	 	alert("请选择目标客户!");
	    	 	alertflag="saveFlag";  
	    	 	$("#gray").hide();
		   		$("#load_div").hide();
	    	 }	  
          }  
       }else{	    	          
		  
	      if (plan_id!="") {	 
	          var bodylength=$(document.body).height();	
		      var hight=document.body.scrollTop;
		      var he=parseInt(bodylength)+parseInt(hight);
		      $("#gray").css({
		             "height":he+"px"
		      });			  
	          document.getElementById("gray").style.filter="alpha(opacity=20)";
			  $("#gray").show();
			  $("#load_div").show();
			  if (plan_id!="") {
		  		  window.location.href="<%=basePath%>updatePlanAction.action?plan_id="+plan_id;
		  	  }
		  }else{
		  	 alert("请上传目标客户清单!");		
		  	 alertflag="saveFlag";  	  
		  }
		 // saveFlag.value="0";		 
  	   }
     
     });
     
     
     function  myfomatter(date) {
	        var y = date.getFullYear();
			var m = date.getMonth()+1;
			var d = date.getDate();
			return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
 //           return y+"年"+m+"月"+d+"日";
		};
   /*  var myDate = new Date();
    var yesterday_milliseconds=myDate.getTime()-1000*60*60*24;
    var yesterday = new Date();
      yesterday.setTime(yesterday_milliseconds);
    var year = myDate.getFullYear();
			var mon = myDate.getMonth()+1;
			var day = myDate.getDate();
			var value = year+(mon<10?('0'+mon):mon)+(day<10?('0'+day):day);
 */
    $("#start_date").datebox({
        formatter:myfomatter
      /*   onSelect:function(date){
        var myDate = new Date();
        if(date<yesterday){
        alert("起始日期不能小于今天。");
        $("#start_date").datebox("setValue","");
        } 
     } */
});	
	
    $("#end_date").datebox({
        formatter:myfomatter,
        onSelect:function(date){
	        var start =$("#start_date").datebox("getValue");
	        start=start.replace("-","").replace("-","");
		    var s = parseInt(start);
		    var end =$("#end_date").datebox("getValue");
		    end=end.replace("-","").replace("-","");
		    var e = parseInt(end);
		    if(s>e){
			     alert("开始时间不能大于结束时间。"); 
			     $("#end_date").datebox("setValue","");
		    }
       } 
     });			
     
    // $("#start_date").datebox("setValue",value);
    // $("#end_date").datebox("setValue",value);
    
   
      $("#import_buton").click(function(){
      
				var fileName = window.frames["ifrmname"].$("#file").val();
				fileName = encodeURI(fileName);
				fileName = encodeURI(fileName);
				if(fileName==""||window.frames["ifrmname"].$("#file")==null){
					alert("路径输入有误。"); 
					return;
				}else{
					if(plan_id==""){
	          			window.$("#create_plan").click(); 
	       			}
	       			window.frames["ifrmname"].$("#form1").attr("action","importAction.action?id="+plan_id);
					window.frames["ifrmname"].$("#form1")[0].submit();
					document.getElementById("gray").style.filter="alpha(opacity=20)";
		            $("#gray").show();
		            $("#load_div").show();
				}
				
       });
 	/*   $("#slt_cust").combobox({
                     url:'custJson.action?type='+"GROUP",
                     valueField:'id',
		             textField:'text',
                     panelHeight:200,
                     onLoadSuccess:function(data){
		                 var value=data[0].id;
                     $('#slt_cust').combobox('setValue',data[0].id);
                         }
       }); */
     $("#slt_cust_type").combobox({  
           onSelect:function(newValue){
           if(newValue.value=='downloadlist'){
               $("#iframe").css("display","none");
               $("#input_cust").css({"display":"block"});
               $("#cust_div").css("display","block");
               window.open ('<%=basePath%>push/listcust.jsp', 'newwindow', 'height=420, width=700, top=250,left=200, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
              /* $("#slt_cust").combobox({
                     url:'custJson.action?type='+newValue,
                     valueField:'id',
		             textField:'text',
                     panelHeight:200,
                     onLoadSuccess:function(data){
		                 var value=data[0].id;
                     $('#slt_cust').combobox('setValue',data[0].id);
                         }
              });*/
              $('#datagrid').datagrid({
		       url:"selectedcustlist.action",
		       queryParams:{custid:custid,custname:custname},
		       height: 100, 
		       title : '',
		       pagination:false, 
		       rownumbers:true,
		       fitColumns:true,
		       columns : [[{
						field : 'filename',
						title : '清单名称',
						width: 200,
						align : 'left'
					}, {
						field : 'id',
						title : 'id',
						width: 100,
						align : 'center',
						hidden:true
					}, {
						field : 'time',
						title : '创建时间',
						width: 120,
						align : 'center'
					}, {
						field : 'type',
						title : '清单类型',
						width: 100,
						align : 'left'
					}, {
						field : 'count',
						title : '人数（人）',
						width: 100,
						align : 'center'
					}, {
						field : 'region',
						title : '归属地域',
						width: 170,
						align : 'center'
					}]]
			}); 
     }else{
            $("#iframe").css("display","block");
            $("#iframe").attr("src","<%=basePath%>push/upload.jsp");
            window.frames["ifrmname"].$("#datagrid").datagrid('reload');
            //$("#slt_cust").combobox("disable");
            $("#input_cust").attr("value1","");
	        $("#input_cust").attr("title","");
	        $("#input_cust").attr("value","");
            $("#input_cust").css("display","none");
            $("#cust_div").css("display","none");
           // alert("请先保存活动,再上传附件。");
             
     }}
     });
	$("#product_choose").click(function(){
		var saveFlag = document.getElementById("saveFlag");
        saveFlag.value="1";
	    window.open ('<%=basePath%>searchPrivilege.action', 'newwindow', 'height=520, width=800, top=150,left=150, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');	    	
	});
	$("#pro_pre_choose").click(function(){
	   var saveFlag = document.getElementById("saveFlag");
       saveFlag.value="1";
	   var productcd=$("#input_product").attr("value1");
	   //alert(productcd);
	   window.open ('<%=basePath%>searchPripro.action?productcd='+productcd, 'newwindow', 'height=520, width=800, top=150,left=150, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
	});
	
	$("#slt_acttype").combobox({
		editable:false,
		onSelect:function(newValue){
           if(newValue.value=='yewubanli'){
           		$("#choose_pro_div").show();
           		$("#input_product").attr("value","请点击右侧按钮进行选择");
           		$("#input_product").attr("value0","");
           }else{
           		$("#input_product").attr("value","1");
           		$("#choose_pro_div").hide();
           		$("#input_product").attr("value0","care");
           }
        }
	});
	
function stoprefresh() 
{ 
   
	 return "活动未生成，是否离开？";
   
} 


//window.onbeforeunload=stoprefresh; //注册关闭前的事件
window.onbeforeunload = function remindSaveData(evt){
    /* var saveFlag_0 = document.getElementById("saveFlag_0");
    var saveFlag_1 = document.getElementById("saveFlag_1"); */
    var saveFlag = document.getElementById("saveFlag");
   
	if(saveFlag.value == "0"){
        evt = (evt) ? evt : ((window.event) ? window.event : ""); 
        evt.returnValue = "活动未生成，是否离开？";
    }
    
    if (alertflag=="saveFlag") {
		saveFlag.value="0";
	}else{saveFlag.value="1";}
};
window.onunload = function UnloadConfirm() 
{ //页面离开后的事件
         var saveFlag = document.getElementById("saveFlag");
         if (saveFlag=="0"&&plan_id!=""&&userId!="") {		
		     $.ajax({
				url : "deluploadbyplanid.action?planId=" + plan_id+"&creator="+userId,
				type : "post",
				dataType : 'text',
				success : function(data) {  
					/* var a=eval(data);
					var result= a[0].delresult;
					if(result=="删除成功！"){}
					else{alert(result);}  */
			   }
		     });
		}
};    //注册关闭后的事件	
			
  });


		

			
  </script>
</body>
</html>
