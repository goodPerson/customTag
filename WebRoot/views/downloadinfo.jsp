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
	* {
	font-family: "微软雅黑";
	font-size: 10pt;
	}
	html {
	height: 100%;
	overflow-x: auto;
	overflow-y: auto;
	}
	body {
	height: 100%;
	width: 100%;
	font: 10pt "微软雅黑";
	margin: 0px auto;
	background:#FFF;
	overflow-x: hidden;
	overflow-y: auto;
	text-align:center;
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
	#wait_div{
	margin:0;
	width: 100%;
	height:100%;
	position: absolute;
	top:0px;
	left:0px;
	display:none;
	background:#666;
	filter:alpha(opacity:80);
	z-index:2;
	opacity:0.8;
	}
	#wait_div1 {
	margin:0;
	width: 400px;
	height:300px;
	position: absolute;
	top:100px;
	left:550px;
	display:none;
	background:#FFF;
	z-index:3;
	}
	
	#treasury{
	background:#094AB2;
	height:30px;
	color:#FFF;
	padding-left:20px;
	text-align:left;
	line-height:30px;
	}
	.buttons{
	display: block;
	background: #03F;
	width: 80px;
	height: 28px;
	text-align: center;
	font-size: 10pt;
	line-height: 28px;
	color:#FFFFFF;
	}
	</style>
	<body>
		<!-- <div id="wait_div" class="wait_div" >-->
		<div id="wait_div"></div>
		<div id="wait_div1">
			<div id="treasury">金库短信验证</div>
			<div style="text-align:left; padding-left:20px; margin-top:5px;">
				<input type="" id="downFilePath" value="">
				<div style="padding-left:20px;">
					<div id="radiolist">
					</div>
					<div id="div_dowreason" style="margin-top:30px;">
						下载原因：<input type="text" name="treasuny_downreason"   id="treasuny_downreason" size="20"/>
					</div>
					<div id="veri_code" style="margin-top:30px;">
						验证码：<input id="treasuny_pin"  type="text" name="treasuny_pin" size="10"/><span id="pin_code"></span>
					</div>
					<div style="margin-top:30px; text-align:center;">
						<div id="submits" class="buttons"  style="cursor:hand;">提交</div>
						<div id="sure" class="buttons" style="cursor:hand;">确定</div>
						
					</div>
				</div>
				
			</div>
		</div>
		<div>
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
								<td style="color:#030;" width="10%">下载原因</td>
								<td style="color:#030;" width="10%"  align="center">操作</td>
							</tr>
							<s:iterator  value="listDown"   var="DownloadInfo">
							<tr>
								<td style="color:#666;display:none;"><s:property value="id" /></td>
								<td style="color:#666" width="15%"><s:property value="file_name" /></td>
								<td style="color:#666" width="10%"><s:property value="%{create_time.substring(0,4)}" />年<s:property value="%{create_time.substring(4,6)}" />月<s:property value="%{create_time.substring(6,8)}" />日</td>
								<td style="color:#666" width="10%"><s:property value="file_type" /></td>
								<td style="color:#666" width="10%"><s:property value="count" />人</td>
								<td style="color:#666;" width="10%"><s:property value="region_name" /></td>
								<!--  	<td style="color:#666;" width="10%" ><s:property value="status" /></td> -->
								<td style="color:#666" width="10%"> <s:property value="manager" /></td>
								<td style="color:#666" width="10%"><div class="downloadreason" title="<s:property value='downLoadReason'/>"><s:property value='downLoadReason'/></div></td>
								<s:if test="%{#DownloadInfo['custlist_path']=='none'}" >
								<!--<td style="color:#666 ">文件生成中</td>-->
									<td align="center"> <div><img src="./img/load/load.jpg" width="20" height="20"   align="absmiddle" /></div></td>
								</s:if>
								<s:else>
								<td  style="color:#666 " align="center">
									<s:if test='%{downLoadReason.trim()!=""}'>
									<!-- <a  href="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/<s:property value='custlist_path'/>" >下载</a> -->
									 <span class="downFile">下载</span> <input type="hidden" value="<s:property value='custlist_path'/>"/>
									<a href="delShow.action?createTime=<s:property value='create_time'/>"> 删除</a>
									<a href="<%=basePath%>entryplan_create.action?filename=<s:property value='file_name'/>&id=<s:property value='id'/>&filetype=<s:property value='file_type'/>" id="myplan"> 活动</a>
									</s:if>
									<s:else>
									<a href="requestDownReason.action?userId=<s:property value='manager_id'/>&createTime=<s:property value='create_time'/>" > 填写原因</a>
									</s:else>
									<!-- <a class="href" href="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/${DownloadInfo['custlist_path']}" >下载</a>  -->
									<!--<a  href="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/<s:property value='custlist_path'/>">下载</a>-->
								</td>
								</s:else>
							
						</tr>
						</s:iterator>
						<tr>
							<td colspan="8" align="center">
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
								</s:else>
								<s:if test="%{pageNo==pageCounts}">
								下一页 &nbsp;
								尾页 &nbsp;
								</s:if>
								<s:else>
								<a href="javaScript:void(0)"  id="next" >下一页</a>&nbsp;
								<a href="javaScript:void(0)"  id="tail" >尾页</a>&nbsp;
								</s:else>
								当前 <s:property value="pageNo"/> 页 ， 共 <s:property value="totalRecords"/> 条记录 ，共计 <s:property value="pageCounts"/> 页  
								<input id="TreasuryIds" type="hidden" value=""/>
							</td>
						</tr>
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
	</div>
	<script type="text/javascript">
	var sessionUserId="<s:property value='#session.userId'/>";
	$(function(){
		//alert(sessionUserId);
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
	var page1                      =$("#page1").val();
	var page2                      =$("#page2").val();
	var page3                      =$("#page3").val();
	var page4                      =$("#page4").val();
	var hrefFy="querydown.action?userId=<s:property value='#session.userId'/>";
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
	$(".downFile").click(function(){	
		var  donURLapp=$(this).parent().find("input").val();
		$("#downFilePath").val(donURLapp);
                          var  treReq=treasuryRequest().split("::");
/*		*/

		
	});
	var treasure_flag="";  //短信验证标志
	if (treasure_flag==""){
		$("#sure").css("display","none");
			$("#veri_code").css("display","none");
	}
	$("#submits").click(function(){
		//var joniuser=$('input[name="joniuser"]').attr("checked");
		var joniuser=$('input:radio[name="joniuser"]:checked').val();
		if (joniuser==null) {
			alert("请选择协同人");
			return;
		};
		$("#sure").css("display","block");
			$("#veri_code").css("display","block");
		$("#submits").css("display","none");
			$("#div_dowreason").css("display","none");
		$("#radiolist").hide();
		treasuryAuthInit();
		
	});
	$("#sure").click(function(){
		var treasuny_pin=$("#treasuny_pin").val();
		if (treasuny_pin=="") {
			alert("验证码不能为空");
			return;
		};
		if (treasuny_pin!=$("#pin_code").text().Trim()){
			alert("验证码错误");
			return;
		};
		$("#wait_div").hide();
		$("#wait_div1").hide();
		downLoadUrl();

	});
		});
		function treasuryRequest(){
			            var returnFlag="";
			            var TreasuryId="";
				var tName='客户标签数据下载';
							tName = encodeURI(tName);
						$.ajax({
							url:'<%=request.getContextPath()%>/treasury_treasuryRequest.action',
							type:'post',
							data:{
								busCode:'117000',
								sceneId:'140000',//场景ID
								applyMaster:sessionUserId,//主账号4A
								tName:tName
							},
							dataType:'json',
							async: false,
							success:function(jsonObj){
								if (jsonObj.ResultCode==0) {
									showPage();  //显示扁平化

									$.each(jsonObj,function(key,value){
									//alert(key+value);
									if (key=="TreasuryId") {
										$("#TreasuryIds").val(value);
										TreasuryId=value;
									};
									if (key=="JointUsers") {
											var str="协同人：</br>";
											$.each(value,function(key1,value1){
												//alert("key1"+key1+";"+"Account"+value1.Account+" 	"+"RealName"+value1.RealName);
												str+="<input type=\"radio\" name=\"joniuser\" value='"+ value1.Account +"'/> "+ value1.RealName +"</br>"
																		
											});
											$("#radiolist").html(str);
									};
									returnFlag="0";
																							});
								}else if (jsonObj.ResultCode==1000) {
									alert("金库有效");
										if ($("#downFilePath").val()!="none") {
									            		var downUrl="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/"+$("#downFilePath").val();
											window.location.href=downUrl;
										};
									returnFlag="1000";
								}else if (jsonObj.ResultCode==9999) {
									alert("启动应急");
										if ($("#downFilePath").val()!="none") {
									            		var downUrl="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/"+$("#downFilePath").val();
											window.location.href=downUrl;
										};									returnFlag="9999";
								}else{
									alert("申请失败");
									returnFlag="reqerror";
								}
							},
							error:function(){
									
							}
						});
				return returnFlag+"::"+TreasuryId;
			}
		//获取显示标志
		function showPage(){
				document.getElementById("wait_div").style.display="block";
				document.getElementById("wait_div").style.filter="alpha(opacity=20)";
				$("#wait_div").show();
					$("#wait_div1").show();
		}
		//金库认证初始化
		function treasuryAuthInit(){
			var jointUser = $('input:radio[name="joniuser"]:checked').val();
			var treasuryId =$("#TreasuryIds").val(); 
			var applyReason=$("#treasuny_downreason").val();
				$.ajax({
				url:'<%=request.getContextPath()%>/treasury_treasuryAuthInit.action',
				type:'post',
				data:{
					busCode:'117000',
					sceneId:'140000',
					applyMaster:sessionUserId,
					jointUser:jointUser,
					treasuryId:treasuryId,
					applyReason:applyReason,
					authType:'1'
				},
				success:function(){
					treasuryAuth();   //金库认证
				},
				errot:function(){
				}
			})
		}
		//短信认证
		function treasuryAuth(){
			var random=GetRandomNum(1000,9999);
			var jointUser = $('input:radio[name="joniuser"]:checked').val()+"::"+random;
			var treasuryId =$("#TreasuryIds").val();   
			$.ajax({
				url:'<%=request.getContextPath()%>/treasury_treasuryAuth.action',
				type:'post',
				async:false,
				data:{
					busCode:'117000',
					sceneId:'140000',
					applyMaster:sessionUserId,
					jointUserValue : jointUser,
					treasuryId:treasuryId,
					authType:'1'
				},
				success:function(data){
					// alert(data);
					$("#pin_code").text(random);
				},
				error:function(){
					alert("认证失败");
				}
			})
		}

		//下载地址
		function downLoadUrl(){
			if ($("#downFilePath").val()!="none") {
			            if (treasuryRequest().split("::")[0]!="reqerror") {
			            		var downUrl="http://www.hebmcbass.com/customTag/views/loadFile.jsp?url=/app1/file/khbq/"+$("#downFilePath").val();
					window.location.href=downUrl;
			            };
			};
		}
		//a去空格
		String.prototype.Trim = function()
		{
		return this.replace(/(^\s*)|(\s*$)/g, "");
		}
		//随机数
		function GetRandomNum(Min,Max)
		{
		var Range = Max - Min;
		var Rand = Math.random();
		return(Min + Math.round(Rand * Range));
		}
	</script>
</body>

</html>