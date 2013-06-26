package dao;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class CustomgroupInfoDaoImpl extends JdbcDaoSupport{
  /**
   * ≤È’“œ¬‘ÿ¬∑æ∂
   * @param id
   * @return
   */
	public String getDownPath(String id){
		String downPath="";
		if (!id.equals("")){
			try{
				String sql="select DOWNLOAD_PATH from MK_VGOP.TB_CUSTOMGROUP_INFO where TAG_ID='"+id+"'";
				downPath=(String)this.getJdbcTemplate().queryForObject(sql, String.class);		
			}catch( Exception e){
				e.printStackTrace();
				downPath="";
			}
				
		}
		return downPath;
	}
}
