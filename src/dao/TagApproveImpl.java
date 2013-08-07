package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;


import module.TagAprove;

public class TagApproveImpl extends JdbcDaoSupport{
	/**
	 * 待处理和已处理标签
	 * @param userId
	 * @param jspmes
	 * @return
	 */
	public List<TagAprove> listtag(String userId,String jspmes){
		String sql="";
//		if (getRole(userId).equals("审批人")){
			if("0".equals(jspmes)){
				 sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state from mk_vgop.tb_tag_approve "+
			                "where (tag_examiner_id='"+userId+"') and tag_state in('0') order by create_time desc";
				}else{
					sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state from mk_vgop.tb_tag_approve "+
			                "where (tag_examiner_id='"+userId+"') and tag_state in('2','3','1') order by create_time desc";	
				}		
		/*
		}else{
			if("0".equals(jspmes)){
				 sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state from mk_vgop.tb_tag_approve "+
			                "where (tag_applyer_id ='"+userId+"' ) and tag_state in('0') order by create_time desc";
				}else{
					sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state from mk_vgop.tb_tag_approve "+
			                "where (tag_applyer_id ='"+userId+"' ) and tag_state in('2','3','1') order by create_time desc";	
				}			
		}
         */
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		List<TagAprove> listtag= new ArrayList<TagAprove>();
		for(Map<String,Object> row:list){
			TagAprove attr= new TagAprove();
			attr.setTag_id((String)row.get("tag_id"));
			attr.setTag_name((String)row.get("tag_name"));
			attr.setTag_applyer((String)row.get("tag_applyer"));
			attr.setCreate_time((String)row.get("create_time"));
			attr.setTag_examiner((String)row.get("tag_examiner"));
			attr.setTag_treater((String)row.get("tag_treater"));
			if("0".equals((String)row.get("tag_state"))){
				attr.setTag_state("待审批");
			}else if("1".equals((String)row.get("tag_state"))){
				attr.setTag_state("待生成标签");
			}else if("2".equals((String)row.get("tag_state"))){
				attr.setTag_state("已退回");
			}else if ("3".equals((String)row.get("tag_state"))){
				attr.setTag_state("已发布");
			}
			listtag.add(attr);
		}
		return listtag;
	}
	/**
	 * 我的标签
	 * @param userId
	 * @return
	 */
	public List<TagAprove> myListtag(String userId){
		String	sql="";
//		if (getRole(userId).equals("审批人")){
		/*
				sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state from mk_vgop.tb_tag_approve "+
	                "where ( tag_examiner_id='"+userId+"')  order by create_time desc";	
		
		}else{*/
				sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state from mk_vgop.tb_tag_approve "+
	                "where (tag_applyer_id ='"+userId+"' )  order by create_time desc";		
		/*
		}
        */
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		List<TagAprove> listtag= new ArrayList<TagAprove>();
		for(Map<String,Object> row:list){
			TagAprove attr= new TagAprove();
			attr.setTag_id((String)row.get("tag_id"));
			attr.setTag_name((String)row.get("tag_name"));
			attr.setTag_applyer((String)row.get("tag_applyer"));
			attr.setCreate_time((String)row.get("create_time"));
			attr.setTag_examiner((String)row.get("tag_examiner"));
			attr.setTag_treater((String)row.get("tag_treater"));
			if("0".equals((String)row.get("tag_state"))){
				attr.setTag_state("待审批");
			}else if("1".equals((String)row.get("tag_state"))){
				attr.setTag_state("待生成标签");
			}else if("2".equals((String)row.get("tag_state"))){
				attr.setTag_state("已退回");
			}else if ("3".equals((String)row.get("tag_state"))){
				attr.setTag_state("已发布");
			}
			listtag.add(attr);
		}
		return listtag;
	}
	/**
	 * 获取角色
	 * @param userId
	 * @return
	 */
	public String getRole(String userId){
		String sql="select USER_ROLE from MK_VGOP.TB_APPROVER_INFO where USER_ID='"+ userId +"'";
		return this.getJdbcTemplate().queryForObject(sql, String.class);
	}
}
