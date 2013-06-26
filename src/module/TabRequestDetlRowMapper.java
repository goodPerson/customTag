package module;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class TabRequestDetlRowMapper implements RowMapper {

	public Object mapRow(ResultSet rs, int value) throws SQLException {
		// TODO Auto-generated method stub
		TabRequestDetl   trd=new TabRequestDetl();
		trd.setReq_id(rs.getString("REQ_ID"));
		trd.setReq_name(rs.getString("REQ_NAME"));
		trd.setReq_resons(rs.getString("REQ_RESONS"));
		trd.setReq_scope(rs.getString("REQ_SCOPE"));
		trd.setReq_time_limit(rs.getString("REQ_TIME_LIMIT"));
		trd.setCus_need_counts(rs.getString("CUS_NEED_COUNTS"));
		trd.setReq_target(rs.getString("REQ_TARGET"));
		trd.setCus_brand(rs.getString("CUS_BRAND"));
		trd.setReq_getdata_type(rs.getString("REQ_GETDATA_TYPE"));
		trd.setScreen_condition(rs.getString("SCREEN_CONDITION"));
		trd.setRemark(rs.getString("REMARK"));
		trd.setReq_reson(rs.getString("REQ_RESON"));
		trd.setReq_time(rs.getString("REQ_TIME"));
		trd.setVerify(rs.getString("VERIFIER"));		
		return trd;
	}

}
     