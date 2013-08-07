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
    
    <title>My JSP 'attrmanage.jsp' starting page</title>
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

  </head>
  <style>
  *{font-family: "微软雅黑";font-size: 10pt;
}
html{
	height:100%;
	overflow-x: hidden;
	overflow-y: auto;
	}
body{
	height:100%;
	width:1024px;
	font:10pt "微软雅黑" ;
	overflow-x: hidden;
	overflow-y: auto;
	text-align:center;
	margin:0px auto;
	background-color:#FFF;
	}
 #taginfo_table tr{
    cursor:pointer;
   }
 .line {
	height: 1px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 1px;
	float: left;
}
.title_div {
	cursor: pointer;
	height: 40px;
	float: left;
	line-height: 40px;
	margin-right: 35px;	
}
.img_div {
	height: 40px;
	float: left;
	line-height: 40px;
	margin-left:20px;
}
.nav_bt_div{ float:left; cursor:pointer;
}     
.center_all{
	margin:0px auto;
	}
  </style>
  <body>
   <table  id="chartTable_one" width="1024" height="100%"  border="0"  cellspacing="0" cellpadding="0">
	<tr>
	  <td width="24px" height="24px"><img src="./img/leftup.png" width="24px" height="24px"></td>
	  <td width="100%" style="background:url(./img/upborder.png)  repeat-x"></td>
	  <td width="24px" height="24px"><img src="./img/rightup.png" width="24px" height="24px"></td>
	</tr>
	<tr>
	  <td  style="background:url(./img/leftborder.png) repeat-y"></td>
	  <td width="100%" valign="top">
	  <!--主要内容开始-->
	        <!--
			<div class="center_all">
			  <div id="create_tag" class="nav_bt_div">
			  <div id="create_pic" class="img_div" ><img src="./img/maintag/create.png" align="absmiddle" /></div>
			  <div id="" class="title_div">标签申请</div>
			  </div>
			 -->
			  <div id="my_tag" class="nav_bt_div">
			  <div id="create_pic" class="img_div" ><img src="${url3}" align="absmiddle" /></div>
			  <div id="" class="title_div">我的标签</div>
			  </div>	
			  <div id="unifinish_tag" class="nav_bt_div">
			  <div id="no_finish" class="img_div" ><img src="${url2}" align="absmiddle" /></div>
			  <div id="" class="title_div">待处理标签</div>
			  </div>		  
			  <div id="complete_tag" class="nav_bt_div">
			  <div id="finish" class="img_div" ><img src="${url1} " align="absmiddle" /></div>
			  <div id="" class="title_div">已处理标签</div>
			  </div>

			   <div class="line" style="width:100%;" >&nbsp;</div>
			</div>  
			<table id="taginfo_table" width="100%" border="0" cellspacing="0" cellpadding="5">
			  <tr>
			 <!--<td width="2%"><input name="" type="checkbox" value="" onClick="check_all(this)" id="check"> </td> -->
				<td style="color:#030;" >申请单名称</td>
				<td style="color:#030;" >申请人</td>
				<td style="color:#030;" >申请单号</td>
				<td style="color:#030;" >申请时间</td>
				<td style="color:#030;" >审批人</td>
				<td style="color:#030;" >标签状态</td>
				<s:if test="%{role=='审批人'}">
				<td style="color:#030;" >操作</td>
				</s:if>
			  </tr>
			  <s:if test="myListtag!=null">
					  <s:iterator  value="myListtag"   var="TagAprove">  	     	
							 <tr id="table_text" >
						<!-- 	<td><input name="subBox" type="checkbox" /></td>   -->
								<td style="color:#666"> <s:property value="tag_name" /></td>
								<td style="color:#666" ><s:property value="tag_applyer" /></td>
								<td style="color:#666" ><s:property value="tag_id" /></td>
								<td style="color:#666" ><s:property value="create_time" /></td>
								<td style="color:#666;"><s:property value="tag_examiner" /></td>
								<td style="color:#666;"><s:property value="tag_state" /></td>
								 <s:if test="%{role=='审批人'}">
								<td style="color:#030;" ><a name="Approver" href="getTabRequestDetl.action?req_id=<s:property value='tag_id'/>">审批</a></td>    		                                               
								</s:if>
							</tr>  	    	    	 
					</s:iterator> 
			  </s:if>
			  
			  <s:if test="listtag!=null">
					  <s:iterator  value="listtag"   var="TagAprove">  	     	
							 <tr id="table_text" >
						<!-- 	<td><input name="subBox" type="checkbox" /></td>   -->
								<td style="color:#666"> <s:property value="tag_name" /></td>
								<td style="color:#666" ><s:property value="tag_applyer" /></td>
								<td style="color:#666" ><s:property value="tag_id" /></td>
								<td style="color:#666" ><s:property value="create_time" /></td>
								<td style="color:#666;"><s:property value="tag_examiner" /></td>
								<td style="color:#666;"><s:property value="tag_state" /></td>
								 <s:if test="%{role=='审批人'}">
								<td style="color:#030;" ><a name="Approver" href="getTabRequestDetl.action?req_id=<s:property value='tag_id'/>">审批</a></td>    		                                               
								</s:if>
							</tr>  	    	    	 
					</s:iterator> 
			</s:if>
			  </table>
	  
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
     
     var userId="<%=request.getAttribute("userId") %>";
     
     $("#complete_tag").click(
       function(){
       $("#no_finish img").attr("src","./img/maintag/no_finished_gray.png");
       var href = "listtTgApproAction.action?jspmes=1&userId="+userId;
         window.location.href=href;
       });
       
       
      $("#unifinish_tag").click(
       function(){
       var href = "listtTgApproAction.action?jspmes=0&userId="+userId;
         window.location.href=href;
       });
       $("#create_tag").click(
       function(){
       var href="access.action";
       window.location.href=href;
       }
       );
       
       $("#my_tag").click(function(){
           var href="myTagAction.action?jspmes=0&userId="+userId;
           window.location.href=href;
       });
       
        $("#taginfo_table tr:gt(0)").mouseenter(
	         function(){	
        var index =($("#taginfo_table tr").index(this));
              $(this).css("background","#e7e7e7");
                    
		});
       $("#taginfo_table tr:gt(0)").mouseleave(
	         function(){
	    var index =($("#taginfo_table tr").index(this));    
	         $(this).css("background","");
		
		});
		var sixtd="";
//		alert($("#taginfo_table tr").length);
		for (i=1;i<$("#taginfo_table tr").length;i++){
	
	   sixtd=$("#taginfo_table tr:eq("+i+") td:eq(5)").text();
	  
		if (sixtd=="已退回"){
			$("#taginfo_table tr:eq("+i+") td:eq(6)").text("已处理");
		}else if(sixtd=="已发布"){
			$("#taginfo_table tr:eq("+i+") td:eq(6)").text("已处理");
		}else if(sixtd=="待生成标签"){
			$("#taginfo_table tr:eq("+i+") td:eq(6)").text("已审批");
		}
		}
		

 });
</script>  
  </body>
</html>
