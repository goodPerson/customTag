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
    
    <title>My JSP 'tagCountMonth.jsp' starting page</title>
    
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
	<script type="text/javascript">
	$(function () {
	    var chart;
	    $(document).ready(function() {
	        chart = new Highcharts.Chart({
	            chart: {
	                renderTo: 'double_line_Day',
	                zoomType: 'xy'
	            },
	            title: {
	                text: '<b>客户标签日统计</b>'
	            },
	            subtitle: {
	                text: '日期：<s:property value="czD.statisDate"/>'
	            },
	            xAxis: [{
	                categories: ['<div style="margin-top:3px;">省公司</div>', '<div style="margin-top:3px;">石家庄</div>', '<div style="margin-top:3px;">唐山</div>', '<div style="margin-top:3px;">秦皇岛</div>', '<div style="margin-top:3px;">保定</div>', '<div style="margin-top:3px;">廊坊</div>',
	                             '<div style="margin-top:3px;">衡水</div>', '<div style="margin-top:3px;">邢台</div>', '<div style="margin-top:3px;">沧州</div>', '<div style="margin-top:3px;">张家口</div>', '<div style="margin-top:3px;">邯郸</div>', '<div style="margin-top:3px;">承德</div>']
	            }],
	            yAxis: [{ // Primary yAxis
	                labels: {
	                    formatter: function() {
	                        return this.value +'';
	                    },
	                    style: {
	                        color: '#89A54E'
	                    }
	                },
	                title: {
	                    text: '次(个)数',
	                    style: {
	                        color: '#89A54E'
	                    }
	                }
	            }, { // Secondary yAxis
	                title: {
	                    text: '人数',
	                    style: {
	                        color: '#4572A7'
	                    }
	                },
	                labels: {
	                    formatter: function() {
	                        return this.value +' ';
	                    },
	                    style: {
	                        color: '#4572A7'
	                    }
	                },
	                opposite: true
	            }],
	            tooltip: {
	                formatter: function() {
	                    return ''+
	                        this.x +': '+ this.y +
	                        (this.series.name == 'Rainfall' ? ' ' : '');
	                }
	            },
	            legend: {
	                layout: 'vertical',
	                align: 'right',
	                x: 0,
	                verticalAlign: 'top',
	                y: 100,
	                floating: false,
	                backgroundColor: '#FFFFFF'
	            },
	            series: [{
	                name: '访问人数',
	                color: '#4572A7',
	                type: 'spline',
	                yAxis: 1,
	                data: [<s:property value='sgsD.accessSubsCnt'/>, <s:property value='sjzD.accessSubsCnt'/>, <s:property value='tsD.accessSubsCnt'/>,  <s:property value='qhdD.accessSubsCnt'/>, <s:property value='bdD.accessSubsCnt'/>, <s:property value='lfD.accessSubsCnt'/>, <s:property value='hsD.accessSubsCnt'/>, <s:property value='xtD.accessSubsCnt'/>,<s:property value='czD.accessSubsCnt'/>, <s:property value='zjkD.accessSubsCnt'/>, <s:property value='hdD.accessSubsCnt'/>, <s:property value='cdD.accessSubsCnt'/>]
	    
	            },{
	                name: '客户清单下载人数',
	                color: '#873A59',
	                type: 'spline',
	                yAxis: 1,
	                data: [<s:property value='sgsD.custlistDwlnSubsCnt'/>, <s:property value='sjzD.custlistDwlnSubsCnt'/>, <s:property value='tsD.custlistDwlnSubsCnt'/>, <s:property value='qhdD.custlistDwlnSubsCnt'/>, <s:property value='bdD.custlistDwlnSubsCnt'/>, <s:property value='lfD.custlistDwlnSubsCnt'/>,<s:property value='hsD.custlistDwlnSubsCnt'/>, <s:property value='xtD.custlistDwlnSubsCnt'/>, <s:property value='czD.custlistDwlnSubsCnt'/>, <s:property value='zjkD.custlistDwlnSubsCnt'/>, <s:property value='hdD.custlistDwlnSubsCnt'/>, <s:property value='cdD.custlistDwlnSubsCnt'/>]
	    
	            }, {
	                name: '客户分群创建人数',
	                color: '#873A9B',
	                type: 'spline',
	                yAxis: 1,
	                data: [<s:property value='sgsD.custgroupCreateSubsCnt'/>, <s:property value='sjzD.custgroupCreateSubsCnt'/>, <s:property value='tsD.custgroupCreateSubsCnt'/>, <s:property value='qhdD.custgroupCreateSubsCnt'/>, <s:property value='bdD.custgroupCreateSubsCnt'/>, <s:property value='lfD.custgroupCreateSubsCnt'/>, <s:property value='hsD.custgroupCreateSubsCnt'/>, <s:property value='xtD.custgroupCreateSubsCnt'/>,<s:property value='czD.custgroupCreateSubsCnt'/>, <s:property value='zjkD.custgroupCreateSubsCnt'/>, <s:property value='hdD.custgroupCreateSubsCnt'/>, <s:property value='cdD.custgroupCreateSubsCnt'/>]
	    
	            },{
	                name: '标签新增创建人数',
	                color: '#D50600',
	                type: 'spline',
	                yAxis: 1,
	                data: [<s:property value='sgsD.custtagCreateSubsCnt'/>, <s:property value='sjzD.custtagCreateSubsCnt'/>, <s:property value='tsD.custtagCreateSubsCnt'/>, <s:property value='qhdD.custtagCreateSubsCnt'/>, <s:property value='bdD.custtagCreateSubsCnt'/>, <s:property value='lfD.custtagCreateSubsCnt'/>, <s:property value='hsD.custtagCreateSubsCnt'/>, <s:property value='xtD.custtagCreateSubsCnt'/>, <s:property value='czD.custtagCreateSubsCnt'/>, <s:property value='zjkD.custtagCreateSubsCnt'/>, <s:property value='hdD.custtagCreateSubsCnt'/>, <s:property value='cdD.custtagCreateSubsCnt'/>]
	    
	            },{
	                name: '访问次数',
	                color: '#568C6A',
	                type: 'spline',
	                data: [<s:property value='sgsD.accessCnt'/>, <s:property value='sjzD.accessCnt'/>, <s:property value='tsD.accessCnt'/>, <s:property value='qhdD.accessCnt'/>, <s:property value='bdD.accessCnt'/>, <s:property value='lfD.accessCnt'/>, <s:property value='hsD.accessCnt'/>, <s:property value='xtD.accessCnt'/>, <s:property value='czD.accessCnt'/>, <s:property value='zjkD.accessCnt'/>, <s:property value='hdD.accessCnt'/>, <s:property value='cdD.accessCnt'/>]
	            }, {
	                name: '客户清单下载次数',
	                color: '#07186A',
	                type: 'spline',
	                data: [<s:property value='sgsD.custlistDwlnCnt'/>, <s:property value='sjzD.custlistDwlnCnt'/>, <s:property value='tsD.custlistDwlnCnt'/>, <s:property value='qhdD.custlistDwlnCnt'/>,  <s:property value='bdD.custlistDwlnCnt'/>, <s:property value='lfD.custlistDwlnCnt'/>, <s:property value='hsD.custlistDwlnCnt'/>, <s:property value='xtD.custlistDwlnCnt'/>, <s:property value='czD.custlistDwlnCnt'/>, <s:property value='zjkD.custlistDwlnCnt'/>, <s:property value='hdD.custlistDwlnCnt'/>, <s:property value='cdD.custlistDwlnCnt'/>]
	            },{
	                name: '客户分群创建个数',
	                color: '#2A6D59',
	                type: 'spline',
	                data: [<s:property value='sgsD.custgroupCreateCnt'/>, <s:property value='sjzD.custgroupCreateCnt'/>, <s:property value='tsD.custgroupCreateCnt'/>, <s:property value='qhdD.custgroupCreateCnt'/>, <s:property value='bdD.custgroupCreateCnt'/>, <s:property value='lfD.custgroupCreateCnt'/>, <s:property value='hsD.custgroupCreateCnt'/>, <s:property value='xtD.custgroupCreateCnt'/>, <s:property value='czD.custgroupCreateCnt'/>, <s:property value='zjkD.custgroupCreateCnt'/>, <s:property value='hdD.custgroupCreateCnt'/>, <s:property value='cdD.custgroupCreateCnt'/>]
	            }, {
	                name: '标签新增创建个数',
	                color: '#89A54E',
	                type: 'spline',
	                data: [<s:property value='sgsD.custtagCreateCnt'/>, <s:property value='sjzD.custtagCreateCnt'/>, <s:property value='tsD.custtagCreateCnt'/>, <s:property value='qhdD.custtagCreateCnt'/>, <s:property value='bdD.custtagCreateCnt'/>, <s:property value='lfD.custtagCreateCnt'/>, <s:property value='hsD.custtagCreateCnt'/>, <s:property value='xtD.custtagCreateCnt'/>, <s:property value='czD.custtagCreateCnt'/>, <s:property value='zjkD.custtagCreateCnt'/>, <s:property value='hdD.custtagCreateCnt'/>, <s:property value='cdD.custtagCreateCnt'/>]
	            }]
	        });
	    });
	    
	});
	
	</script>
	<style type="text/css">
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
#div_day_count{
	height:728px;
	}
#day{
	float:left;
	width:45px;
	height:18px;
	margin-left:10px;
	background-image:url(./img/T_Light.png);
	cursor:pointer;
	}
#month{
	float:left;
	width:45px;
	height:18px;
	margin-left:10px;
	background-image:url(./img/T_gray.png);
	cursor:pointer;
	}
	</style>
  </head>
  
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
	  <div> <div id="month"><a id="month_href">月统计</a></div> <div id="day">日统计</div> </div>
	  <div style="clear:both;"></div>
	  <div id="div_day_count">
		 <div id="double_line_Day" style="min-width: 400px; height: 350px; margin: 0 auto"></div><br/>&nbsp;<br/>
	      <div id="day_counts">
			 <table id="dg" cellspacing="0" cellpadding="0"></table>
	      </div> 
       </div>
       
       	  <div id="toolbar">	
			<div align="left">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>开始日期:</label>&nbsp;&nbsp;
				<select id="findstartDay" panelHeight="auto"class="easyui-combobox" name="month" style="width: 120px;"></select>
				<label>结束日期:</label>&nbsp;&nbsp;
				<select id="findsendDay" panelHeight="auto"class="easyui-combobox" name="month" style="width: 120px;"></select>
				&nbsp;&nbsp;<label>地区:</label>&nbsp; 
				<select id="cityNames"class="easyui-combobox" name="state" style="width: 100px;"></select>
				<a class="easyui-linkbutton" iconCls="icon-search"   onclick="conditionFind()">查询</a>&nbsp;&nbsp;
				<a class="easyui-linkbutton" iconCls="icon-print"
					onclick="exportDregion(); "  plain="true">导出Excel</a>	
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
  <script type="text/javascript">
  $(function(){
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
			}
	});		
		 $('#dg').datagrid({
	             //  url :'browDayPiect.action',
	             url :'getTagCountsData.action?findstartDay=&findsendDay=&regionName=',
					pagination : true,
					title: '客户标签日统计',
					iconCls : 'icon-save',
					width : 980,
					height : 340,
					rownumbers : true,
					fitColumns : true,
					singleSelect : true,
					nowrap : false,
					striped : true,
					collapsible : false,
					remoteSort : true,
					idField : 'value6',
					loadMsg : '数据加载中请稍后……',
					toolbar : '#toolbar',  
					remoteSort:false,
	               columns: [[{
	                   title: '日期',
	                   field: 'statisDate',
	                   width: 70,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '地域名称',
	                   field: 'regionName',
	                   width: 60,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '访问人数',
	                   field: 'accessSubsCnt',
	                   width: 60,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '访问次数',
	                   field: 'accessCnt',
	                   width: 60,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '客户清单下载人数',
	                   field: 'custlistDwlnSubsCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '客户清单下载次数',
	                   field: 'custlistDwlnCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '客户分群创建人数',
	                   field: 'custgroupCreateSubsCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               }, {
	                   title: '客户分群创建个数',
	                   field: 'custgroupCreateCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '标签新增创建人数',
	                   field: 'custtagCreateSubsCnt',
	                   width: 100,
	                   align: 'center',
	                   sortable: true
	               },{
	                   title: '标签新增创建个数',
	                   field: 'custtagCreateCnt',
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
	         var p = $('#dg').datagrid('getPager');
			$(p).pagination({
				pageSize : 10,//每页显示的记录条数，默认为10  
				pageList : [ 10, 15, 20 ],//可以设置每页记录条数的列表  
				beforePageText : '第',//页数文本框前显示的汉字  
				afterPageText : '页    共 {pages} 页',
				displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
			});	
  });
  	$(function(){
		$("#month").click(function(){
			$("#month_href").attr("href","mainMethod.action");
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

		
	});
	function  myfomatter(date) {
        var y = date.getFullYear();
		var m = date.getMonth()+1;
		var d = date.getDate();
		return y+""+(m<10?('0'+m):m)+""+(d<10?('0'+d):d);
//      return y+"年"+m+"月"+d+"日";
	}
	
    function exportDregion(){
		var findstartDay=$("#findstartDay").combobox("getText");
		var findsendDay=$("#findsendDay").combobox("getText");
		var regionName=$("#cityNames").combobox("getText");
		if (regionName=="全部") {
			regionName="";
		};
		if (regionName=="") {
			$("#cityNames").combobox("setText","全部");
		};
        var exportUrl = "exportDr.action?findstartDay="+ findstartDay +"&findsendDay="+ findsendDay +"&regionName="+encodeURI(encodeURI(regionName));
	    window.location.href = exportUrl;
      }
	
	function conditionFind(){
		var findstartDay = $("#findstartDay").combobox("getText");
		var findsendDay = $("#findsendDay").combobox("getText");
		var regionName = $("#cityNames").combobox("getText");
		if (regionName=="全部") {
			regionName="";
		};
		if (regionName=="") {
			$("#cityNames").combobox("setText","全部");
		};

		$('#dg').datagrid({
			url:'getTagCountsData.action?findstartDay='+ findstartDay +'&findsendDay='+ findsendDay +'&regionName='+encodeURI(encodeURI(regionName)),
			pagination : true,
			title: '客户标签日统计',
			iconCls : 'icon-save',
			width : 980,
			height : 340,
			rownumbers : true,
			fitColumns : true,
			singleSelect : true,
			nowrap : false,
			striped : true,
			collapsible : false,
			remoteSort : true,
			idField : 'value6',
			loadMsg : '数据加载中请稍后……',
			toolbar : '#toolbar',  
			remoteSort:false,
           columns: [[{
               title: '日期',
               field: 'statisDate',
               width: 70,
               align: 'center',
               sortable: true
           },{
               title: '地域名称',
               field: 'regionName',
               width: 60,
               align: 'center',
               sortable: true
           },{
               title: '访问人数',
               field: 'accessSubsCnt',
               width: 60,
               align: 'center',
               sortable: true
           },{
               title: '访问次数',
               field: 'accessCnt',
               width: 60,
               align: 'center',
               sortable: true
           },{
               title: '客户清单下载人数',
               field: 'custlistDwlnSubsCnt',
               width: 100,
               align: 'center',
               sortable: true
           },{
               title: '客户清单下载次数',
               field: 'custlistDwlnCnt',
               width: 100,
               align: 'center',
               sortable: true
           },{
               title: '客户分群创建人数',
               field: 'custgroupCreateSubsCnt',
               width: 100,
               align: 'center',
               sortable: true
           }, {
               title: '客户分群创建个数',
               field: 'custgroupCreateCnt',
               width: 100,
               align: 'center',
               sortable: true
           },{
               title: '标签新增创建人数',
               field: 'custtagCreateSubsCnt',
               width: 100,
               align: 'center',
               sortable: true
           },{
               title: '标签新增创建个数',
               field: 'custtagCreateCnt',
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
        var p = $('#dg').datagrid('getPager');
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
