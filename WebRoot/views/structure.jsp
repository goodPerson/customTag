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
    
    <title>My JSP 'structure.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<style type="text/css">
#struct_condition {
	width: auto;
	height: 400px;
	font-size:12px;
	text-align:center;
	line-height:400px;
	overflow:hidden; 
	/*position: absolute;
	top: 100px;
	left:300px;
    float:left;
	visibility:hidden;
	z-index:-5;*/
}	
#line_struct{
	z-index:-5;
	}
</style>
  </head>
  
  <body>
                      <!--构建条件开始-->
                        <div id="struct_condition">
                             <s:if test='%{attrTypeC=="连续型"}'>
							 		   <s:if test='%{structAttr=="0"}'>
									   		暂无构成条件！
									   </s:if>
									   <s:else>
									   		<div id="line_struct" style="min-width: 400px; height: 400px; margin: 0 auto"></div>  
									   </s:else>
                                           
                              </s:if>
                              <s:elseif test='%{attrTypeC=="是否码表"}'>
							  		   <s:if test='%{structAttr=="0"}'>
									   		暂无构成条件！
									   </s:if>
									   <s:else>
									   		<div id="pie" style="min-width: 400px; height: 400px; margin: 0 auto"></div> 
									   </s:else>
                               		 
                              </s:elseif>
							  <s:elseif test='%{attrTypeC=="码表"}'>							  
							  		   <s:if test='%{structAttr=="0"}'>
									   		暂无构成条件！
									   </s:if>
									   <s:else>
									   		<div id="line_struct" style="min-width: 400px; height: 400px; margin: 0 auto"></div> 
									   </s:else>
							  </s:elseif>
                              <s:else>
                              		暂无构成条件！
                              </s:else>                      
                        </div>
                        
                        <!--构建条件结束-->
   
  </body>
  <s:if test='%{attrTypeC=="连续型" || attrTypeC=="码表"}'>
  <script type="text/javascript">
$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'line_struct',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '<s:property value="attrDesc"/>'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage}%</b><br>数量：<b>{point.y} </b>',
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
                            return '<b>'+ this.point.name +'</b>';
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: '百分比',
                data: [                      
							<s:property value="structAttr"/>               

                ]
            }]
        });
    });
    
});
		</script>
</s:if>
<s:elseif test='%{attrTypeC=="是否码表" && structAttr.indexOf(",")>0}'>
<script type="text/javascript">
$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'pie',
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: '<s:property value="attrDesc"/>'
            },
            tooltip: {
        	    pointFormat: '{series.name}: <b>{point.percentage}%</b><br>数量：<b>{point.y} </b>',
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
                            return '<b>'+ this.point.name +'</b> ';
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: '百分比',
                data: [
					<s:property value="structAttr"/>    
                ]
            }]
        });
    });
    
});
</script>
</s:elseif>
</html>
