<% /**渠道新发展通话五次以下用户明细*/%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK" %>
<%@ page import="com.miapsoft.viewquery.pojo.UserInfo" %>
<%@include file="/WEB-INF/content/common/tag.jsp" %>
<%UserInfo userInfo = (UserInfo)session.getAttribute("userInfo"); %>
<html>
  <head>
  	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/themes/liferay/classic/css/main.css" />
 	
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js//grid/gt_grid.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/grid/skin/vista/skinstyle.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/grid/skin/pink/skinstyle.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/grid/skin/mac/skinstyle.css" />
  	<script type="text/javascript" src="<%=request.getContextPath() %>/js/grid/gt_msg_en.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/grid/gt_grid_all.js"></script> 
	<script type="text/javascript" src="<c:url value="/js/meizzDate.js"/>"></script>
			<style  type="text/css">
			table {
				border:solid 1px #97A6BD; 
			}
			table tr td{
				border:solid 1px #97A6BD; 
				text-align:center;
			}
			.mybutton-cls { 
        		background : url(<%=request.getContextPath()%>/js/grid/skin/default/images/tool_xls.gif) no-repeat center center; 
			}
		</style>
			
	<script type="text/javascript">
		    
		var loadurl = "initQhdRptChnlCall5BelowSubsDetlD.action?statisDate=${statisDate}&regionId=${regionId}";
		var exporturl = "exportQhdRptChnlCall5BelowSubsDetlD.xls?statisDate=${statisDate}&regionId=${regionId}";
		var grid_demo_id = "myGrid1" ;

		var dsOption = {
				
				fields : [
						{name:'statisDate'			, type:'string'		, index:'statisDate'		},
						{name:'regionName'			, type:'string'		, index:'regionName'		},
						{name:'phoneNo'				, type:'string'		, index:'phoneNo'		},
						{name:'checkinTime'			, type:'string'		, index:'checkinTime'		},
						{name:'checkinChnlId'		, type:'string'		, index:'checkinChnlId'		},
						{name:'checkinChnlName'		, type:'string'		, index:'checkinChnlName'		},
						{name:'checkinChnlType'		, type:'string'		, index:'checkinChnlType'		},
						{name:'monExpCurDayCommCnt'	, type:'string'		, index:'monExpCurDayCommCnt'		}
				]
		};

		var colsOption = [
						{name:'statisDate'			, header:'statisDate'			, fieldName:'statisDate'			,width:'80',sortable:false},
						{name:'regionName'			, header:'regionName'			, fieldName:'regionName'			,width:'60',sortable:false},
						{name:'phoneNo'				, header:'phoneNo'				, fieldName:'phoneNo'			,width:'90',sortable:false},
						{name:'checkinTime'			, header:'checkinTime'			, fieldName:'checkinTime'			,width:'80',sortable:false},
						{name:'checkinChnlId'		, header:'checkinChnlId'		, fieldName:'checkinChnlId'			,width:'90',sortable:false},
						{name:'checkinChnlName'		, header:'checkinChnlName'		, fieldName:'checkinChnlName'			,width:'160',sortable:false},
						{name:'checkinChnlType'		, header:'checkinChnlType'		, fieldName:'checkinChnlType'			,width:'100',sortable:false},
						{name:'monExpCurDayCommCnt'	, header:'monExpCurDayCommCnt'	, fieldName:'monExpCurDayCommCnt'			,width:'140',sortable:false}
						];
		Sigma.ToolFactroy.register(
	   		    'mybutton',  
	   		    {
	   		        cls : 'mybutton-cls',  
	   		        toolTip : '导出',
	   		        action : function(event,grid) {  beforeExport();  }
	   		    }
	   		);
      	var gridOption={
      			id : grid_demo_id,
      			width: '100%', 
      			height: '100%',  	
      			container : 'gridbox', 
      			loadURL : loadurl,
      			exportURL : exporturl,
      			dataset : dsOption ,
      			columns : colsOption ,
      			pageSizeList : [10,20,50,100],
      			customHead : 'myhead',
      			skin : 'vista',
      			stripeRows : true,//是否交替显示行颜色
      			remotePaging : true,
      			pageSize:20,
      			toolbarPosition : 'bottom',
      			toolbarContent : 'print | mybutton | pagesize | nav | goto | state',
      			showGridMenu : true,
      			allowCustomSkin	: false ,
      			allowGroup : true,
      			allowHide	: true,
      			allowGroup	: true
      		};
  		
		var mygrid = new Sigma.Grid( gridOption );
		Sigma.Util.onLoad( Sigma.Grid.render(mygrid) );

		function excuteQuery(){
			var regionIds = $("#regionId")[0].options;
			var regionId = "";
			var regionName = "";
			$.each(regionIds,function(){
	    		if($(this).attr("selected")==true){
	    			regionId += $(this).val()+",";
	    			regionName += $(this).attr("title")+",";
	    		}
    		});
    		if(regionId!=""){
    			regionId = regionId.substring(0,regionId.length-1);
    			regionName = regionName.substring(0,regionName.length-1);
    		}
    		
    		
			var statisDate = $("#statisDate").val();
			
    		if(statisDate=="" || null==statisDate){
				alert("请选择统计日期");
				return false;
        	}
    		
    		if(regionIds=="" || null == regionIds){
				alert("请选择地域");
				return false;
        	}
        	
    		return true;
	   	}

	   	function resetAll(){
			$("#statisDate").val("");
			$("select option").attr("selected",false);
		}
	</script>

  </head>
  
  <body style="text-align:center;">
  <div id="container">
  <div id="searchArean">
  	<form action="qhdRptChnlCall5BelowSubsDetlD.action" method="post" id="form1" name="form1" onsubmit="return excuteQuery();">
		<table width="99.8%">
				<tr>
					<td valign="middle" style="background-color:#DFEBF7;width:6%" align="center">
						<strong>统计日期</strong>
					</td>
					<td width="12%">
						<input type="text" size="15" style="height:22px;" readonly="readonly" id="statisDate" onclick="setday(this,null,'yyyymmdd');" name="statisDate" value="${statisDate}" />
					 </td>
					 <td valign="middle" style="background-color:#DFEBF7;width:6%" align="center">
					 	<strong>地域选择</strong>
					 </td>
					 <td width="12%">
						<select	id="regionId" name="regionId" size="4" multiple="multiple" style="width:90%">
							<c:forEach items="${regions}" var="region">
		           	  	  		<c:choose>
		           	  	  			<c:when test="${fn:indexOf(regionId,region.regionId)>=0 }">
		           	  	  				<option value="${region.regionId }" title="${region.regionName }" selected="selected">${region.regionName }</option>
		           	  				</c:when>
		           	  				<c:otherwise>
		           	  	  				<option value="${region.regionId }" title="${region.regionName }">${region.regionName }</option>
		           	  				</c:otherwise>
		           	  			</c:choose>
							</c:forEach>
						</select>
					</td>
					<td width="8%">
						<input type="hidden" id="userId" name="userId" value="${userId }">
						<input type="button" class="button" value="查 询" onclick="beforeQuery();"/> 
					</td>
					<td width="8%">
						<input type="button" class="button" value="重 置" onclick="resetAll();">
					</td>
				</tr>
		</table>
	</form>
  </div>


   <div id="gridbox" style="width:100%;height:370px;"></div>
  
    <table id="myhead" cellspacing="0" cellpadding="0" style="display:none">
    	<tr>
    		<td columnId="statisDate">统计日期</td>
    		<td columnId="regionName">地域标识</td>
    		<td columnId="phoneNo">电话号码</td>
    		<td columnId="checkinTime">入网时间</td>
    		<td columnId="checkinChnlId">入网渠道编码</td>
    		<td columnId="checkinChnlName">入网渠道名称</td>
    		<td columnId="checkinChnlType">入网渠道类型</td>
    		<td columnId="monExpCurDayCommCnt">月初截止当日通信次数</td>
    	</tr>
    </table>
	</div>
	
	<!-- 应用金库--> 
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/simplemodal/jquery.simplemodal.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/simplemodal/css/basic.css" />
	<div id="treasuryText" style="display:none;height:300px;width:300px;padding:45px 50px 7px 60px;font-size:12px;text-align:left;">
		正在请求应用金库，请稍等...
	</div>
	
	<!-- 下载链接 -->
	<a id="exportA" href="exportQhdRptChnlCall5BelowSubsDetlD.xls?statisDate=${statisDate}&regionId=${regionId}"></a>	
	<script type="text/javascript">
		var treasuryId ="";
		var treasuryAction = "";
		var treasuryUserInfo = ""
			
		
		function beforeQuery(){
			var flag = excuteQuery();
			if(flag){
				treasuryAction ="query";
				$("#treasuryText").modal();
				treasuryRequest();
				
			}
		}
		function beforeExport(){
			treasuryAction ="export";
			$("#treasuryText").modal();
			treasuryRequest();
		}
		function treasuryRequest(){
			var tName='渠道新发展通话五次以下用户明细';
			tName = encodeURI(tName);
			var appModule='渠道新发展通话五次以下用户明细';
			appModule = encodeURI(appModule);
			if(treasuryAction == "query"){
				var opText='<%=userInfo.getUser().getUserIdAccounts()%>查询了渠道新发展通话五次以下用户明细模块下的数据';
				opText = encodeURI(opText);
				}else if(treasuryAction =="export"){
					var opText='<%=userInfo.getUser().getUserIdAccounts()%>导出了渠道新发展通话五次以下用户明细模块下的数据';
					opText = encodeURI(opText);
				}

			var optObj='渠道新发展通话五次以下用户明细';
			optObj = encodeURI(optObj);
			var subUser='<%=userInfo.getUser().getUserIdAccounts()%>';
			subUser = encodeURI(subUser);   
					$.ajax({
						url:'<%=request.getContextPath()%>/treasuryRequest.action',
						type:'post',
						data:{
							busCode:'117000',
							sceneId:'110004',//场景ID
							applyMaster:'${masterId}',//主账号4A
							tName:tName
						},
						dataType:'json',
						success:function(jsonObj){
							if("off"==jsonObj.result){
								$.modal.close();//关闭模式窗口
								if("export" == treasuryAction){
									document.getElementById("exportA").click();
								}else if("query" == treasuryAction){
									$("#form1").submit();
								}
							}else if("1111"==jsonObj.result){
								$.ajax({
									url:'<%=request.getContextPath()%>/insertType.action',
									type:'post',
									data:{
										treasuryId:treasuryId,
										busCode:'117000',
										sceneId:'110004',
										logType:'2',
										logTime : '',
										subUser : subUser,
										status:'1',
										app : 'BASS',
										sip : '<%=request.getLocalAddr()%>',
										appModule : appModule,
										opType : 'View',
										opText : opText,
										ticket : '',
										optObj : optObj,
										logLevel : '1',
										masterAcc : '${masterId}'
									
									},
									success:function(tb){
										$.modal.close();//关闭模式窗口
										if("export" == treasuryAction){
											document.getElementById("exportA").click();
										}else if("query" == treasuryAction){
											$("#form1").submit();
										}
									},
									error:function(){
										alert("数据库访问失败");
								 	}
								});     
							}else if("2222" == jsonObj.applyMaster){
                                       alert("4A账号没有配置，请联系4A管理员！");
								}else if("123"==jsonObj.usersInfo){
								        alert("当前场景（场景编码）未配置协同操作人，请联系4A管理进行配置！");
								}else if("9999"==jsonObj.resultCodeStr){//应急金库模式
								        $.ajax({
												url:'<%=request.getContextPath()%>/insertType.action',
												type:'post',
												data:{
													treasuryId:treasuryId,
													busCode:'117000',
													sceneId:'111005',
													logType:'2',
													logTime : '',
													subUser : subUser,
													status:'1',
													app : 'BASS',
													sip : '<%=request.getLocalAddr()%>',
													appModule : appModule,
													opType : 'View',
													opText : opText,
													ticket : '',
													optObj : optObj,
													logLevel : '1',
													masterAcc : '${masterId}'
												
												},
												success:function(tb){
													$.modal.close();//关闭模式窗口
													if("export" == treasuryAction){
														document.getElementById("exportA").click();
													}else if("query" == treasuryAction){
														$("#form1").submit();
													}
												},
												error:function(){
													alert("数据库访问失败");
											 	}
											});     
								}else{
								
								       if("0" == jsonObj.ResultCode){
									
										treasuryId = jsonObj.TreasuryId;
										var jointUsers = jsonObj.JointUsers;
										var text = "<div>认证方式：</div><div><input style='filter:alpha(opacity=50);' name='AuthType' id='duanxi' type='radio' value='1' checked='checked' onclick='gongdanElm();'/>短信<input  style='filter:alpha(opacity=50);'  name='AuthType' id='mima' type='radio' value='2' onclick='gongdanElm();'/>静态密码";//<input style='filter:alpha(opacity=50);' name='AuthType' id='gondan' type='radio' value='5' onclick='gongdanElm();'/>工单</div> 
										 text += "<div id='g' name='gond'>";
										text += "<div>协同人：</div>" ;
										text += "<div style='height:132px;overflow:auto;'>";
										for(var i=0;i<jointUsers.length;i++){
											text += "<div><input type='checkbox' style='filter:alpha(opacity=50);' class='button' id='"+jointUsers[i].Account+"' value='"+jointUsers[i].RealName+"' name='jointUsersChk'/>"+jointUsers[i].RealName+"</div>";
										}
										text += "</div>";
										
										text += "<div>操作原因：</div><input style='filter:alpha(opacity=50);' type='text' id='ApplyReason' />";
										text += "</div>";
										
										 text += "<div><button type='button' class='button' style='filter:alpha(opacity=50);' onclick='trea()'>提交</button></div>"
										   $("#treasuryText").html(text);
									
								}else if("1" == jsonObj.ResultCode){//不是金库模式
									 $.modal.close();//关闭模式窗口
										if("export" == treasuryAction){
											document.getElementById("exportA").click();
										}else if("query" == treasuryAction){
											$("#form1").submit();
										}
								}else if("1000" == jsonObj.ResultCode){
									$.ajax({
											url:'<%=request.getContextPath()%>/treasuryLog2.action',
											type:'post',
											data:{
												busCode:'117000',
												sceneId:'110004',
												logType:'1',
												subUser : subUser,
												status:'2',
												logTime : '',
												app : 'BASS',
												sip : '',
												appModule : appModule,
												opType : 'View',
												opText : opText,
												ticket : '',
												optObj : optObj,
												logLevel : '1',
												masterAcc : '${masterId}',
												treasuryId:treasuryId
											},
											success:function(responseString){
												$.modal.close();//关闭模式窗口
												if("export" == treasuryAction){
													document.getElementById("exportA").click();
												}else if("query" == treasuryAction){
													$("#form1").submit();
												}
											},
											error:function(){
												alert("请求失败！");
										 }
									}); 
							    }
						  }
						},
						error:function(){
								
								}
					}); 
			
		}


		function gongdanElm(){
               
	    	   var checkBoxGroup=document.getElementsByName("AuthType");
			   	var rvalue="";
	   			for(var i=0;i<checkBoxGroup.length;i++)
	   			{
				  if(checkBoxGroup[i].checked)
				   {
					 rvalue=checkBoxGroup[i].value;
					 if(rvalue=="5"){
							jQuery("div[name='gond']").each(function(){
								jQuery(this).css("display","none");
							});
						 }else{
							 jQuery("div[name='gond']").each(function(){
									jQuery(this).css("display","block");
								});
							 }
				   }
	   			}
	           }
		
		function trea(){//认证选择
		   var checkBoxGroup=document.getElementsByName("AuthType");
		   	var rvalue="";
   			for(var i=0;i<checkBoxGroup.length;i++)
   			{
			  if(checkBoxGroup[i].checked)
			   {
				 rvalue=checkBoxGroup[i].value;
				  var appModule='渠道新发展通话五次以下用户明细';
				appModule = encodeURI(appModule);
				if(treasuryAction == "query"){
					var opText='<%=userInfo.getUser().getUserIdAccounts()%>查询了渠道新发展通话五次以下用户明细模块下的数据';
					opText = encodeURI(opText);
					}else if(treasuryAction =="export"){
						var opText='<%=userInfo.getUser().getUserIdAccounts()%>导出了渠道新发展通话五次以下用户明细模块下的数据';
						opText = encodeURI(opText);
					}
	
				var optObj='渠道新发展通话五次以下用户明细';
				optObj = encodeURI(optObj);
				var subUser='<%=userInfo.getUser().getUserIdAccounts()%>';
				subUser = encodeURI(subUser);
		      if(rvalue=="2"){//静态密码
		       var jointUser = "";
		        var userInfo="";
			    var jointUsersInfo = document.getElementsByName("jointUsersChk");
			    for(var i=0;i<jointUsersInfo.length;i++){
					var temp = jointUsersInfo[i];
					if(temp.checked){
						userInfo += temp.id+"::"+temp.value;
						jointUser += temp.id;
					    userInfo += ";;";
				        jointUser += "::";
					}	
				}
				
				userInfo=userInfo.substring(0,userInfo.length-2);
			    treasuryUserInfo = userInfo;
			    
			    if(jointUser == ""){
					alert("请选择协同人！");
					return;
				}
				var applyReason = $("#ApplyReason").val();
				$("#treasuryText").attr("JointUser",jointUser);
				var userInfo = treasuryUserInfo.split(";;");
							var text = "请输入协同人验证信息：<br/><div style='height:170px;overflow:auto;'>";
							var userInfo = treasuryUserInfo.split(";;");
							for(var i=0;i<userInfo.length;i++){
								var temp = userInfo[i].split("::");
								var uId = temp[0];
								text += "</br>"+temp[1];
								text += "</br><input style='filter:alpha(opacity=50);' id='"+uId+"' name='JointUserValue' type='password'/>";
							}
							text += "</div></br>";
							text +="<button type='button' class='button' style='filter:alpha(opacity=50);' onclick='treasuryAuth2()'>提交</button>";
							$("#treasuryText").html(text);
				var jointUserValue = "";
				var jointuv = document.getElementsByName('JointUserValue');
				for(var i=0;i<jointuv.length;i++){
					var uid = jointuv[i].id;
					var uval = jointuv[i].value;
					jointUserValue += uid+"::"+uval;
					if(i!=jointuv.length){
						jointUserValue +=";;";
					}
				}
		    	 
			}else if(rvalue=="1"){//短信认证
				
			    var userInfo="";
			    var jointUser = "";
			    var jointUsersInfo = document.getElementsByName("jointUsersChk");
			    for(var i=0;i<jointUsersInfo.length;i++){
					var temp = jointUsersInfo[i];
					if(temp.checked){
						userInfo += temp.id+"::"+temp.value;
						jointUser += temp.id;
							userInfo += ";;";
							jointUser += "::";
					}	
				}
				userInfo=userInfo.substring(0,userInfo.length-2);
			    treasuryUserInfo = userInfo;
			    
			    if(jointUser == ""){
					alert("请选择协同人！");
					return;
				}
				var applyReason = $("#ApplyReason").val();
				$("#treasuryText").attr("JointUser",jointUser);
				
				$.ajax({
					url:'<%=request.getContextPath()%>/treasuryAuthInit.action',
					type:'post',
					data:{
						busCode:'117000',
						sceneId:'110004',
						applyMaster:'${masterId}',
						jointUser:jointUser,
						treasuryId:treasuryId,
						applyReason:applyReason,
						authType:'1'
					},
					success:function(responseString){
						if("0" == responseString){
							var text = "请输入协同人验证信息：<br/><div style='height:170px;overflow:auto;'>"
							var userInfo = treasuryUserInfo.split(";;");
							for(var i=0;i<userInfo.length;i++){
								var temp = userInfo[i].split("::");
								var uId = temp[0];
								text += "</br>"+temp[1];
								text += "</br><input style='filter:alpha(opacity=50);' id='"+uId+"' name='JointUserValue' type='text'/>";
							}
							text += "</div></br><button type='button' class='button' style='filter:alpha(opacity=50);' onclick='treasuryAuth()'>提交</button>"
							$("#treasuryText").html(text);
						}else if("1" == responseString){
							alert("认证初始化失败！");
						}else if("1000" == responseString){
									$.ajax({
										url:'<%=request.getContextPath()%>/treasuryLog2.action',
										type:'post',
										data:{
											busCode:'117000',
											sceneId:'110004',
											logType:'1',
											subUser : subUser,
											status:'2',
											logTime : '',
											app : 'BASS',
											sip : '',
											appModule : appModule,
											opType : 'View',
											opText : opText,
											ticket : '',
											optObj : optObj,
											logLevel : '1',
											masterAcc : '${masterId}',
											treasuryId:treasuryId
										},
										success:function(responseString){
											$.modal.close();//关闭模式窗口
											if("export" == treasuryAction){
												document.getElementById("exportA").click();
											}else if("query" == treasuryAction){
												$("#form1").submit();
											}
										},
										error:function(){
											alert("请求失败！");
									 }
								}); 
							}
					},
					error:function(){
						alert("请求失败！");
					}
				});
			  }else	if(rvalue=="5"){
				
				    $.ajax({
						url:'<%=request.getContextPath()%>/getWorkOrderList.action',
						type:'post',
						data:{
							busCode:'117000',
							sceneId:'110004',
							applyMaster:'${masterId}'

						},
						dataType:'json',
						success:function(jsonObj){
							if("0" == jsonObj.ResultCode){
								
								var  orderList= jsonObj.OrderList;
								var text = "<div>";
								text += "<div>工单列表：</div>";
								text += "<div style='height:170px;'>";
								
								for(var i=0;i<orderList.length;i++){
									text +="<input style='filter:alpha(opacity=50);' type='checkbox' id='"+orderList[i].Orderid+"' value='"+orderList[i].OrderName+"' name='jointOrdersChk'/>"+orderList[i].OrderName+"</div>";
									}
								
								text += "</div>";
											text += "</br><button type='button' class='button' style='filter:alpha(opacity=50);' onclick='getValidateOrder()'>提交</button>"
											$("#treasuryText").html(text);
								
							}else if("1" == jsonObj.ResultCode){
								alert("认证初始化失败！");
							}else if("1000" == jsonObj.ResultCode){
										$.ajax({
										url:'<%=request.getContextPath()%>/treasuryLog2.action',
										type:'post',
										data:{
											busCode:'117000',
											sceneId:'110004',
											logType:'1',
											subUser : subUser,
											status:'2',
											logTime : '',
											app : 'BASS',
											sip : '',
											appModule : appModule,
											opType : 'View',
											opText : opText,
											ticket : '',
											optObj : optObj,
											logLevel : '1',
											masterAcc : '${masterId}',
											treasuryId:treasuryId
										},
										success:function(responseString){
											$.modal.close();//关闭模式窗口
											if("export" == treasuryAction){
												document.getElementById("exportA").click();
											}else if("query" == treasuryAction){
												$("#form1").submit();
											}
										},
										error:function(){
											alert("请求失败！");
									 }
								}); 
							}
						},
						error:function(){
							alert("请求失败！");
					 }
					});   
				}	
		  }
   	   }
	}
		
		function treasuryAuth(){//短信认证
			var jointUserValue = "";
			var jointuv = document.getElementsByName('JointUserValue');
			for(var i=0;i<jointuv.length;i++){
				var uid = jointuv[i].id;
				var uval = jointuv[i].value;
				if(uval == ""){
					alert("请填写协同人验证信息！");
					return;
				}
				var validateObj = /^[A-Za-z0-9]+$/;
				if(!validateObj.test(uval)){
					alert("验证信息只能为字母或数字！");
					return;
				}
				
				jointUserValue += uid+"::"+uval;
				if(i!=jointuv.length){
					jointUserValue +=";;";
				}
			}
			      var appModule='渠道新发展通话五次以下用户明细';
				appModule = encodeURI(appModule);
				if(treasuryAction == "query"){
					var opText='<%=userInfo.getUser().getUserIdAccounts()%>查询了渠道新发展通话五次以下用户明细模块下的数据';
					opText = encodeURI(opText);
					}else if(treasuryAction =="export"){
						var opText='<%=userInfo.getUser().getUserIdAccounts()%>导出了渠道新发展通话五次以下用户明细模块下的数据';
						opText = encodeURI(opText);
					}
	
				var optObj='渠道新发展通话五次以下用户明细';
				optObj = encodeURI(optObj);
				var subUser='<%=userInfo.getUser().getUserIdAccounts()%>';
				subUser = encodeURI(subUser);  
			$.ajax({
				url:'<%=request.getContextPath()%>/treasuryAuth.action',
				type:'post',
				data:{
					busCode:'117000',
					sceneId:'110004',
					applyMaster:'${masterId}',
					jointUserValue : jointUserValue,
					treasuryId:treasuryId,
					authType:'1'
				},
				success:function(responseString){
					if("0" == responseString){
						alert("认证成功！");
						$.modal.close();//关闭模式窗口
						if("export" == treasuryAction){
							document.getElementById("exportA").click();
						}else if("query" == treasuryAction){
							$("#form1").submit();
						}
						
					}else if("9999"==jsonObj.resultCodeStr){//应急金库模式
								        $.ajax({
												url:'<%=request.getContextPath()%>/insertType.action',
												type:'post',
												data:{
													treasuryId:treasuryId,
													busCode:'117000',
													sceneId:'111005',
													logType:'2',
													logTime : '',
													subUser : subUser,
													status:'1',
													app : 'BASS',
													sip : '<%=request.getLocalAddr()%>',
													appModule : appModule,
													opType : 'View',
													opText : opText,
													ticket : '',
													optObj : optObj,
													logLevel : '1',
													masterAcc : '${masterId}'
												
												},
												success:function(tb){
													$.modal.close();//关闭模式窗口
													if("export" == treasuryAction){
														document.getElementById("exportA").click();
													}else if("query" == treasuryAction){
														$("#form1").submit();
													}
												},
												error:function(){
													alert("数据库访问失败");
											 	}
											});     
								}else if("1000" == responseString){
								$.ajax({
										url:'<%=request.getContextPath()%>/treasuryLog2.action',
										type:'post',
										data:{
											busCode:'117000',
											sceneId:'110004',
											logType:'1',
											subUser : subUser,
											status:'2',
											logTime : '',
											app : 'BASS',
											sip : '',
											appModule : appModule,
											opType : 'View',
											opText : opText,
											ticket : '',
											optObj : optObj,
											logLevel : '1',
											masterAcc : '${masterId}',
											treasuryId:treasuryId
										},
										success:function(responseString){
											$.modal.close();//关闭模式窗口
											if("export" == treasuryAction){
												document.getElementById("exportA").click();
											}else if("query" == treasuryAction){
												$("#form1").submit();
											}
										},
										error:function(){
											alert("请求失败！");
									 }
								}); 																
						}else if("1001" == responseString){
						      alert("认证超时最大阀值！");
						}else{
							alert("认证失败！");
							$.ajax({
								url:'<%=request.getContextPath()%>/treasuryLog.action',
								type:'post',
								data:{
									busCode:'117000',
									sceneId:'110004',
									logType:'2',
									subUser : subUser,
									status:'1',
									logTime : '',
									app : 'BASS',
									sip : '',
									appModule : appModule,
									opType : 'View',
									opText : opText,
									ticket : '',
									optObj : optObj,
									logLevel : '1',
									masterAcc : '${masterId}',
									treasuryId:treasuryId
								
								},
								success:function(responseString){
									
								},
								error:function(){
									alert("请求失败！");
							 }
							});
						}
				},
				error:function(){
					alert("请求失败！");
			 }
			});
			
		}
		function treasuryAuth2(){//静态密码认证
			var jointUserValue = "";
			var jointuv = document.getElementsByName('JointUserValue');
			for(var i=0;i<jointuv.length;i++){
				var uid = jointuv[i].id;
				var uval = jointuv[i].value;
				if(uval == ""){
					alert("请填写协同人验证信息！");
					return;
				}			
				jointUserValue += uid+"::"+uval;
				if(i!=jointuv.length){
					jointUserValue +=";;";
				}
			}
			       var appModule='渠道新发展通话五次以下用户明细';
					appModule = encodeURI(appModule);
					if(treasuryAction == "query"){
						var opText='<%=userInfo.getUser().getUserIdAccounts()%>查询了渠道新发展通话五次以下用户明细模块下的数据';
						opText = encodeURI(opText);
						}else if(treasuryAction =="export"){
							var opText='<%=userInfo.getUser().getUserIdAccounts()%>导出了渠道新发展通话五次以下用户明细模块下的数据';
							opText = encodeURI(opText);
						}
		
					var optObj='渠道新发展通话五次以下用户明细';
					optObj = encodeURI(optObj);
					var subUser='<%=userInfo.getUser().getUserIdAccounts()%>';
					subUser = encodeURI(subUser);
			$.ajax({
				url:'<%=request.getContextPath()%>/treasuryAuth.action',
				type:'post',
				data:{
					busCode:'117000',
					sceneId:'110004',
					applyMaster:'${masterId}',
					jointUserValue : jointUserValue,
					treasuryId:treasuryId,
					authType:'2'
				},
				success:function(responseString){
					if("0" == responseString){
						alert("认证成功！");
						$.modal.close();//关闭模式窗口
						if("export" == treasuryAction){
							document.getElementById("exportA").click();
						}else if("query" == treasuryAction){
							$("#form1").submit();
						}
						
					}else if("9999"==jsonObj.resultCodeStr){//应急金库模式
								        $.ajax({
												url:'<%=request.getContextPath()%>/insertType.action',
												type:'post',
												data:{
													treasuryId:treasuryId,
													busCode:'117000',
													sceneId:'111005',
													logType:'2',
													logTime : '',
													subUser : subUser,
													status:'1',
													app : 'BASS',
													sip : '<%=request.getLocalAddr()%>',
													appModule : appModule,
													opType : 'View',
													opText : opText,
													ticket : '',
													optObj : optObj,
													logLevel : '1',
													masterAcc : '${masterId}'
												
												},
												success:function(tb){
													$.modal.close();//关闭模式窗口
													if("export" == treasuryAction){
														document.getElementById("exportA").click();
													}else if("query" == treasuryAction){
														$("#form1").submit();
													}
												},
												error:function(){
													alert("数据库访问失败");
											 	}
											});     
								}else if("1000" == responseString){
						alert(responseString);
								$.ajax({
										url:'<%=request.getContextPath()%>/treasuryLog2.action',
										type:'post',
										data:{
											busCode:'117000',
											sceneId:'110004',
											logType:'1',
											subUser : subUser,
											status:'2',
											logTime : '',
											app : 'BASS',
											sip : '',
											appModule : appModule,
											opType : 'View',
											opText : opText,
											ticket : '',
											optObj : optObj,
											logLevel : '1',
											masterAcc : '${masterId}',
											treasuryId:treasuryId
										},
										success:function(responseString){
											$.modal.close();//关闭模式窗口
											if("export" == treasuryAction){
												document.getElementById("exportA").click();
											}else if("query" == treasuryAction){
												$("#form1").submit();
											}
										},
										error:function(){
											alert("请求失败！");
									 }
								}); 		
						}else if("1001" == responseString){
						      alert("认证超时最大阀值！");
						}else{
							alert(responseString);
						     	$.ajax({
										url:'<%=request.getContextPath()%>/treasuryLog.action',
										type:'post',
										data:{
											busCode:'117000',
											sceneId:'110004',
											logType:'2',
											subUser : subUser,
											status:'1',
											logTime : '',
											app : 'BASS',
											sip : '',
											appModule : appModule,
											opType : 'View',
											opText : opText,
											ticket : '',
											optObj : optObj,
											logLevel : '1',
											masterAcc : '${masterId}',
											treasuryId:treasuryId
										
									},
									success:function(responseString){
									},
									error:function(){
										alert("请求失败！");
								 }
							});
					}
				},
				error:function(){
					alert("请求失败！");
			 }
			});
			
		}

	function getValidateOrder(){
		var orderList = "";
		var jointuv = document.getElementsByName('jointOrdersChk');
		for(var i=0;i<jointuv.length;i++){
			var uid = jointuv[i].id;
			var uname =  jointuv[i].name;
			if(uid == ""){
				alert("请填写协同人工单号！");
				return;
			}	
			if(uname == ""){
				alert("请填写协同人工单名称！");
				return;
			}
					
			orderList += uid+"::"+uname;
			if(i!=jointuv.length){
				orderList +=";;";
			}
		}
		            var appModule='渠道新发展通话五次以下用户明细';
					appModule = encodeURI(appModule);
					if(treasuryAction == "query"){
						var opText='<%=userInfo.getUser().getUserIdAccounts()%>查询了渠道新发展通话五次以下用户明细模块下的数据';
						opText = encodeURI(opText);
						}else if(treasuryAction =="export"){
							var opText='<%=userInfo.getUser().getUserIdAccounts()%>导出了渠道新发展通话五次以下用户明细模块下的数据';
							opText = encodeURI(opText);
						}
		
					var optObj='渠道新发展通话五次以下用户明细';
					optObj = encodeURI(optObj);
					var subUser='<%=userInfo.getUser().getUserIdAccounts()%>';
					subUser = encodeURI(subUser);	
					var orderType ='单次工单';
					orderType = encodeURI(orderType);	
			$.ajax({
				url:'<%=request.getContextPath()%>/getValidateOrder.action',
				type:'post',
				data:{
					busCode:'117000',
					sceneId:'110004',
					orderType:orderType,
					orderid:'201201',
					applyMaster:'${masterId}'
				},
				success:function(responseString){
					if("0" == responseString){
						alert("认证成功！");
						$.modal.close();//关闭模式窗口
						if("export" == treasuryAction){
							document.getElementById("exportA").click();
						}else if("query" == treasuryAction){
							$("#form1").submit();
						}
						
					}else if("1000" == responseString){
						alert(responseString);
								$.ajax({
								url:'<%=request.getContextPath()%>/treasuryLog2.action',
								type:'post',
								data:{
									busCode:'117000',
									sceneId:'110004',
									logType:'1',
									subUser : subUser,
									status:'2',
									logTime : '',
									app : 'BASS',
									sip : '',
									appModule : appModule,
									opType : 'View',
									opText : opText,
									ticket : '',
									optObj : optObj,
									logLevel : '1',
									masterAcc : '${masterId}',
									treasuryId:treasuryId
								},
								success:function(responseString){
									$.modal.close();//关闭模式窗口
									if("export" == treasuryAction){
										document.getElementById("exportA").click();
									}else if("query" == treasuryAction){
										$("#form1").submit();
									}
								},
								error:function(){
									alert("请求失败！");
							 }
						}); 					
						}else{
							alert(responseString);
					     	$.ajax({
								url:'<%=request.getContextPath()%>/treasuryLog.action',
								type:'post',
								data:{
									busCode:'117000',
									sceneId:'110004',
									logType:'2',
									subUser : subUser,
									status:'1',
									logTime : '',
									app : 'BASS',
									sip : '',
									appModule : appModule,
									opType : 'View',
									opText : opText,
									ticket : '',
									optObj : optObj,
									logLevel : '1',
									masterAcc : '${masterId}',
									treasuryId:treasuryId
								
							},
							success:function(responseString){
							},
							error:function(){
								alert("请求失败！");
						    }
						});
					}
				},
				error:function(){
					alert("请求失败！");
			     }
			});
		}
		</script>
  </body>
</html>
