package dao;

import module.TypeUserInfo;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class TypeUserInfoDaoImpl extends JdbcDaoSupport {
	/**
	 * ÃÌº”∫≈¬Î–≈œ¢
	 * @param typeUserInfo
	 */
	public boolean  addTyperUserInfo(TypeUserInfo typeUserInfo){
		boolean  flag=false;
		try{
			String sql="insert into MK_VGOP.TB_CUSTTAG_LOAD_LIST_INFO (USER_ID,LOAD_TIME,LIST_TYPE,TAG_ID,TAG_NAME,LIST_NUM) value (?,?,?,?,?,?) ";
			Object[] params=new Object[]{typeUserInfo.getUser_id(),typeUserInfo.getLoad_time(),typeUserInfo.getList_type(),typeUserInfo.getTag_id(),typeUserInfo.getTag_name(),typeUserInfo.getList_num()};
			this.getJdbcTemplate().update(sql, params);
			flag=true;
		}catch(Exception e){
			flag=false;
			e.printStackTrace();
		}	
		return flag;
	}
}
