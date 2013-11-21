<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'testpie.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
   <%--  <script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>   
    <script type="text/javascript" src="<%=path%>/js/highcharts.js"></script> --%>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/themes/icon.css">
	<link rel="stylesheet" href="<%=path%>/js/icon.css" type="text/css"></link>
	<link rel="stylesheet" href="<%=path%>/js/demo.css" type="text/css"></link>
 
	<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
   	<script type="text/javascript" src="<%=path%>/js/highcharts.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
     
    <script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
    </head>
  <body>
  <div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
    	<script type="text/javascript">
$(function () {
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
                text: 'Browser market shares at a specific website, 2010'
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
                            return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Browser share',
                data: [
                    ['Firefox',   45.0],
                    ['IE',       26.8],
                    {
                        name: 'Chrome',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['Safari',    8.5],
                    ['Opera',     6.2],
                    ['Others',   0.7]
                ]
            }]
        });
    });
    
});
		</script>
  </body>
</html>
