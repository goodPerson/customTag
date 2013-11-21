<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户标签Home</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/home.css"/>
<!--<link rel="stylesheet" type="text/css" href="../css/home.css" />-->
<script type="text/javascript" src="<%=path %>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/home.js"></script>
<style>
body{
	font-family:"微软雅黑";
	text-align:center;
	background-color:#E5ECF2; margin:0px auto;
	overflow-x : hidden;   
	overflow-y: auto; 
	}
</style>
</head>

<body>
<!--image begin-->
<div id="image_extends" align="center">
    <div id="image" align="center">
        <span id="image_content">客户标签是对各类客户属性、特征、行为的认知结果，反映客户的需求和偏好，主要包括客户身份标签、内容偏好标签、流量标签、终端信息标签、基础信息标签等。</span>
    </div>
</div>

<!--image end-->

<!--module begin-->
<div id="module" styel="">
	<div id="quick_entry">
    	<div id="quick_entry_top">
        	<div id="quick_entry_logo"></div> <div id="quick_entry_name">快捷入口</div>
            <div class="split" style="height:15px;"></div>
            <!--圆角矩形 begin-->
                <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
                <div class="b d1">
                	<div id="tag_lib" class="quick_column"  style="background-image:url(./img/tag_lib.png)">
                    	<div class="quick_column_name">标签库</div>
                    </div>
                    <div id="group_find" class="quick_column"  style="background-image:url(./img/group_find.png)">
                    	<div class="quick_column_name">我的群</div>
                    </div>
                    <div id="tag_counts"  class="quick_column"  style="background-image:url(./img/tag_counts.png)">
                    	<div class="quick_column_name">标签统计</div>
                    </div>
                    <div id="tag_create" class="quick_column"  style="background-image:url(./img/tag_create.png)">
                    	<div class="quick_column_name">标签申请</div>
                    </div>
                    <div id="group_create" class="quick_column"  style="background-image:url(./img/group_create.png)">
                    	<div class="quick_column_name">创建群</div>
                    </div>
                    <div id="property_find" class="quick_column"  style="background-image:url(./img/property_find.png)">
                    	<div class="quick_column_name">属性查询</div>
                    </div>
                    <div id="tag_approval" class="quick_column"  style="background-image:url(./img/tag_arrpoval.png)">
                    	<div class="quick_column_name">标签审批</div>
                    </div>
                    <div id="share_group" class="quick_column"  style="background-image:url(./img/group_share.png)">
                    	<div class="quick_column_name">共享群</div>
                    </div>
                    <div id="down_find" class="quick_column"  style="background-image:url(./img/down_find.png)">
                    	<div class="quick_column_name">下载查询</div>
                    </div>
                    <div class="split" style="height:15px;"></div>                  
                    
                </div>
                <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
		   <!--圆角矩形 end-->
        </div>    	
    </div>
    <div id="first_order">
        <!-- 月城市统计-->
        <div id="city_sort_month">
            <div id="city_sort_top">
                <div id="city_sort_logo"></div>
                <div id="city_sort_name">地市排行</div>
                <div class="sort_date">月份：<s:property value="areaMonth"/></div>
            </div>
            <div class="split" style="height:15px;"></div>    
            <!--圆角矩形 begin-->
                    <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
                    <div class="b d1"  style="height:348px;">
                       <div class="city_sort_property_top">
                        <span class="city_sort_property_name" style="margin-left:10px;">排名</span>
                        <span class="city_sort_property_name" style="margin-left:10px;">地&nbsp;市&nbsp;名&nbsp;称</span>
                        <span class="city_sort_property_name" style="margin-left:40px;">使用次数</span>
                       </div>
                         <div class="split" style="height:12px;"></div>          
                         <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:iterator value="listOrderM"  id="lorder"  status="l" >
                                <tr>
                                    <td width="18%">
                                        
                                            <s:if test="%{#l.index+1<4}">
                                                <div class="sort_top" ><s:property value="#l.index+1" /></div>
                                            </s:if>
                                            <s:else>
                                                <div class="sort_next" ><s:property value="#l.index+1" /></div>
                                            </s:else>
                                     
                                    </td>
                                    <td class="sort_property_content" style="color:#0649B1;" width="57%"><s:property value="#lorder.orderName" /></td>
                                    <td width="25%" class="sort_property_content" style=" color:#000;">
                                    	<s:property value="#lorder.sameMonthCount" /> 
                                         <s:if test="%{sameMonthCount>beforeMonthCount}">
                                            <img src="./img/up.png" width="7" height="8"/>
                                         </s:if>
                                         <s:else>
                                            <img src="./img/down.png" width="7" height="8"/>
                                         </s:else>
                                    </td>
                                </tr>
                             </s:iterator>  
                         </table>                                                                       
                    </div>
                    <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
               <!--圆角矩形 end-->            
        </div>
         <!--月标签排行-->
		<div id="tag_sort_month" >
            <div id="tag_sort_top">
                <div id="tag_sort_logo"></div>
                <div id="tag_sort_name">标签排行</div> <div class="sort_date">月份：<s:property value="tagMonth"/></div>
            </div>
            <div class="split" style="height:15px;"></div>  
            <!--圆角矩形 begin-->
            <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
            <div class="b d1"  style="height:348px;">
               <div class="city_sort_property_top">
                <span class="city_sort_property_name" style="margin-left:10px;">排名</span>
                <span class="city_sort_property_name" style="width:80px;">标&nbsp;签&nbsp;名&nbsp;称</span>
                <span class="city_sort_property_name" style="margin-left:40px;">使用人数</span>
               </div>
                              
                <div class="split" style="height:12px;"></div>  
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:iterator   value="listOrderTagM"  id="lorder"  status="l"  >
                                <tr>
                                    <td width="18%">
                                         <s:if test="%{#l.index+1<4}">
                                                <div class="sort_top" ><s:property value="#l.index+1" /></div>
                                        </s:if>
                                        <s:else>
                                                <div class="sort_next" ><s:property value="#l.index+1" /></div>	 						
                                        </s:else>
                                    </td>
                                    <td width="57%">
                                      <div  class="sort_property_content" style="color:#0649B1; width:auto;" title="<s:property value='orderName'/>">
                                            <s:if test="%{#l.length()>8}">
                                                <s:property value="orderName.substring(0,8)"/>..
                                            </s:if>
                                            <s:else>
                                                <s:property value="orderName"/>
                                            </s:else>
                                      </div>                               										
                                </td>
                                    <td width="25%" class="sort_property_content" style=" color:#000;">
                                    <s:property value="sameMonthCount"/>
                                    <s:if test="%{sameMonthCount>beforeMonthCount}">
                                        <img src="./img/up.png" width="7" height="8"/>
                                     </s:if>
                                     <s:else>
                                        <img src="./img/down.png" width="7" height="8"/>
                                     </s:else>
                                    </td>
                                </tr>
                             </s:iterator>  
                         </table>                          
            
            </div>
            <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
       <!--圆角矩形 end-->
        </div>
        <!--月 访问排行-->      
         <div id="access_sort_month" >
            <div id="tag_sort_top">
                <div id="city_sort_logo"></div>
                <div id="tag_sort_name">访问英雄榜</div> <div class="sort_date">月份：<s:property value="accessMonth"/></div>
            </div>
            <div class="split" style="height:15px;"></div>  
            <!--圆角矩形 begin-->
            <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
            <div class="b d1"  style="height:348px;">
               <div class="city_sort_property_top">
                <span class="city_sort_property_name" style="margin-left:10px;">排名</span>
                <span class="city_sort_property_name" style="width:80px;">姓&nbsp;名</span>
                <span class="city_sort_property_name" style="margin-left:40px;">访问次数</span>
               </div>
                              
                <div class="split" style="height:12px;"></div>   
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:iterator   value="listAccessM"  id="lorder"  status="l"  >
                                <tr>
                                    <td width="18%">
                                        <s:if test="%{#l.index+1<4}">
                                                <div class="sort_top" ><s:property value="#l.index+1" /></div>
                                        </s:if>
                                        <s:else>
                                                <div class="sort_next" ><s:property value="#l.index+1" /></div>	 						
                                        </s:else>
                                    </td>
                                    <td class="sort_property_content" style="color:#0649B1;" width="57%">
                                <div  class="sort_property_content" style="color:#0649B1; width:auto; " title="<s:property value='orderName'/>">    
                                    <s:if test="%{#l.length()>8}">
                                        <s:property value="orderName.substring(0,8)"/>..
                                    </s:if>
                                    <s:else>
                                        <s:property value="orderName"/>
                                    </s:else>
                                </div>
                                </td>
                                    <td width="25%" class="sort_property_content" style=" color:#000;">
                                    <s:property value="sameMonthCount"/>
                                    <s:if test="%{sameMonthCount>beforeMonthCount}">
                                        <img src="./img/up.png" width="7" height="8"/>
                                     </s:if>
                                     <s:else>
                                        <img src="./img/down.png" width="7" height="8"/>
                                     </s:else>
                                    </td>
                                </tr>
                             </s:iterator>  
                         </table>                        
               
            
            </div>
            <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
       <!--圆角矩形 end-->
        </div>
        <!--月 下载排行-->
         <div id="download_sort_month" >
            <div id="tag_sort_top">
                <div id="tag_sort_logo"></div>
                <div id="tag_sort_name">应用英雄榜</div> <div class="sort_date">月份：<s:property value="downMonth"/></div>
            </div>
            <div class="split" style="height:15px;"></div>  
            <!--圆角矩形 begin-->
            <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
            <div class="b d1"  style="height:348px;">
               <div class="city_sort_property_top">
                <span class="city_sort_property_name" style="margin-left:10px;">排名</span>
                <span class="city_sort_property_name" style="width:80px;">姓&nbsp;名</span>
                <span class="city_sort_property_name" style="margin-left:40px;">下载次数</span>
               </div>
                              
                <div class="split" style="height:12px;"></div>   
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:iterator   value="listDownM"  id="lorder"  status="l"  >
                                <tr>
                                    <td width="18%">
                                        <s:if test="%{#l.index+1<4}">
                                      		    <div class="sort_top" ><s:property value="#l.index+1" /></div>
                                        </s:if>
                                        <s:else>
                                                <div class="sort_next" ><s:property value="#l.index+1" /></div>	 						
                                        </s:else>
                                    </td>
                                    <td class="sort_property_content" style="color:#0649B1;" width="57%">                               	    <div  class="sort_property_content" style="color:#0649B1; width:auto;" title="<s:property value='orderName'/>">  
                                    <s:if test="%{#l.length()>8}">
                            		<s:property value="orderName.substring(0,8)"/>..
                                    </s:if>
                                    <s:else>
                                        <s:property value="orderName"/>
                                    </s:else>
                                    </div>
                                </td>
                                    <td width="25%" class="sort_property_content" style=" color:#000;">
                                    <s:property value="sameMonthCount"/>
                                    <s:if test="%{sameMonthCount>beforeMonthCount}">
                                        <img src="./img/up.png" width="7" height="8"/>
                                     </s:if>
                                     <s:else>
                                        <img src="./img/down.png" width="7" height="8"/>
                                     </s:else>
                                    </td>
                                </tr>
                             </s:iterator>  
                         </table>                        
                 
            
            </div>
            <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
       <!--圆角矩形 end-->
        </div>
        
        <div id="city_sort">
            <div id="city_sort_top">
                <div id="city_sort_logo"></div>
                <div id="city_sort_name">地市排行</div>
                <div class="sort_date">日期：<s:property value="areaDate"/></div>
            </div>
            <div class="split" style="height:15px;"></div>    
            <!--圆角矩形 begin-->
                    <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
                    <div class="b d1"  style="height:348px;">
                       <div class="city_sort_property_top">
                        <span class="city_sort_property_name" style="margin-left:10px;">排名</span>
                        <span class="city_sort_property_name" style="margin-left:10px;">地&nbsp;市&nbsp;名&nbsp;称</span>
                        <span class="city_sort_property_name" style="margin-left:40px;">使用次数</span>
                       </div>
                         <div class="split" style="height:12px;"></div>          
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:iterator value="listOrder"  id="lorder"  status="l" >
                                <tr>
                                    <td width="18%">
                                    <s:if test="%{#l.index+1<4}">
                                        <div class="sort_top" ><s:property value="#l.index+1" /></div>
                                    </s:if>
                                    <s:else>
                                        <div class="sort_next" ><s:property value="#l.index+1" /></div>
                                    </s:else>
                                    </td>
                                    <td class="sort_property_content" style="color:#0649B1;" width="57%">                               										                                   <s:property value="#lorder.orderName" />
                                </td>
                                    <td width="25%" class="sort_property_content" style=" color:#000;">
                                         <s:property value="#lorder.sameDayCount" /> 
                                         <s:if test="%{sameDayCount>beforeDayCount}">
                                            <img src="./img/up.png" width="7" height="8"/>
                                         </s:if>
                                         <s:else>
                                            <img src="./img/down.png" width="7" height="8"/>
                                         </s:else>
                                    </td>
                                </tr>
                             </s:iterator>  
                         </table>                       
                                                                     
                    </div>
                    <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
               <!--圆角矩形 end-->
            
        </div>
        <div id="tag_sort" >
            <div id="tag_sort_top">
                <div id="tag_sort_logo"></div>
                <div id="tag_sort_name">标签排行</div> <div class="sort_date">日期：<s:property value="tagDate"/></div>
            </div>
            <div class="split" style="height:15px;"></div>  
            <!--圆角矩形 begin-->
            <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
            <div class="b d1"  style="height:348px;">
               <div class="city_sort_property_top">
                <span class="city_sort_property_name" style="margin-left:10px;">排名</span>
                <span class="city_sort_property_name" style="width:80px;">标&nbsp;签&nbsp;名&nbsp;称</span>
                <span class="city_sort_property_name" style="margin-left:40px;">使用人数</span>
               </div>
                              
                <div class="split" style="height:12px;"></div>  
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:iterator   value="listOrderTag"  id="lorder"  status="l"  >
                                <tr>
                                    <td width="18%">
                                   <s:if test="%{#l.index+1<4}">
                                        <div class="sort_top" ><s:property value="#l.index+1" /></div>
                                    </s:if>
                                    <s:else>
                                            <div class="sort_next" ><s:property value="#l.index+1" /></div>	 						
                                    </s:else>
                                    </td>
                                        <td width="57%">
                                    <div  class="sort_property_content" style="color:#0649B1; width:auto;" title="<s:property value='orderName'/>">    
                                        <s:if test="%{#l.length()>8}">
                                            <s:property value="orderName.substring(0,8)"/>..
                                        </s:if>
                                        <s:else>
                                            <s:property value="orderName"/>
                                        </s:else>
                                    </div>
                                </td>
                                    <td width="25%" class="sort_property_content" style=" color:#000;">
                                     <s:property value="sameDayCount"/>
                                    <s:if test="%{sameDayCount>beforeDayCount}">
                                        <img src="./img/up.png" width="7" height="8"/>
                                     </s:if>
                                     <s:else>
                                        <img src="./img/down.png" width="7" height="8"/>
                                     </s:else>
                                    </td>
                                </tr>
                             </s:iterator>  
                         </table>                                           
            
            </div>
            <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
       <!--圆角矩形 end-->
        </div>
        
 		<div id="access_sort" >
            <div id="tag_sort_top">
                <div id="city_sort_logo"></div>
                <div id="tag_sort_name">访问英雄榜</div> <div class="sort_date">日期：<s:property value="accessDate"/></div>
            </div>
            <div class="split" style="height:15px;"></div>  
            <!--圆角矩形 begin-->
            <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
            <div class="b d1"  style="height:348px;">
               <div class="city_sort_property_top">
                <span class="city_sort_property_name" style="margin-left:10px;">排名</span>
                <span class="city_sort_property_name" style="width:80px;">姓&nbsp;名</span>
                <span class="city_sort_property_name" style="margin-left:40px;">访问次数</span>
               </div>
                              
                <div class="split" style="height:12px;"></div>    
                           <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:iterator   value="listAccess"  id="lorder"  status="l"  >
                                <tr>
                                    <td width="18%">
                                   <s:if test="%{#l.index+1<4}">
                                        <div class="sort_top" ><s:property value="#l.index+1" /></div>
                                    </s:if>
                                    <s:else>
                                            <div class="sort_next" ><s:property value="#l.index+1" /></div>	 						
                                    </s:else>
                                    </td>
                                        <td class="sort_property_content" style="color:#0649B1;" width="57%">                               			 <div  class="sort_property_content" style="color:#0649B1; width:auto;" title="<s:property value='orderName'/>">   
                                         <s:if test="%{#l.length()>8}">
                                            <s:property value="orderName.substring(0,8)"/>..
                                        </s:if>
                                        <s:else>
                                            <s:property value="orderName"/>
                                        </s:else>
                                        </div>
                                </td>
                                    <td width="25%" class="sort_property_content" style=" color:#000;">
                                    <s:property value="sameDayCount"/>
                                    <s:if test="%{sameDayCount>beforeDayCount}">
                                        <img src="./img/up.png" width="7" height="8"/>
                                     </s:if>
                                     <s:else>
                                        <img src="./img/down.png" width="7" height="8"/>
                                     </s:else>
                                    </td>
                                </tr>
                             </s:iterator>  
                         </table>      
                 
            
            </div>
            <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
       <!--圆角矩形 end-->
        </div>       


		<div id="download_sort" >
            <div id="tag_sort_top">
                <div id="tag_sort_logo"></div>
                <div id="tag_sort_name">应用英雄榜</div> <div class="sort_date">日期：<s:property value="downDate"/></div>
            </div>
            <div class="split" style="height:15px;"></div>  
            <!--圆角矩形 begin-->
            <b class="b1"></b><b class="b2 d1"></b><b class="b3 d1"></b><b class="b4 d1"></b>
            <div class="b d1"  style="tag_name;">
               <div class="city_sort_property_top">
                <span class="city_sort_property_name" style="margin-left:10px;">排名</span>
                <span class="city_sort_property_name" style="width:80px;">姓&nbsp;名</span>
                <span class="city_sort_property_name" style="margin-left:40px;">下载次数</span>
               </div>
                              
                <div class="split" style="height:12px;"></div>   
                		<table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <s:iterator   value="listDown"  id="lorder"  status="l"  >
                                <tr>
                                    <td width="18%">
                                <s:if test="%{#l.index+1<4}">
                                        <div class="sort_top" ><s:property value="#l.index+1" /></div>
                                </s:if>
                                <s:else>
                                        <div class="sort_next" ><s:property value="#l.index+1" /></div>	 						
                                </s:else>
                                    </td>
                                        <td class="sort_property_content" style="color:#0649B1;" width="57%">
                                <div  class="sort_property_content" style="color:#0649B1; width:auto;" title="<s:property value='orderName'/>">  
                                <s:if test="%{#l.length()>8}">
                            		<s:property value="orderName.substring(0,8)"/>..
                            	</s:if>
                            	<s:else>
                            		<s:property value="orderName"/>
                            	</s:else>
                                </div>
                                </td>
                                    <td width="25%" class="sort_property_content" style=" color:#000;">
                                    <s:property value="sameDayCount"/>
                                    <s:if test="%{sameDayCount>beforeDayCount}">
                                        <img src="./img/up.png" width="7" height="8"/>
                                     </s:if>
                                     <s:else>
                                        <img src="./img/down.png" width="7" height="8"/>
                                     </s:else>
                                    </td>
                                </tr>
                             </s:iterator>  
                         </table>      
            
            </div>
            <b class="b4b d1"></b><b class="b3b d1"></b><b class="b2b d1"></b><b class="b1b"></b>
       <!--圆角矩形 end-->
        </div>        

         
         
        <div style="clear:both"></div>
        <div style="height:18px; font-size:12px;  width:450px;"><div id="fist">1</div><div id="second">2</div> <div id="day">日排行</div> <div id="month">月排行</div> </div>
    </div>
    
</div>
<!--module end-->

<!--bottom begin-->
<div id="bottom">
	<div id="ICP_logo"></div><div class="bottom_content">中国移动通信集团河北有限公司版权所有</div> 
</div>
<!--bottom end-->
<script>
$(function(){
	var userId="<%=session.getAttribute("userId") %>";
	var userName="<%=session.getAttribute("userName")%>";
	var regionId="<%=session.getAttribute("regionId") %>";
	var regionName="<%=session.getAttribute("regionName")%>";
	
	var first=$("#fist");
	var second=$("#second");
	
	var flag="month"; //日统计  月统计标志
	var flagType="area_tag"; //地区和标签
	$("#tag_lib").click(function(){
		window.location.href="initMainTagAction.action?serv_type=0&serv_name=0&serv_name_src=img/maintag/duanxin.png";
		});
	
	
	$("#group_find").click(function(){
		window.location.href="TaginfoAction.action?userId="+userId+"&regionId="+regionId+"&userName="+userName+"&regionName="+regionName;
		});		
	
	$("#tag_create").click(function(){
		window.location.href="access.action";
		});
	
	$("#group_create").click(function(){
		window.location.href="initAttrTagAction.action?title_name="+ ""+"&id="+""+"&userId="+userId+"&regionId="+regionId+"&href="+"";
		});
	
	$("#property_find").click(function(){
		window.location.href="getAttrListAction.action";
		});
	
	$("#tag_approval").click(function(){
		window.location.href="listtTgApproAction.action?jspmes=0&userId="+userId;
		});

	$("#down_find").click(function(){
		window.location.href="querydown.action?userId="+userId;
		});

	$("#share_group").click(function(){
		window.location.href="TaginfoAction.action?custom_type=0";
		});
	$("#tag_counts").click(function(){
		window.location.href="mainMethod.action";
		});	
	$("#fist").click(function(){		
		flagType="area_tag";
		//alert(flag+"--"+flagType);
		$("#fist").css("background-image","url(./img/maintag/light.png)");
		$("#second").css("background-image","url(./img/maintag/gray.png)");	
		var offsetSecond= second.offset();
		//alert(offsetSecond.left);
		//alert(offsetSecond.top);
		if (flag=="date" && flagType=="area_tag" ){
			$("#city_sort").css({
				 "visibility":"visible",
				 "left":offsetSecond.left-232+"px",
				 "top":offsetSecond.top-385+"px"			 
				 });
			$("#tag_sort").css({
				 "visibility":"visible",
				 "left":offsetSecond.left+"px",
				 "top":offsetSecond.top-385+"px"				
			});
			$("#access_sort").css("visibility","hidden");
			$("#download_sort").css("visibility","hidden");
			$("#city_sort_month").css("visibility","hidden");
			$("#tag_sort_month").css("visibility","hidden");
			$("#access_sort_month").css("visibility","hidden");
			$("#download_sort_month").css("visibility","hidden");
		
		}else{
			$("#city_sort").css("visibility","hidden");
			$("#tag_sort").css("visibility","hidden");
			$("#access_sort").css("visibility","hidden");
			$("#download_sort").css("visibility","hidden");
			$("#city_sort_month").css({
				 "visibility":"visible",
				 "left":offsetSecond.left-232+"px",
				 "top":offsetSecond.top-385+"px"			 
				 });
			$("#tag_sort_month").css({
				 "visibility":"visible",
				 "left":offsetSecond.left+"px",
				 "top":offsetSecond.top-385+"px"				
			});
			$("#access_sort_month").css("visibility","hidden");
			$("#download_sort_month").css("visibility","hidden");
		}

		});
	$("#second").click(function(){
		flagType="access_down";
		//alert(flag+"--"+flagType);
		$("#fist").css("background-image","url(./img/maintag/gray.png)");
		$("#second").css("background-image","url(./img/maintag/light.png)");
		var offsetSecond= second.offset();
		//alert(offsetSecond.left);
		//alert(offsetSecond.top);
		if (flag=="date" && flagType=="access_down"){
			$("#city_sort").css("visibility","hidden");
			$("#tag_sort").css("visibility","hidden");
			$("#access_sort").css({
				 "visibility":"visible",
				 "left":offsetSecond.left-232+"px",
				 "top":offsetSecond.top-385+"px"			 
				 });
			$("#download_sort").css({
				 "visibility":"visible",
				 "left":offsetSecond.left+"px",
				 "top":offsetSecond.top-385+"px"				
			});
			$("#city_sort_month").css("visibility","hidden");
			$("#tag_sort_month").css("visibility","hidden");
			$("#access_sort_month").css("visibility","hidden");
			$("#download_sort_month").css("visibility","hidden");
		}else if (flag=="month" && flagType=="access_down"){
			$("#city_sort").css("visibility","hidden");
			$("#tag_sort").css("visibility","hidden");
			$("#access_sort").css("visibility","hidden");
			$("#download_sort").css("visibility","hidden");
			$("#city_sort_month").css("visibility","hidden");
			$("#tag_sort_month").css("visibility","hidden");
			$("#access_sort_month").css({
				 "visibility":"visible",
				 "left":offsetSecond.left-232+"px",
				 "top":offsetSecond.top-385+"px"			 
				 });
			$("#download_sort_month").css({
				 "visibility":"visible",
				 "left":offsetSecond.left+"px",
				 "top":offsetSecond.top-385+"px"				
			});
		}
		
		});
		
	$("#day").click(function(){
		 flag="date";
		 //alert(flag+"--"+flagType);
		 $("#day").css("background-image","url(./img/T_Light.png)");
		 $("#month").css("background-image","url(./img/T_gray.png)");
		 var offsetSecond= second.offset();
			//alert(offsetSecond.left);
			//alert(offsetSecond.top);
		 if (flag=="date" && flagType=="area_tag"){
			 
		    $("#city_sort").css({
				 "visibility":"visible",
				 "left":offsetSecond.left-232+"px",
				 "top":offsetSecond.top-385+"px"			 
				 });
			$("#tag_sort").css({
				 "visibility":"visible",
				 "left":offsetSecond.left+"px",
				 "top":offsetSecond.top-385+"px"			 
				 });
			$("#access_sort").css("visibility","hidden");
			$("#download_sort").css("visibility","hidden");
			$("#city_sort_month").css("visibility","hidden");
			$("#tag_sort_month").css("visibility","hidden");
			$("#access_sort_month").css("visibility","hidden");
			$("#download_sort_month").css("visibility","hidden");
		 }else if (flag=="date" && flagType=="access_down"){
		 	$("#city_sort").css("visibility","hidden");
			$("#tag_sort").css("visibility","hidden");
			$("#access_sort").css({
				 "visibility":"visible",
				 "left":offsetSecond.left-232+"px",
				 "top":offsetSecond.top-385+"px"			 
				 });
			$("#download_sort").css({
				 "visibility":"visible",
				 "left":offsetSecond.left+"px",
				 "top":offsetSecond.top-385+"px"			 
				 });
			$("#city_sort_month").css("visibility","hidden");
			$("#tag_sort_month").css("visibility","hidden");
			$("#access_sort_month").css("visibility","hidden");
			$("#download_sort_month").css("visibility","hidden");
		 }
		});
	$("#month").click(function(){		
		 flag="month";
		// alert(flag+"--"+flagType);
		 $("#day").css("background-image","url(./img/T_gray.png)");
		 $("#month").css("background-image","url(./img/T_Light.png)");
		 var offsetSecond= second.offset();
			//alert(offsetSecond.left);
			//alert(offsetSecond.top);
		 if(flag=="month" && flagType=="area_tag" ){	
			$("#city_sort").css("visibility","hidden");
			$("#tag_sort").css("visibility","hidden");
			$("#access_sort").css("visibility","hidden");
			$("#download_sort").css("visibility","hidden");	    	 
			$("#city_sort_month").css({
				 "visibility":"visible",
				 "left":offsetSecond.left-232+"px",
				 "top":offsetSecond.top-385+"px"			 
				 });
			
			$("#tag_sort_month").css({
				 "visibility":"visible",
				 "left":offsetSecond.left+"px",
				 "top":offsetSecond.top-385+"px"			 
				 }); 
			$("#access_sort_month").css("visibility","hidden");
			$("#download_sort_month").css("visibility","hidden");
				 
			//alert("111");
		 }else if(flag=="month" && flagType=="access_down" ){
			$("#city_sort").css("visibility","hidden");
			$("#tag_sort").css("visibility","hidden");
			$("#access_sort").css("visibility","hidden");
			$("#download_sort").css("visibility","hidden");
			$("#city_sort_month").css("visibility","hidden");
			$("#tag_sort_month").css("visibility","hidden");
			$("#access_sort_month").css({
				 "visibility":"visible",
				 "left":offsetSecond.left-232+"px",
				 "top":offsetSecond.top-385+"px"				
			});
			$("#download_sort_month").css({
				 "visibility":"visible",
				 "left":offsetSecond.left+"px",
				 "top":offsetSecond.top-385+"px"				
			});
			/*
			$("#access_sort_month").css("visibility","visible");
			$("#download_sort_month").css("visibility","visible");
			*/
		 }

		});
	})
</script>
</body>
</html>

