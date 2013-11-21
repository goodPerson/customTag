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
		<title>构成分析</title>
         <script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script> 
<!-- 	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>  -->	
		<script type="text/javascript" src="<%=basePath%>/js/highcharts.js"></script>
	</head>


	<body>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
		<script type="text/javascript">
    $(document).ready(function() {
     var name="城乡构成分析";
    var chart;
        Highcharts.getOptions().colors = $.map(Highcharts.getOptions().colors, function(color) {
		    return {
		        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
		        stops: [
		            [0, color],
		            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
		        ]
		    };
		});
     $.ajax({
		        type: 'POST',                                                                 
		        url:'consistAction.action',
		        success: function(msg){
		        msg=$.trim(msg);
		     	msg=eval(msg);
		        //msg =eval('('+msg+')');
		        alert(msg);
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: name
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage}%</b><br> 人数：<b>{point.y} 人</b>',
            	percentageDecimals: 2
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false                  
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: '占比',
                data: msg
            }]
           
        });
    }
    });   
    });
	</script>

	</body>
</html>
