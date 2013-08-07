package dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class OperateLogDaoImpl extends JdbcDaoSupport {
	/**
	 * ≤Â»Î»’÷æ
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

}
