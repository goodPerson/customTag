package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import module.CustomGroup;
import module.CustomTag;
import module.MainTag;

public class TagOperateImpl extends JdbcDaoSupport{
	
	public List<CustomGroup> listTag(String custom_type ,String name,String userId ){
		String sql="";
		if("我的客户群".equals(custom_type) || custom_type=="我的客户群"){
		 sql="select tag_id,tag_name,tag_type,create_time,end_time,profile,count_subs,tag_statement,tag_creator,tag_region,is_share,tag_status,custlist_path from  mk_vgop.tb_customgroup_info where tag_creator_id='"+userId+"'  order by "+name+" desc ";
		}else{
		 sql="select tag_id,tag_name,tag_type,create_time,end_time,profile,count_subs,tag_statement,tag_creator,tag_region,is_share,tag_status,custlist_path from  mk_vgop.tb_customgroup_info where tag_region='"+custom_type+"' order by "+name+" desc ";
		}
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		List<CustomGroup> tagList= new ArrayList<CustomGroup>();
		for(Map<String,Object> row:list){
			CustomGroup tag= new CustomGroup();
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
			if("0".equals((String)row.get("tag_status"))){
				tag.setTag_status("新建");
			}else if ("1".equals((String)row.get("tag_status"))){
				tag.setTag_status("生成名单中");
			}
			else{
				//System.out.println(row.get("tag_status"));
				tag.setTag_status("已生成名单");
			}
			tag.setCustlist_path((String)row.get("custlist_path"));
			tagList.add(tag);
		}
		return tagList;	
		
	}
	
	public  void addTag(CustomGroup tag){
		try {
			String sql="insert into mk_vgop.tb_customgroup_info values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params= new Object[]{tag.getTag_id(),tag.getTag_name(),tag.getTag_type(),tag.getTag_serv_type(),tag.getTag_class(),tag.getCreate_time(),tag.getEnd_time(),tag.getProfile(),tag.getCount_subs(),tag.getTag_statement(),tag.getTag_creator(),tag.getTag_creator_id(),tag.getTag_region(),tag.getIs_share(),tag.getTag_status(),tag.getTag_tec_stamt(),tag.getCustlist_path()};
			 this.getJdbcTemplate().update(sql,params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public void delTag(String id){
		 String sql="delete from mk_vgop.tb_customgroup_info where tag_id =?";
		  this.getJdbcTemplate().update(sql, new Object[]{id});
	}
	
	public void shareTag(String id){
		 String sql="update mk_vgop.tb_customgroup_info set is_share=1 where tag_id =?";
		  this.getJdbcTemplate().update(sql, new Object[]{id});
	}
	
	public void renameTag(String name,String id){
		String sql="update mk_vgop.tb_customgroup_info set tag_name=? where tag_id=?";
		this.getJdbcTemplate().update(sql, new Object[]{name,id});
	}

}
