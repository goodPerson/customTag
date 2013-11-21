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

<title>产品选择</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
 <link rel="stylesheet" type="text/css" href="css/themes/gray/easyui.css">
 <link rel="stylesheet" type="text/css" href="css/themes/icon.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
 <script type="text/javascript" src="<%=basePath%>js/easyui-lang-zh_CN.js"></script>
<style type="text/css">
* {
			font-family: "微软雅黑";
			font-size: 10pt;
		}
		
body {
			width: 100%;
			margin: 0 auto;
			text-align: center;			
			overflow-x: hidden;
			overflow-y: auto ;			
		}
.condLab{
			font-weight: bold;
			width: 100px;
			background-color: #F7F5F6;
			text-align: left;
			padding-left:10px; 
			padding-right:10px; 
		}		
.common{
			color: #000;
			cursor: hand;
		}
.tmnlBrand{
			margin-left: 15px;
			width: 165px;
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
#moreBrandBox{
			width: 800px;
			max-height: 300px;
			position: absolute;
			left:0px;
			top:10px;
			border: 1px solid #dddddd;
			border-top:none;
			background-color: #FFF;		
		}
.type{
		cursor:pointer;	
		}
.First_char{
       color:#094AB2;
}
.first_choosen{
    color:red;
}
.choosen{
		color:#094AB2;
		}
.line{
	height: 0px;
	font-size: 0px;
	background: #CCCCCC;
	line-height: 0px;
	float: left;	
}
#wait_div {
	background: #666;
	margin: 0;
	width: 200%;
	height: 100%;
	position: absolute;
	left: 0px;
	opacity: 0.1;
	z-index: 99;
	display: none;
}
#serch_div{
	position:absolute;left:150px; top:107px; width:427px;border-bottom:solid #CCC 1px; border-left:solid #CCC 1px; border-right:solid #CCC 1px; background:#FFF; height:200px; overflow:auto; display:none;z-index:4;	
}
#serchspname_div{
	position:absolute;left:150px; top:107px; width:169px;border-bottom:solid #CCC 1px; border-left:solid #CCC 1px; border-right:solid #CCC 1px; background:#FFF; height:200px; overflow:auto; display:none;z-index:4;	
}
.markt_tishi_div{
margin:2px;color:#666;cursor:pointer;
}
.spname_tishi_div{
margin:2px;color:#666;cursor:pointer;
}
#searchdiv a{ display:block; width:40px; height:24px; text-align:center; font-size:10pt; line-height:24px;}			
#searchdiv a:link{text-decoration:none ; background:#094AB2; color:#FFF ;}
#searchdiv a:visited {text-decoration:none ; background:#094AB2; color:#FFF ;}
#searchdiv a:hover {text-decoration:none ; background:#03F; color:#FFF ;}
#searchdiv a:active {text-decoration:none ;background:#03e; color:#FFF ;}
#no_data {
  font: 12pt "微软雅黑" ;
  color: #A9A9A9;
  top:130px; 
  left:50px;
  
}
</style>
</head>

<body>
	<!-- 更多 -->
	<div id="wait_div" class="wait_div" ></div>
  <img id="load_div" src="./img/load/load.jpg" width="32" height="32" align="absmiddle" style="z-index:100; position:absolute; left:49%;top:40%; display:none">
					<div id="moreBrandBox">	
						<hr id="topBorder" size="1" style="border: 1px solid #dddddd;position: absolute;top:0px;left:0px;" />					
						<div style="width: 100%;text-align: left;">
							<div
								style="position: relative;padding-bottom: 2px;padding-top: 2px;border-bottom: 1px solid #dddddd;">
								<label style="padding-left: 20px;font-weight: bold;" class="type" value="prevelige">优惠</label>
								<label style="padding-left: 20px;font-weight: bold;" class="type" value="product">产品</label>
							<!-- 	<label style="padding-left: 20px;font-weight: bold;" class="type" value="pre_product">带优惠的产品</label> -->
								<label style="padding-left: 20px;font-weight: bold;" class="type" value="sp">SP</label>								
							</div>
						    <div  style="margin-bottom:5px;margin-top:5px; margin-left:10px;width:100%;">	  	  
		                          <div id="region_div" style="float:left;margin-left:2px;margin-right:10px;display:block;">
		                          <s:if test="#session.regionId==1">
		                           		<select id="region" class="easyui-combobox" name="state" style="width:155px;height:25px" panelHeight="auto">
								                <option value="HB">河北省</option>
								                <option value="HB.SJ">石家庄</option>
								                <option value="HB.BD">保定</option>
								                <option value="HB.ZJ">张家口</option>
								                <option value="HB.CD">承德</option>								                
								                <option value="HB.TS">唐山</option>
								                <option value="HB.LF">廊坊</option>
								                <option value="HB.CZ">沧州</option>
								                <option value="HB.HS">衡水</option>
								                <option value="HB.XT">邢台</option>
								                <option value="HB.HD">邯郸</option>
								                <option value="HB.QH">秦皇岛</option>
						                </select>
						          </s:if>
						         <s:else>
						            <select id="region" class="easyui-combobox" name="state" style="width:155px;height:25px" panelHeight="auto">
								                <option value="HB">河北省</option>
								                <option value="<s:property value='#session.proregionid'/>"><s:property value="#session.proregionName"/></option>
						            </select>
						         </s:else>
		                          </div> 
		                          <div id="sp_div" style="float:left;margin-left:2px;margin-right:10px;display:none;border:solid #CCC 1px; height:25px;width: 120px;">
		                           		<!-- <select id="sp_select" class="easyui-combobox" name="state" style="width:120px;height:25px" panelHeight="auto">
						                </select> -->
						                <input id="spname_text" type="text" value="SP企业名称/SP企业ID" value1="" style=" width:155px;border-width: 0px; padding-top: 1px;color: gray;" onfocus="if(value=='SP企业名称/SP企业ID'){value='';}" onblur="if(value==''){value='SP企业名称/SP企业ID';this.style.color='gray';}" onkeydown="{this.style.color='#000';}">
		                          </div> 
		                          <div style=" float:left; padding-right:10px; border:solid #CCC 1px; height:25px;width: 380px;">
				                       <input id="marketname_text" type="text" value="产品名称/产品ID"  style=" width:415px;border-width: 0px; padding-top: 1px;color: gray;" onfocus="if(value=='产品名称/产品ID'){value='';}" onblur="if(value==''){value='产品名称/产品ID';this.style.color='gray';}" onkeydown="{this.style.color='#000';}">
		                          </div>
		                          <div id="searchdiv" style="float:left;margin: 0px 0px 0px 30px;">
			                           <a id="serch_bt" href="javascript:void(0)" hidefocus="true">搜索</a>
		                          </div>
	                        </div>
	                        <div id="serch_div" ></div>
	                        <div id="serchspname_div" ></div>
                             <div class="line" style="width:100%;border:solid #CCC 0px;margin-top:0px; color: #CCC;height: 1px;" >&nbsp;</div>
                             <div id="no_data" style="display:none;margin-left:10px;">对不起，没有该业务，请核查数据。</div>
							<div id="first_char" style="width: 90%;margin-top: 15px;display:none;" class="First_char">
								<s:iterator value="privilegeJson.first" id="one" >
									<label id="<s:property value='#one.FIRST_CHAR' />" style="width: 20px;cursor: hand;padding-left: 10px;height: 20px;line-height: 20px;" onclick="scrollTo('<s:property value="#one.FIRST_CHAR" />','1');"><s:property value="#one.FIRST_CHAR" /></label>
								</s:iterator>
							</div>
							<div id="moreContent1" style="display:none;height:350px;overflow-y:auto;position: relative;margin-top: 15px;border-top: 1px solid #D3D3D3;">
								<table width="100%">
									<s:iterator value="privilegeJson.first" id="one" >
										<tr>
											<td style="vertical-align: top;" align="center" class="First_char">
												<label id="<s:property value="#one.FIRST_CHAR" />1"><s:property value="#one.FIRST_CHAR" /></label>
											</td>
											<td class="common">
												<s:iterator value="privilegeJson.rows" id="two" >
													<s:if test="#two.FIRST_CHAR==#one.FIRST_CHAR">
														<label class="tmnlBrand"  style="cursor: hand;" title="名称:<s:property value="#two.NAME"/>&nbsp;ID:<s:property value="#two.Value1"/>" value1="<s:property value="#two.Value1"/>" value2="<s:property value="#two.Value2"/>"><s:property value="#two.NAME" /></label>
													</s:if>																										
												</s:iterator>												
											<br></td>
										</tr>									
									</s:iterator>									
								</table>
								
							</div>													
						</div>
					</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	/**显示更多品牌 **/
	document.getElementById("wait_div").style.filter="alpha(opacity=20)";
	//$("#wait_div").show();  
	//$("#load_div").show();
	var length="<%=request.getAttribute("length") %>";
	if(length!=0){
     $("#first_char").show();
     $("#moreContent1").show();
    }else{
      $("#no_data").show();  
      $("#moreBrandBox").css("border","0px"); 
    }
	var type="<%=request.getAttribute("type") %>";
	var returnplanname="<%=request.getAttribute("name") %>";
	var returnspname="<%=request.getAttribute("spname") %>";
	var returnspcode="<%=request.getAttribute("spcode") %>";
	if (returnspname==""||returnspname==null) {
		$("#spname_text").val("SP企业名称/SP企业ID");
		$("#spname_text").attr("value1","");
	}else {
		$("#spname_text").val(returnspname);
		$("#spname_text").attr("value1",returnspcode);
	}
	if (returnplanname==""||returnplanname==null) {
		$("#marketname_text").val("产品名称/产品ID");
	}else {
		$("#marketname_text").val(returnplanname);
	}
 	if (type=="sp") {
	    $("#region_div").hide(); 
	    $("#sp_div").show();	
	    $("#sp_select").combobox({
					url:"getsp_nameList.action",
			    	editable:true,
					valueField:"id",
					textField:"text",
					onLoadSuccess:function(data){
						$("#sp_select").combobox("setValue",data[0].id);
				     }
	   });   	     
	}else {
	    $("#region_div").show(); 
	    $("#sp_div").hide();
	} 
	 $(".type").each(function(){
	   if(type==$(this).attr("value")){
	     $(this).addClass("choosen");
	   }else{
	     $(this).removeClass("choosen");
	   }
	 
	 });
	 var region="<%=request.getAttribute("combo_region") %>";
	 $("#region").combobox("setValue",region);
	   $("#region").combobox({
	     onSelect:function(newValue){
	      // alert(newValue.value); 
		   window.location.href="searchPrivilege.action?type="+type+"&combo_region="+newValue.value+"&Operate_type=2";    		
	    }
	   });
        $(".type").click(function(){
               $("#wait_div").show();  
	    	   $("#load_div").show(); 
               var value = $(this).attr("value");
               window.location.href="searchPrivilege.action?type="+value;
            
               //$(this).addClass("choosen");
               $("#wait_div").hide();  
	           $("#load_div").hide();     
        });
				
	   $(".tmnlBrand").click(function(){	
	      var ispropri=$(this).attr("value2");
	      if (ispropri=='1') {
			type="pre_product";			
			 var productcd=$(this).attr("value1");
	         window.open ('<%=basePath%>searchPripro.action?productcd='+productcd, 'newwindow', 'height=520, width=800, top=150,left=150, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
		  }else{
		  	window.close();
		  }
		  if(type=='pre_product'){
		       window.opener.$("#choose_pro_pre_div").css("display","block");  
		       window.opener.$("#input_previlege").attr("value","请点击右侧按钮进行选择");
	      }else{
		       window.opener.$("#input_previlege").attr("value","1");
		       window.opener.$("#choose_pro_pre_div").css("display","none");	       
	      }
	      window.opener.$("#input_product").val($(this).text());
	      window.opener.$("#input_product").attr("value0",type);
	      window.opener.$("#input_product").attr("value1",$(this).attr("value1"));
	      window.opener.$("#input_product").attr("value2",$(this).attr("value2"));
	      window.opener.$("#saveFlag").attr("value","0");
	      //alert(a);
	   });
	   
	   
//属性查询事件
	var oldtext = "产品名称/产品ID";
	$("#marketname_text").keyup(function() {
		if ($(this).val() != oldtext) { 
			var planName = encodeURI($("#marketname_text").val());  
			$.markt_panel_tishi(planName);
		}
		
		if($("#marketname_text").val()==""){$("#serch_div").hide();}
	});
	
    var oldspnametext = "SP企业名称/SP企业ID";
	$("#spname_text").keyup(function() {
		if ($(this).val() != oldspnametext) { 
			var spName = encodeURI($("#spname_text").val());  
			$.spname_panel_tishi(spName);
		}
		
		if($("#spname_text").val()==""){$("#serch_div").hide();}
	});
	
	 $("#serch_bt").click(function() { 
	 	$("#wait_div").show();  
	    $("#load_div").show(); 
		var planName = encodeURI($("#marketname_text").val());//二级属性类
		var spname= encodeURI($("#spname_text").val());
		var spcode= $("#spname_text").attr("value1");
		if($("#marketname_text").val()=="产品名称/产品ID"){planName="";}	
		if($("#spname_text").val()=="SP企业名称/SP企业ID"){spname="";spcode="";}	
		window.location.href="searchPrivilege.action?type="+type+"&name="+planName+"&spname="+spname+"&spcode="+spcode;
		
		$("#wait_div").hide();  
	    $("#load_div").hide(); 
	}); 
 
	 $.extend({"spname_panel_tishi":function(spName){	
	  $.ajax({
    		type: 'POST',
    		url: 'spnametishiAction.action',
    		data:{spname:spName},
    		dataType:'json', 
    		success: function(data){ 
		     var table_str=""; 		    
			$("#serchspname_div").children().remove();			
			$.each(data,function(i,table){				 		
				table_str=table_str+"<div class='spname_tishi_div'  onClick='$.spname_tishi(this)'   onMouseover='$.spname_tishi_over(this)' onMouseOut='$.spname_tishi_out(this)' title='"+table.sp_code+"' >"+table.sp_name+"</div> ";  
			});	
			$("#serchspname_div").html(table_str);
			var offset=$("#spname_text").offset();
			$("#serchspname_div").css({
			       "display":"block",
			       "left":(parseInt(offset.left)-4)+"px",
			       "top":(parseInt(offset.top)+13)+"px"
			});
            },
   			error: function(data){
     			return false;
    		}
    	});			
		
	}
	});
	 $.extend({"markt_panel_tishi":function(planName){	
		var spname= encodeURI($("#spname_text").val());
		var spcode= $("#spname_text").attr("value1");
		if($("#spname_text").val()=="SP企业名称/SP企业ID"){spname="";spname="";}	
	  $.ajax({
    		type: 'POST',
    		url: 'tishiAction.action',
    		data:{type:type,name:planName,spname:spname,spcode:spcode},
    		dataType:'json', 
    		success: function(data){ 
		     var table_str=""; 		    
			$("#serch_div").children().remove();			
			$.each(data,function(i,table){				 		
				table_str=table_str+"<div class='markt_tishi_div' onClick='$.markt_tishi(this)' onMouseover='$.markt_tishi_over(this)' onMouseOut='$.markt_tishi_out(this)' >"+table.name+"</div> ";  
			});	
			$("#serch_div").html(table_str);
			var offset=$("#marketname_text").offset();
			$("#serch_div").css({
			       "display":"block",
			       "left":(parseInt(offset.left)-2)+"px",
			       "top":(parseInt(offset.top)+13)+"px"
			});
            },
   			error: function(data){
     			return false;
    		}
    	});			
		
	}
	}); 
	$.extend({'spname_tishi' : function(evet) {
			$("#spname_text").val($(evet).text());
			$("#spname_text").attr("value1",$(evet).attr("title"));  
			var planName = encodeURI($("#marketname_text").val());//二级属性类
			var spname= encodeURI($("#spname_text").val());
			var spcode= $("#spname_text").attr("value1");
			if($("#marketname_text").val()=="产品名称/产品ID"){planName="";}	
			if($("#spname_text").val()=="SP企业名称/SP企业ID"){spname="";spcode="";}	
			window.location.href="searchPrivilege.action?type="+type+"&name="+planName+"&spname="+spname+"&spcode="+spcode;
			$("#serchspname_div").hide();
		}
	}); 
	$.extend({'markt_tishi' : function(evet) {
			 
			$("#marketname_text").val($(evet).text()); 
			$("#serch_div").hide();

		}
	}); 
	$.extend({'spname_tishi_over' : function(evet) {
			$(evet).css('color', '#06F');
		}
	});
	$.extend({'markt_tishi_over' : function(evet) {
			$(evet).css('color', '#06F');
		}
	});

	$.extend({
		'spname_tishi_out' : function(evet) {
			$(evet).css('color', '#666');
		}
	});
	$.extend({
		'markt_tishi_out' : function(evet) {
			$(evet).css('color', '#666');
		}
	});
	var blur_type="";
	$("#serch_div").mouseover(function(){
	   blur_type=1;
	});
	$("#serch_div").mouseout(function(){
	   blur_type=0;
	});
	var spblur_type="";
	$("#serchspname_div").mouseover(function(){
	   spblur_type=1;
	});
	$("#serchspname_div").mouseout(function(){
	   spblur_type=0;
	});
	
	$("#spname_text").blur(function () { 
		 if(spblur_type==0){
		 	$("#serchspname_div").hide(); 
		 }
	 });
	$("#marketname_text").blur(function () { 
		 if(blur_type==0){
		 $("#serch_div").hide(); 
		 }
	 });
	
//结束	 
		 
		});
		 /** 更多品牌中品牌选中事件**/
			function selectBrand(){
				/* $("#tmnl_brand_more").click();
				var cond = "终端品牌 ："+name;
				$(".tmnlBrand").removeClass("condSelected").attr("selected",null);
				$("#tmnlBrand1").val(name);
			//	$("#tmnlModel1").val(null);			
			//	$("#tmnlModel4").css("display","none");		
				$("#tmnlBrand4").css("display","block").text(cond).attr("title",cond);
				//searchDetail(); */
				//findTmnlModels(name);
				alert($(this).attr("title"));
			}
			
			/** 滚动条跳转到指定位置**/
		function scrollTo(id,i){
		    $(".First_char").children().removeClass("first_choosen");
		    $("#"+id).addClass("first_choosen");		
			$("#moreContent"+i).scrollTop(0);
			var top = $("#"+id+i).position().top;
			$("#moreContent"+i).scrollTop(top);
		}
		/**删除选择**/
		function delCond(id){
			$("#"+id+"4").css("display","none");
			$("."+id).removeClass("condSelected").attr("selected",null);
			$("#"+id+"1").val(null); 
		}
		
		window.onunload =function UnloadConfirm(){
			window.opener.$("#saveFlag").attr("value","0");
		};
		
		
</script>
</html>
