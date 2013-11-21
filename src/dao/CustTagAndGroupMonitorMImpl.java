package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import module.CustTagAndGroupMonitorM;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.Pagination;

public class CustTagAndGroupMonitorMImpl extends JdbcDaoSupport {
	private Pagination pageInfo;

	public List<CustTagAndGroupMonitorM> queryAllM(String statisMonth, String regionName, int pageNo,int pageSize){
		String sql="select STATIS_MONTH,REGION_NAME,ACCESS_SUBS_CNT,ACCESS_CNT,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT,CUSTGROUP_CREATE_CNT ,"
		          +"CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT 	,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn"
		          +" from MK_VGOP.TB_CUST_TAG_AND_GROUP_MONITOR_M";
		StringBuffer  whereSql=new StringBuffer();
		whereSql.append(" where 1=1 ");
	    if (!"".equals(statisMonth) ){
	    	 whereSql.append(" and STATIS_MONTH="+ statisMonth +"");
	    }
	    if (!"".equals(regionName)){
	    	whereSql.append(" and REGION_NAME='"+ regionName +"'");
	    }
		
	    sql+=whereSql.toString();
		
		 pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		 List<Map<String,Object>> listTemp=pageInfo.getResultList();
		 List<CustTagAndGroupMonitorM> listDPage=new ArrayList<CustTagAndGroupMonitorM>();
		 for(Map<String,Object> obj: listTemp){
			 CustTagAndGroupMonitorM cgmd=new CustTagAndGroupMonitorM();
				cgmd.setStatisMonth((Integer)obj.get("STATIS_MONTH"));
				cgmd.setRegionName((String)obj.get("REGION_NAME"));
				cgmd.setAccessSubsCnt((Integer)obj.get("ACCESS_SUBS_CNT"));
				cgmd.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
				cgmd.setCustlistDwlnSubsCnt((Integer)obj.get("CUSTLIST_DWLN_SUBS_CNT"));
				cgmd.setCustlistDwlnCnt((Integer)obj.get("CUSTLIST_DWLN_CNT"));
				cgmd.setCustgroupCreateSubsCnt((Integer)obj.get("CUSTGROUP_CREATE_SUBS_CNT"));
				cgmd.setCustgroupCreateCnt((Integer)obj.get("CUSTGROUP_CREATE_CNT"));
				cgmd.setCusttagCreateSubsCnt((Integer)obj.get("CUSTTAG_CREATE_SUBS_CNT"));
				cgmd.setCusttagCreateCnt((Integer)obj.get("CUSTTAG_CREATE_CNT"));
				listDPage.add(cgmd);
		 }
		return listDPage;
	}
	
	
	public List<CustTagAndGroupMonitorM> queryAllM(String statisMonth, String regionName){
		String sql="select STATIS_MONTH,REGION_NAME,ACCESS_SUBS_CNT,ACCESS_CNT,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT,CUSTGROUP_CREATE_CNT ,"
		          +"CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT 	,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn"
		          +" from MK_VGOP.TB_CUST_TAG_AND_GROUP_MONITOR_M";
		StringBuffer  whereSql=new StringBuffer();
		whereSql.append(" where 1=1 ");
	    if (!"".equals(statisMonth) ){
	    	 whereSql.append(" and STATIS_MONTH="+ statisMonth +"");
	    }
	    if (!"".equals(regionName)){
	    	whereSql.append(" and REGION_NAME='"+ regionName +"'");
	    }
		
	    sql+=whereSql.toString();
		
		 List<Map<String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		 List<CustTagAndGroupMonitorM> listDPage=new ArrayList<CustTagAndGroupMonitorM>();
		 for(Map<String,Object> obj: listTemp){
			 CustTagAndGroupMonitorM cgmd=new CustTagAndGroupMonitorM();
				cgmd.setStatisMonth((Integer)obj.get("STATIS_MONTH"));
				cgmd.setRegionName((String)obj.get("REGION_NAME"));
				cgmd.setAccessSubsCnt((Integer)obj.get("ACCESS_SUBS_CNT"));
				cgmd.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
				cgmd.setCustlistDwlnSubsCnt((Integer)obj.get("CUSTLIST_DWLN_SUBS_CNT"));
				cgmd.setCustlistDwlnCnt((Integer)obj.get("CUSTLIST_DWLN_CNT"));
				cgmd.setCustgroupCreateSubsCnt((Integer)obj.get("CUSTGROUP_CREATE_SUBS_CNT"));
				cgmd.setCustgroupCreateCnt((Integer)obj.get("CUSTGROUP_CREATE_CNT"));
				cgmd.setCusttagCreateSubsCnt((Integer)obj.get("CUSTTAG_CREATE_SUBS_CNT"));
				cgmd.setCusttagCreateCnt((Integer)obj.get("CUSTTAG_CREATE_CNT"));
				listDPage.add(cgmd);
		 }
		return listDPage;
	}
	
	/**
	 * 获取日统计数据
	 * @return
	 */
	public List<CustTagAndGroupMonitorM> getRecentlyCountsM(){
		String sql="select STATIS_MONTH,REGION_NAME,ACCESS_SUBS_CNT,ACCESS_CNT,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT,CUSTGROUP_CREATE_CNT ,"
	                      + " CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT from MK_VGOP.TB_CUST_TAG_AND_GROUP_MONITOR_M where STATIS_MONTH="+getRecentlyMonth()+" order by REGION_NAME";
				
		List<Map<String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		 List<CustTagAndGroupMonitorM> listD=new ArrayList<CustTagAndGroupMonitorM>();
		 for (int i=0;i<listTemp.size();i++){
			 Map<String,Object> obj= listTemp.get(i);
			 CustTagAndGroupMonitorM  cd=new CustTagAndGroupMonitorM();
			 cd.setStatisMonth((Integer)obj.get("STATIS_MONTH"));
			 cd.setRegionName((String)obj.get("REGION_NAME"));
			 cd.setAccessSubsCnt((Integer)obj.get("ACCESS_SUBS_CNT"));
			 cd.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
			 cd.setCustlistDwlnSubsCnt((Integer)obj.get("CUSTLIST_DWLN_SUBS_CNT"));
			 cd.setCustlistDwlnCnt((Integer)obj.get("CUSTGROUP_CREATE_CNT"));
			 cd.setCustgroupCreateSubsCnt((Integer)obj.get("CUSTGROUP_CREATE_SUBS_CNT"));
			 cd.setCustgroupCreateCnt((Integer)obj.get("CUSTGROUP_CREATE_CNT"));
			 cd.setCusttagCreateSubsCnt((Integer)obj.get("CUSTTAG_CREATE_SUBS_CNT"));
			 cd.setCusttagCreateCnt((Integer)obj.get("CUSTTAG_CREATE_CNT"));
			 listD.add(cd);
		 }
		return listD;
	}
	
	
	  /**
	   * 获取最近日期
	   * @return
	   */
       public Integer getRecentlyMonth(){
    	   String sql="select STATIS_MONTH FROM MK_VGOP.TB_CUST_TAG_AND_GROUP_MONITOR_M GROUP BY STATIS_MONTH ORDER BY STATIS_MONTH DESC fetch first 1 rows only";
    	   return this.getJdbcTemplate().queryForObject(sql, Integer.class);
       }

	public Pagination getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(Pagination pageInfo) {
		this.pageInfo = pageInfo;
	}
}
