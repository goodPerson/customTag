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

<title>营销活动列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
  


 <link rel="stylesheet" type="text/css" href="<%=basePath%>css/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css"> 
	<link rel="stylesheet" href="<%=basePath%>js/demo.css" type="text/css"></link>
    <script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/highcharts.js"></script>

   
     <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
  
    
    <script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script> 	    
    

<style type="text/css">
* {
	font-family: "微软雅黑";
	font-size: 10pt;
}

html {
	overflow-x: hidden;
	overflow-y: auto;
}

body {
	width: 1024px;
	font: 10pt "微软雅黑";
	text-align: center;
	margin: 0px auto;
	background: #fff;
	overflow-x: hidden;
	overflow-y: auto;
}

.line{
	height: 0px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 0px;
	float: left;	
}

#searchdiv a {
	display: block;
	width: 40px;
	height: 25px;
	text-align: center;
	font-size: 10pt;
	line-height: 25px;
}
#searchdiv a:link {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#searchdiv a:visited {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#searchdiv a:hover {
	text-decoration: none;
	background: #03F;
	color: #FFF;
}
#searchdiv a:active {
	text-decoration: none;
	background: #03e;
	color: #FFF;
}
#close_div{
    z-index:91;
     top:100px;
    float:center;
    position: absolute;
}
#close_div a {
	display: block;
	width: 40px;
	height: 25px;
	text-align: center;
	font-size: 10pt;
	line-height: 25px;
}
#close_div a:link {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#close_div a:visited {
	text-decoration: none;
	background: #094AB2;
	color: #FFF;
}
#close_div a:hover {
	text-decoration: none;
	background: #03F;
	color: #FFF;
}
#close_div a:active {
	text-decoration: none;
	background: #03e;
	color: #FFF;
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
#plan_valuate{
    border:solid #2C92DD 1px;
    z-index:90;
    background:#fff;
    width:501px;
    height:420px;
    top:100px;
    position: absolute;
}
#serch_div{
position:absolute;left:425px; top:94px; width:427px;border-bottom:solid #CCC 1px; border-left:solid #CCC 1px; border-right:solid #CCC 1px; background:#FFF; height:200px; overflow:auto; display:none;	
}
.markt_tishi_div{
margin:2px;color:#666;cursor:pointer;
}

</style>


</head>

<body>
<div id="wait_div" class="wait_div" ></div>
  <img id="load_div" src="./img/load/load.jpg" width="32" height="32" align="absmiddle" style="z-index:100; position:absolute; left:49%;top:40%; display:none"> 
<input id="userid" type="hidden" value="<s:property value='#session.userId'/>">
<table  id="chartTable_one"  width="1024"  height="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
	  <td width="24px" height="24px" style="background:url(./img/leftup.png)  ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  <td width="24px" style="background:url(./img/upborder.png)  "></td>
	  <td width="24px" height="24px" style="background:url(./img/rightup.png)  ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
	  <td width="24px" style="background:url(./img/leftborder.png) "></td>
	  <td width="100%" valign="top">	  
	  <div style="float:left;margin-left:10px;color: #105C90;font-size: 13pt; font-weight: bold;">营销活动列表</div>
	  <div class="line" style="width:100%;border:solid #CCC 0px;margin-top:10px; color: #CCC;height: 1px;" >&nbsp;</div>
	  <div  style="margin-bottom:20px;margin-top:10px; margin-left:240px;width:100%;">	  	  
		  <div style=" float:left; padding-right:10px; border:solid #CCC 1px; height:25px;width: 415px;">
				<input id="marketname_text" type="text" value="营销活动名称"  style=" width:415px;border-width: 0px; padding-top: 1px;color: gray;" onfocus="if(value=='营销活动名称'){value='';}" onblur="if(value==''){value='营销活动名称';this.style.color='gray'; $('#serch_div').hide();}" onkeydown="{this.style.color='#000';}">
		  </div>
		  <div id="searchdiv" style="float:left;margin: 0px 0px 0px 30px;">
			   <a id="market_serch_bt" href="javascript:void(0)" hidefocus="true">搜索</a>
		  </div>
	  </div>
	  <div id="serch_div" ></div>  
	  <div style="background:url(./img/push/background.png) repeat-x ;float:left;height:28px; margin-top:0px; border-top:0px solid #CCC; border-left:0px solid #CCC;; border-right:0px solid #CCC;;width:100%;">
	  		<img alt="创建" src="./img/push/creat.png" border="0" style="margin:4px; cursor:pointer;"><a id="market_creat_bt" href="javascript:void(0)" hidefocus="true" style="color: #fff;height: 26px;text-align:center; font-size: 10pt;	line-height: 26px; border: 0px red solid; margin-bottom: 8px;text-decoration: none;">创建</a>
	  		<img alt="删除" src="./img/push/delete.png" border="0" style="margin:4px;cursor:pointer;" id ="delimg"><a id="market_del_bt" href="javascript:void(0)" hidefocus="true" style="color:#fff;height: 26px;text-align:center; font-size: 10pt;	line-height: 26px;border: 0px red solid; margin-bottom: 8px;text-decoration: none;">删除</a>
	  </div>
	  <div style="float:left;width:100%;margin-bottom:5px;margin-top:-7px;border:1px solid #CCC;height: 73%;">
	  	<div id="datagrid" style="margin:20px 20px;position: absolute; right:5px;"></div>
	  </div>
	  
	  </td>
	  <td width="24px" style="background:url(./img/rightborder.png) "></td>
	</tr>
	<tr>
	  <td width="24px" height="24px" style="background:url(./img/leftdown.png)   ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  <td height="24px"   style="background:url(./img/downborder.png)   "></td>
	  <td width="24px" height="24px"  style="background:url(./img/rightdown.png)   ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
</table> 
	<div id="access" style="display:none">
 
		<div id="close_div" >
			<a id="close" href="javascript:void(0)" hidefocus="true">关闭</a>
		</div>
		<div id="plan_valuate">
			<div id="container"
				style="min-width: 400px; height: 350px;  margin: 1px auto 0px auto"></div>
			<div id="datagrid_access"  ></div>
		</div>
	</div>
</body>
<script type="text/javascript">

$(function(){
	var bodywidth=$(document.body).width();	
	var bodylength=$(document.body).height();
	

	 $("#datagrid").datagrid({
	   				       title : "",
	   				       url:"getMarkPlanInfoList.action",
					       pagination:true,
					       fit:true,
					       rownumbers:true,
		       			   fitColumns:true,
		       			   singleSelect:true,			   
		       			   border:false,
		       			   frozenColumns:[[{
		       			   	field : 'ck',checkbox:true
		       			   }]],
					       columns : [[{
									field : 'plan_id',
									title : '活动Id', 
									width:bodywidth*0.17,
									align : 'center',
									hidden:true
								}, {
									field : 'plan_name',
									title : '活动名称', 
									width:bodywidth*0.3,
									align : 'left'
								}, {
									field : 'creator_id',
									title : '创建人id',  
									width:bodywidth*0.15,
									align : 'left',
									hidden:true
								}, {
									field : 'creator_name',
									title : '创建人',  
									width:bodywidth*0.15,
									align : 'left'
								}, {
									field : 'plan_region_name',
									title : '活动归属地',  
									width:bodywidth*0.1,
									align : 'left'
								},{
									field : 'start_time',
									title : '活动开始时间', 
									width:bodywidth*0.17,
									align : 'center'
								},{
									field : 'end_time',
									title : '活动结束时间',  
									width:bodywidth*0.17,
									align : 'center'
								},{
									field : 'paln_state', 
									title : '活动状态',  
									width:bodywidth*0.17,
									align : 'center'
								},{
									field : 'operate', 
									title : '操作',  
									width :bodywidth*0.15,
									align : 'center'
								}]],								
								onLoadSuccess:function(){
								   $("#wait_div").hide();  
								},
								onDblClickRow:function(rowIndex, rowData){
								   //alert(rowData.plan_id);
								}
	}); 
	
	var p = $('#datagrid').datagrid('getPager');
	$(p).pagination({
		pageSize : 10, 
		pageList : [10,20,30,40,50 ]  				
	});
	
	//属性查询事件
	var oldtext = "";
	$("#marketname_text").keyup(function() {
		if ($(this).val() != oldtext) { 
			var planName = encodeURI($("#marketname_text").val());  
			$.markt_panel_tishi(planName);
		}
		
		if($("#marketname_text").val()==""){$("#serch_div").hide();}
	});

 

	$("#market_serch_bt").click(function() {
		   document.getElementById("wait_div").style.filter="alpha(opacity=20)";
 		$("#wait_div").show(); 
		var planName = encodeURI($("#marketname_text").val());//二级属性类
		
		if($("#marketname_text").val()=='营销活动名称'){planName="";}
		 
		$("#serch_div").hide();
		
		$('#datagrid').datagrid('load', {   
		    userId: 'jyyr_999',   
		    planName: planName  
		});  
		
		 
	}); 
	



    
   $.extend({"markt_panel_tishi":function(planName){	
	  $.ajax({
    		type: 'POST',
    		url: 'getPlanNameList.action',
    		data:{userId:'jyyr_999',planName:planName},
    		dataType:'json', 
    		success: function(data){ 
		    var table_str=""; 		    
			$("#serch_div").children().remove();			
			$.each(data,function(i,table){				 		
				table_str=table_str+"<div class='markt_tishi_div' onClick='$.markt_tishi(this)' onMouseover='$.markt_tishi_over(this)' onMouseOut='$.markt_tishi_out(this)'  >"+table.plan_name+"</div> ";  
			});	

			$("#serch_div").html(table_str);
			var offset=$("#marketname_text").offset();
			//alert(offset.left);
			$("#serch_div").css({
			       "display":"block",
			       "left":(parseInt(offset.left)-1)+"px"
			       });
			//$("#serch_div").focus();
			

            },
   			error: function(data){
            alert(data);
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
			$(evet).css('color', '#000');
		}
	});
	var type="";
	$("#serch_div").mouseover(function(){
	   type=1;
	});
	$("#serch_div").mouseout(function(){
	   type=0;
	});
	
	$("#marketname_text").blur(function () { 
	 if(type==0){
	 $("#serch_div").hide(); 
	 }
	 });
	 $("#close").click(function(){
	   $("#access").css("display","none");
	   $("#load_div").hide();
	 });
  
  	$("#delimg").click(function(){window.$("#market_del_bt").click();});
    $("#market_del_bt").click(function() {
    		var selectRow = $("#datagrid").datagrid('getSelections');//获取选中行
    		//alert(selectRow[0].plan_id);
    		 
    		var userId=$("#userid").val();
    		
    		if(selectRow!=null&&selectRow.length!=0){ 
    		        var selectuserId=selectRow[0].creator_id;
    		        if(userId!=selectuserId){    		        	
    					alert("对不起，您不能删除他人的活动!");
    				}else{
						if (confirm('您确认删除这条记录么?')) {
							for(var i=0;i<selectRow.length;i++){ 
								var planId = selectRow[i].plan_id;
								var planStat=selectRow[i].paln_state;
								if(planStat=='活动创建'||planStat=='目标客户生成'){
						            $.ajax({
								            url : "delMarkt.action?planId=" + planId,
											type : "post",
											dataType : 'text',
											success : function(data) {  
												var a=eval(data);
												var result= a[0].delresult;
												if(result=="删除成功！"){}
												else{alert(result);}												 
												$('#datagrid').datagrid('reload'); 
											}
									});
								}else{
									alert("活动已推送,不能删除！");
								}
							}	
						} 
					} 
			}else{
				alert('请先选择要删除的活动！');
			}
		}
	);
	
   $("#market_creat_bt").click(function(){
   
   window.location.href="<%=basePath%>push/plan_create.jsp";
   
   }); 

}); 

	function PlanAccess(){
	      
	     
	     var bodywidth=$(document.body).width();	
	     var selectRow = $("#datagrid").datagrid('getSelected');//获取选中行
         var state = selectRow.paln_state;
         var plan_id = selectRow.plan_id;
         if(state=='活动评估'){   
	 	  $.ajax({
       type: "POST",
    		url: "pie.action?plan_id="+plan_id,
    		dataType:"text", 
    		success: function(data){ 
    		data=eval(data);
    		//alert(data);
    		if(data==""||data==null){
    		  alert("暂无反馈活动效果。");
    		}else{
    		 $("#load_div").show();
        $("#access").css({
                 "left"  :(parseInt(bodywidth)-500)/2+"px",
                 "display" : "block"
            });
          $("#plan_valuate").css({
                 "left"  :(parseInt(bodywidth)-500)/2+"px",
                 "display" : "block"
            }); 
          $("#close_div").css({
                 "left":(parseInt(bodywidth)-500)/2+460+"px"
                 }); 
  var chart;
 $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '<b>'+data[0].plan_name+'活动效果'+'</b>'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage}%</b>',
            	percentageDecimals: 1
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                         enabled: true,
                        color: '#000000',
                        connectorColor: '#000000',
                        formatter: function() {
                            return '<b>'+ this.point.name +'</b>: '+ this.y+'人' ;
                        }
                    }                   
                }
            },
            series: [{
                type: 'pie',
                name: '人数占比',
                data: [
                    ['已成功人数',   data[0].success_cnt],
                    ['未成功人数',   data[0].fial_cnt]
                ]
            }]
        });
        });
         $("#load_div").hide();
        
     $("#datagrid_access").datagrid({
	   				       title : "",
	   				       url:"getplanaccess.action?plan_id="+plan_id, 
	   				       height:60,
	   				       width:490,
		       			   fitColumns:true, 
					       columns : [[{
									field : 'date_stamp',
									title : '统计日期', 
									width :  110,
									align : 'center'
								}, {
									field : 'plan_name',
									title : '活动名称', 
									width :  180,
									align : 'center'
								}, {
									field : 'commend_cnt',
									title : '推送人数',  
									width :  120,
									align : 'center'
								},{
									field : 'success_cnt',
									title : '成功人数', 
									width :  120,
									align : 'center'
								},{
									field : 'success_rate',
									title : '成功率(%)',  
									width :  90,
									align : 'center'
								}]],								
								onLoadSuccess:function(){
								   $("#load_div").hide();  
								}
	});  
        }
            }
   }); 
	 }else{
         alert("活动正在推送,暂无反馈效果。");
         } 
	}

</script>
</html>