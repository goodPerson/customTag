package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import module.Attr;
import module.CustomTag;
import module.MainTag;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class MainTagDaoImpl extends JdbcDaoSupport{
	
	public List<MainTag> listTag_bak(int serv_type,String serv_name){
		
		String sql="select tag_id,tag_name,tag_type,tag_serv_type,tag_class,create_time,end_time,profile,count_subs,tag_statement,tag_creator,tag_region,tag_status,tag_url,is_used  from MK_VGOP.TB_CUSTOMTAG_INFO  ";		
		switch(serv_type)
		{
		case 1: //业务类
			//if(serv_name.equals("GPRS流量")){
            // sql+=" where tag_type='GPRS套餐'  order by tag_class,is_share";}
			//else{sql+=" where tag_type='增值业务类' and TAG_SERV_TYPE='"+serv_name+"'  order by tag_class,is_share";}
			sql+=" where tag_type='业务特征' and TAG_SERV_TYPE='"+serv_name+"'  order by tag_class,is_share";
			break;
		case 6://偏好类
			sql+="where TAG_TYPE='消费价值特征' order by TAG_SERV_TYPE,is_share";
			break;
		case 2://事件类
			sql+="where TAG_TYPE='渠道偏好' order by TAG_SERV_TYPE,is_share";
			break;
		case 3://终端类
			sql+="where TAG_TYPE='终端偏好'  order by TAG_SERV_TYPE,is_share";
			break;
		case 4://身份类
			sql+="where TAG_TYPE='互联网内容偏好'  order by TAG_SERV_TYPE,is_share";
			break;	
		case 5://价值类
			sql+="where TAG_TYPE='服务偏好'  order by TAG_SERV_TYPE,is_share";
			break;			
		case 0://交往圈类
			sql+="where TAG_TYPE='基本属性'  order by TAG_SERV_TYPE,is_share";
			break;	
		case 7://语音类
			sql+="where TAG_TYPE='营销活动偏好'  order by TAG_SERV_TYPE,is_share";
			break;	
		case 8://位置类
			sql+="where TAG_TYPE='基本属性'  order by TAG_SERV_TYPE,is_share";
			break;			
			
		}
			List<Map<String,Object>> list= this.getJdbcTemplate().queryForList(sql);
			List<MainTag> tagList= new ArrayList<MainTag>();
			for(Map<String,Object> row:list){
				MainTag tag= new MainTag();
				tag.setTag_id((String)row.get("tag_id"));
				tag.setTag_name((String)row.get("tag_name"));
				tag.setTag_type((String)row.get("tag_type"));
				tag.setTag_serv_type((String)row.get("tag_serv_type"));
				tag.setTag_class((String)row.get("tag_class"));
				tag.setCreate_time((String)row.get("create_time"));
				tag.setEnd_time((String)row.get("end_time"));
				tag.setProfile((String)row.get("profile"));
				tag.setCount_subs((Integer)row.get("count_subs")); 
				tag.setTag_creator((String)row.get("tag_creator"));
				tag.setTag_statement((String)row.get("tag_statement"));
				tag.setTag_region((String)row.get("tag_region"));
				tag.setIs_share((String)row.get("is_share"));
				tag.setTag_url((String)row.get("tag_url"));
				tag.setIs_used((String)row.get("is_used"));
				tagList.add(tag);
		}
			return tagList;
	}
	
public List<MainTag> listTag(int serv_type,String serv_name,String regionId){
		
		String sql="select a.tag_id,a.tag_name,a.tag_type,a.tag_serv_type,a.tag_class,a.create_time,a.end_time,"
                          +" a.profile,a.count_subs,a.tag_statement,a.tag_creator,a.tag_region,a.tag_status,a.tag_url,a.is_used,"
			              +" b.SUBS_CNT,b.REGION_NAME,b.PARENT_REGION_ID,b.REGION_ID"
                          +" from MK_VGOP.TB_CUSTOMTAG_INFO a, MK_VGOP.TB_CUST_TAG_SUBS_NUM_MON b where a.TAG_ID=b.TAG_ID ";		
//		and b.PARENT_REGION_ID='1' and a.TAG_ID='IS_TX_SILENT_USER';
		switch(serv_type)
		{
		case 1: //业务类
			//if(serv_name.equals("GPRS流量")){
            // sql+=" where tag_type='GPRS套餐'  order by tag_class,is_share";}
			//else{sql+=" where tag_type='增值业务类' and TAG_SERV_TYPE='"+serv_name+"'  order by tag_class,is_share";}
			sql+=" and a.tag_type='业务特征' and a.TAG_SERV_TYPE='"+serv_name+"' and b.REGION_ID='"+ regionId +"'  order by a.tag_class,a.is_share";
			break;
		case 6://偏好类
			sql+="and a.TAG_TYPE='消费价值特征' and b.REGION_ID='"+ regionId +"'  order by a.TAG_SERV_TYPE,a.is_share";
			break;
		case 2://事件类
			sql+="and a.TAG_TYPE='渠道偏好' and b.REGION_ID='"+ regionId +"' order by a.TAG_SERV_TYPE,a.is_share";
			break;
		case 3://终端类
			sql+="and a.TAG_TYPE='终端偏好' and b.REGION_ID='"+ regionId +"'  order by a.TAG_SERV_TYPE,a.is_share";
			break;
		case 4://身份类
			sql+="and a.TAG_TYPE='互联网内容偏好' and b.REGION_ID='"+ regionId +"'  order by a.TAG_SERV_TYPE,a.is_share";
			break;	
		case 5://价值类
			sql+="and a.TAG_TYPE='服务偏好' and b.REGION_ID='"+ regionId +"'  order by a.TAG_SERV_TYPE,a.is_share";
			break;			
		case 0://交往圈类
			sql+="and a.TAG_TYPE='基本属性' and b.REGION_ID='"+ regionId +"'  order by a.TAG_SERV_TYPE,a.is_share";
			break;	
		case 7://语音类
			sql+="and TAG_TYPE='营销活动偏好' and b.REGION_ID='"+ regionId +"'  order by a.TAG_SERV_TYPE,a.is_share";
			break;	
		case 8://位置类
			sql+="and a.TAG_TYPE='基本属性' and b.REGION_ID='"+ regionId +"'  order by a.TAG_SERV_TYPE,a.is_share";
			break;			
			
		}
			List<Map<String,Object>> list= this.getJdbcTemplate().queryForList(sql);
			List<MainTag> tagList= new ArrayList<MainTag>();
			for(Map<String,Object> row:list){
				MainTag tag= new MainTag();
				tag.setTag_id((String)row.get("tag_id"));
				tag.setTag_name((String)row.get("tag_name"));
				tag.setTag_type((String)row.get("tag_type"));
				tag.setTag_serv_type((String)row.get("tag_serv_type"));
				tag.setTag_class((String)row.get("tag_class"));
				tag.setCreate_time((String)row.get("create_time"));
				tag.setEnd_time((String)row.get("end_time"));
				tag.setProfile((String)row.get("profile"));
				tag.setCount_subs((Integer)row.get("count_subs")); 
				tag.setTag_creator((String)row.get("tag_creator"));
				tag.setTag_statement((String)row.get("tag_statement"));
				tag.setTag_region((String)row.get("tag_region"));
				tag.setIs_share((String)row.get("is_share"));
				tag.setTag_url((String)row.get("tag_url"));
				tag.setIs_used((String)row.get("is_used"));
				tag.setSubsCnt((Integer)row.get("SUBS_CNT"));
				tagList.add(tag);
		}
			return tagList;
	}
	/*获取各地区、区县的数据*/
	public List<MainTag> listRegionData(String regionId, String tagId){
		String sql="select 	b.SUBS_CNT,b.REGION_NAME,b.REGION_ID,b.TAG_ID,a.tag_name"
                          +" from MK_VGOP.TB_CUSTOMTAG_INFO a, MK_VGOP.TB_CUST_TAG_SUBS_NUM_MON b" 
                          +" where a.TAG_ID=b.TAG_ID and b.PARENT_REGION_ID='"+ regionId +"' and a.TAG_ID='"+ tagId +"' order by b.SUBS_CNT desc";
		List<Map<String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		List<MainTag> listRegionData=new ArrayList<MainTag>();
		for(Map<String,Object> obj: listTemp){
			MainTag mt=new MainTag();
			mt.setRegionName((String)obj.get("REGION_NAME"));
			mt.setSubsCnt((Integer)obj.get("SUBS_CNT"));
			mt.setRegionId((String)obj.get("REGION_ID"));
			mt.setTag_id((String)obj.get("TAG_ID"));
			mt.setTag_name((String)obj.get("tag_name"));
			listRegionData.add(mt);
		}
		
		return listRegionData;		
	}
	
	public int getMonth(){
		String sql="select DATE_VALUE from  MK_VGOP.TB_CUV_CUST_VIEW_SHOW_DATE where DATE_TYPE='月'";
		return (int)getJdbcTemplate().queryForInt(sql) ;
	}
		
		


}
