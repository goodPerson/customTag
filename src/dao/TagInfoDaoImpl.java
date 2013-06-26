package dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import module.Attr;
import module.CustomTag;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class TagInfoDaoImpl extends JdbcDaoSupport {
	


	public List<CustomTag> listTag(String mes,String name){
		if(mes=="共享标签"||"共享标签".equals(mes)){
			String sql="select tag_id,tag_name,tag_type,create_time,end_time,profile,count_subs,tag_statement,tag_creator,tag_region,is_share from  mk_vgop.tb_customtag_info where tag_type='myTag' and is_share=1  order by "+name+"";
			List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
			List<CustomTag> tagList= new ArrayList<CustomTag>();
			for(Map<String,Object> row:list){
				CustomTag tag= new CustomTag();
				tag.setTag_id((String)row.get("tag_id"));
				tag.setTag_name((String)row.get("tag_name"));
				tag.setTag_type((String)row.get("tag_type"));
				tag.setCreate_time((String)row.get("create_time"));
				tag.setEnd_time((String)row.get("end_time"));
				tag.setProfile((String)row.get("profile"));
				tag.setCount_subs((Integer)row.get("count_subs")); 
				tag.setTag_creator((String)row.get("tag_creator"));
				tag.setTag_statement((String)row.get("tag_statement"));
				tag.setTag_region((String)row.get("tag_region"));
				tag.setIs_share((String)row.get("is_share"));
				tagList.add(tag);
			}
			return tagList;
		}else{
		String sql="select tag_id,tag_name,tag_type,create_time,end_time,profile,count_subs,tag_statement,tag_creator,tag_region,is_share from  mk_vgop.tb_customtag_info where tag_type='"+mes+"'  order by "+name+"";
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		List<CustomTag> tagList= new ArrayList<CustomTag>();
		for(Map<String,Object> row:list){
			CustomTag tag= new CustomTag();
			tag.setTag_id((String)row.get("tag_id"));
			tag.setTag_name((String)row.get("tag_name"));
			tag.setTag_type((String)row.get("tag_type"));
			tag.setCreate_time((String)row.get("create_time"));
			tag.setEnd_time((String)row.get("end_time"));
			tag.setProfile((String)row.get("profile"));
			tag.setCount_subs((Integer)row.get("count_subs"));
			tag.setTag_creator((String)row.get("tag_creator"));
			tag.setTag_statement((String)row.get("tag_statement"));
			tag.setTag_region((String)row.get("tag_region"));
			tag.setIs_share((String)row.get("is_share"));
			tagList.add(tag);
		}
		return tagList;
		}
		
		
	}
	public  void addTag(CustomTag tag){
		try {
			String sql="insert into mk_vgop.tb_customtag_info (TAG_ID,TAG_NAME,TAG_TYPE,TAG_SERV_TYPE,TAG_CLASS,CREATE_TIME,END_TIME,PROFILE,COUNT_SUBS,TAG_STATEMENT,TAG_CREATOR,TAG_REGION,IS_SHARE,TAG_STATUS) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params= new Object[]{tag.getTag_id(),tag.getTag_name(),tag.getTag_type(),"标准标签","普通标签",tag.getCreate_time(),tag.getEnd_time(),tag.getProfile(),tag.getCount_subs(),tag.getTag_statement(),tag.getTag_creator(),tag.getTag_region(),tag.getIs_share(),tag.getTag_status()};
			 this.getJdbcTemplate().update(sql,params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void delTag(String id){
		 String sql="delete from mk_vgop.tb_customtag_info where tag_id =?";
		  this.getJdbcTemplate().update(sql, new Object[]{id});
	}
	
	public void shareTag(String id){
		 String sql="update mk_vgop.tb_customtag_info set is_share=1 where tag_id =?";
		  this.getJdbcTemplate().update(sql, new Object[]{id});
	}
	
	public void renameTag(String name,String id){
		String sql="update mk_vgop.tb_customtag_info set tag_name=? where tag_id=?";
		this.getJdbcTemplate().update(sql, new Object[]{name,id});
	}
	
	public List<Attr> listAtrr(String type1,String type2){
		List<Attr> attrList= new ArrayList<Attr>();
		String sql="";
		if(type1.equals("1")){
			sql="select attr_name,attr_desc,value_type,unit,dim_tab,'1' from MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC where  ATTR_CLASSIFY_one='"+type2+"' order by attr_desc";
		}
		else if(type1.equals("2")){
			sql="select attr_name,attr_desc,value_type,unit,dim_tab,'1' from MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC where attr_desc like '%"+type2+"%'";
		}
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		for(Map<String,Object> row:list){
			Attr attr= new Attr();
			attr.setAttr_id((String)row.get("attr_name"));
			attr.setAttr_name((String)row.get("attr_desc"));
			attr.setAttr_type((String)row.get("value_type"));
			attr.setAttr_unit((String)row.get("unit"));
			attr.setAttr_table((String)row.get("dim_tab"));
			attr.setAttr_is_tab("1");
			attrList.add(attr);
		}
		
		return attrList;
	}
	
	public void saveTag (String tag_sta,String name){
		String sql="update mk_vgop.tb_customtag_info set tag_statement=? where tag_tag=?";
		this.getJdbcTemplate().update(sql, new Object[]{name,tag_sta});
	}

}
