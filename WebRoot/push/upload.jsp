<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String plan_id=request.getParameter("plan_id");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upload.jsp' starting page</title>
    
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
	overflow-x: hidden;
	overflow-y: auto;
}
body {
	height: 100%;
	width: 1024px;
	text-align:center;
	margin:0px auto;
	font-family:"微软雅黑";
	font-size:15pt;
	background-color:#FFF;	
}
  
#import_div a{ display:block; width:40px; height:21px; text-align:center; font-size:10pt; line-height:21px;}			
#import_div a:link{text-decoration:none ; background:#094AB2; color:#FFF ;}
#import_div a:visited {text-decoration:none ; background:#094AB2; color:#FFF ;}
#import_div a:hover {text-decoration:none ; background:#03F; color:#FFF ;}
#import_div a:active {text-decoration:none ;background:#03e; color:#FFF ;}
  </style>
  
  <body>
   <div style="margin:0px 10px 10px 5px;valign:middle;height:30px;">
	  <label style="float:left;width:120px;">上传客户清单：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	  <div id="import_div" >
	  <form   method="post" id="form1" enctype="multipart/form-data" name="form1" >	 
	  <input type="file" id="file" name="file" style="border:1px solid #D3D3D3; width:200px;float:left;margin-left:0px;" onchange="filecheckmethod();">
	  <a href="javascript:void(0)" hidefocus="true" style="display:inline-block;margin-left:10px;float:left" id="import_buton">上传</a>	 
	   </form>
	   <label style="color: red;float:left;margin-left:15px;">*(注:支持上传txt文件，文件应在40M以内)</label>
	  </div>
	  </div>
  <fieldset style="height:150px;width:970px;border:1px solid #D3D3D3;float:left">
     <legend style="border:1px solid #D3D3D3;font-size:10pt">客户清单列表</legend>
      <div style="margin:10px 10px 10px 10px"><div id="datagrid" style="position: absolute; right:5px;" ></div></div>  
  </fieldset>
  <script type="text/javascript">
    $(function () {
  
   $("#import_buton").click(
       function(){
		   //window.parent.document.getElementById("gray").style.filter="alpha(opacity=20)";
		   //window.parent.$("#gray").show();
		   //window.parent.$("#load_div").show();
		   window.parent.$("#import_buton").click(); 
       });
       $("#datagrid").datagrid({
       url:"datagridjson.action",
       height: 100,
       pagination:false,
       rownumbers:true,
       fitColumns:true,
       columns : [ [  {
				field : 'creator',
				title : '上传人',
				width: 100,
				align : 'center'
			}, {
				field : 'filename',
				title : '客户清单名称',
				width: 100,
				align : 'center'
			}, {
				field : 'time',
				title : '上传时间',
				width: 100,
				align : 'center'
			}, {
				field : 'upload',
				title : '生成文件名称',
				width: 100,
				align : 'center',
				hidden:true
			},{
			   field : 'operate',
				title : '删除',
				width: 100,
				align : 'center'
			}] ],
             onLoadSuccess:function(){
			 window.parent.$("#gray").hide(); 
			 window.parent.$("#load_div").hide();
			}
			}); 
       });
     function filecheckmethod(){
				if($('#file').val()=="" || $('#file')==null){
					$.messager.alert('提示',"请输入要上传的文件!");
					return false;
				}
				
				var fileValue = $('#file').val();
				if(fileValue.substring(fileValue.length-4,fileValue.length)!=".txt" && fileValue.substring(fileValue.length-4,fileValue.length)!=".TXT"){
					fileValue = "";
					$.messager.alert('提示',"请选择以'.txt'结尾的文件");
					return false;
				}
				
				
			};
			
			
            function Delfile(){
                $.messager.confirm('提示', '您确认删除这条记录么?', function(r){
                    if (r) {
                        var selectRow = $("#datagrid").datagrid('getSelected');//获取选中行
                        var upload = selectRow.upload;
                        
                      $.ajax({
                            url: 'delfileAction.action',
                            data:{upload:upload},
                            type: "POST",
                            dataType: 'text',
                            success: function(msg){
                                //重新加载数据
                                $("#datagrid").datagrid('reload');
                                 alert( '删除成功');
                            }
                        });
                    }
                });
            };
       
  
  </script> 
  </body>
</html>
