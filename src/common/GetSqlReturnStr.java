package common;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class GetSqlReturnStr extends JdbcDaoSupport {
	private String sql;

	private  int listSize(){
		int flagInt=getJdbcTemplate().queryForList(sql, String.class).size();
		return flagInt;
	}

	public  String getSqlStr(){
	    String str="";
		if (listSize()>0){
			str=this.getJdbcTemplate().queryForObject(sql, String.class).toString();
		}
		return str;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}
	
}
