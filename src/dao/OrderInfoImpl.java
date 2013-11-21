package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.OrderInfo;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.DateUtil;
import common.GetSqlReturnStr;

public class OrderInfoImpl extends JdbcDaoSupport {
	GetSqlReturnStr getStrSql=new  GetSqlReturnStr();
	/**
	 * 地区排行  日
	 * @return
	 */
	
	public List<OrderInfo> listOrderInfoByArea(){
		String strAreaDate="";
		if ("".equals(getAreaDate())){
			strAreaDate=DateUtil.getYearMonthDay();
		}else{
			strAreaDate=getAreaDate();
		}
		String sql="Select SAME_DAY,SAME_DAY_COUNT,ORDER_TYPE,ORDER_NAME,BEFORE_DAY_COUNT from MK_VGOP.TB_ORDER_INFO " 
				         +" where ORDER_TYPE='AREA' and  SAME_DAY='"+strAreaDate+"' order by SAME_DAY_COUNT desc fetch first 12 rows only ";
		List<Map<String,Object>> listOrderMap=this.getJdbcTemplate().queryForList(sql);
		List<OrderInfo>  listOrder=new ArrayList<OrderInfo>();
		for(Map<String,Object> map: listOrderMap){
			 OrderInfo  orderInfo=new OrderInfo();
			 orderInfo.setSameDay((String)map.get("SAME_DAY"));
			 orderInfo.setSameDayCount((Integer)map.get("SAME_DAY_COUNT"));
			 orderInfo.setOrderType((String)map.get("ORDER_TYPE"));
			 orderInfo.setOrderName((String)map.get("ORDER_NAME"));
			 orderInfo.setBeforeDayCount((Integer)map.get("BEFORE_DAY_COUNT"));
			 listOrder.add(orderInfo);
		}		
		return listOrder;
	}
	/**
	 * 标签排行 日
	 * @return
	 */
	public List<OrderInfo> listOrderInfoByTag(){
		String strTagDate="";
		if ("".equals(getTagDate())){
			strTagDate=DateUtil.getYearMonthDay();
		}else{
			strTagDate=getTagDate();
		}
		String sql="Select SAME_DAY,SAME_DAY_COUNT,ORDER_TYPE,ORDER_NAME,BEFORE_DAY_COUNT from MK_VGOP.TB_ORDER_INFO " 
				         +" where ORDER_TYPE='TAG' and  SAME_DAY='"+strTagDate+"' order by SAME_DAY_COUNT desc fetch first 12 rows only";
		List<Map<String,Object>> listOrderMap=this.getJdbcTemplate().queryForList(sql);
		List<OrderInfo>  listTagOrder=new ArrayList<OrderInfo>();
		for(Map<String,Object> map: listOrderMap){
			 OrderInfo  orderInfo=new OrderInfo();
			 orderInfo.setSameDay((String)map.get("SAME_DAY"));
			 orderInfo.setSameDayCount((Integer)map.get("SAME_DAY_COUNT"));
			 orderInfo.setOrderType((String)map.get("ORDER_TYPE"));
			 orderInfo.setOrderName((String)map.get("ORDER_NAME"));
			 orderInfo.setBeforeDayCount((Integer)map.get("BEFORE_DAY_COUNT"));
			 listTagOrder.add(orderInfo);
		}		
		return listTagOrder;
	}
	
	/**
	 * 访问用户排行 日
	 * @return
	 */
	public List<OrderInfo> listOrderInfoByAccess(){
		String strAccessDate="";
		if ("".equals(getAccessDate())){
			strAccessDate=DateUtil.getYearMonthDay();
		}else{
			strAccessDate=getAccessDate();
		}
		String sql="Select SAME_DAY,SAME_DAY_COUNT,ORDER_TYPE,ORDER_NAME,BEFORE_DAY_COUNT from MK_VGOP.TB_ORDER_INFO " 
				         +" where ORDER_TYPE='ACCESS_USER' and  SAME_DAY='"+strAccessDate+"' and ORDER_NAME!='郑声远' order by SAME_DAY_COUNT desc fetch first 12 rows only";
		List<Map<String,Object>> listOrderMap=this.getJdbcTemplate().queryForList(sql);
		List<OrderInfo>  listTagOrder=new ArrayList<OrderInfo>();
		for(Map<String,Object> map: listOrderMap){
			 OrderInfo  orderInfo=new OrderInfo();
			 orderInfo.setSameDay((String)map.get("SAME_DAY"));
			 orderInfo.setSameDayCount((Integer)map.get("SAME_DAY_COUNT"));
			 orderInfo.setOrderType((String)map.get("ORDER_TYPE"));
			 orderInfo.setOrderName((String)map.get("ORDER_NAME"));
			 orderInfo.setBeforeDayCount((Integer)map.get("BEFORE_DAY_COUNT"));
			 listTagOrder.add(orderInfo);
		}		
		return listTagOrder;
	}
	
	/**
	 * 下载用户排行 日
	 * @return
	 */
	public List<OrderInfo> listOrderInfoByDown(){
		String strDownLoadDate="";
		if("".equals(getDownLoadDate())){
			strDownLoadDate=DateUtil.getYearMonthDay();
		}else{
			strDownLoadDate=getDownLoadDate();
		}
		String sql="Select SAME_DAY,SAME_DAY_COUNT,ORDER_TYPE,ORDER_NAME,BEFORE_DAY_COUNT from MK_VGOP.TB_ORDER_INFO " 
				         +" where ORDER_TYPE='DOWNLOAD_USER' and  SAME_DAY='"+strDownLoadDate+"' order by SAME_DAY_COUNT desc fetch first 12 rows only";
		List<Map<String,Object>> listOrderMap=this.getJdbcTemplate().queryForList(sql);
		List<OrderInfo>  listTagOrder=new ArrayList<OrderInfo>();
		for(Map<String,Object> map: listOrderMap){
			 OrderInfo  orderInfo=new OrderInfo();
			 orderInfo.setSameDay((String)map.get("SAME_DAY"));
			 orderInfo.setSameDayCount((Integer)map.get("SAME_DAY_COUNT"));
			 orderInfo.setOrderType((String)map.get("ORDER_TYPE"));
			 orderInfo.setOrderName((String)map.get("ORDER_NAME"));
			 orderInfo.setBeforeDayCount((Integer)map.get("BEFORE_DAY_COUNT"));
			 listTagOrder.add(orderInfo);
		}		
		return listTagOrder;
	}
	
	public String getAreaDate(){
		
		String sql="select SAME_DAY from MK_VGOP.TB_ORDER_INFO  where ORDER_TYPE='AREA'  group by SAME_DAY order by SAME_DAY desc fetch first 1 rows only";	
//		getStrSql.setSql(sql);
//		String aaa=getStrSql.getSqlStr();
		return  getStr( sql);
	}
	
	public String getTagDate(){
		String sql="select SAME_DAY from MK_VGOP.TB_ORDER_INFO  where ORDER_TYPE='TAG'  group by SAME_DAY order by SAME_DAY desc fetch first 1 rows only";	
//		strSql.setSql(sql);
		return  getStr( sql);
	}
	
	public String getAccessDate(){
		String sql="select SAME_DAY from MK_VGOP.TB_ORDER_INFO  where ORDER_TYPE='ACCESS_USER'  group by SAME_DAY order by SAME_DAY desc fetch first 1 rows only";		
//		strSql.setSql(sql);
		return  getStr( sql);
	}
	
	public String getDownLoadDate(){
		String sql="select SAME_DAY from MK_VGOP.TB_ORDER_INFO  where ORDER_TYPE='DOWNLOAD_USER'  group by SAME_DAY order by SAME_DAY desc fetch first 1 rows only";		
		//strSql.setSql(sql);
		return  getStr( sql);
	}
	private  int listSize(String sql){
		int flagInt=getJdbcTemplate().queryForList(sql, String.class).size();
		return flagInt;
	}

	public  String getStr(String sql){
	    String str="";
		if (listSize(sql)>0){
			str=this.getJdbcTemplate().queryForObject(sql, String.class).toString();
		}
		return str;
	}
	
}
