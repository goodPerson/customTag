package dao;
/**
 * 客户标签和群的监控月表实现类
 * @author ywz
 *@date 20130717
 */
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.CustTagAndGroupMonitorD;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.Pagination;

public class CustTagAndGroupMonitorDImpl extends JdbcDaoSupport {
	private Pagination pageInfo;

	public List<CustTagAndGroupMonitorD> queryAll(String findstartDay, String findsendDay, String  regionName, int pageNo,int pageSize){
	
		String sql="select STATIS_DATE,REGION_NAME,ACCESS_SUBS_CNT,ACCESS_CNT,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT,CUSTGROUP_CREATE_CNT ,"
				          +"CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT 	,rownumber() over(ORDER BY STATIS_DATE desc) AS rn"
				          +" from MK_VGOP.TB_CUST_TAG_AND_GROUP_MONITOR_D";
		StringBuffer whereSql=new StringBuffer();
		whereSql.append(" where 1=1");
		if (!"".equals(findstartDay) && !"".equals(findsendDay) ){
			  whereSql.append(" and  STATIS_DATE between  "+ findstartDay +"  and "+ findsendDay +" ");
		}
		
		if (!"".equals(regionName)){
			 whereSql.append(" and REGION_NAME='"+ regionName +"'");
		}
		sql+=whereSql.toString();
		pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		 List<Map<String,Object>> listTemp=pageInfo.getResultList();
		 List<CustTagAndGroupMonitorD> listDPage=new ArrayList<CustTagAndGroupMonitorD>();
		 for(Map<String,Object> obj: listTemp){
			    CustTagAndGroupMonitorD cgmd=new CustTagAndGroupMonitorD();
				cgmd.setStatisDate((Integer)obj.get("STATIS_DATE"));
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
	
	
	public List<CustTagAndGroupMonitorD> queryAll(String findstartDay, String findsendDay, String  regionName){
		
		String sql="select STATIS_DATE,REGION_NAME,ACCESS_SUBS_CNT,ACCESS_CNT,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT,CUSTGROUP_CREATE_CNT ,"
				          +"CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT 	,rownumber() over(ORDER BY STATIS_DATE desc) AS rn"
				          +" from MK_VGOP.TB_CUST_TAG_AND_GROUP_MONITOR_D";
		StringBuffer whereSql=new StringBuffer();
		whereSql.append(" where 1=1");
		if (!"".equals(findstartDay) && !"".equals(findsendDay) ){
			  whereSql.append(" and  STATIS_DATE between  "+ findstartDay +"  and "+ findsendDay +" ");
		}
		
		if (!"".equals(regionName)){
			 whereSql.append(" and REGION_NAME='"+ regionName +"'");
		}
		sql+=whereSql.toString();
		 List<Map<String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		 List<CustTagAndGroupMonitorD> listDPage=new ArrayList<CustTagAndGroupMonitorD>();
		 for(Map<String,Object> obj: listTemp){
			    CustTagAndGroupMonitorD cgmd=new CustTagAndGroupMonitorD();
				cgmd.setStatisDate((Integer)obj.get("STATIS_DATE"));
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
	public List<CustTagAndGroupMonitorD> getRecentlyCounts(){
		String sql="select STATIS_DATE,REGION_NAME,ACCESS_SUBS_CNT,ACCESS_CNT,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT,CUSTGROUP_CREATE_CNT ,"
	                      + " CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT from MK_VGOP.TB_CUST_TAG_AND_GROUP_MONITOR_D where STATIS_DATE="+getRecentlyDay()+" order by REGION_NAME";
				
		List<Map<String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		 List<CustTagAndGroupMonitorD> listD=new ArrayList<CustTagAndGroupMonitorD>();
		 for (int i=0;i<listTemp.size();i++){
			 Map<String,Object> obj= listTemp.get(i);
			 CustTagAndGroupMonitorD  cd=new CustTagAndGroupMonitorD();
			 cd.setStatisDate((Integer)obj.get("STATIS_DATE"));
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
		/* for(Map<String,Object> obj: listTemp){
			    CustTagAndGroupMonitorD cgmd=new CustTagAndGroupMonitorD();
				cgmd.setStatisDate((Integer)obj.get("STATIS_DATE"));
				cgmd.setRegionName((String)obj.get("REGION_NAME"));
				cgmd.setAccessSubsCnt((Integer)obj.get("ACCESS_SUBS_CNT"));
				cgmd.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
				cgmd.setCustlistDwlnSubsCnt((Integer)obj.get("CUSTLIST_DWLN_SUBS_CNT"));
				cgmd.setCustlistDwlnCnt((Integer)obj.get("CUSTLIST_DWLN_CNT"));
				cgmd.setCustgroupCreateSubsCnt((Integer)obj.get("CUSTGROUP_CREATE_SUBS_CNT"));
				cgmd.setCustgroupCreateCnt((Integer)obj.get("CUSTGROUP_CREATE_CNT"));
				cgmd.setCusttagCreateSubsCnt((Integer)obj.get("CUSTTAG_CREATE_SUBS_CNT"));
				cgmd.setCusttagCreateCnt((Integer)obj.get("CUSTTAG_CREATE_CNT"));
				listD.add(cgmd);
		 }*/
		return listD;
	}
	  /**
	   * 获取最近日期
	   * @return
	   */
       public Integer getRecentlyDay(){
    	   String sql="select STATIS_DATE FROM MK_VGOP.TB_CUST_TAG_AND_GROUP_MONITOR_D GROUP BY STATIS_DATE ORDER BY STATIS_DATE DESC fetch first 1 rows only";
    	   return this.getJdbcTemplate().queryForObject(sql, Integer.class);
       }

	public Pagination getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(Pagination pageInfo) {
		this.pageInfo = pageInfo;
	}
       
}
