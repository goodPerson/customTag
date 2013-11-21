package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.Region;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class RegionDaoImpl extends JdbcDaoSupport {
  /**
   * 获取城市名称
   * @return
   */
	public List<Region> getCityRegionName(String region_id){
		String sql="";
		if(region_id.equals("1")){
			 sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where REGION_PARENT_ID='1' and REGION_ID!='999' order by REGION_ID desc";
			}
		else{
			 sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where region_id='"+region_id+"' and REGION_ID!='999' order by REGION_ID desc";
		}
		List<Map <String,Object>> listCity=getJdbcTemplate().queryForList(sql);
		int listCitySize=listCity.size();
		ArrayList<Region> listCityName=new ArrayList<Region>();				
	//	for (Map<String,Object> rows: listCity){
		for (int i=0; i<listCitySize;i++){			
		 Map<String ,Object> rows=listCity.get(i);
		  Region region=new Region();
		  region.setRegion_id((String)rows.get("REGION_ID"));
		  region.setRegion_name((String)rows.get("REGION_NAME"));
		  listCityName.add(region);			
		}		
		listCityName.trimToSize();
		return listCityName;
	}
	/**
	 * 查询地域级别
	 */
	public int  getlvl (String regionId){
		String sql ="select LVL_ID from MK_VGOP.TB_DIM_REGION WHERE REGION_ID = '"+regionId+"'";
		return (int)getJdbcTemplate().queryForInt(sql);
		
	}
	/**
	 * 获取区县名称
	 * @param cityName
	 * @return
	 */
	public List<Region> getCountyName(String cityId,int lvl_id){
	    String newCityId="";
		String sql="";
		if(lvl_id!=3){
		if (cityId.equals("1") || cityId.trim().equals("")){	
			 sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where REGION_PARENT_ID='1' and lvl_id='2' and REGION_ID!='999' order by REGION_ID";			 
		}else{
			 newCityId=cityId.substring(0, 3);
			 sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where REGION_ID like '"+newCityId+"%' and REGION_ID NOT LIKE '%999'  order by REGION_ID";
		}}else{
			 sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where REGION_ID ='"+cityId+"' and REGION_ID NOT LIKE '%999' ";
		}
		//and length(region_name)<5 and length(region_id)=6 
		List<Map<String,Object>> listCounty=getJdbcTemplate().queryForList(sql);
		List<Region> listCountyName = new ArrayList<Region>();
		for (Map <String, Object> rows: listCounty){
			    Region region=new Region();
				region.setRegion_id((String)rows.get("REGION_ID"));
				region.setRegion_name((String)rows.get("REGION_NAME"));
				listCountyName.add(region);
		}
		return listCountyName;
	}
	/*
	 * 获取下载地域
	 * 
	 */
	public List<Region> getDownName(String regionId,int lvl_id){
		String sql="";
		if(lvl_id!=3){
		if(regionId.equals("1")){
			 sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where REGION_PARENT_ID='1' and REGION_ID!='999' order by REGION_ID desc";
			}
		else{
			 sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where REGION_ID like '"+regionId.substring(0,3)+"%' and REGION_ID NOT LIKE '%999' order by REGION_ID ";
		}}else{
			sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where REGION_ID ='"+regionId+"' and REGION_ID NOT LIKE '%999' ";
		}
		List<Map<String,Object>> listCounty=getJdbcTemplate().queryForList(sql);
		List<Region> listCountyName = new ArrayList<Region>();
		for (Map <String, Object> rows: listCounty){
			    Region region=new Region();
				region.setRegion_id((String)rows.get("REGION_ID"));
				region.setRegion_name((String)rows.get("REGION_NAME"));
				listCountyName.add(region);
		}
		return listCountyName;
	}
	
}
