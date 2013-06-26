package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.ApproverInfo;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class ApproverInfoDaoImpl extends JdbcDaoSupport{
	/**
	 * 查找归属的审批人
	 * @param userArea
	 * @return
	 */
	public List<ApproverInfo> getApprover( String userArea){
		 String sql="select USER_ID,USER_NAME,USER_ROLE,USER_AREA from MK_VGOP.TB_APPROVER_INFO where USER_AREA='"+userArea+"' and USER_ROLE='审批人'";      
		 List<Map<String,Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		 List<ApproverInfo> listAppr=new ArrayList<ApproverInfo>();		
		 for(Map<String, Object> rows: listTemp){
			 ApproverInfo approver=new ApproverInfo();
			 approver.setUser_id((String)rows.get("USER_ID"));
			 approver.setUser_name((String)rows.get("USER_NAME"));
			 approver.setUser_area((String)rows.get("USER_AREA"));
			 approver.setUser_role((String)rows.get("USER_ROLE"));
			 listAppr.add(approver);			 
		 }
		 
		 return listAppr;
	}
     
	/**
	 * 根据Id查找角色
	 * @param id
	 * @return
	 */
	public String getRoleById(String id){
		String userRole="";
		String sql="select USER_ROLE  from MK_VGOP.TB_APPROVER_INFO where USER_ID='"+id+"'";
		if (getCounts(id)>0){
			userRole=this.getJdbcTemplate().queryForObject(sql, String.class);
		}
		return userRole;
	 
	}
	
	public int getCounts(String id){
		String sql="select count(*)  from MK_VGOP.TB_APPROVER_INFO where USER_ID='"+id+"'";
		return this.getJdbcTemplate().queryForInt(sql);
	}
	
	/**
	 * 根据Id查找名字
	 * @param id
	 * @return
	 */
	public String getNameById(String id){
		String sql="select USER_NAME  from MK_VGOP.TB_APPROVER_INFO where USER_ID='"+id+"'";		
		return this.getJdbcTemplate().queryForObject(sql, String.class);
	}
}
