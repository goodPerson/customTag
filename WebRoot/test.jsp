<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title> 
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
  <style>
      html, body, #map {
        height:100%;
        width:100%;
        margin:0;
        padding:0;
      }
      body {
        background-color:#FFF;
        overflow:hidden;
        font-family:"Trebuchet MS";
      }
          #info {
        top: 20px;
        color: #444;
        height: auto;
        font-family: arial;
        right: 20px;
        margin: 5px;
        padding: 10px;
        position: absolute;
        width: 115px;
        z-index: 40;
        border: solid 2px #ccc;
        border-radius: 4px;
        background-color: #fff;
      }
    </style>
      <script>
     $(function(){
    	 $("#dfd").click(function(){
    		// alert(11);
    		/*
    		 $.ajax({
    			 url: 'http://www.baidu.com',
    			 type: 'POST', 
    			 dataType: 'html', 
    			 timeout: 1000, 
    			 error: function(){alert('Error loading PHP document');}, 
    			 success: function(result){alert(result);} 

    			 }); 
    		*/
    		 $.ajax({
    			 type:"POST",
    			 url:" http://www.qq.com/index.shtml",
    			 dataType:"html",
    			 success:function(data){
    			  // var ab=$(data).find("#defTailInfo").html();
    			 //$("#news").html(ab);
    			 alert(data);
    			 },
    			 error:function(){
    			 //$("#news").html("载入失败！");
    			 alert("失败");
    			 }
    			 });
    		 
    		 
    		//alert(11);
    		 //htmlobj=$.ajax({url:"http://www.baidu.com",async:false});
    		 // $("#myDiv").html(htmlobj.responseText);
    	 });
     });
    </script>
    
  </head>
  
  <body class="nihilo">
       <div id="dfd">dfd</div>
       <div id="myDiv"></div>
    
  </body>
</html>
