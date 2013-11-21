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
<title>员工明细访问统计</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/demo.css">
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/highcharts.js"></script>

</head>
<style>
body {
	height: 100%;
	width: 1024px;
	text-align:center;
	margin:0px auto;
	font-family:"微软雅黑";
	font-size:12px;
	background-color:#FFF;	
}

#chartTable_one{
	text-align:center;
	margin:0px auto;
	width:1024px;
	}
#day{
	float:left;
	width:45px;
	height:18px;
	margin-left:10px;
	background-image:url(./img/T_gray.png);
	cursor:pointer;
	}
#month{
	float:left;
	width:45px;
	height:18px;
	margin-left:10px;
	background-image:url(./img/T_Light.png);
	cursor:pointer;
	}
. datagrid-cell-rownumbers{
	width:50px;
	text-align:center;
	margin:0px;
	padding:3px 0px;
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
               <div id="div_month_count">
	      <div id="month_counts">
	       <table id="month_table" cellspacing="0" cellpadding="0" data-options="
				pagination:true,
				pageSize:15"></table>     
	      </div>
	  </div><br/>
	  
	 <div id="div_day_count">
	      <div id="day_counts">
	       <table id="day_table" cellspacing="0" cellpadding="0" data-options="
				pagination:true,
				pageSize:15"></table>     
	      </div>
	 </div>
	  <!-- 月明细统计 -->
	  <div id="toolbar">	
			<div align="left"  style="vertical-align : center;" >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>月份:</label>&nbsp;&nbsp;
				<select id="ymonth" panelHeight="auto"class="easyui-combobox" name="month" style="width: 100px;"></select>&nbsp;&nbsp;
				<label>姓名:</label>&nbsp;&nbsp;
				<select id="yuser"  class="easyui-combobox" name="yuser" style="width: 100px;"></select>
				<s:if test='%{#session.regionName=="河北省"}'>
				&nbsp;&nbsp;<label>地区:</label>&nbsp; 
				<select id="cityNames"class="easyui-combobox" name="cityNames" style="width: 100px;"></select>
				</s:if>
				<s:else>
					<span style="display:none;"><select id="cityNames"class="easyui-combobox" name="cityNames" style="width: 100px;display:none;"></select></span>
				</s:else>
				&nbsp;&nbsp;<label>区县:</label>&nbsp; 
				<select id="countyNames"class="easyui-combobox" name="countyNames" style="width: 100px;"></select>
				<a class="easyui-linkbutton" iconCls="icon-search"   onclick="conditionFind();">查询</a>
				&nbsp;&nbsp;
				<a class="easyui-linkbutton" iconCls="icon-print"
					onclick="exportMdetai(); "  plain="true">导出Excel</a>	
			</div>
	 </div>
	 <!-- 日明细统计 -->
	 <div id="toolbarday">	
			<div align="left"  style="vertical-align : center;" >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>开始日期:</label>&nbsp;&nbsp;
				<select id="findstartDay" panelHeight="auto"class="easyui-combobox" name="month" style="width: 120px;"></select>
				<label>结束日期:</label>&nbsp;&nbsp;
				<select id="findsendDay" panelHeight="auto"class="easyui-combobox" name="month" style="width: 120px;"></select>&nbsp;&nbsp;
				<label>姓名:</label>&nbsp;&nbsp;
				<select id="duser"  class="easyui-combobox" name="month" style="width: 100px;"></select>
				<s:if test='%{#session.regionName=="河北省"}'>
					&nbsp;&nbsp;<label>地区:</label>&nbsp; 
				<select id="dcityNames"class="easyui-combobox" name="state" style="width: 100px; "></select>
				</s:if>
				<s:else>
				<span style="display:none;"><select id="dcityNames"class="easyui-combobox" name="state" style="width: 100px;"></select></span>
					
				</s:else>
				&nbsp;&nbsp;<label>区县:</label>&nbsp; 
				<select id="dcountyNames"class="easyui-combobox" name="state" style="width: 100px;"></select>
				<a class="easyui-linkbutton" iconCls="icon-search"   onclick="conditionFindD();">查询</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="easyui-linkbutton" iconCls="icon-print"
					onclick="exportDdetai(); "  plain="true">导出Excel</a>	
			</div>
	 </div>
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
 <script> 	
	$(function(){
		/*var vymonth=$("#ymonth").combobox("getValue");
		alert(vymonth+"ceshi ");
		if (vymonth==""){
			$("#ymonth").combobox("setText","-请选择-");	
		}
		*/
        		var d = new Date();
		var vYear = d.getFullYear();
		$("#ymonth").combobox({  
			valueField: 'label',
			textField: 'value', 
			data: [{
						label: vYear+'01',
						value: vYear+'01'
					},{
						label: vYear+'02',
						value: vYear+'02'
					},{
						label: vYear+'03',
						value: vYear+'03'
					},{
						label: vYear+'04',
						value: vYear+'04'
					},{
						label: vYear+'05',
						value: vYear+'05'
					},{
						label: vYear+'06',
						value: vYear+'06'
					},{
						label: vYear+'07',
						value: vYear+'07'
					},{
						label: vYear+'08',
						value: vYear+'08'
					},{
						label: vYear+'09',
						value: vYear+'09'
					},{
						label: vYear+'10',
						value: vYear+'10'
					},{
						label: vYear+'11',
						value: vYear+'11'
					},{
						label: vYear+'12',
						value: vYear+'12'
			}],
			onLoadSuccess:function(){
				$("#ymonth").combobox("setText","全部");
			}
	             });		
		$("#cityNames").combobox({  
			valueField: 'label',
			textField: 'value', 
			data: [{
						label: '省公司',
						value:  '省公司'
					},{
						label: '石家庄',
						value: '石家庄'
					},{
						label: '唐山',
						value: '唐山'
					},{
						label: '保定',
						value: '保定'
					},{
						label: '廊坊',
						value: '廊坊'
					},{
						label: '承德',
						value: '承德'
					},{
						label: '张家口',
						value: '张家口'
					},{
						label: '秦皇岛',
						value: '秦皇岛'
					},{
						label: '沧州',
						value: '沧州'
					},{
						label: '衡水',
						value: '衡水'
					},{
						label: '邯郸',
						value: '邯郸'
					},{
						label: '邢台',
						value: '邢台'
			}],
			onLoadSuccess:function(){
				$("#cityNames").combobox("setText","全部");
			},
			onSelect:function(){
				 //获取月区县名称清单
				 var rCityName=$("#cityNames").combobox("getText");
				 $("#countyNames").combobox({
					  url:'getCountyNamel_sechtag.action?rCityName='+encodeURI(encodeURI(rCityName)),
					  editable:true,
					  valueField:'id',
					  textField:'text',
					  panelHight:'auto',
					  panelWidth:100,
					  editable:true,
					  onLoadSuccess:function(){
					  	$("#countyNames").combobox("setText","全部");
					  }
				});
		 
			}

	             });		
		
		 $('#month_table').datagrid({
	                url :'getTagSubsM_sechtag.action?statisMonth=&userName=&regionName=&countryName= ',
					pagination : true,
					title: '客户标签客户访问月统计',
					iconCls : 'icon-save',
					width : 980,
					height : 370,
					pageSize:10,
					rownumbers : true,
					fitColumns : true,
					singleSelect : true,
					nowrap : false,
					striped : true,
					collapsible : false,
					loadMsg : '数据加载中请稍后……',
					toolbar : '#toolbar',  
					remoteSort:false,
	               columns: [[{
	                   title: '月份',
	                   field: 'statisMonth',
	                   width: 70,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '用户姓名',
	                   field: 'userName',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '地域名称',
	                   field: 'regionName',
	                   width: 60,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '区县名称',
	                   field: 'countryName',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '访问次数',
	                   field: 'accessCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '客户清单下载次数',
	                   field: 'downloadCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '客户分群创建个数',
	                   field: 'groupCreateCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               }, {
	                   title: '标签新增创建个数',
	                   field: 'tagCreateCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               }]],
	               frozenColumns: [{
	                   field: 'ck',
	                   checkbox: false
	               }]
	             });
         //获取月用户清单
		 $("#yuser").combobox({
		  url:'getUserName_sechtag.action',
		  editable:true,
		  valueField:'id',
		  textField:'text',
		  panelHight:'auto',
		  panelWidth:100,
		  editable:true,
		  onLoadSuccess:function(){
		  	$("#yuser").combobox("setText","全部");

		  }
		 });
		 //获取月区县名称清单
		 $("#countyNames").combobox({
			  url:'getCountyNamel_sechtag.action?rCityName=',
			  editable:true,
			  valueField:'id',
			  textField:'text',
			  panelHight:'auto',
			  panelWidth:100,
			  editable:true,
			  onLoadSuccess:function(){
			  	$("#countyNames").combobox("setText","全部");
			  }
		});
		 
		 $('#day_table').datagrid({
	             //  url :'browDayPiect.action',
	             url :'getTagSubsD_sechtag.action?starTime=&endTime=&userName=&regionName=&countryName= ',
					pagination : true,
					title: '客户标签客户访问日统计',
					iconCls : 'icon-save',
					width : 980,
					height : 370,
					pageSize:10,
					rownumbers : true,
					fitColumns : true,
					singleSelect : true,
					nowrap : false,
					striped : true,
					collapsible : false,
					loadMsg : '数据加载中请稍后……',
					toolbar : '#toolbarday',  
					remoteSort:false,
	               columns: [[{
	                   title: '日期',
	                   field: 'statisDate',
	                   width: 70,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '用户姓名',
	                   field: 'userName',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '地域名称',
	                   field: 'regionName',
	                   width: 60,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '区县名称',
	                   field: 'countryName',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '访问次数',
	                   field: 'accessCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '客户清单下载次数',
	                   field: 'downloadCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '客户分群创建个数',
	                   field: 'groupCreateCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               }, {
	                   title: '标签新增创建个数',
	                   field: 'tagCreateCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               }]],
	               frozenColumns: [{
	                   field: 'ck',
	                   checkbox: false
	               }]
	             });
	           //设置月明细统计分页控件
	             var pM = $('#month_table').datagrid('getPager');
			$(pM).pagination({
				pageSize : 10,//每页显示的记录条数，默认为10  
				pageList : [ 10, 15, 20 ],//可以设置每页记录条数的列表  
				beforePageText : '第',//页数文本框前显示的汉字  
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			});	
		//设置日明细统计分页控件
	        	var pD = $('#day_table').datagrid('getPager');
			$(pD).pagination({
				pageSize : 10,//每页显示的记录条数，默认为10  
				pageList : [ 10, 15, 20 ],//可以设置每页记录条数的列表  
				beforePageText : '第',//页数文本框前显示的汉字  
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			});
		});
	        	
		
		
	$(function(){

		$("#day").click(function(){
			$("#day_href").attr("href","mainDay.action");
			});
		$("#findstartDay").datebox({
		     formatter:myfomatter
		});
		
		$("#findsendDay").datebox({
		     formatter:myfomatter,
		     onSelect:function(date){
					var start =$("#findstartDay").datebox("getValue");
					var s = parseInt(start);
					var end =$("#findsendDay").datebox("getValue");
					var e = parseInt(end);
					if(s>e){
					alert("开始日期不能大于结束日期");
					 $("#findsendDay").datebox("setValue","");
		     	}
		     }
		});	
		
        //获取日用户清单
		 $("#duser").combobox({
		  url:'getUserNameD_sechtag.action',
		  editable:true,
		  valueField:'id',
		  textField:'text',
		  panelHight:'auto',
		  panelWidth:100,
		  editable:true,
		  onLoadSuccess:function(){
		  	$("#duser").combobox("setText","全部");
		  }
		 });
		 //获取日区县名称清单
		 $("#dcountyNames").combobox({
			  url:'getCountyNamelD_sechtag.action?rCityName=',
			  editable:true,
			  valueField:'id',
			  textField:'text',
			  panelHight:'auto',
			  panelWidth:100,
			  editable:true,
			  onLoadSuccess:function(){
			  	$("#dcountyNames").combobox("setText","全部");
			  }
			 });
		 $("#dcityNames").combobox({  
				valueField: 'label',
				textField: 'value', 
				data: [{
							label: '省公司',
							value:  '省公司'
						},{
							label: '石家庄',
							value: '石家庄'
						},{
							label: '唐山',
							value: '唐山'
						},{
							label: '保定',
							value: '保定'
						},{
							label: '廊坊',
							value: '廊坊'
						},{
							label: '承德',
							value: '承德'
						},{
							label: '张家口',
							value: '张家口'
						},{
							label: '秦皇岛',
							value: '秦皇岛'
						},{
							label: '沧州',
							value: '沧州'
						},{
							label: '衡水',
							value: '衡水'
						},{
							label: '邯郸',
							value: '邯郸'
						},{
							label: '邢台',
							value: '邢台'
				}],
				onLoadSuccess:function(){
					$("#dcityNames").combobox("setText","全部");
				},
				onSelect:function(){
					 //获取月区县名称清单
					 var rCityName=$("#dcityNames").combobox("getText");
					  $("#dcountyNames").combobox({
						  url:'getCountyNamel_sechtag.action?rCityName='+encodeURI(encodeURI(rCityName)),
						  editable:true,
						  valueField:'id',
						  textField:'text',
						  panelHight:'auto',
						  panelWidth:100,
						  editable:true,
						  onLoadSuccess:function(){
						  	$("#dcountyNames").combobox("setText","全部");
						  }
				             })
				}
		});
		
	});
	
	function  myfomatter(date) {
		var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+""+(m<10?('0'+m):m)+""+(d<10?('0'+d):d);
		//      return y+"年"+m+"月"+d+"日";
	}
	
    function exportMdetai(){
		var statisMonth  =$("#ymonth").combobox("getText");
		if (statisMonth=="全部") {
			statisMonth="";
		};
		if (statisMonth=="") {
			$("#ymonth").combobox("setText","全部");
		};
		var regionName =$("#cityNames").combobox("getText");
		if (regionName=="全部") {
			regionName="";
		};
		if (regionName=="") {
			$("#cityNames").combobox("setText","全部");
		};		
		var userName     =$("#yuser").combobox("getText");
		if (userName=="全部") {
			userName="";
		};
		if (userName=="") {
			$("#yuser").combobox("setText","全部");
		};		
		var countryName =$("#countyNames").combobox("getText");
		if (countryName=="全部") {
			countryName="";
		};
		if (countryName=="") {
			$("#countyNames").combobox("setText","全部");
		};			
        var exportUrl = "exportMdet.action?statisMonth="+statisMonth+"&userName="+encodeURI(encodeURI(userName))+"&regionName="+encodeURI(encodeURI(regionName))+"&countryName="+encodeURI(encodeURI(countryName));
	    window.location.href = exportUrl;
      }
	
	
	function conditionFind(){
		var statisMonth  =$("#ymonth").combobox("getText");
		if (statisMonth=="全部") {
			statisMonth="";
		};
		if (statisMonth=="") {
			$("#ymonth").combobox("setText","全部");
		};
		var regionName =$("#cityNames").combobox("getText");
		if (regionName=="全部") {
			regionName="";
		};
		if (regionName=="") {
			$("#cityNames").combobox("setText","全部");
		};
		var userName     =$("#yuser").combobox("getText");
		if (userName=="全部") {
			userName="";
		};
		if (userName=="") {
			$("#yuser").combobox("setText","全部");
		};
		var countryName =$("#countyNames").combobox("getText");
		if (countryName=="全部") {
			countryName="";
		};
		if (countryName=="") {
			$("#countyNames").combobox("setText","全部");
		};
		$("#month_table").datagrid({
			url: 'getTagSubsM_sechtag.action?statisMonth='+statisMonth+'&userName='+encodeURI(encodeURI(userName))+'&regionName='+encodeURI(encodeURI(regionName))+'&countryName='+encodeURI(encodeURI(countryName)),
			pagination : true,
			title: '客户标签客户访问月统计',
			iconCls : 'icon-save',
			width : 980,
			height : 340,
			rownumbers : true,
			fitColumns : true,
			singleSelect : true,
			nowrap : false,
			striped : true,
			collapsible : false,
			loadMsg : '数据加载中请稍后……',
			toolbar : '#toolbar',  
			remoteSort:false,
			columns: [[{
                title: '月份',
                field: 'statisMonth',
                width: 70,
                align: 'center',
                sortable: true
            },{
                title: '用户姓名',
                field: 'userName',
                width: 100,
                align: 'center',
                sortable: true
            },{
                title: '地域名称',
                field: 'regionName',
                width: 60,
                align: 'center',
                sortable: true
            },{
                title: '区县名称',
                field: 'countryName',
                width: 100,
                align: 'center',
                sortable: true
            },{
                title: '访问次数',
                field: 'accessCnt',
                width: 100,
                align: 'center',
                sortable: true
            },{
                title: '客户清单下载次数',
                field: 'downloadCnt',
                width: 100,
                align: 'center',
                sortable: true
            },{
                title: '客户分群创建个数',
                field: 'groupCreateCnt',
                width: 100,
                align: 'center',
                sortable: true
            }, {
                title: '标签新增创建个数',
                field: 'tagCreateCnt',
                width: 100,
                align: 'center',
                sortable: true
            }]],
           frozenColumns: [{
               field: 'ck',
               checkbox: false
           }]
		});
		
        //设置分页控件
        var pM = $('#month_table').datagrid('getPager');
		$(pM).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10  
			pageList : [ 10, 15, 20 ],//可以设置每页记录条数的列表  
			beforePageText : '第',//页数文本框前显示的汉字  
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});	
		/*alert(statisMonth+"__"+regionName);
		  $("#month_table").datagrid('load',{
			  statisMonth:statisMonth,
			  regionName:regionName
			});*/
	}
	//导出明细日统计
    function exportDdetai(){
    	var findstartDay=$("#findstartDay").combobox("getText");
		var findsendDay=$("#findsendDay").combobox("getText");
		var regionName =$("#dcityNames").combobox("getText");
		if (regionName=="全部") {
			regionName="";
		};
		if (regionName=="") {
			$("#dcityNames").combobox("setText","全部");
		};
		var userName     =$("#duser").combobox("getText");
		if (userName=="全部") {
			userName="";
		};
		if (userName=="") {
			$("#duser").combobox("setText","全部");
		};
		var countryName =$("#dcountyNames").combobox("getText");
		if (countryName=="全部") {
			countryName="";
		};
		if (countryName=="") {
			$("#dcountyNames").combobox("setText","全部");
		};
        var exportUrl = "exportDdet.action?starTime="+findstartDay+"&endTime="+findsendDay+"&userName="+ encodeURI(encodeURI(userName)) +"&regionName="+ encodeURI(encodeURI(regionName)) +"&countryName="+ encodeURI(encodeURI(countryName));
	    window.location.href = exportUrl;
      }
	
	function conditionFindD(){
		var findstartDay=$("#findstartDay").combobox("getText");
		var findsendDay=$("#findsendDay").combobox("getText");
		var regionName =$("#dcityNames").combobox("getText");
		if (regionName=="全部") {
			regionName="";
		};
		if (regionName=="") {
			$("#dcityNames").combobox("setText","全部");
		};
		var userName     =$("#duser").combobox("getText");
		if (userName=="全部") {
			userName="";
		};
		if (userName=="") {
			$("#duser").combobox("setText","全部");
		};		
		var countryName =$("#dcountyNames").combobox("getText");
		if (countryName=="全部") {
			countryName="";
		};
		if (countryName=="") {
			$("#dcountyNames").combobox("setText","全部");
		};		
		$('#day_table').datagrid({
			url:'getTagSubsD_sechtag.action?starTime='+findstartDay+'&endTime='+findsendDay+'&userName='+ encodeURI(encodeURI(userName)) +'&regionName='+ encodeURI(encodeURI(regionName)) +'&countryName='+ encodeURI(encodeURI(countryName)) ,
			pagination : true,
			title: '客户标签客户访问日统计',
			iconCls : 'icon-save',
			width : 980,
			height : 340,
			rownumbers : true,
			fitColumns : true,
			singleSelect : true,
			nowrap : false,
			striped : true,
			collapsible : false,
			loadMsg : '数据加载中请稍后……',
			toolbar : '#toolbarday',  
			remoteSort:false,
			columns: [[{
                title: '日期',
                field: 'statisDate',
                width: 70,
                align: 'center',
                sortable: true
            },{
                title: '用户姓名',
                field: 'userName',
                width: 100,
                align: 'center',
                sortable: true
            },{
                title: '地域名称',
                field: 'regionName',
                width: 60,
                align: 'center',
                sortable: true
            },{
                title: '区县名称',
                field: 'countryName',
                width: 100,
                align: 'center',
                sortable: true
            },{
                title: '访问次数',
                field: 'accessCnt',
                width: 100,
                align: 'center',
                sortable: true
            },{
                title: '客户清单下载次数',
                field: 'downloadCnt',
                width: 100,
                align: 'center',
                sortable: true
            },{
                title: '客户分群创建个数',
                field: 'groupCreateCnt',
                width: 100,
                align: 'center',
                sortable: true
            }, {
                title: '标签新增创建个数',
                field: 'tagCreateCnt',
                width: 100,
                align: 'center',
                sortable: true
            }]],
           frozenColumns: [{
               field: 'ck',
               checkbox: false
           }]
		});
		
        //设置分页控件
        var p = $('#day_table').datagrid('getPager');
		$(p).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10  
			pageList : [ 10, 15, 20 ],//可以设置每页记录条数的列表  
			beforePageText : '第',//页数文本框前显示的汉字  
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});	
	}
	
	

	</script>
</body>


</html>
