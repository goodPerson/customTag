package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.Pagination;

import module.TagSubsDayDetail;
import module.TagSubsMonthDetail;
import dao.Idao.ITagSubsDetail;

public class TagSubsDetImpl extends JdbcDaoSupport implements ITagSubsDetail {
	private Pagination pageInfo;
	public List<TagSubsMonthDetail> getListTsmd(String regionName,TagSubsMonthDetail tsmd,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		String sql="";
		String Strcompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		if("河北省".equals(regionName)){
			sql="select STATIS_MONTH,USER_ID,USER_NAME ,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn "
                    +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where 1=1";
		}else if (Strcompar.indexOf(regionName)>0){
			sql="select STATIS_MONTH,USER_ID,USER_NAME ,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn "
                    +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where REGION_NAME='"+ regionName +"'";
			
		}else{
			sql="select STATIS_MONTH,USER_ID,USER_NAME ,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn "
                    +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where COUNTRY_NAME like '%"+ regionName +"%'";
		}		
		           sql=sql+getMonthCondition( tsmd);
		return getListMDetail( tsmd, sql,pageNo,pageSize);
	}
	
	
	public List<TagSubsMonthDetail> getListTsmd(String regionName,
			TagSubsMonthDetail tsmd) {
		// TODO Auto-generated method stub
		String sql="";
		String Strcompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		if("河北省".equals(regionName)){
			sql="select STATIS_MONTH,USER_ID,USER_NAME ,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn "
                    +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where 1=1";
		}else if (Strcompar.indexOf(regionName)>0){
			sql="select STATIS_MONTH,USER_ID,USER_NAME ,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn "
                    +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where REGION_NAME='"+ regionName +"'";
			
		}else{
			sql="select STATIS_MONTH,USER_ID,USER_NAME ,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_MONTH desc) AS rn "
                    +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where COUNTRY_NAME like '%"+ regionName +"%'";
		}		
		           sql=sql+getMonthCondition( tsmd);
		return getListMDetail( tsmd, sql);
	}

	public List<TagSubsDayDetail> getListTsdd(String regionName,String startTime, String endTime ,TagSubsDayDetail tsdd,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		String sql="";
		String Strcompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		if("河北省".equals(regionName)){
			sql="select STATIS_DATE,USER_ID,USER_NAME,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_DATE desc) AS rn "
			          +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where 1=1 ";
		}else if (Strcompar.indexOf(regionName)>0){
			sql="select STATIS_DATE,USER_ID,USER_NAME,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_DATE desc) AS rn "
			          +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where REGION_NAME='"+ regionName +"' ";
		}else{
			sql="select STATIS_DATE,USER_ID,USER_NAME,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_DATE desc) AS rn "
			          +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where COUNTRY_NAME like '%"+ regionName +"%' ";
		}
		           
		           sql+=getDayCondition(startTime,endTime,tsdd);
		return getListDDetail( tsdd, sql,pageNo,pageSize);
	}
	
	
	public List<TagSubsDayDetail> getListTsdd(String regionName,
			String startTime, String endTime, TagSubsDayDetail tsdd) {
		// TODO Auto-generated method stub
		String sql="";
		String Strcompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		if("河北省".equals(regionName)){
			sql="select STATIS_DATE,USER_ID,USER_NAME,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_DATE desc) AS rn "
			          +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where 1=1 ";
		}else if (Strcompar.indexOf(regionName)>0){
			sql="select STATIS_DATE,USER_ID,USER_NAME,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_DATE desc) AS rn "
			          +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where REGION_NAME='"+ regionName +"' ";
		}else{
			sql="select STATIS_DATE,USER_ID,USER_NAME,REGION_NAME,COUNTRY_NAME,ACCESS_CNT,DOWNLOAD_CNT,GROUP_CREATE_CNT,TAG_CREATE_CNT,rownumber() over(ORDER BY STATIS_DATE desc) AS rn "
			          +" from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where COUNTRY_NAME like '%"+ regionName +"%' ";
		}
		           
		    sql+=getDayCondition(startTime,endTime,tsdd);
		return  getListDDetail( tsdd, sql);
	}
	
	public List<Map<String, Object>> getUserName(String regionName) {
		// TODO Auto-generated method stub
		String sql="";
		String Strcompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		if("河北省".equals(regionName)){
			sql="select distinct USER_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where USER_NAME!='' order by  USER_NAME desc ";
		}else{
			if (Strcompar.indexOf(regionName)>0){
				sql="select distinct USER_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where USER_NAME!='' and  REGION_NAME =  '"+ regionName +"' order by  USER_NAME desc ";
			}else{
				sql="select distinct USER_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where USER_NAME!='' and  COUNTRY_NAME like  '%"+ regionName +"%' order by  USER_NAME desc ";
			}
		}
		
		List<Map <String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		return listTemp;
	}
	
	private String getMonthCondition(TagSubsMonthDetail tsmd){
		String sql="";
		if (tsmd.getStatisMonth()!=0){
		        sql+=" and STATIS_MONTH="+tsmd.getStatisMonth();
		}
		if (!"".equals(tsmd.getRegionName())){
				sql+=" and REGION_NAME='"+ tsmd.getRegionName() +"'";
		}
		if(!"".equals(tsmd.getCountryName())){
				sql+=" and COUNTRY_NAME like '%"+ tsmd.getCountryName()  +"%'";
		}
		if (!"".equals(tsmd.getUserName())){
				sql+=" and USER_NAME='"+ tsmd.getUserName() +"'";
		}
		return sql;
	}

	
	private List<TagSubsMonthDetail> getListMDetail(TagSubsMonthDetail tsmd,String sql,int pageNo,int pageSize){
		pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		List<Map<String,Object>> tempList=pageInfo.getResultList();
		List<TagSubsMonthDetail> listTsmd=new ArrayList<TagSubsMonthDetail>();
		for(Map<String,Object> obj:tempList){
				TagSubsMonthDetail tsd=new TagSubsMonthDetail();
				tsd.setStatisMonth((Integer)obj.get("STATIS_MONTH"));
				tsd.setUserId((String)obj.get("USER_ID"));
				tsd.setUserName((String)obj.get("USER_NAME"));
				tsd.setRegionName((String)obj.get("REGION_NAME"));
				tsd.setCountryName((String)obj.get("COUNTRY_NAME"));
				tsd.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
				tsd.setDownloadCnt((Integer)obj.get("DOWNLOAD_CNT"));
				tsd.setGroupCreateCnt((Integer)obj.get("GROUP_CREATE_CNT"));
				tsd.setTagCreateCnt((Integer)obj.get("TAG_CREATE_CNT"));
				listTsmd.add(tsd);
				
		}
	
		return listTsmd;
	}
   
	private List<TagSubsMonthDetail> getListMDetail(TagSubsMonthDetail tsmd,String sql){
		List<Map<String,Object>> tempList=this.getJdbcTemplate().queryForList(sql);
		List<TagSubsMonthDetail> listTsmd=new ArrayList<TagSubsMonthDetail>();
		for(Map<String,Object> obj:tempList){
				TagSubsMonthDetail tsd=new TagSubsMonthDetail();
				tsd.setStatisMonth((Integer)obj.get("STATIS_MONTH"));
				tsd.setUserId((String)obj.get("USER_ID"));
				tsd.setUserName((String)obj.get("USER_NAME"));
				tsd.setRegionName((String)obj.get("REGION_NAME"));
				tsd.setCountryName((String)obj.get("COUNTRY_NAME"));
				tsd.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
				tsd.setDownloadCnt((Integer)obj.get("DOWNLOAD_CNT"));
				tsd.setGroupCreateCnt((Integer)obj.get("GROUP_CREATE_CNT"));
				tsd.setTagCreateCnt((Integer)obj.get("TAG_CREATE_CNT"));
				listTsmd.add(tsd);
				
		}
	
		return listTsmd;
	}
	private String getDayCondition(String startTime, String endTime ,TagSubsDayDetail tsdd){
		String sql="";
		if (!"".equals(startTime) && !"".equals(endTime)  ){
		        sql+=" and STATIS_DATE >="+startTime+" and STATIS_DATE<="+endTime ;
		}
		if (!"".equals(tsdd.getRegionName())){
				sql+=" and REGION_NAME='"+ tsdd.getRegionName() +"'";
		}
		if(!"".equals(tsdd.getCountryName())){
				sql+=" and COUNTRY_NAME like '%"+ tsdd.getCountryName()  +"%'";
		}
		if (!"".equals(tsdd.getUserName())){
				sql+=" and USER_NAME='"+ tsdd.getUserName() +"'";
		}
		return sql;
	}

	private List<TagSubsDayDetail> getListDDetail(TagSubsDayDetail tsdd,String sql,int pageNo,int pageSize){
		pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		List<Map<String,Object>> tempList=pageInfo.getResultList();
		List<TagSubsDayDetail> listTsdd=new ArrayList<TagSubsDayDetail>();
		for(Map<String,Object> obj:tempList){
			TagSubsDayDetail tdd=new TagSubsDayDetail();
				tdd.setStatisDate((Integer)obj.get("STATIS_DATE"));
				tdd.setUserId((String)obj.get("USER_ID"));
				tdd.setUserName((String)obj.get("USER_NAME"));
				tdd.setRegionName((String)obj.get("REGION_NAME"));
				tdd.setCountryName((String)obj.get("COUNTRY_NAME"));
				tdd.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
				tdd.setDownloadCnt((Integer)obj.get("DOWNLOAD_CNT"));
				tdd.setGroupCreateCnt((Integer)obj.get("GROUP_CREATE_CNT"));
				tdd.setTagCreateCnt((Integer)obj.get("TAG_CREATE_CNT"));
				listTsdd.add(tdd);
		}
		return listTsdd;
	}
	
		
	private List<TagSubsDayDetail> getListDDetail(TagSubsDayDetail tsdd,String sql){
		List<Map<String,Object>> tempList=this.getJdbcTemplate().queryForList(sql);
		List<TagSubsDayDetail> listTsdd=new ArrayList<TagSubsDayDetail>();
		for(Map<String,Object> obj:tempList){
			TagSubsDayDetail tdd=new TagSubsDayDetail();
				tdd.setStatisDate((Integer)obj.get("STATIS_DATE"));
				tdd.setUserId((String)obj.get("USER_ID"));
				tdd.setUserName((String)obj.get("USER_NAME"));
				tdd.setRegionName((String)obj.get("REGION_NAME"));
				tdd.setCountryName((String)obj.get("COUNTRY_NAME"));
				tdd.setAccessCnt((Integer)obj.get("ACCESS_CNT"));
				tdd.setDownloadCnt((Integer)obj.get("DOWNLOAD_CNT"));
				tdd.setGroupCreateCnt((Integer)obj.get("GROUP_CREATE_CNT"));
				tdd.setTagCreateCnt((Integer)obj.get("TAG_CREATE_CNT"));
				listTsdd.add(tdd);
		}
		return listTsdd;
	}

	public List<Map<String, Object>> getCountyName(String countyName) {
		// TODO Auto-generated method stub
		String sql="";
		String strCompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		if("河北省".equals(countyName)){
			sql="select REPLACE(COUNTRY_NAME,'分公司','') as COUNTRY_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M group by COUNTRY_NAME";
		}else{
			if(strCompar.indexOf(strCompar)>0){
				sql="select REPLACE(COUNTRY_NAME,'分公司','') as COUNTRY_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where REGION_NAME  like  '%"+ countyName +"%' group by COUNTRY_NAME";
			}else{
				sql="select REPLACE(COUNTRY_NAME,'分公司','') as COUNTRY_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_M where COUNTRY_NAME  like  '%"+ countyName +"%' group by COUNTRY_NAME";
			}
		}
		
		List<Map <String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		return listTemp;
	}
	
	public List<Map<String, Object>> getUserNameD(String regionName) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String sql="";
		String Strcompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		if("河北省".equals(regionName)){
			sql="select distinct USER_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where USER_NAME!='' order by  USER_NAME desc ";
		}else{
			if (Strcompar.indexOf(regionName)>0){
				sql="select distinct USER_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where USER_NAME!='' and  REGION_NAME =  '"+ regionName +"' order by  USER_NAME desc ";
			}else{
				sql="select distinct USER_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where USER_NAME!='' and  COUNTRY_NAME like  '%"+ regionName +"%' order by  USER_NAME desc ";
			}
		}
		
		List<Map <String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		return listTemp;
	}

	public List<Map<String, Object>> getCountyNameD(String countyName) {
		// TODO Auto-generated method stub
		String sql="";
		String strCompar="石家庄 唐山 秦皇岛 保定 廊坊 张家口 承德 衡水 沧州 邢台 邯郸";
		if("河北省".equals(countyName)){
			sql="select REPLACE(COUNTRY_NAME,'分公司','') as COUNTRY_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D group by COUNTRY_NAME";
		}else{
			if(strCompar.indexOf(strCompar)>0){
				sql="select REPLACE(COUNTRY_NAME,'分公司','') as COUNTRY_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where REGION_NAME  like  '%"+ countyName +"%' group by COUNTRY_NAME";
			}else{
				sql="select REPLACE(COUNTRY_NAME,'分公司','') as COUNTRY_NAME from MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D where COUNTRY_NAME  like  '%"+ countyName +"%' group by COUNTRY_NAME";
			}
		}
		
		List<Map <String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		return listTemp;
	}
	
	public Pagination getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(Pagination pageInfo) {
		this.pageInfo = pageInfo;
	}





	
}
