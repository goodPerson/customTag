package dao.push;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
 
import module.PlanAccess;
import module.push.MarkPlanInfo;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class MarkPlanInfoImpl extends JdbcDaoSupport{
	
	public List<MarkPlanInfo> getMarkPlanInfoList(String creator_id,String regionId,String plan_name,int begin,int end) {
		String sql="";
		String region="";
		if (!"1".equals(regionId)) {
			region=" AND CREATOR_REGION_ID = '"+regionId.substring(0, 3)+"'";
		}else {
			region="";
		}
//		sql="SELECT PLAN_ID,PLAN_NAME,PLAN_REGION_NAME,START_TIME,END_TIME,PALN_STATE FROM ("
//		+" SELECT PLAN_ID,PLAN_NAME,PLAN_REGION_NAME,START_TIME,END_TIME,"
//		+" CASE PALN_STATE WHEN  '0' THEN '活动创建'"
//		+" WHEN '1' THEN '目标客户生成'"
//		+" WHEN '2' THEN '活动推送'"
//		+" WHEN '3' THEN '活动评估' END AS PALN_STATE,ROW_NUMBER() OVER(order by  PLAN_ID DESC) AS RN"
//		+" FROM MK_VGOP.TB_MARK_PLAN_BASIC_INFO"
//		+" WHERE "
//		+"CREATOR_ID='"+creator_id
//		+"' AND PLAN_NAME LIKE '%"+plan_name+"%' )"
//		+"  WHERE RN>="+begin+" AND RN<="+end+"";
		sql="SELECT PLAN_ID,PLAN_NAME,PLAN_REGION_NAME,START_TIME,END_TIME,CREATOR_ID,CREATOR_NAME,PALN_STATE FROM ("
				+" SELECT PLAN_ID,PLAN_NAME,PLAN_REGION_ID,PLAN_REGION_NAME,START_TIME,END_TIME,CREATOR_ID, CREATOR_NAME,CASE PALN_STATE"
				+" WHEN  '0' THEN '活动创建' "
				+"WHEN '1' THEN '目标客户生成' " 
				+"WHEN '2' THEN '活动推送' " 
				+"WHEN '3' THEN '活动评估' END AS PALN_STATE," 
				+"ROW_NUMBER() OVER(ORDER BY CASE WHEN CREATOR_ID = '"+creator_id+"' THEN 1 ELSE 999 END ,PUSH_TIME DESC) AS RN"
				+" FROM MK_VGOP.TB_MARK_PLAN_BASIC_INFO " 
				+"WHERE  PLAN_NAME LIKE '%"+plan_name+"%'"
				+region
				+")  WHERE RN>="+begin+" AND RN<="+end+"";
		List<Map<String, Object>> list=getJdbcTemplate().queryForList(sql);
		List<MarkPlanInfo> markPlanInfoList=new ArrayList<MarkPlanInfo>();
		
		for (Map<String, Object> row:list) {
			
			MarkPlanInfo markPlanInfo = new MarkPlanInfo();
			markPlanInfo.setPlan_id((String) row.get("plan_id"));
			markPlanInfo.setPlan_name((String) row.get("plan_name"));
			markPlanInfo.setPlan_region_name((String) row.get("plan_region_name"));
			markPlanInfo.setStart_time((String) row.get("start_time"));
			markPlanInfo.setEnd_time((String) row.get("end_time"));
			markPlanInfo.setCreator_id((String)row.get("creator_id"));
			markPlanInfo.setCreator_name((String)row.get("creator_name"));
			markPlanInfo.setPaln_state((String) row.get("paln_state"));
			markPlanInfoList.add(markPlanInfo);
		} 
		return markPlanInfoList;
	}
	
	public int getMarkPlanInfoCount(String creator_id ,String regionId,String plan_name) {
		int count=0;
		String region="";
		if (!"1".equals(regionId)) {
			region=" AND CREATOR_REGION_ID = '"+regionId.substring(0, 3)+"'";
		}else {
			region="";
		}
		String sql="SELECT COUNT(1) FROM "
				+" (SELECT PLAN_ID,PLAN_NAME,PLAN_REGION_ID,PLAN_REGION_NAME,START_TIME,END_TIME, CREATOR_NAME,CREATOR_ID,CASE PALN_STATE"
				+" WHEN  '0' THEN '活动创建' "
				+"WHEN '1' THEN '目标客户生成' " 
				+"WHEN '2' THEN '活动推送' " 
				+"WHEN '3' THEN '活动评估' END AS PALN_STATE," 
				+"ROW_NUMBER() OVER(ORDER BY CASE WHEN CREATOR_ID = '"+creator_id+"' THEN 1 ELSE 999 END ,PUSH_TIME DESC) AS RN"
				+" FROM MK_VGOP.TB_MARK_PLAN_BASIC_INFO " 
				+"WHERE  PLAN_NAME LIKE '%"+plan_name+"%'"
				+region+" )";
		try {
			count=getJdbcTemplate().queryForInt(sql);
		} catch (Exception e) { 
			count=0;
		}
		return  count;
	}
	
	public List<MarkPlanInfo> getPlanNameList(String creator_id,String plan_name) {
		String sql="SELECT PLAN_ID, PLAN_NAME FROM MK_VGOP.TB_MARK_PLAN_BASIC_INFO WHERE  PLAN_NAME LIKE '%"+plan_name+"%' ORDER BY PUSH_TIME DESC";//CREATOR_ID='"+creator_id+"' AND
		List<Map<String, Object>> list=getJdbcTemplate().queryForList(sql);
		List<MarkPlanInfo> planNameList=new ArrayList<MarkPlanInfo>();
		for (Map<String, Object> row:list) {
			
			MarkPlanInfo markPlanInfo=new MarkPlanInfo();
			markPlanInfo.setPlan_id((String)row.get("plan_id"));
			markPlanInfo.setPlan_name((String)row.get("plan_name"));
			planNameList.add(markPlanInfo);
			
		}
		return planNameList;
	}
	
	public int delMarkt(String plan_id,String userId) {
		String sql="delete from MK_VGOP.TB_MARK_PLAN_BASIC_INFO where plan_id='"+plan_id+"' and CREATOR_ID='"+userId+"'";
		int i=0;
		try {
			i=getJdbcTemplate().update(sql);
		} catch (Exception e) {
			i=0;
		}				
		return i;
	}
	
	public List<PlanAccess>getplan (String planid){
		String sql="select * from MK_VGOP.TB_MARK_PLAN_ASSESS_INFO where plan_id='"+planid+"'";
		List<Map<String, Object>> list=getJdbcTemplate().queryForList(sql);
		List<PlanAccess> planNameList=new ArrayList<PlanAccess>();
		for (Map<String, Object> row:list) {
			PlanAccess plan=new PlanAccess();
			plan.setDate_stamp((String)row.get("DATE_STAMP"));
			plan.setPlan_id((String)row.get("PLAN_ID"));
			plan.setPlan_name((String)row.get("PLAN_NAME"));
			plan.setCommend_cnt((Integer)row.get("COMMEND_CNT"));
			plan.setSuccess_cnt((Integer)row.get("SUCCESS_CNT"));
			plan.setSuccess_rate((BigDecimal)row.get("SUCCESS_RATE"));
			planNameList.add(plan);
		}
		  return planNameList;
	}

}
