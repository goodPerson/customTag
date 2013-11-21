package dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class TagApproveDaoImpl extends JdbcDaoSupport {
     public boolean addTagApprove(String tag_id,String tag_name,String tag_applyer,String tag_applyer_id,String create_time,String tag_examiner,String tag_examiner_id,String tag_state){
    	 String sql="insert into MK_VGOP.TB_TAG_APPROVE (TAG_ID,TAG_NAME,TAG_APPLYER,TAG_APPLYER_ID,CREATE_TIME,TAG_EXAMINER,TAG_EXAMINER_ID,TAG_STATE) " 
    	 		  +" values (?,?,?,?,?,?,?,?)";
    	 Object[] objects=new Object[]{tag_id,tag_name,tag_applyer,tag_applyer_id,create_time,tag_examiner,tag_examiner_id,tag_state};
    	 if (this.getJdbcTemplate().update(sql, objects)>0){
    		 return true;
    	 }else{
    		 return false;
    	 }
     }

     public boolean updateTagApprove(String tag_id,String state,String remark){
    	 String sql="update MK_VGOP.TB_TAG_APPROVE set tag_state='"+state+"', TAG_APPROVE_REMARK='"+ remark +"'  where TAG_ID='"+tag_id+"'";
    	if ( this.getJdbcTemplate().update(sql)>0)   
    	     return true;
    	return false;
     }
     
     public String getState(String req_id){
    	 String sql="select tag_state from MK_VGOP.TB_TAG_APPROVE where tag_id='"+req_id+"'";    	 
    	 return this.getJdbcTemplate().queryForObject(sql,String.class);    	 
     }
}
