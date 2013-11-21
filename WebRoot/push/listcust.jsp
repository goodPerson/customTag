<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>目标客户选择</title>

      <meta http-equiv="pragma" content="no-cache">
      <meta http-equiv="cache-control" content="no-cache">
      <meta http-equiv="expires" content="0">
      <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
      <meta http-equiv="description" content="This is my page">
       <link rel="stylesheet" type="text/css" href="css/themes/gray/easyui.css">
      <link rel="stylesheet" type="text/css" href="css/themes/icon.css">
      <script type="text/javascript" src="<%=basePath%>js/jquery-1.8.1.min.js"></script>
      <script type="text/javascript" src="<%=basePath%>js/jquery.easyui.min.js"></script>
      <script type="text/javascript" src="<%=basePath%>js/easyui-lang-zh_CN.js"></script></head>
  <style type="text/css">
* {
			font-family: "微软雅黑";
			font-size: 10pt;
		}
		
 body {
			width: 100%;
			margin: 0 auto;
			text-align: center;			
			overflow-x: hidden;
			overflow-y: auto ;			
		}
 #searchdiv{margin-top:10px;}
 #searchdiv a{ display:block; width:40px; height:23px; text-align:center; font-size:10pt; line-height:23px;}			
 #searchdiv a:link{text-decoration:none ; background:#094AB2; color:#FFF ;}
 #searchdiv a:visited {text-decoration:none ; background:#094AB2; color:#FFF ;}
 #searchdiv a:hover {text-decoration:none ; background:#03F; color:#FFF ;}
 #searchdiv a:active {text-decoration:none ;background:#03e; color:#FFF ;}
  </style>		  
  <body>
    <div id="searchdiv">
     <label>类型选择：</label>
    <select id="slt_type" class="easyui-combobox" panelHeight="auto" style="width:150px;">    
		 <option value="tag_list">标签用户清单</option>
	     <option value="group_list">客户群用户清单</option>   
	 </select>
	 <a id="serch_bt" href="javascript:void(0)" hidefocus="true" style="display:inline;">搜索</a>
	 </div>
    <div style="margin-top:15px;">
    <div id="datagrid" style="margin:20px 20px;position: absolute; right:5px;" ></div>
    </div>
 <script type="text/javascript">
 $(function () {
    var bodywidth=$(document.body).width();
     var bodylength=$(document.body).height();
    $('#datagrid').datagrid({
       url:"plancustlist.action",
       queryParams:{type:"tag_list"},
       height: 350,
       width:700,
       title : '目标客户清单',
       pagination:true,
       singleSelect:true,
       rownumbers:true,
       fitColumns:true,
       columns : [ [  {
				field : 'filename',
				title : '清单名称',
				width: 200,
				align : 'left'
			}, {
				field : 'id',
				title : 'id',
				width: 100,
				align : 'center',
				hidden:true
			}, {
				field : 'time',
				title : '创建时间',
				width: 120,
				align : 'center'
			}, {
				field : 'type',
				title : '清单类型',
				width: 100,
				align : 'left'
			}, {
				field : 'count',
				title : '人数（人）',
				width: 100,
				align : 'center'
			}, {
				field : 'region',
				title : '归属地域',
				width: 170,
				align : 'center'
			}] ],
			onClickRow:function(rowIndex, rowData){
			var id=rowData.id;
			var name=rowData.filename;
			var E_type="";
			var type=rowData.type;
			if(type=='标签清单'){
			   E_type="TAG";
			}else{
			   E_type="GROUP";
			}
	            window.opener.$("#input_cust").attr("value1",E_type);
	            window.opener.$("#input_cust").attr("title",id);
	            window.opener.$("#input_cust").attr("value",name);
	            window.opener.$('#datagrid').datagrid({
			       url:"selectedcustlist.action",
			       queryParams:{custid:id,custname:name}
		        });
	            window.close(); 
			}
			});
		var p = $('#datagrid').datagrid('getPager');
		$(p).pagination({
			pageSize : 10, 
			pageList : [10,15,20]  
		});
	  
	  $("#serch_bt").click(function(){
	      var type=$("#slt_type").combobox("getValue");
	      //alert(type);
	      $("#datagrid").datagrid('load',{
	          type:type
	      }
	      );
	  });
 
 })
 </script>
  </body>
</html>
