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
	 * 获取区县名称
	 * @param cityName
	 * @return
	 */
	public List<Region> getCountyName(String cityId){
	    String newCityId="";
		String sql="";
		
		if (cityId.equals("1") || cityId.trim().equals("")){	
			 sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where REGION_PARENT_ID='1' and lvl_id=2 and REGION_ID!='999' order by REGION_ID";			 
		}else{
			 newCityId=cityId.substring(0, 3);
			 sql="select REGION_ID, REGION_NAME from MK_VGOP.TB_DIM_REGION where REGION_PARENT_ID like '"+newCityId+"%' and length(region_name)<5 and length(region_id)=6 and REGION_ID!='999'  order by REGION_ID";
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
