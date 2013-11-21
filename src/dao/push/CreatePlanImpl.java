package dao.push;

import module.push.PlanInfo;
import module.push.UploadInfo;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class CreatePlanImpl extends JdbcDaoSupport{
	
	public void addUpload(UploadInfo upload){
		String sql="insert into MK_VGOP.TB_UPLOAD_CUST_INFO (PLAN_ID,CREATOR,FILE_NAME,UPLOAD_FILE_NAME,UPLOAD_TIME) VALUES (?,?,?,?,?) ";
		Object[] params= new Object[]{upload.getPlanid(),upload.getCreateid(),upload.getFilename(),upload.getUploadfilename(),upload.getUploadtime()};
		this.getJdbcTemplate().update(sql,params);
	}
	
	public int addPlan(PlanInfo plan){
		int i=0;
		try {
			String sql="insert into MK_VGOP.TB_MARK_PLAN_BASIC_INFO values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params= new Object[]{plan.getPlanid(),plan.getPlanname(),plan.getPlanregionid(),plan.getPlanregionname(),plan.getStarttime(),plan.getEndtime(),plan.getPushtime(),plan.getCusttype(),plan.getTargetcustid(),plan.getPushchanlid(),plan.getProducttype(),plan.getProductid(),plan.getSpenterpriseid(),plan.getSpserved(),plan.getFavid(),plan.getCreaterid(),plan.getCreatername(),plan.getCreaterregionId(),plan.getPlanstate(),plan.getPlancomment()};
			i=this.getJdbcTemplate().update(sql, params);
		} catch (Exception e) {
			e.printStackTrace();
			i=0;
		}
		return i;
	}
	
	public void delUpload(String upload){
		String sql="delete from MK_VGOP.TB_UPLOAD_CUST_INFO where UPLOAD_FILE_NAME=?";
		this.getJdbcTemplate().update(sql, new Object[]{upload});
	}
	
	public void delUploadByPlanId(String planid,String creator){
		String sql="delete from MK_VGOP.TB_UPLOAD_CUST_INFO where PLAN_ID='"+planid+"' AND CREATOR='"+creator+"'";
		String sql1="delete from MK_VGOP.TB_MARK_PLAN_BASIC_INFO where plan_id=?";
		this.getJdbcTemplate().update(sql1,new Object[]{planid});
		this.getJdbcTemplate().update(sql);
	}
	
	public int updateplan(String plan_id){
		String sql="update MK_VGOP.TB_MARK_PLAN_BASIC_INFO set PALN_STATE='1' where PLAN_ID='"+plan_id+"'";
		//this.getJdbcTemplate().update(sql, new Object[]{plan_id});
		int i=0;
		try {
			i=this.getJdbcTemplate().update(sql);
		} catch (Exception e) { 
			e.printStackTrace();
			i=0;
		}
		return i;
		//System.out.println(sql);
		//int i = this.getJdbcTemplate().update(sql);
		 
		//System.out.println(i);
	}
	
	public void wrightlog(String userId,String userName,String operatetime,String plan_id,String operate_desc){
		String sql="insert into MK_VGOP.TB_PUSH_PLAN_LOG_INFO values (?,?,?,?,?)";
		Object[] params=new Object[]{userId,userName,operatetime,plan_id,operate_desc};	
		this.getJdbcTemplate().update(sql, params);
	}

}
