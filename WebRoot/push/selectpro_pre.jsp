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
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/DatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="css/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="css/themes/icon.css">
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
			height: 300px;
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
.markt_tishi_div{
margin:2px auto 2px 2px;color:#666;cursor:pointer; text-align:left;
}
#searchdiv a{ display:block; width:40px; height:24px; text-align:center; font-size:10pt; line-height:24px;}			
#searchdiv a:link{text-decoration:none ; background:#094AB2; color:#FFF ;}
#searchdiv a:visited {text-decoration:none ; background:#094AB2; color:#FFF ;}
#searchdiv a:hover {text-decoration:none ; background:#03F; color:#FFF ;}
#searchdiv a:active {text-decoration:none ;background:#03e; color:#FFF ;}
</style>
</head>

<body>
	<!-- 更多 -->
	<div id="wait_div" class="wait_div" ></div>
  <img id="load_div" src="./img/load/load.jpg" width="32" height="32" align="absmiddle" style="z-index:100; position:absolute; left:49%;top:40%; display:none">
					<div id="moreBrandBox">	
						<hr id="topBorder" size="1" style="border: 1px solid #dddddd;position: absolute;top:0px;left:0px;" />					
						<div style="width: 100%;text-align: left;">
						    <div  style="margin-bottom:10px;margin-top:10px; margin-left:150px;width:100%;">	  	  
		                          <div style=" float:left; padding-right:10px; border:solid #CCC 1px; height:25px;width: 415px;">
				                       <input id="marketname_text" type="text" value="产品名称/产品ID"  style=" width:415px;border-width: 0px; padding-top: 1px;color: gray;" onfocus="if(value=='产品名称/产品ID'){value='';}" onblur="if(value==''){value='产品名称/产品ID';this.style.color='gray';}" onkeydown="{this.style.color='#000';}">
		                          </div>
		                          <div id="searchdiv" style="float:left;margin: 0px 0px 0px 30px;">
			                           <a id="serch_bt" href="javascript:void(0)" hidefocus="true">搜索</a>
		                          </div>
	                        </div>
	                        <div id="serch_div" ></div>
                             <div class="line" style="width:100%;border:solid #CCC 0px;margin-top:0px; color: #CCC;height: 1px;" >&nbsp;</div>
							<div style="width: 90%;margin-top:15px;float:left;" class="First_char">
								<s:iterator value="priproJson.first" id="one" >
									<label id="<s:property value='#one.FIRST_CHAR' />" style="width: 20px;cursor: hand;padding-left: 10px;height: 15px;line-height: 15px;" onclick="scrollTo('<s:property value="#one.FIRST_CHAR" />','1');"><s:property value="#one.FIRST_CHAR" /></label>
								</s:iterator>
							</div>
							<div id="moreContent1" style="height:350px;overflow-y:auto;position: relative;margin-top: 15px;border-top: 1px solid #D3D3D3;">
								<table width="100%">
									<s:iterator value="priproJson.first" id="one" >
										<tr>
											<td style="vertical-align: top;" align="center" class="First_char">
												<label id="<s:property value="#one.FIRST_CHAR" />1"><s:property value="#one.FIRST_CHAR" /></label>
											</td>
											<td class="common">
												<s:iterator value="priproJson.rows" id="two" >
													<s:if test="#two.FIRST_CHAR==#one.FIRST_CHAR">
														<label class="tmnlBrand"  style="cursor: hand;" title="<s:property value="#two.NAME"/>" value1="<s:property value="#two.Value1"/>" value2="<s:property value="#two.Value2"/>"><s:property value="#two.NAME" /></label>
													</s:if>																										
												</s:iterator>												
											</td>
										</tr>									
									</s:iterator>									
								</table>
								
							</div>													
						</div>
					</div>
</body>
<script type="text/javascript">
  $(function () {
   $(".tmnlBrand").click(function(){	       
	      window.opener.$("#input_previlege").val($(this).attr("title"));
	      window.opener.$("#input_previlege").attr("value1",$(this).attr("value1"));
	      window.opener.$("#saveFlag").attr("value","0");
	      window.close();
	      //alert(a);
	   });
	   
//属性查询事件
    var productcd=window.opener.$("#input_product").attr("value1");
	var oldtext = "产品名称/产品ID";
	$("#marketname_text").keyup(function() {
		if ($(this).val() != oldtext) { 
			var planName = encodeURI($("#marketname_text").val());  
			$.markt_panel_tishi(planName);
		}
		
		if($("#marketname_text").val()==""){$("#serch_div").hide();}
	});
	
	 $("#serch_bt").click(function() { 
	 	$("#wait_div").show();  
	    $("#load_div").show(); 
		var planName = encodeURI($("#marketname_text").val());//二级属性类	
		if($("#marketname_text").val()=='产品名称/产品ID'){planName="";}	
		window.location.href="searchPripro.action?name="+planName+"&productcd="+productcd;
		$("#wait_div").hide();  
	    $("#load_div").hide(); 
	}); 
	 $.extend({"markt_panel_tishi":function(planName){	
	  $.ajax({
    		type: 'POST',
    		url: 'tishipreAction.action',
    		data:{productcd:productcd,name:planName},
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
			       "left":(parseInt(offset.left)-4)+"px",
			       "top":(parseInt(offset.top)+11)+"px"
			       });
            },
   			error: function(data){
            //alert(111);
     		return false;
    		}
    	});			
		
	}
	}); 
	$.extend({'markt_tishi' : function(evet) {
			 
			$("#marketname_text").val($(evet).text()); 
			$("#serch_div").hide();

		}
	}); 
	$.extend({'markt_tishi_over' : function(evet) {
			$(evet).css('color', '#06F');
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
