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
	
	public List<MainTag> listTag(int serv_type,String serv_name){
		
		String sql="select tag_id,tag_name,tag_type,tag_serv_type,tag_class,create_time,end_time,profile,count_subs,tag_statement,tag_creator,tag_region,tag_status,tag_url  from MK_VGOP.TB_CUSTOMTAG_INFO  ";		
		switch(serv_type)
		{
		case 0: //业务类
			//if(serv_name.equals("GPRS流量")){
            // sql+=" where tag_type='GPRS套餐'  order by tag_class,is_share";}
			//else{sql+=" where tag_type='增值业务类' and TAG_SERV_TYPE='"+serv_name+"'  order by tag_class,is_share";}
			sql+=" where tag_type='增值业务类' and TAG_SERV_TYPE='"+serv_name+"'  order by tag_class,is_share";
			break;
		case 1://偏好类
			sql+="where TAG_TYPE='偏好类' order by TAG_SERV_TYPE,is_share";
			break;
		case 2://事件类
			sql+="where TAG_TYPE='事件' order by TAG_SERV_TYPE,is_share";
			break;
		case 3://终端类
			sql+="where TAG_TYPE='终端类'  order by TAG_SERV_TYPE,is_share";
			break;
		case 4://身份类
			sql+="where TAG_TYPE='客户身份'  order by TAG_SERV_TYPE,is_share";
			break;	
		case 5://价值类
			sql+="where TAG_TYPE='价值类'  order by TAG_SERV_TYPE,is_share";
			break;			
		case 6://交往圈类
			sql+="where TAG_TYPE='交往圈'  order by TAG_SERV_TYPE,is_share";
			break;	
		case 7://语音类
			sql+="where TAG_TYPE='语音业务类'  order by TAG_SERV_TYPE,is_share";
			break;	
		case 8://位置类
			sql+="where TAG_TYPE='位置类'  order by TAG_SERV_TYPE,is_share";
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
				tagList.add(tag);
		}
			return tagList;
	}
		
		


}
