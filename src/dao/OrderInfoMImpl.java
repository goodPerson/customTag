package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.OrderInfo;
import module.OrderInfoM;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.DateUtil;
import common.GetSqlReturnStr;

/**
 * 月统计排行实现类
 * @author ywz
 *@date 20130716
 */
public class OrderInfoMImpl extends JdbcDaoSupport{
//	GetSqlReturnStr strSql=new  GetSqlReturnStr();
	/**
	 * 地区排行  月
	 * @return
	 */
	
	public List<OrderInfoM> listOrderInfoByAreaM(){
		String strAreaMonth="";
		if ("".equals(getAreaMonth())){
				strAreaMonth=DateUtil.getYearMonthDay();
		}else{
				strAreaMonth=getAreaMonth();
		}
		String sql="select SAME_MONTH,SAME_MONTH_COUNT,ORDER_TYPE,ORDER_NAME,BEFORE_MONTH_COUNT from MK_VGOP.TB_ORDER_INFO_M " 
				         +" where ORDER_TYPE='AREA' and  SAME_MONTH='"+strAreaMonth+"' order by SAME_MONTH_COUNT desc fetch first 12 rows only ";
		List<Map<String,Object>> listOrderMap=this.getJdbcTemplate().queryForList(sql);
		List<OrderInfoM>  listOrder=new ArrayList<OrderInfoM>();
		for(Map<String,Object> map: listOrderMap){
			 OrderInfoM  orderInfoM=new OrderInfoM();
			 orderInfoM.setSameMonth((String)map.get("SAME_MONTH"));
			 orderInfoM.setSameMonthCount((Integer)map.get("SAME_MONTH_COUNT"));
			 orderInfoM.setOrderType((String)map.get("ORDER_TYPE"));
			 orderInfoM.setOrderName((String)map.get("ORDER_NAME"));
			 orderInfoM.setBeforeMonthCount((Integer)map.get("BEFORE_MONTH_COUNT"));
			 listOrder.add(orderInfoM);
		}		
		return listOrder;
	}
	/**
	 * 标签排行 月
	 * @return
	 */
	public List<OrderInfoM> listOrderInfoByTagM(){
		String strTagMonth="";
		if("".equals(getTagMonth())){
			strTagMonth=DateUtil.getYearMonthDay();
		}else{
			strTagMonth=getTagMonth();
		}
		String sql="select SAME_MONTH,SAME_MONTH_COUNT,ORDER_TYPE,ORDER_NAME,BEFORE_MONTH_COUNT from MK_VGOP.TB_ORDER_INFO_M " 
				         +" where ORDER_TYPE='TAG' and  SAME_MONTH='"+strTagMonth+"' order by SAME_MONTH_COUNT desc fetch first 12 rows only";
		List<Map<String,Object>> listOrderMap=this.getJdbcTemplate().queryForList(sql);
		List<OrderInfoM>  listTagOrder=new ArrayList<OrderInfoM>();
		for(Map<String,Object> map: listOrderMap){
			OrderInfoM  orderInfo=new OrderInfoM();
			 orderInfo.setSameMonth((String)map.get("SAME_MONTH"));
			 orderInfo.setSameMonthCount((Integer)map.get("SAME_MONTH_COUNT"));
			 orderInfo.setOrderType((String)map.get("ORDER_TYPE"));
			 orderInfo.setOrderName((String)map.get("ORDER_NAME"));
			 orderInfo.setBeforeMonthCount((Integer)map.get("BEFORE_MONTH_COUNT"));
			 listTagOrder.add(orderInfo);
		}		
		return listTagOrder;
	}
	
	/**
	 * 访问用户排行 月
	 * @return
	 */
	public List<OrderInfoM> listOrderInfoByAccessM(){
		String strAccessMonth="";
		if("".equals(getAccessMonth())){
			strAccessMonth=DateUtil.getYearMonthDay();
		}else{
			strAccessMonth=getAccessMonth();
		}
		String sql="select SAME_MONTH,SAME_MONTH_COUNT,ORDER_TYPE,ORDER_NAME,BEFORE_MONTH_COUNT from MK_VGOP.TB_ORDER_INFO_M " 
				         +" where ORDER_TYPE='ACCESS_USER' and  SAME_MONTH='"+strAccessMonth+"' and ORDER_NAME!='郑声远' order by SAME_MONTH_COUNT desc fetch first 12 rows only";
		List<Map<String,Object>> listOrderMap=this.getJdbcTemplate().queryForList(sql);
		List<OrderInfoM>  listTagOrder=new ArrayList<OrderInfoM>();
		for(Map<String,Object> map: listOrderMap){
			OrderInfoM  orderInfo=new OrderInfoM();
			 orderInfo.setSameMonth((String)map.get("SAME_MONTH"));
			 orderInfo.setSameMonthCount((Integer)map.get("SAME_MONTH_COUNT"));
			 orderInfo.setOrderType((String)map.get("ORDER_TYPE"));
			 orderInfo.setOrderName((String)map.get("ORDER_NAME"));
			 orderInfo.setBeforeMonthCount((Integer)map.get("BEFORE_MONTH_COUNT"));
			 listTagOrder.add(orderInfo);
		}		
		return listTagOrder;
	}
	
	/**
	 * 下载用户排行 月
	 * @return
	 */
	public List<OrderInfoM> listOrderInfoByDownM(){
		String strDownLoadMonth="";
		if("".equals(getDownLoadMonth())){
			strDownLoadMonth=DateUtil.getYearMonthDay();
		}else{
			strDownLoadMonth=getDownLoadMonth();
		}
		String sql="select SAME_MONTH,SAME_MONTH_COUNT,ORDER_TYPE,ORDER_NAME,BEFORE_MONTH_COUNT from MK_VGOP.TB_ORDER_INFO_M " 
				         +" where ORDER_TYPE='DOWNLOAD_USER' and  SAME_MONTH='"+strDownLoadMonth+"' order by SAME_MONTH_COUNT desc fetch first 12 rows only";
		List<Map<String,Object>> listOrderMap=this.getJdbcTemplate().queryForList(sql);
		List<OrderInfoM>  listTagOrder=new ArrayList<OrderInfoM>();
		for(Map<String,Object> map: listOrderMap){
			OrderInfoM  orderInfo=new OrderInfoM();
			 orderInfo.setSameMonth((String)map.get("SAME_MONTH"));
			 orderInfo.setSameMonthCount((Integer)map.get("SAME_MONTH_COUNT"));
			 orderInfo.setOrderType((String)map.get("ORDER_TYPE"));
			 orderInfo.setOrderName((String)map.get("ORDER_NAME"));
			 orderInfo.setBeforeMonthCount((Integer)map.get("BEFORE_MONTH_COUNT"));
			 listTagOrder.add(orderInfo);
		}		
		return listTagOrder;
	}
	
	public String getAreaMonth(){
		String sql="select SAME_MONTH from MK_VGOP.TB_ORDER_INFO_M  where ORDER_TYPE='AREA'  group by SAME_MONTH order by SAME_MONTH desc fetch first 1 rows only";		
//		strSql.setSql(sql);
		return  getStr(sql);
	}
	
	public String getTagMonth(){
		String sql="select SAME_MONTH from MK_VGOP.TB_ORDER_INFO_M where ORDER_TYPE='TAG'  group by SAME_MONTH order by SAME_MONTH desc fetch first 1 rows only";		
//		strSql.setSql(sql);
		return  getStr(sql);
	}
	
	public String getAccessMonth(){
		String sql="select SAME_MONTH from MK_VGOP.TB_ORDER_INFO_M  where ORDER_TYPE='ACCESS_USER'  group by SAME_MONTH order by SAME_MONTH desc fetch first 1 rows only";		
//		strSql.setSql(sql);
		return  getStr(sql);
	}
	
	public String getDownLoadMonth(){
		String sql="select SAME_MONTH from MK_VGOP.TB_ORDER_INFO_M  where ORDER_TYPE='DOWNLOAD_USER'  group by SAME_MONTH order by SAME_MONTH desc fetch first 1 rows only";		
//		strSql.setSql(sql);
		return  getStr(sql);
	}	
	private   int listSize(String sql){
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
