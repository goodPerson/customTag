<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.net.*" %>
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
#create_div{border-color:#000; border-style:solid;border-width:2px;
			background:#FFF; width:380px; height:250px;
			position:absolute;top:40px;left:400px;z-index:2;
			visibility:hidden
			}
#create_div a{ display:block; width:80px; height:28px; text-align:center; font-size:10pt; line-height:28px;}			
#create_div a:link{text-decoration:none ; background:#094AB2; color:#FFF ;}
#create_div a:visited {text-decoration:none ; background:#094AB2; color:#FFF ;}
#create_div a:hover {text-decoration:none ; background:#03F; color:#FFF ;}
#create_div a:active {text-decoration:none ;background:#000; color:#FFF ;}
#find_button a{ display:block; width:50px; height:22px; text-align:center; font-size:10pt; line-height:22px;}			
#find_button a:link{text-decoration:none ; background:#094AB2; color:#FFF ;}
 #find_button a:visited {text-decoration:none ; background:#094AB2; color:#FFF ;}
 #find_button a:hover {text-decoration:none ; background:#03F; color:#FFF ;}
 #find_button a:active {text-decoration:none ;background:#000; color:#FFF ;}
.img_div {
	height: 40px;
	float: left;
	line-height: 40px;
	margin-left:20px;
}
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
  <label>属性分类:</label>&nbsp; <select id="attr_classify" class="easyui-combobox" name="state" style="width: 100px;"></select> 
  <label>属性子类1:</label>&nbsp; <select id="attr_classify_one" class="easyui-combobox" name="state" style="width: 100px;"></select>
  <label>属性子类2:</label>&nbsp; <select id="attr_classify_two" class="easyui-combobox" name="state" style="width: 100px;"></select>
  </div>
  <div id="find_button"><a  href="javaScript:void(0)"  id="query" style="float:left;margin-left:10px;margin-top:10px">查询</a> </div>
<!--    <div id="create_pic" class="img_div" ><img src="./img/maintag/create.png" align="absmiddle" /></div>
  <div id="create_attr" class="title_div">创建</div>
  <div id="" class="img_div" ><img src="./img/maintag/rename.png" align="absmiddle" /></div>
  <div id="edit_attr" class="title_div">编辑</div>
  <div id="" class="img_div" ><img src="./img/maintag/manage.png" align="absmiddle" /></div>
   <div id="del_attr" class="title_div">删除</div> -->
  
   <div class="line" style="width:100%;" >&nbsp;</div>
 <!------------------------ 内容table---------------------------------------- -->
  <table id="taginfo_table" width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr >
<!-- <td width="2%"><input name="" type="checkbox" value="" onClick="check_all(this)" id="check"> </td>-->
    <td style="color:#030;" width="10%">属性名称</td>
    <td style="color:#030;" width="10%">属性分类</td>
    <td style="color:#030;" width="10%">属性子类1</td>
    <td style="color:#030;" width="10%">属性子类2</td>
    <td style="color:#030;" width="20%">统计口径</td>
    <td style="display:none">num</td>
 <!--    <td style="color:#030;  ">标签结束时间</td>
    <td style="color:#030;  ">标签创建人</td>
    <td style="color:#030;  ">标签地市</td>
     -->
  </tr>
  <s:iterator  value="listAttrName"   var="AttrUnify">  	     	
 	     <tr id="table_text" >
<!-- style="color:#000099"  		<td><input name="subBox" type="checkbox" /></td>    -->
    		<td style="color:#666" width="10%"> <s:property value="attr_desc" /></td>
    		<td style="color:#666" width="10%"><s:property value="attr_classify" /></td>
    		<td style="color:#666" width="10%"><s:property value="attr_classify_one" /></td>
    		<td style="color:#666" width="10%"><s:property value="attr_classify_two" /></td>
    		<td style="color:#666;" width="20%"><a style="width:300px;text-align:left;" title="<s:property value="statis_requmts" />"><s:property value="statis_requmts" /></a></td>
    		<td  width="20%" style="display:none"><s:property value="num_order" /></td>
    	 <!-- 	<td style="color:#666"><s:property value="" /></td>
   			<td style="color:#666"><s:property value="" /></td>
   			<td style="color:#666 "><s:property value="" /></td>
   			<td style="display:none"><s:property value="" /></td> -->
  		</tr>  	    	    	 
</s:iterator> 
<tr>
<td colspan="6"  align="center">
<input id="attr_classifyPar"  type="hidden" value="<s:property value='attr_classifyPar'/>"/>
<input id="attr_classify_onePar" type="hidden" value="<s:property value='attr_classify_onePar'/>"/>
<input id="attr_classify_twoPar" type="hidden" value="<s:property value='attr_classify_twoPar'/>"/>
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
 <a href="getAttrListAction.action?attr_classify=<%=URLEncoder.encode(request.getAttribute("attr_classifyPar").toString(),"utf-8")%>&attr_classify_one=<%=URLEncoder.encode(request.getAttribute("attr_classify_onePar").toString(),"utf-8")%>
  &attr_classify_two=<%=URLEncoder.encode(request.getAttribute("attr_classify_twoPar").toString(),"utf-8")%>&pageNo=1">第一页</a>&nbsp;
  <a href="getAttrListAction.action?attr_classify=<%=URLEncoder.encode(request.getAttribute("attr_classifyPar").toString(),"utf-8")%>&attr_classify_one=<%=URLEncoder.encode(request.getAttribute("attr_classify_onePar").toString(),"utf-8")%>
  &attr_classify_two=<%=URLEncoder.encode(request.getAttribute("attr_classify_twoPar").toString(),"utf-8")%>&pageNo=<s:property value="pageNo-1"/>">上一页 </a>&nbsp;
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
  <a href="getAttrListAction.action?attr_classify=<%=URLEncoder.encode(request.getAttribute("attr_classifyPar").toString(),"utf-8")%>&attr_classify_one=<%=URLEncoder.encode(request.getAttribute("attr_classify_onePar").toString(),"utf-8")%>
  &attr_classify_two=<%=URLEncoder.encode(request.getAttribute("attr_classify_twoPar").toString(),"utf-8")%>&pageNo=<s:property value="pageNo+1"/>">下一页 </a> &nbsp;
  <a href="getAttrListAction.action?attr_classify=<%=URLEncoder.encode(request.getAttribute("attr_classifyPar").toString(),"utf-8")%>&attr_classify_one=<%=URLEncoder.encode(request.getAttribute("attr_classify_onePar").toString(),"utf-8")%>
  &attr_classify_two=<%=URLEncoder.encode(request.getAttribute("attr_classify_twoPar").toString(),"utf-8")%>&pageNo=<s:property value="pageCounts"/>"> 尾页 </a>&nbsp;
   --> 
 </s:else>


 当前 <s:property value="pageNo"/> 页 ， 共 <s:property value="totalRecords"/> 条记录 ，共计 <s:property value="pageCounts"/> 页</td>
</tr>
  </table>
 <!------------------------ 创建标签对话框---------------------------------------- -->
 <div id='create_div'>
<table width="100%" border="0" cellspacing="0" cellpadding="10" >
  <tr>
    <td colspan="2" style="font-size:12pt;">创建属性</td>
    </tr>
   <tr>
    <td colspan="2"><input name="" id="attr_txt" type="text"  value="请输入名称" style="width:100%; height:25px; border:1px solid  #CCC"  ></td>
  </tr>
  <tr>
    <td colspan="2"> <label>属性分类&nbsp;&nbsp;:</label>&nbsp; <select id="classify" class="easyui-combobox" name="state" style="width:286px;"></select></td>
  </tr>
  <tr>
    <td colspan="2"> <label>属性子类1:</label>&nbsp; <select id="classify1" class="easyui-combobox" name="state" style="width: 286px;"></select> </td>
  </tr>
  <tr>
    <td colspan="2"> <label>属性分类2:</label>&nbsp; <select id="classify2" class="easyui-combobox" name="state" style="width: 286px;"></select> </td>
  </tr>
  <tr>
    <td align="left"><a id="createAttr_bt" href="javascript:void(0)">创建</a></td>
    <td align="right"><a id="uncreateAttr_bt" href="javascript:void(0)">取消</a></td>
  </tr>
</table>
</div> 
  <script type="text/javascript">
   $(function(){
 
   // var  cla="<%=request.getAttribute("attr_classifyPar") %>";
   // var  one="<%=request.getAttribute("attr_classify_onePar") %>";
   // var  two="<%=request.getAttribute("attr_classify_twoPar") %>";
    var  cla="<%=request.getAttribute("attr_classifyPar") %>";
    var  one="<%=request.getAttribute("attr_classify_onePar") %>";
    var  two="<%=request.getAttribute("attr_classify_twoPar") %>";
   //  alert(classify);
          
      $("#attr_classify").combobox({
                url: 'getAttrAction.action',
                editable:false,
				valueField: 'id',
				textField: 'text',
				panelHeight: '200',
				onChange:function(newValue,oldValue){		  
		         $("#attr_classify_one").combobox({
			                    disabled:false,
			                    url:'getAttr1Action.action?attr='+ encodeURI(encodeURI(newValue)),
			                    valueField:'id',
			                    panelHeight: '200',
			                    textField:'text',
			                    onChange:function(newValue,oldValue){
			                    $("#attr_classify_two").combobox({
			                    disabled:false,
			                    url:'getAttr2Action.action?attr1='+ encodeURI(encodeURI(newValue)),
			                    valueField:'id',
			                    panelHeight:'100',
			                    textField:'text'
			                    });
			                    }
			      });
		     }
         });
          $("#classify").combobox({
                url: 'getAttrAction.action',
                editable:false,
				valueField: 'id',
				textField: 'text',
				panelHeight: '100',
				onChange:function(newValue,oldValue){		  
		         $("#classify1").combobox({
			                    disabled:false,
			                    url:'getAttr1Action.action?attr='+ encodeURI(encodeURI(newValue)),
			                    valueField:'id',
			                    panelHeight: 'auto',
			                    textField:'text',
			                    onChange:function(newValue,oldValue){
			                    $("#classify2").combobox({
			                    disabled:false,
			                    url:'getAttr2Action.action?attr1='+ encodeURI(encodeURI(newValue)),
			                    valueField:'id',
			                    panelHeight:'100',
			                    textField:'text'
			                    });
			                    }
			      });
		     }
         });
      
      
   
     $("#query").click(
     function(){
      var attr_classify =$("#attr_classify").combobox("getValue");
      var attr_classify_one =$("#attr_classify_one").combobox("getValue");
      var attr_classify_two =$("#attr_classify_two").combobox("getValue");
     var a ="getAttrListAction.action?attr_classify="+encodeURI(encodeURI(attr_classify))+"&attr_classify_one="+encodeURI(encodeURI(attr_classify_one))+"&attr_classify_two="+encodeURI(encodeURI(attr_classify_two));
//          window.location.href=a; 
      $("#query").attr("href",a);
      
     });
     
      $("#attr_classify").combobox("setValue",cla) ;
      $("#attr_classify_one").combobox("setValue",one) ;
      $("#attr_classify_two").combobox("setValue",two) ;
/*    var tr_index=0; 
    $("#taginfo_table tr:gt(0)").live("mousedown",function (){
   tr_index=($("#taginfo_table tr").index(this));  
    if($(this).find("input").attr("checked")){//已选中的行 取消选中
    $(this).find("input").attr("checked",false);
    $(this).css("background","");
    $("#taginfo_table tr:eq("+tr_index+") td:gt(1)").css("color","#666");
    $("#taginfo_table tr:eq("+tr_index+") td:eq(1)").css("color","#000099");
   }else{//未选中的行，进行选中
    $(this).find("input").attr("checked",true);
    $(this).css("background","#0033CC");
    $("#taginfo_table tr:eq("+tr_index+") td").css("color","#FFFFFF");
   }
   });*/
   
   //fenye 
   var attr_classifyPar         =$("#attr_classifyPar").val();
   var attr_classify_onePar              =$("#attr_classify_onePar").val();
   var attr_classify_twoPar    =$("#attr_classify_twoPar").val();
   var page1                      =$("#page1").val();
   var page2                      =$("#page2").val();
   var page3                      =$("#page3").val();
   var page4                      =$("#page4").val();
   var hrefFy="getAttrListAction.action?attr_classify="+encodeURI(encodeURI(attr_classifyPar))+"&attr_classify_one="+encodeURI(encodeURI(attr_classify_onePar))+"&attr_classify_two="+encodeURI(encodeURI(attr_classify_twoPar));
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
