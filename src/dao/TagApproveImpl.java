package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.Pagination;


import module.TagAprove;

public class TagApproveImpl extends JdbcDaoSupport{
	private Pagination pageInfo;
	public List<TagAprove> listtag(String userId,String jspmes){
		String sql="";
		if(!"0".equalsIgnoreCase(jspmes)){
			sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state from mk_vgop.tb_tag_approve "+
	                "where (tag_applyer_id ='"+userId+"' or tag_examiner_id='"+userId+"') and tag_state in('2','3')";	
		}else{

			sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state from mk_vgop.tb_tag_approve "+
	                "where (tag_applyer_id ='"+userId+"' or tag_examiner_id='"+userId+"') and tag_state in('0','1')";
		}
		List<Map<String,Object>> list= this.getJdbcTemplate().queryForList(sql);
		//List<Map<String,Object>> list=this.getJdbcTemplate().queryForList(sql);
		List<TagAprove> listtag= new ArrayList<TagAprove>();
		if (list!=null){
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
		}
		
		return listtag;
	}

	public List<TagAprove> listtagPage(String userId,String jspmes,int pageNo,int pageSize){
		String sql="";
		if(!"0".equalsIgnoreCase(jspmes)){
			sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state,rownumber() over(ORDER BY create_time desc) AS rn from mk_vgop.tb_tag_approve "+
	                "where (tag_applyer_id ='"+userId+"' or tag_examiner_id='"+userId+"') and tag_state in('2','3') order by create_time desc";	
		}else{

			sql="select tag_id,tag_name,tag_applyer,create_time,tag_examiner,tag_treater,tag_state,rownumber() over(ORDER BY create_time desc) AS rn from mk_vgop.tb_tag_approve "+
	                "where (tag_applyer_id ='"+userId+"' or tag_examiner_id='"+userId+"') and tag_state in('0','1')  order by create_time desc";
		}
		 pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		List<Map<String,Object>> list= pageInfo.getResultList();
		//List<Map<String,Object>> list=this.getJdbcTemplate().queryForList(sql);
		List<TagAprove> listtag= new ArrayList<TagAprove>();
		if (list!=null){
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
		}
		
		return listtag;
	}

	public Pagination getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(Pagination pageInfo) {
		this.pageInfo = pageInfo;
	}

}
