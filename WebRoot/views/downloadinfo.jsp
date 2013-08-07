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
    
    <title>My JSP 'DownloadInfo.jsp' starting page</title>
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
	overflow-y: hidden;
	}
body{
	height:100%;
	width:1024px;
	font:10pt "微软雅黑" ;
	text-align:center;
	margin:0px auto;
	overflow-x: hidden;
	overflow-y: auto;
	background:#FFF;
	}
	.line {
	height: 1px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 1px;
	float: left;
}
#taginfo_table tr{
    cursor:pointer;
   }
a {
     font-size:10pt;
     font-family:"微软雅黑";
     font-weight: 550;
     text-decoration : none;
                 }
 .line1{
	height: 0px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 0px;
	float: left;	
}
.downloadreason{
	width:auto;
	height:25px;
	line-height:25px;
	overflow:hidden;
	}


  </style>
  <body>
   <table  id="chartTable_one"  width="1024"  height="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td width="24px" height="24px" style="background:url(./img/leftup.png)  ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	  <td width="24px" style="background:url(./img/upborder.png)  "></td>
	  <td width="24px" height="24px" style="background:url(./img/rightup.png)  ">&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
	<tr>
	  <td  width="24px" style="background:url(./img/leftborder.png) "></td>

	  <td width="100%" valign="top">
	  <!--主要内容开始-->
   <div style="float:left;margin-top:10px;margin-bottom:10px">下载列表：</div>
     <div class="line1" style="width:100%;border:solid #5ab4f9 1px;" >&nbsp;</div>
     <!------------------------ 内容table---------------------------------------- -->
  <table id="taginfo_table" width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr>
    <td style="color:#030;" width="20%">文件名称</td>
    <td style="color:#030;" width="15%">创建时间</td>
    <td style="color:#030;" width="10%">下载类型</td>
    <td style="color:#030;" width="10%">人数</td>
    <td style="color:#030;" width="14%">目标客户归属</td>
 <!-- <td style="color:#030;" width="10%">状态</td> -->
    <td style="color:#030;" width="10%">操作人</td>
    <td style="color:#030;" width="8%">下载</td>
    <td style="color:#030;" width="10%">下载原因</td>
  </tr>
  <s:iterator  value="listDown"   var="DownloadInfo">  	     	
 	     <tr>
    		<td style="color:#666" width="15%"><s:property value="file_name" /></td>
    		<td style="color:#666" width="10%"><s:property value="%{create_time.substring(0,4)}" />年<s:property value="%{create_time.substring(4,6)}" />月<s:property value="%{create_time.substring(6,8)}" />日</td>
    		<td style="color:#666" width="10%"><s:property value="file_type" /></td>
    		<td style="color:#666" width="10%"><s:property value="count" />人</td>
    		<td style="color:#666;" width="10%"><s:property value="region_name" /></td>
   <!--  	<td style="color:#666;" width="10%" ><s:property value="status" /></td> -->
    		<td style="color:#666" width="10%"> <s:property value="manager" /></td>
    		 <s:if test="%{#DownloadInfo['custlist_path']=='none'}" >
   			 <!--<td style="color:#666 ">文件生成中</td>-->
   			<td> <div><img src="./img/load/load.jpg" width="20" height="20"   align="absmiddle" /></div> </td> 
            </s:if>
            <s:else>
               			<td  style="color:#666 ">               			
               			 <s:if test='%{downLoadReason.trim()!=""}'>
               			      <a  href="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/<s:property value='custlist_path'/>" >下载</a>
               			</s:if>
               			<s:else>
               					<a href="requestDownReason.action?userId=<s:property value='manager_id'/>&createTime=<s:property value='create_time'/>" > 下载原因</a>
               			</s:else>
               			<!-- <a class="href" href="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/${DownloadInfo['custlist_path']}" >下载</a>  -->
               			<!--<a  href="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/<s:property value='custlist_path'/>">下载</a>-->
               			</td>
            </s:else>
    	 <td style="color:#666" width="10%"><div class="downloadreason" title="<s:property value='downLoadReason'/>"><s:property value='downLoadReason'/></div></td> 
  		</tr>  	    	    	 
</s:iterator> 
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
	  /*
 for (i=1;i<$("#taginfo_table tr").length;i++){
	
     if($("#taginfo_table tr:eq("+i+") td:eq(6)").text()!="文件生成中"){
      var href=$("#taginfo_table tr:eq("+i+") td:eq(6)").find("a").attr("href");
     // alert(href);
		      if (typeof(href)!="undefined"){
		    	    //    alert("ok");
					      $.ajax({
					       url: href,
					      type: 'POST',
					      complete: function(response) {
						       if(response.status == 200) {
									    //alert('有效');
						          } else {
									     $(".href").css("display","none");
									     $(".img").css("display","block");
									     // $("#taginfo_table tr:eq("+i+") td:eq(6)").text("文件生成中");
									     //alert('无效');
						  		  }
					  		}
					       });   	  
		      }

      }
  }; 
  */
   $("#taginfo_table tr:gt(0)").mouseenter(
	function(){	
        var index =($("#taginfo_table tr").index(this));
         // alert(str); //此处是选择的li 标签下的选中的 checkbox 
           if(!$(this).find("input").attr("checked")) {
              $(this).css("background","#e7e7e7");
              }        
		});
$("#taginfo_table tr:gt(0)").mouseleave(
	function(){
	    var index =($("#taginfo_table tr").index(this));     
	   if(!$(this).find("input").attr("checked")){	
		$(this).css("background","");
		}
		});
$("#taginfo_table tr:eq(1)").css("background","#e7e7e7");	
});	
  </script>
  </body>
  
</html>
