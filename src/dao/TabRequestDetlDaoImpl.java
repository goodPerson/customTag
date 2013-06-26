package dao;

import module.TabRequestDetl;
import module.TabRequestDetlRowMapper;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
/**
 * 标签申请  审批  DaoImpl
 * @author ywz
 * @date  20130603
 */
public class TabRequestDetlDaoImpl extends JdbcDaoSupport {
	/**
	 * 添加申请详细信息表
	 * @param req_id
	 * @param req_name
	 * @param req_resons
	 * @param req_scope
	 * @param req_time_limit
	 * @param cus_need_counts
	 * @param req_target
	 * @param cus_brand
	 * @param req_getdata_type
	 * @param screen_condition
	 * @param remark
	 * @param req_reson
	 * @param req_time
	 * @param verifier
	 * @return
	 */
	public boolean addTagReqDetl(String req_id, String req_name,String req_resons,String req_scope,
			String req_time_limit,String cus_need_counts, String req_target,String cus_brand,String req_getdata_type,
			String screen_condition,String remark,String req_reson,String req_time,String verifier){
		String sql="insert into MK_VGOP.TB_TAB_REQUEST_DETL (REQ_ID,REQ_NAME,REQ_RESONS,REQ_SCOPE,REQ_TIME_LIMIT,CUS_NEED_COUNTS,REQ_TARGET,"
				        +"CUS_BRAND,REQ_GETDATA_TYPE,SCREEN_CONDITION,REMARK,REQ_RESON,REQ_TIME,VERIFIER )"
				         +" values ('"+req_id+"','"+req_name+"','"+req_resons+"','"+req_scope+"','"+req_time_limit+"','"+cus_need_counts+"','"+req_target+"','"
				        +cus_brand+"','"+req_getdata_type+"','"+screen_condition+"','"+remark+"','"+req_reson+"','"+req_time+"','"+verifier+"')";
		int flag=this.getJdbcTemplate().update(sql);
		if (flag>0){
			return true;
		}else{
			return false;
		}		
	}

	/**
	 * 审批展示
	 * @param req_id
	 * @return
	 */
    public TabRequestDetl getTabRequestDetl(String req_id){
    	String sql="select REQ_ID,REQ_NAME,REQ_RESONS,REQ_SCOPE,REQ_TIME_LIMIT ,CUS_NEED_COUNTS ,REQ_TARGET,CUS_BRAND,REQ_GETDATA_TYPE,SCREEN_CONDITION ,REMARK ,REQ_RESON ,REQ_TIME ,VERIFIER from MK_VGOP.TB_TAB_REQUEST_DETL where REQ_ID='"+ req_id +"'";
    	TabRequestDetl object=(TabRequestDetl)this.getJdbcTemplate().queryForObject(sql, new TabRequestDetlRowMapper());  	
    	//TabRequestDetl object=this.getJdbcTemplate()
    	return object;
    }
}
