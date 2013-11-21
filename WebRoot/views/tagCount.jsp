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
<link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/demo.css">
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/highcharts.js"></script>
<script type="text/javascript">

//双轴月统计折线图
$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'month_double_line',
                zoomType: 'xy'
            },
            title: {
                text: '<b>客户标签月统计</b>'
            },
            subtitle: {
                text: '月份：<s:property value="czM.statisMonth"/>'
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
                data: [<s:property value='sgsM.accessSubsCnt'/>, <s:property value='sjzM.accessSubsCnt'/>, <s:property value='tsM.accessSubsCnt'/>,  <s:property value='qhdM.accessSubsCnt'/>, <s:property value='bdM.accessSubsCnt'/>, <s:property value='lfM.accessSubsCnt'/>, <s:property value='hsM.accessSubsCnt'/>, <s:property value='xtM.accessSubsCnt'/>,<s:property value='czM.accessSubsCnt'/>, <s:property value='zjkM.accessSubsCnt'/>, <s:property value='hdM.accessSubsCnt'/>, <s:property value='cdM.accessSubsCnt'/>]
    
            },{
                name: '客户清单下载人数',
                color: '#873A59',
                type: 'spline',
                yAxis: 1,
                data: [<s:property value='sgsM.custlistDwlnSubsCnt'/>, <s:property value='sjzM.custlistDwlnSubsCnt'/>, <s:property value='tsM.custlistDwlnSubsCnt'/>, <s:property value='qhdM.custlistDwlnSubsCnt'/>, <s:property value='bdM.custlistDwlnSubsCnt'/>, <s:property value='lfM.custlistDwlnSubsCnt'/>,<s:property value='hsM.custlistDwlnSubsCnt'/>, <s:property value='xtM.custlistDwlnSubsCnt'/>, <s:property value='czM.custlistDwlnSubsCnt'/>, <s:property value='zjkM.custlistDwlnSubsCnt'/>, <s:property value='hdM.custlistDwlnSubsCnt'/>, <s:property value='cdM.custlistDwlnSubsCnt'/>]
    
            }, {
                name: '客户分群创建人数',
                color: '#873A9B',
                type: 'spline',
                yAxis: 1,
                data: [<s:property value='sgsM.custgroupCreateSubsCnt'/>, <s:property value='sjzM.custgroupCreateSubsCnt'/>, <s:property value='tsM.custgroupCreateSubsCnt'/>, <s:property value='qhdM.custgroupCreateSubsCnt'/>, <s:property value='bdM.custgroupCreateSubsCnt'/>, <s:property value='lfM.custgroupCreateSubsCnt'/>, <s:property value='hsM.custgroupCreateSubsCnt'/>, <s:property value='xtM.custgroupCreateSubsCnt'/>,<s:property value='czM.custgroupCreateSubsCnt'/>, <s:property value='zjkM.custgroupCreateSubsCnt'/>, <s:property value='hdM.custgroupCreateSubsCnt'/>, <s:property value='cdM.custgroupCreateSubsCnt'/>]
    
            },{
                name: '标签新增创建人数',
                color: '#D50600',
                type: 'spline',
                yAxis: 1,
                data: [<s:property value='sgsM.custtagCreateSubsCnt'/>, <s:property value='sjzM.custtagCreateSubsCnt'/>, <s:property value='tsM.custtagCreateSubsCnt'/>, <s:property value='qhdM.custtagCreateSubsCnt'/>, <s:property value='bdM.custtagCreateSubsCnt'/>, <s:property value='lfM.custtagCreateSubsCnt'/>, <s:property value='hsM.custtagCreateSubsCnt'/>, <s:property value='xtM.custtagCreateSubsCnt'/>, <s:property value='czM.custtagCreateSubsCnt'/>, <s:property value='zjkM.custtagCreateSubsCnt'/>, <s:property value='hdM.custtagCreateSubsCnt'/>, <s:property value='cdM.custtagCreateSubsCnt'/>]
    
            },{
                name: '访问次数',
                color: '#568C6A',
                type: 'spline',
                data: [<s:property value='sgsM.accessCnt'/>, <s:property value='sjzM.accessCnt'/>, <s:property value='tsM.accessCnt'/>, <s:property value='qhdM.accessCnt'/>, <s:property value='bdM.accessCnt'/>, <s:property value='lfM.accessCnt'/>, <s:property value='hsM.accessCnt'/>, <s:property value='xtM.accessCnt'/>, <s:property value='czM.accessCnt'/>, <s:property value='zjkM.accessCnt'/>, <s:property value='hdM.accessCnt'/>, <s:property value='cdM.accessCnt'/>]
            }, {
                name: '客户清单下载次数',
                color: '#07186A',
                type: 'spline',
                data: [<s:property value='sgsM.custlistDwlnCnt'/>, <s:property value='sjzM.custlistDwlnCnt'/>, <s:property value='tsM.custlistDwlnCnt'/>, <s:property value='qhdM.custlistDwlnCnt'/>,  <s:property value='bdM.custlistDwlnCnt'/>, <s:property value='lfM.custlistDwlnCnt'/>, <s:property value='hsM.custlistDwlnCnt'/>, <s:property value='xtM.custlistDwlnCnt'/>, <s:property value='czM.custlistDwlnCnt'/>, <s:property value='zjkM.custlistDwlnCnt'/>, <s:property value='hdM.custlistDwlnCnt'/>, <s:property value='cdM.custlistDwlnCnt'/>]
            },{
                name: '客户分群创建个数',
                color: '#2A6D59',
                type: 'spline',
                data: [<s:property value='sgsM.custgroupCreateCnt'/>, <s:property value='sjzM.custgroupCreateCnt'/>, <s:property value='tsM.custgroupCreateCnt'/>, <s:property value='qhdM.custgroupCreateCnt'/>, <s:property value='bdM.custgroupCreateCnt'/>, <s:property value='lfM.custgroupCreateCnt'/>, <s:property value='hsM.custgroupCreateCnt'/>, <s:property value='xtM.custgroupCreateCnt'/>, <s:property value='czM.custgroupCreateCnt'/>, <s:property value='zjkM.custgroupCreateCnt'/>, <s:property value='hdM.custgroupCreateCnt'/>, <s:property value='cdM.custgroupCreateCnt'/>]
            }, {
                name: '标签新增创建个数',
                color: '#89A54E',
                type: 'spline',
                data: [<s:property value='sgsM.custtagCreateCnt'/>, <s:property value='sjzM.custtagCreateCnt'/>, <s:property value='tsM.custtagCreateCnt'/>, <s:property value='qhdM.custtagCreateCnt'/>, <s:property value='bdM.custtagCreateCnt'/>, <s:property value='lfM.custtagCreateCnt'/>, <s:property value='hsM.custtagCreateCnt'/>, <s:property value='xtM.custtagCreateCnt'/>, <s:property value='czM.custtagCreateCnt'/>, <s:property value='zjkM.custtagCreateCnt'/>, <s:property value='hdM.custtagCreateCnt'/>, <s:property value='cdM.custtagCreateCnt'/>]
            }]
        });
    });
    
});


		</script>
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
#div_month_count{
	height:728px;
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
      <div> <div id="month">月统计</div> <div id="day"><a id="day_href" >日统计</a></div> </div>
      <div style="clear:both;"></div>	  
      <div id="div_month_count">
	       <div id="month_double_line" style="min-width: 400px; height: 350px; margin: 0 auto;"></div><br/>&nbsp;<br/>
	      <div id="month_counts">
	       <table id="month_table" cellspacing="0" cellpadding="0"></table>     
	      </div>
	  </div>
	  
	  	<div id="toolbar">	
			<div align="left"  style="vertical-align : center;" >
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<label>月份:</label>&nbsp;&nbsp;
				<select id="ymonth" panelHeight="auto"class="easyui-combobox" name="month" style="width: 100px;"></select>
				&nbsp;&nbsp;<label>地区:</label>&nbsp; 
				<select id="cityNames"class="easyui-combobox" name="state" style="width: 100px;"></select>
				<a class="easyui-linkbutton" iconCls="icon-search"   onclick="conditionFind();">查询</a>&nbsp;&nbsp;
				<a class="easyui-linkbutton" iconCls="icon-print"
					onclick="exportMregion(); "  plain="true">导出Excel</a>	
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
			}
	});		

		
			 $('#month_table').datagrid({
	             //  url :'browDayPiect.action',
	             url :'getTagCountsDataM.action?statisMonth=&regionName=',
					pagination : true,
					title: '客户标签月统计',
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
	                   title: '月份',
	                   field: 'statisMonth',
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
	         var pM = $('#month_table').datagrid('getPager');
			$(pM).pagination({
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
     
		
	});
	
    function exportMregion(){
		var statisMonth=$("#ymonth").combobox("getText");
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
        var exportUrl = "exportRm.action?statisMonth="+statisMonth+"&regionName="+encodeURI(encodeURI(regionName));
	    window.location.href = exportUrl;
      }
	
	function conditionFind(){
		var statisMonth=$("#ymonth").combobox("getText");
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

		$("#month_table").datagrid({
			url: 'getTagCountsDataM.action?statisMonth='+statisMonth+'&regionName='+encodeURI(encodeURI(regionName)),
			pagination : true,
			title: '客户标签月统计',
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
               title: '月份',
               field: 'statisMonth',
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
	
	

	</script>
</body>


</html>
