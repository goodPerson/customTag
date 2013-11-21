package module;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class DownloadInfoRowMap  implements RowMapper {

	public Object mapRow(ResultSet rs, int value) throws SQLException {
		// TODO Auto-generated method stub
		DownloadInfo dInfo=new DownloadInfo();		
		dInfo.setFile_name(rs.getString("FILE_NAME"));
		dInfo.setId(rs.getString("ID"));
		dInfo.setCreate_time(rs.getString("CREATE_TIME"));
		dInfo.setFile_type(rs.getString("FILE_TYPE"));
		dInfo.setCount(rs.getInt("COUNT"));
		dInfo.setRegion_name(rs.getString("REGION_NAME"));
		dInfo.setRegion_id(rs.getString("REGION_ID"));
		dInfo.setStatus(rs.getString("STATUS"));
		dInfo.setColumn(rs.getString("COLUMN"));
		dInfo.setColumn_desc(rs.getString("COLUMN_DESC"));
		dInfo.setSql(rs.getString("SQL"));
		dInfo.setManager(rs.getString("MANAGER"));
		dInfo.setManager_id(rs.getString("MANAGER_ID"));
		dInfo.setCustlist_path(rs.getString("CUSTLIST_PATH"));
		dInfo.setDownLoadReason(rs.getString("DOWNLOAD_REASON"));
		dInfo.setDownLoagFlag(rs.getInt("DOWNLOAD_FLAG"));
		return dInfo;
	}

}
