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
    <script type="text/javascript" src="js/DD_roundies_min.js"></script>
     
    
</head>
   <style>
*{font-family: "微软雅黑";font-size: 10pt;
}
html{
	overflow-x: hidden;
	overflow-y: auto;
	}
body{

	width:1024px;
	font:10pt "微软雅黑" ;
	text-align:center;
	margin:0px auto;
	background:#fff;
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
	height: 0px;
	font-size: 0px;
	background: #E8E8E8;
	line-height: 0px;
	float: left;
	
}
 .line_de {
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
  z-index: 1;  
}
.label{
	height:30px;
	line-height:30px;
	width:9.8%;
	text-align:center;
	float:left;
    cursor: pointer;
} 
.label_one{
  length:20px;
  margin-right:14px;
  margin-top:5px;
  margin-bottom:5px;
  text-align:right;
} 
#nav a{
  font-size:12pt;
  font-family:"微软雅黑";
  font-weight: 550;
  text-decoration : none;
}
#attr_one a{
  font-size:11pt;
  font-family:"微软雅黑";
  font-weight: 550;
  text-decoration : none;
}
.label_in {
  color:#5ab4f9;

}
.labelin_one{
   text-decoration:underline;
}
#serch_attr_div{
position:absolute;left:710px; top:60px; width:414px;border-bottom:solid #CCC 1px; border-left:solid #CCC 1px; border-right:solid #CCC 1px; display:block; background:#FFF; height:200px; overflow:auto; z-index:2;display:none;	
}
.attr_tishi_div{
margin:2px;color:#666;cursor:pointer;
}
.attr_desc_div {

    margin-left:5px;
    padding-bottom:2px;
	float: left;
	width: 85px;
	height: 25px; 
	cursor: pointer;
	text-align:center; 
	color:#999;
	line-height:25px;
}
.attr_desc_div_in{
     color:#5ab4f9;
}
#chartTable_one{
    width:1024px;
    height:100%;
}
   </style>
  <body>
    <!------------------------ 灰层---------------------------------------- -->
      <table  id="chartTable_one" width="1024px"  border="0"  cellspacing="0" cellpadding="0">
	<tr>
	  <td width="24px" height="24px" style="background:url(./img/leftup.png)"></td>
	  <td width="100%" style="background:url(./img/upborder.png)  repeat-x"></td>
	  <td width="24px" height="24px" style="background:url(./img/rightup.png)" ></td>
	</tr>
	<tr>
	  <td height="100%" style="background:url(./img/leftborder.png) repeat-y"></td>
	  <td width="100%" valign="top">
	  <!--主要内容开始-->
      <div id="gray" style="display:none;"></div>
  <div style="width:100%;margin-left:255px">
  <div style="float:left;width:415px;">
    <input type="text" id="attr_name" value="属性名称" style="border:solid #5ab4f9 2px;padding-top:1px;height:30px;width:415px;color:gray;"onfocus="if (value =='属性名称'){value =''}" onBlur="if (value ==''){value='属性名称';this.style.color='gray'}" onKeyDown="{this.style.color='#000'}">
  </div>
     
   <div id="find_button" style="float:left;">
   <div id="serch_attr_div" style="border:1px solid #999"></div>
<img id="query" src="./img/bt_attr.png" width="80" height="30">
    </div>
   </div> 
<div style="clear:both"></div>
 <div id="nav" style="float:left;height:30px; margin-top:10px; border-top:1px solid #CCC; border-left:1px solid #CCC;; border-right:1px solid #CCC;;width:100%;">
<div class="label" >基本属性</div>
<div class="label" >语音属性</div>
<div class="label" >流量属性</div>
<div class="label" >短/彩信属性</div>
<div class="label" >业务属性</div>
<div class="label" >终端属性</div>
<div class="label" >集团属性</div>
<div class="label" >区域属性</div>
<div class="label" >渠道属性</div>
<div class="label" >标签</div>
  </div>
   <div class="line" style="width:100%;border:solid #5ab4f9 1px;" >&nbsp;</div>
   <div id="attr_one" style="float:left;width:100%;margin-bottom:5px;border:1px solid #CCC;">
   <div class="attr_tr" style="width:100%; ">
      <s:iterator value="listAttrName1"  id="AttrUnify1">
       <div class="attr_desc_div"  title="<s:property value='attr_classify_one'/>">
         <s:if test="%{attr_classify_one.length()>5}">
         	<s:property value="%{attr_classify_one.substring(0,4)+'...'}" escape="false" />
         </s:if>
         <s:else>
        	 <s:property value="attr_classify_one"/>
         </s:else>
       </div>                         
      </s:iterator>
   </div>
   </div>

 <!------------------------ 内容table---------------------------------------- -->
 <div style="clear:both" />
 <div style='margin:5px;background-image:url(./img/1113.png);width:195px;height:35px;padding-top:4px;padding-left:5px;color:#FFF;left:-20px;position:relative;'>属性表格</div>
 <div style="border:#CCC 1px solid; width:100%">
  <table id="taginfo_table" width="100%" border="0" cellspacing="0" cellpadding="5">
  <tr >
    <td style="color:#030;font-style:bold" width="20%">属性名称</td>
    <td style="color:#030;" width="60%">统计口径</td>
  </tr>
  <s:iterator  value="listAttrName"   var="AttrUnify">  	     	
 	     <tr id="table_text" >
    		<td style="color:#094AB2" width="20%"> <a style="width:90%;text-align:left;" title="<s:property value="attr_desc" />"><s:property value="attr_desc" /></a></td>
    		<td style="color:#666" width="40%"> <a style="width:90%;text-align:left;" title="<s:property value="statis_requmts" />"><s:property value="statis_requmts" /></a></td>
  		</tr>  	    	    	 
</s:iterator> 
  </table>
  </div>
 <!------------------------ 创建标签对话框---------------------------------------- -->
 <div id='create_div' style="border:1px solid #CCC;">
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
//   DD_roundies.addRule('.label', '5px 5px 0 0', true);
   DD_roundies.addRule('.attr_desc_div_in', '2px', true);
   $(function(){
   
    var  cla="<%=request.getAttribute("attr_classify") %>";
    var  one="<%=request.getAttribute("attr_classify_one") %>";
    var  two="<%=request.getAttribute("attr_classify_two") %>";
    var name="<%=request.getAttribute("attr_classify") %>";
    //alert(name);
    
//    $(".attr_desc_div").css("border","1px solid #999999");
    if(!+[1,]); 
 //   else $("#find_button").css("margin-top","10px");
   
    //属性查询事件
var oldtext="";
$("#attr_name").keyup(function(){
	if($(this).val()!=oldtext){
  		//alert($(this).val());
		//oldtext=$(this).val();
		
	  var type1="";//一级属性类
	  var type2=encodeURI($("#attr_name").val());//二级属性类
	  var type11="";  		
	  $.third_attr_panel_tishi('2',type1,type2,type11);	
  
	}
	 if($("#attr_name").val()=="" || $("#attr_name").val()=="查询属性名称"){
        $("#serch_attr_div").css("display","none");
    }
  
	
});

//生产三级属性查询提示框面板
    $.extend({'third_attr_panel_tishi':function(value_type,type1,type2,type11){	
	  $.ajax({
    		type: 'POST',
    		url: 'listAttrTagAction.action',
    		data:{type_1:value_type,type_2:type2},
    		dataType:'json', 
    		success: function(data){ 
		    var table_str=""; 		    
			$("#serch_attr_div").children().remove();			
			$.each(data,function(i,table){				
				$.each(table,function(l,tr){
				  $.each(tr,function(k,td){
					//atrs 说明 0 属性类型   1 属性名称  2 属性   3 属性id  4 一级属性		
					table_str=table_str+"<div class='attr_tishi_div' onClick='$.attr_tishi(this)' onMouseover='$.attr_tishi_over(this)' onMouseOut='$.attr_tishi_out(this)'  >"+td.attr_name+"</div> ";  
					});								 
				});
			});	

			$("#serch_attr_div").html(table_str);
			var set =$("#attr_name").offset();
			$("#serch_attr_div").css({
			             "display":"block",
						 "left":set.left+"px",
						 "top":(parseInt(set.top)+30)+"px"
						 });	

            },
   			error: function(data){
            alert(data);
     		return false;
    		}
    	});			
		
	}
	});
//提示框点击事件
    $.extend({'attr_tishi':function(evet){	
	  $("#attr_name").val($(evet).text());
	  $("#serch_attr_div").hide();
	
	}});
//提示框移出移入变化
    $.extend({'attr_tishi_over':function(evet){	
	  $(evet).css('background','#d4d4d4');	
	}});
	
    $.extend({'attr_tishi_out':function(evet){
      $(evet).css('background','');	
	  $(evet).css('color','#666');	
	}});
    var index1="";
      $("#nav").find("div").each(function(){
          str_index=$(this).text();
         // alert(str_index);
         if(str_index==name){
         $(this).addClass("label_in");
         }             
          });
          $(".attr_desc_div").each(function(){
          str_index=$(this).attr("title");
         // alert(str_index);
         if(str_index==one){
//          $(this).css("background","#094AB2");
        $(this).addClass("attr_desc_div_in");
         
         }             
          });
    //alert(index1);
   //  alert(classify);
    $(".attr_desc_div").mouseenter(
       function(){
        var index=$(".attr_desc_div").index(this);
         // alert($("#nav children:eq(0)").text());
         if(one!=$(this).attr("title")){
         $(this).addClass("attr_desc_div_in");
         }
    });
    $(".attr_desc_div").mouseleave(
       function(){
        var index=$(".attr_desc_div").index(this);
        if(one!=$(this).attr("title")){
         $(this).removeClass("attr_desc_div_in");
         }
    });
    $("#nav").children().mouseenter(
       function(){
       var text=$(this).text();
        if(text!=name){
        $(this).addClass("label_in");
        }
    
    });
    
     $("#nav").children().mouseleave(
       function(){
       var text=$(this).text();
        if(text!=name){
        $(this).removeClass("label_in");
        }
    
    });
    $("#nav").children().click(
          function(){
           $(this).addClass("label_in");
         var hee="getAttrListAction.action?attr_classify="+encodeURI(encodeURI($(this).text()))+"&attr_classify_one="+""+"&attr_classify_two="+"";
         window.location.href=hee;
    });  
//     $("#attr_one").children().click(
      $(".attr_desc_div").click(
         function(){
          // $(this).addClass("label_in");
          // index1=$("#attr_one").children().index(this);
          // alert($(this).attr("title"));
         var hre="getAttrListAction.action?attr_classify="+encodeURI(encodeURI(name))+"&attr_classify_one="+encodeURI(encodeURI($(this).attr("title")))+"&attr_classify_two="+"";
         window.location.href=hre;
    });    
 //   alert(index1);
    
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
      
      
   
/*     $("#query").click(
     function(){
      var attr_classify =$("#attr_classify").combobox("getValue");
      var attr_classify_one =$("#attr_classify_one").combobox("getValue");
      var attr_classify_two =$("#attr_classify_two").combobox("getValue");
     var a ="getAttrListAction.action?attr_classify="+encodeURI(encodeURI(attr_classify))+"&attr_classify_one="+encodeURI(encodeURI(attr_classify_one))+"&attr_classify_two="+encodeURI(encodeURI(attr_classify_two));
//          window.location.href=a; 
      $("#query").attr("href",a);
      
     });*/
     
     $("#query").click(function(){
       var attr_name=$("#attr_name").val();
       var a ="getAttrDescAction.action?attr_name="+encodeURI(encodeURI(attr_name));
      // $("#query").attr("href",a);
	  window.location.href=a;
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
