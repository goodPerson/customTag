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
    
    <title>My JSP 'logManage.jsp' starting page</title>
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
	width:100%;
	font:10pt "微软雅黑" ;
	margin-bottom: 0px;
	margin-top: 0px;
	margin-right: 0px;
	overflow-x: hidden;
	overflow-y: auto;
	}
  #taginfo_table{
    table-layout: fixed;
  }
 #taginfo_table tr{
    cursor:pointer;
   }
  #taginfo_table td{
    align:left;
    white-space: nowrap;
    overflow: hidden;
　text-overflow:ellipsis;
     
  }
  #taginfo_table a{
    white-space: nowrap;
    overflow: hidden;
　text-overflow:ellipsis;
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

 a{  height:22px; text-align:center; font-size:10pt; line-height:22px;}			
 a:link{text-decoration:none ; }
 a:visited {text-decoration:none ; }
 a:hover {text-decoration:none ; }
 a:active {text-decoration:none ;}

#gray{
 background:#FFFFFF;
  height: 90%;  
  left: 0%;  
  right: 0%;  
  width: 100%;  
  position: absolute; 
  opacity:0.1; 
  z-index: 1;  }  
  
   </style>
  <body>
    <!------------------------ 灰层---------------------------------------- -->
  <div id="gray" style="display:none"></div>
  <div style="float:left;margin-top:10px;margin-bottom:10px">
  <label>员工姓名:</label>
  &nbsp; <select id="log_userName" class="easyui-combobox" name="state" style="width: 100px;"></select> 
  <label>地域:</label>
  &nbsp; <select id="log_region" class="easyui-combobox" name="state" style="width: 100px;"></select>
  <label>栏目名称:</label>
  &nbsp; <select id="log_columnName" class="easyui-combobox" name="state" style="width: 100px;"></select>
  <label>操作类型:</label>
  &nbsp; <select id="log_operateType" class="easyui-combobox" name="state" style="width: 100px;"></select>
  <label>操作名称:</label>
  &nbsp; <select id="log_operateName" class="easyui-combobox" name="state" style="width: 100px;"></select>
  </div>
  <div id="find_button"><a  href="javaScript:void(0)"  id="query" style="float:left;margin-left:10px;margin-top:10px">查询</a> </div>
  
   <div class="line" style="width:100%;" >&nbsp;</div>
 <!------------------------ 内容table---------------------------------------- -->
  <table id="taginfo_table" width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr >
<!-- <td width="2%"><input name="" type="checkbox" value="" onClick="check_all(this)" id="check"> </td>-->
    <td style="color:#030;" width="10%">员工Id</td>
    <td style="color:#030;" width="10%">员工姓名</td>
    <td style="color:#030;" width="10%">地域Id</td>
    <td style="color:#030;" width="10%">地域名称</td>
    <td style="color:#030;" width="10%">栏目名称</td>
    <td style="color:#030;" width="10%">操作类型</td>
	<td style="color:#030;" width="10%">操作名称</td>
	<td style="color:#030;" width="10%">操作参数</td>
	<td style="color:#030;" width="10%">操作时间</td>
  </tr>
  <s:iterator  value="listOLog"   id="log">  	     	
 	     <tr >
    <td style="color:#666;" width="10%"><s:property value="%{#log.userId}"/></td>
    <td style="color:#666;" width="10%"><s:property value="%{#log.userName}"/></td>
    <td style="color:#666;" width="10%"><s:property value="%{#log.regionId}"/></td>
    <td style="color:#666;" width="10%"><s:property value="%{#log.regionName}"/></td>
	<td style="color:#666;" width="10%"><s:property value="%{#log.columnName}"/></td>
    <td style="color:#666;" width="10%"><s:property value="%{#log.operateType}"/></td>
	<td style="color:#666;" width="10%"><s:property value="%{#log.operateName}"/></td>
	<td style="color:#666;" width="10%" title="<s:property value="%{#log.operatePara}"/>"><s:property value="%{#log.operatePara}"/></td>
	<td style="color:#666;" width="10%"><s:property value="%{#log.createTime}"/></td>
  		</tr>  	    	    	 
</s:iterator> 
<tr>
<td colspan="9" align="center" style="color:#666;" >
<input id="userNamePar"  type="hidden" value="<s:property value='userNamePar'/>"/>
<input id="regionNamePar" type="hidden" value="<s:property value='regionNamePar'/>"/>
<input id="columnNamePar" type="hidden" value="<s:property value='columnNamePar'/>"/>
<input id="operateTypePar" type="hidden" value="<s:property value='operateTypePar'/>"/>
<input id="operateNamePar" type="hidden" value="<s:property value='operateNamePar'/>"/>
<input id="page1" type="hidden" value="1"/>
<input id="page2" type="hidden" value="<s:property value='pageNo-1'/>"/>
<input id="page3" type="hidden" value="<s:property value='pageNo+1'/>"/>
<input id="page4" type="hidden" value="<s:property value='pageCounts'/>"/>
<s:if test="%{pageNo==1}">
 第一页&nbsp;  
 上一页&nbsp;
 </s:if>
 <s:else>
 <a href="javaScript:void(0)"  id="first" >第一页</a>&nbsp;
  <a href="javaScript:void(0)"  id="front" >上一页</a>&nbsp;
  <!-- 
 <a href="findOperateLog.action?userName=<s:property value='userNamePar'/>&regionName=<s:property value='regionNamePar'/>&columnName=<s:property value='columnNamePar'/>&operateType=<s:property value='operateTypePar'/>&operateName=<s:property value='operateNamePar'/>&pageNo=1">第一页</a>&nbsp;
  <a href="findOperateLog.action?userName=<s:property value='userNamePar'/>&regionName=<s:property value='regionNamePar'/>&columnName=<s:property value='columnNamePar'/>&operateType=<s:property value='operateTypePar'/>&operateName=<s:property value='operateNamePar'/>&pageNo=<s:property value="pageNo-1"/>">上一页 </a>&nbsp;
   --> 
 </s:else>

  
<s:if test="%{pageNo==pageCounts}"> 
  下一页 &nbsp;
  尾页 &nbsp;
 </s:if>  
 <s:else>
  <a href="javaScript:void(0)"  id="next" >下一页</a>&nbsp;
  <a href="javaScript:void(0)"  id="tail" >尾页</a>&nbsp;
    <!--
  <a href="findOperateLog.action?userName=<s:property value='userNamePar'/>&regionName=<s:property value='regionNamePar'/>&columnName=<s:property value='columnNamePar'/>&operateType=<s:property value='operateTypePar'/>&operateName=<s:property value='operateNamePar'/>&pageNo=<s:property value="pageNo+1"/>">下一页 </a> &nbsp;
  <a href="findOperateLog.action?userName=<s:property value='userNamePar'/>&regionName=<s:property value='regionNamePar'/>&columnName=<s:property value='columnNamePar'/>&operateType=<s:property value='operateTypePar'/>&operateName=<s:property value='operateNamePar'/>&pageNo=<s:property value="pageCounts"/>"> 尾页 </a>&nbsp;
  --> 
 </s:else>
 
 当前 <s:property value="pageNo"/> 页 ， 共 <s:property value="totalRecords"/> 条记录 ，共计 <s:property value="pageCounts"/> 页

 </td>
</tr>
  </table>

  <script type="text/javascript">
   $(function(){
      //alert("ceshi ");
      $("#log_userName").combobox("setText","-请选择-"); 
      $("#log_region").combobox("setText","-请选择-"); 
      $("#log_columnName").combobox("setText","-请选择-"); 
      $("#log_operateType").combobox("setText","-请选择-"); 
      $("#log_operateName").combobox("setText","-请选择-"); 
   //  alert(classify);
         $("#log_userName").combobox({
                url: 'getUserName.action',
                editable:false,
				valueField: 'id',
				textField: 'text',
				panelHeight: '200'
        });  
         $("#log_region").combobox({
             url: 'getRegionName.action',
             editable:false,
				valueField: 'id',
				textField: 'text',
				panelHeight: '200'
        });
         $("#log_columnName").combobox({
             url: 'getColumnName.action',
             editable:false,
  			valueField: 'id',
  			textField: 'text',
  			panelHeight: '200'
        });
         $("#log_operateType").combobox({
             url: 'getOperateType.action',
             editable:false,
  			valueField: 'id',
  			textField: 'text',
  			panelHeight: '200'
        });
         $("#log_operateName").combobox({
             url: 'getOperateName.action',
             editable:false,
  			valueField: 'id',
  			textField: 'text',
  			panelHeight: '200'
        });
      
   
     $("#query").click(
     function(){
    	// alert("ook");
      var log_userName =$("#log_userName").combobox("getValue");
      var log_region =$("#log_region").combobox("getValue");
      var log_columnName =$("#log_columnName").combobox("getValue");
      var log_operateType =$("#log_operateType").combobox("getValue");
      var log_operateName =$("#log_operateName").combobox("getValue");
	   var a ="findOperateLog.action?userName="+encodeURI(encodeURI(log_userName))+"&regionName="+encodeURI(encodeURI(log_region))+
		   "&columnName="+encodeURI(encodeURI(log_columnName))+"&operateType="+encodeURI(encodeURI(log_operateType))+"&operateName="+encodeURI(encodeURI(log_operateName));
      $("#query").attr("href",a);
      
     });
     
     //fenye 
     var log_userNameP         =$("#userNamePar").val();
     var log_regionP              =$("#regionNamePar").val();
     var log_columnNameP    =$("#columnNamePar").val();
     var log_operateTypeP     =$("#operateTypePar").val();
     var log_operateNameP   =$("#operateNamePar").val();
     var page1                      =$("#page1").val();
     var page2                      =$("#page2").val();
     var page3                      =$("#page3").val();
     var page4                      =$("#page4").val();
     var hrefFy="findOperateLog.action?userName="+encodeURI(encodeURI(log_userNameP))+"&regionName="+encodeURI(encodeURI(log_regionP))+
	   "&columnName="+encodeURI(encodeURI(log_columnNameP))+"&operateType="+encodeURI(encodeURI(log_operateTypeP))+"&operateName="+encodeURI(encodeURI(log_operateNameP));
     $("#first").click(function(){
    	 var hrefFyf=hrefFy+"&pageNo="+page1;
    	 $("#first").attr("href",hrefFyf);
     });
     $("#front").click(function(){
    	 var hrefFye=hrefFy+"&pageNo="+page2;
    	 $("#front").attr("href",hrefFye);
     });
     $("#next").click(function(){
    	 var hrefFyt=hrefFy+"&pageNo="+page3;
    	 $("#next").attr("href",hrefFyt);
     });
     $("#tail").click(function(){
    	 var hrefFyfo=hrefFy+"&pageNo="+page4;
    	 $("#tail").attr("href",hrefFyfo);
     });
   
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


$("#edit_attr").click(
   function(){
    var str="";
          $("#taginfo_table tr:gt(0)").each(function(){
          str_index=($("#taginfo_table tr").index(this)); 
           if($(this).find("input").attr("checked")) {
              str+= str_index+",";
              }
          });
          var s = str.split(",");
             if(tr_index==0){
      alert("请选择要编辑的属性！");
      }else if (s.length>2){
      alert("只能选择一个进行编辑！")
      }else{  
      var td = $("#taginfo_table tr:eq("+s[0]+") td:eq(1)");
      var text = td.text(); 
//      alert(text);
       td.html("");
       var input = $("<input>");
       input.attr("value",text);
        input.keyup(function(event){  
            var myEvent = event || window.event;  
            var key = myEvent.keyCode;  
            if(key == 13){  
                var inputNode = $(this);                
                var inputText = inputNode.val();            
                inputNode.parent().html(inputText);                   
                td.click(tdclick);  
            }
             });
             input.dblclick(function(){  
            var inputNode = $(this);  
            var inputText = inputNode.val();  
            inputNode.parent().html(inputText);  
//            alert($("#taginfo_table tr:eq("+(s[0])+") td:eq(6)").text());
           $.ajax({
    		type: 'POST',
    		url: 'renameAttrAction.action',
    		data:{name:inputText ,num:$("#taginfo_table tr:eq("+(s[0])+") td:eq(6)").text()},
    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    		success: function(data){  
    		
             document.location.reload();
            },
   			error: function(data){
     		//alert("json=" + data);
     		return false;
    		}
    	});	  
        });    
            td.append(input);  
          td.unbind("click");  
      }
   });
   
   
  $("#del_attr").click(
     function(){
       var str="";
          $("#taginfo_table tr:gt(0)").each(function(){
          str_index=($("#taginfo_table tr").index(this)); 
           if($(this).find("input").attr("checked")) {
              str+= str_index+",";
              }
          });
           if(tr_index==0){
      alert("请选择要删除的标签！");
      }else{
          var s = str.split(",");
	    var num="";
	    for(i=0;i<s.length-1;i++){
	       num+=$("#taginfo_table tr:eq("+s[i]+") td:eq(6)").text()+",";
	    }
			$.ajax({
    		type: 'POST',
    		url: 'delAttrAction.action',
    		data:{num:num},
    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    		success: function(data){  
            document.location.reload();
            },
   			error: function(data){
     		alert("json=" + data);
     		return false;
    		}
    	});	
		}
     });
 
 
 $("#create_attr").click(
	function(){
        $("#create_div").css("visibility","visible");
        $("#create_div").focus();
        document.getElementById("gray").style.display="block";
	    document.getElementById("gray").style.filter="alpha(opacity=20)";	     
		});	  
   
  
   
 $("#uncreateAttr_bt").click(
	 function(){
		 $("#create_div").css("visibility","hidden");
		  document.getElementById("gray").style.display="none";
	 });
	 
$("#createAttr_bt").click(
     function(){
        $("#create_div").css("visibility","hidden");
		 document.getElementById("gray").style.display="none";
      $.ajax({
    		type: 'POST',
    		url: 'addAttrAction.action',
    		data:{Attr_name:$("#attr_txt").val(),classify:$("#classify").combobox("getValue"),classify1:$("#classify1").combobox("getValue"),classify2:$("#classify2").combobox("getValue")},
    		dataType:"text", //ajax返回值设置为text（json格式也可用它返回，可打印出结果，也可设置成json）
    		success: function(data){ 
           document.location.reload();
            },
   			error: function(data){
     		
     		return false;
    		}
    	});	
     }
);

  check_all =function (obj){
   $("input[type='checkbox']").attr("checked",obj.checked);
   if(obj.checked){
     $("#taginfo_table tr:gt(0)").css("background","#0033CC");
    $("#taginfo_table  tr:gt(0) td").css("color","#FFFFFF");
   }else{
    $("#taginfo_table tr:gt(0)").css("background","");
    $("#taginfo_table  tr:gt(0) td").css("color","#666");
   for (i=1;i<$("#taginfo_table tr").length;i++){
   //  alert($("#taginfo_table tr").length);
    $("#taginfo_table tr:eq("+i+") td:eq(1)").css("color","#000099");
   }
   }
  };
			});
		</script>
  </body>
</html>
