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
	<link rel="stylesheet" type="text/css" href="../../../customTag20130708/WebRoot/views/css/themes/gray/easyui.css">  
    <link rel="stylesheet" type="text/css" href="../../../customTag20130708/WebRoot/views/css/themes/icon.css">  
	<script type="text/javascript" src="../../../customTag20130708/WebRoot/views/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="../../../customTag20130708/WebRoot/views/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript" src="../../../customTag20130708/WebRoot/views/js/jquery.easyui.min.js"></script>  
	<script type="text/javascript" src="../../../customTag20130708/WebRoot/views/js/easyui-lang-zh_CN.js"></script> 

  </head>
  <style>
  *{font-family: "微软雅黑";font-size: 10pt;
}
html{
	height:100%;
	overflow-x: hidden;
	overflow-y: hidden;
	}
body{
	margin:0px auto;
	height:100%;
	width:1024px;
	font:10pt "微软雅黑" ;
	overflow-x: hidden;
	overflow-y: auto;
	text-align:center;
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
<div class="center_all">
  <div id="create_tag" class="nav_bt_div">
      <div id="create_pic" class="img_div" ><img src="../../../customTag20130708/WebRoot/views/img/maintag/create.png" align="absmiddle" /></div>
      <div id="" class="title_div">创建</div>
      </div>
      <div id="complete_tag" class="nav_bt_div">
      <div id="finish" class="img_div" ><img src="<s:property value='url1'/> " align="absmiddle" /></div>
      <div id="" class="title_div">已处理标签</div>
      </div>
      <div id="unifinish_tag" class="nav_bt_div">
      <div id="no_finish" class="img_div" ><img src="<s:property value='url2'/>" align="absmiddle" /></div>
      <div id="" class="title_div">待处理标签</div>
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
<tr>
<td colspan="7"  style="text-align:center"> 
<s:if test="%{pageNo==1}">
 第一页&nbsp;  
 上一页&nbsp;
 </s:if>
 <s:else>
 <a href="listtTgApproAction.action?jspmes=<s:property value="jspmes"/>&userId=<s:property value="userId"/>&pageNo=1">第一页</a>&nbsp;
  <a href="listtTgApproAction.action?jspmes=<s:property value="jspmes"/>&userId=<s:property value="userId"/>&pageNo=<s:property value="pageNo-1"/>">上一页 </a>&nbsp;
 </s:else>

  
<s:if test="%{pageNo==pageCounts}"> 
  下一页 &nbsp;
  尾页 &nbsp;
 </s:if>  
 <s:else>
  <a href="listtTgApproAction.action?jspmes=<s:property value="jspmes"/>&userId=<s:property value="userId"/>&pageNo=<s:property value="pageNo+1"/>">下一页  </a>&nbsp;
  <a href="listtTgApproAction.action?jspmes=<s:property value="jspmes"/>&userId=<s:property value="userId"/>&pageNo=<s:property value="pageCounts"/>"> 尾页 </a>&nbsp;
 </s:else>
 
 当前 <s:property value="pageNo"/> 页 ， 共 <s:property value="totalRecords"/> 条记录 ，共计 <s:property value="pageCounts"/> 页
  </td>
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
		   alert("1111");
       var href="addApply.action";
       window.location.href=href;
       }
       );
       
       
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
	   //alert($("#taginfo_table tr").length);
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
