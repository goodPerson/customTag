package dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class UploadLtLogDaoImpl extends JdbcDaoSupport {

	public boolean addUploadLt(String tagId, String tagType, String fileName, String state){
		boolean flag=false;
		String sqlStr="select count(*) from MK_VGOP.TB_UPLOAD_LT_LOG where TAG_ID='"+tagId+"'";
		int exInt=this.getJdbcTemplate().queryForInt(sqlStr);
		if (0==exInt){
			try{
				String  sql="insert into MK_VGOP.TB_UPLOAD_LT_LOG ( TAG_ID ,TAG_TYPE,FILE_NAME,STATE,UPLOAD_PATH) values (?,?,?,?,?)";
				this.getJdbcTemplate().update(sql, new Object[]{tagId,tagType,fileName,state,""});
				flag=true;
			}catch(Exception e){				
				e.printStackTrace();
			}
		}
		return flag;
	}
}
