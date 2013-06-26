package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import module.AttrUnify;
import module.OperateLog;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.Pagination;

public class OperateLogDaoImpl extends JdbcDaoSupport {
	private Pagination pageInfo;
	/**
	 * 插入日志
	 * @param userId
	 * @param userName
	 * @param regionId
	 * @param regionName
	 * @param columnName
	 * @param operateName
	 * @param createTime
	 * @return 
	 */
	public void addOperateLog(String userId, String userName, String regionId, String regionName,
			                                        String columnName,String operateType,String operateName ,String operatePara,String createTime){
		String sql="insert into MK_VGOP.TB_OPERATE_LOG_INFO (USER_ID,USER_NAME, REGION_ID,REGION_NAME,COLUMN_NAME,OPERATE_TYPE,OPERATE_NAME,OPERATE_PARA,CREATE_TIME)"
				       +" values ('"+userId+"','"+userName+"','"+regionId+"','"+regionName+"','"+columnName+"','"+operateType+"','"+operateName+"','"+operatePara+"','"+createTime+"')";
		int  flag=this.getJdbcTemplate().update(sql);		
	}
	public List<OperateLog> findOperateLog(String userName,String regionName, String columnName, String operateType ,
			                                                      String operateName, String operatePara,int pageNo, int pageSize){
		  StringBuffer sql=new StringBuffer("select USER_ID,USER_NAME, REGION_ID,REGION_NAME,COLUMN_NAME,OPERATE_TYPE,OPERATE_NAME,OPERATE_PARA,CREATE_TIME,rownumber() over(ORDER BY CREATE_TIME desc) AS rn");
		  sql.append(" from MK_VGOP.TB_OPERATE_LOG_INFO where 1=1");
		 
		  if (userName == null || userName.length()<= 0){
			  
		  }else{
			  sql.append(" and USER_NAME='"+ userName +"'");
		  }
		 
		  if(regionName==null || regionName.length()<=0 ){
			  
		  }else{
			  sql.append(" and REGION_NAME='"+ regionName +"'");
		  }
			  
		  if(columnName==null || columnName.length()<=0){
			  
		  }else{
			  sql.append(" and COLUMN_NAME='"+ columnName +"'");
		  }
			 
		  if(operateType==null || operateType.length()<=0){
			  
		  }else{
			  sql.append(" and OPERATE_TYPE='"+ operateType +"'");
		  }
			  
		  if(operateName==null || operateName.length()<=0 ){
			  
		  }else{
			  sql.append(" and OPERATE_NAME='"+ operateName +"'");
		  }
			 
		  if(operatePara==null || operatePara.length()<=0 ){
			  
		  }else{
			  sql.append(" and OPERATE_PARA='"+operatePara+"'");
		  }
		  pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		  List<Map<String,Object>> listTemp=pageInfo.getResultList();
		  List<OperateLog> listOperateLog=new ArrayList<OperateLog>();
		  for(Map<String,Object> rows:listTemp){
			  OperateLog oLog=new OperateLog();
			  oLog.setUserId((String)rows.get("USER_ID"));
			  oLog.setUserName((String)rows.get("USER_NAME"));
			  oLog.setRegionId((String)rows.get("REGION_ID"));
			  oLog.setRegionName((String)rows.get("REGION_NAME"));
			  oLog.setColumnName((String)rows.get("COLUMN_NAME"));
			  oLog.setOperateType((String)rows.get("OPERATE_TYPE"));
			  oLog.setOperateName((String)rows.get("OPERATE_NAME"));
			  oLog.setOperatePara((String)rows.get("OPERATE_PARA"));
			  oLog.setCreateTime((String)rows.get("CREATE_TIME"));
			  listOperateLog.add(oLog);
		  }
		return listOperateLog;
		
	}
	/**
	 * 获取用户名
	 * @return
	 */
	public List getUserName(){
		String sql="select distinct USER_NAME from MK_VGOP.TB_OPERATE_LOG_INFO";
		List<Map<String,Object>> tempListUserName=this.getJdbcTemplate().queryForList(sql);
		List listUserName=new ArrayList();
		for (Map<String,Object> rows:tempListUserName){
			listUserName.add((String)rows.get("USER_NAME"));
		}
		return listUserName;
	}
	/**
	 * 获取地域名
	 * @return
	 */
	public List getRegionName(){
		String sql="select distinct REGION_NAME from MK_VGOP.TB_OPERATE_LOG_INFO";
		List<Map<String,Object>> tempListRegionName=this.getJdbcTemplate().queryForList(sql);
		List listRegionName=new ArrayList();
		for (Map<String,Object> rows:tempListRegionName){
			listRegionName.add((String)rows.get("REGION_NAME"));
		}
		return listRegionName;
	}
	/**
	 * 获取栏目名称
	 * @return
	 */
	public List getColumnName(){		
		String sql="select distinct COLUMN_NAME from MK_VGOP.TB_OPERATE_LOG_INFO";
		List<Map<String,Object>> l=this.getJdbcTemplate().queryForList(sql);
		List list=new ArrayList();
		for(Map<String,Object> row : l){
			list.add(row.get("COLUMN_NAME"));
		}
		return list;	
	}
	
	/**
	 * 获取操作类型
	 * @return
	 */
	public List getOperateType(){
		String sql="select distinct OPERATE_TYPE from MK_VGOP.TB_OPERATE_LOG_INFO";
		List<Map<String,Object>> tempListOperateType=this.getJdbcTemplate().queryForList(sql);
		List listOperateType=new ArrayList();
		for (Map<String,Object> rowsOp:tempListOperateType){
			listOperateType.add((String)rowsOp.get("OPERATE_TYPE"));
		}
		return listOperateType;
	}
	/**
	 * 获取操作名称
	 * @return
	 */
	public List getOperateName(){
		String sql="select distinct OPERATE_NAME from MK_VGOP.TB_OPERATE_LOG_INFO";
		List<Map<String,Object>> tempListOperateName=this.getJdbcTemplate().queryForList(sql);		
		List list=new ArrayList();		
		for (Map<String,Object> rows : tempListOperateName){
			list.add((String)rows.get("OPERATE_NAME"));
		}
		return list;
	}
	public Pagination getPageInfo() {
		return pageInfo;
	}
	public void setPageInfo(Pagination pageInfo) {
		this.pageInfo = pageInfo;
	}

}
