package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.Pagination;

import module.CustTagCountyD;
import module.CustTagCountyM;
import dao.Idao.ITagCounty;

public class TagCountyImpl extends JdbcDaoSupport implements ITagCounty {
	private Pagination pageInfo;
	public List<CustTagCountyD> findCtcdList(String regionName,String startTime, String endTime ,CustTagCountyD ctcd,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		String sql=getConditionD( regionName, startTime,  endTime , ctcd);		
		return lctcd( sql, pageNo, pageSize );
	}

	public List<CustTagCountyD> findCtcdList(String regionName,
			String startTime, String endTime, CustTagCountyD ctcd) {
		// TODO Auto-generated method stub
		String sql=getConditionD( regionName, startTime,  endTime , ctcd);		
		return lctcd( sql);
	}
	
	public List<CustTagCountyM> findCtcmList(String regionName,CustTagCountyM ctcm,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		String sql=getConditionM( regionName, ctcm);		
		return lctcm( sql, pageNo, pageSize);
	}
	
	public List<CustTagCountyM> findCtcmList(String regionName,
			CustTagCountyM ctcm) {
		// TODO Auto-generated method stub
		String sql=getConditionM( regionName, ctcm);		
		return lctcm( sql);
	}
	
	private List<CustTagCountyD> lctcd(String sql,int pageNo,int pageSize ){
		pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		List<Map<String,Object>>  l=pageInfo.getResultList();
		return structureList(l);
		
	}
	
	private List<CustTagCountyD> lctcd(String sql){
		List<Map<String,Object>>  l=this.getJdbcTemplate().queryForList(sql);
		return structureList(l);
		
	}
	
	private List<CustTagCountyD> structureList(List<Map<String,Object>> lt){
		List<CustTagCountyD> lctcd=new ArrayList<CustTagCountyD>();
		for(Map<String,Object> obj : lt){
				CustTagCountyD ctcdt=new CustTagCountyD();
				ctcdt.setStatisDate((Integer)obj.get("STATIS_DATE"));
				ctcdt.setRegionName((String)obj.get("REGION_NAME"));
				ctcdt.setCountryName((String)obj.get("COUNTRY_NAME"));
				ctcdt.setAccessSubsCnt((Integer)obj.get("ACCESS_SUBS_CNT"));
				ctcdt.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
				ctcdt.setCustlistDwlnSubsCnt((Integer)obj.get("CUSTLIST_DWLN_SUBS_CNT"));
				ctcdt.setCustlistDwlnCnt((Integer)obj.get("CUSTLIST_DWLN_CNT"));
				ctcdt.setCustgroupCreateSubsCnt((Integer)obj.get("CUSTGROUP_CREATE_SUBS_CNT"));
				ctcdt.setCustgroupCreateCnt((Integer)obj.get("CUSTGROUP_CREATE_CNT"));
				ctcdt.setCusttagCreateSubsCnt((Integer)obj.get("CUSTTAG_CREATE_SUBS_CNT"));
				ctcdt.setCusttagCreateCnt((Integer)obj.get("CUSTTAG_CREATE_CNT"));
				lctcd.add(ctcdt);
		}
		return lctcd;
	}

	private String getConditionD(String regionName,String startTime, String endTime ,CustTagCountyD ctcd){
        String Strcompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		String sql="";
		if("河北省".equals(regionName)){
			sql="select STATIS_DATE,REGION_NAME,COUNTRY_NAME,ACCESS_SUBS_CNT,ACCESS_CNT ,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT , "
			         + " CUSTGROUP_CREATE_CNT,CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_DATE desc) AS rn from MK_VGOP.TB_CUST_TAG_COUNTY_D where 1=1  ";
		}else if (Strcompar.indexOf(regionName)>0){
			sql="select STATIS_DATE,REGION_NAME,COUNTRY_NAME,ACCESS_SUBS_CNT,ACCESS_CNT ,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT , "
			         + " CUSTGROUP_CREATE_CNT,CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_DATE desc) AS rn from MK_VGOP.TB_CUST_TAG_COUNTY_D where REGION_NAME='"+ regionName +"'  ";						
		}else{
			sql="select STATIS_DATE,REGION_NAME,COUNTRY_NAME,ACCESS_SUBS_CNT,ACCESS_CNT ,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT , "
			         + " CUSTGROUP_CREATE_CNT,CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_DATE desc) AS rn from MK_VGOP.TB_CUST_TAG_COUNTY_D where COUNTRY_NAME like '%"+ regionName +"%'";				
		}
		 
		if (!"".equals(startTime) &&  !"".equals(endTime)){
			sql+=" and STATIS_DATE   >="+ startTime +"  and  STATIS_DATE<="+ endTime ;
		}
		if (!"".equals(ctcd.getRegionName())){
			sql+=" and REGION_NAME='"+ ctcd.getRegionName() +"'";
		}
		if (!"".equals(ctcd.getCountryName())){
			sql+=" and COUNTRY_NAME like '%"+ ctcd.getCountryName() +"%'";
		}
		return sql;
	}
	
	private String getConditionM(String regionName,CustTagCountyM ctcm){
		String sql="";
		String Strcompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		
		if("河北省".equals(regionName)){
			 sql="select STATIS_MONTH,REGION_NAME,COUNTRY_NAME,ACCESS_SUBS_CNT,ACCESS_CNT ,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT , "
			         + " CUSTGROUP_CREATE_CNT,CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn from MK_VGOP.TB_CUST_TAG_COUNTY_M where 1=1  ";
		}else if (Strcompar.indexOf(regionName)>0){
			 sql="select STATIS_MONTH,REGION_NAME,COUNTRY_NAME,ACCESS_SUBS_CNT,ACCESS_CNT ,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT , "
			         + " CUSTGROUP_CREATE_CNT,CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn from MK_VGOP.TB_CUST_TAG_COUNTY_M where REGION_NAME='"+ regionName +"'  ";			
		}else{
			 sql="select STATIS_MONTH,REGION_NAME,COUNTRY_NAME,ACCESS_SUBS_CNT,ACCESS_CNT ,CUSTLIST_DWLN_SUBS_CNT,CUSTLIST_DWLN_CNT,CUSTGROUP_CREATE_SUBS_CNT , "
			         + " CUSTGROUP_CREATE_CNT,CUSTTAG_CREATE_SUBS_CNT,CUSTTAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn from MK_VGOP.TB_CUST_TAG_COUNTY_M where COUNTRY_NAME like '%"+ regionName +"%'  ";			
		}
		
		if (ctcm.getStatisMonth()!=0){
			sql+=" and STATIS_MONTH="+ ctcm.getStatisMonth() +"";
		}
		if (!"".equals(ctcm.getRegionName())){
			sql+=" and REGION_NAME='"+ ctcm.getRegionName() +"'";
		}
		if (!"".equals(ctcm.getCountryName())){
			sql+=" and COUNTRY_NAME like '%"+ ctcm.getCountryName() +"%'";
		}
		return sql;
	}
	
	private List<CustTagCountyM>lctcm(String sql,int pageNo,int pageSize){
		pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		List<Map<String,Object>>  l=pageInfo.getResultList();
		return structureListM( l);
	}
	
	
	private List<CustTagCountyM>lctcm(String sql){
		List<Map<String,Object>>  l=this.getJdbcTemplate().queryForList(sql);
		return structureListM(l);
	}
	
	private List<CustTagCountyM> structureListM(List<Map<String,Object>> lt){
		List<CustTagCountyM> lctcm=new ArrayList<CustTagCountyM>();
		for(Map<String,Object> obj : lt){
			CustTagCountyM ctcmt=new CustTagCountyM();
			ctcmt.setStatisMonth((Integer)obj.get("STATIS_MONTH"));
			ctcmt.setRegionName((String)obj.get("REGION_NAME"));
			ctcmt.setCountryName((String)obj.get("COUNTRY_NAME"));
			ctcmt.setAccessSubsCnt((Integer)obj.get("ACCESS_SUBS_CNT"));
			ctcmt.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
			ctcmt.setCustlistDwlnSubsCnt((Integer)obj.get("CUSTLIST_DWLN_SUBS_CNT"));
			ctcmt.setCustlistDwlnCnt((Integer)obj.get("CUSTLIST_DWLN_CNT"));
			ctcmt.setCustgroupCreateSubsCnt((Integer)obj.get("CUSTGROUP_CREATE_SUBS_CNT"));
			ctcmt.setCustgroupCreateCnt((Integer)obj.get("CUSTGROUP_CREATE_CNT"));
			ctcmt.setCusttagCreateSubsCnt((Integer)obj.get("CUSTTAG_CREATE_SUBS_CNT"));
			ctcmt.setCusttagCreateCnt((Integer)obj.get("CUSTTAG_CREATE_CNT"));
			lctcm.add(ctcmt);
		}
		return lctcm;
		
	}
	
	
	public Pagination getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(Pagination pageInfo) {
		this.pageInfo = pageInfo;
	}

	



}
