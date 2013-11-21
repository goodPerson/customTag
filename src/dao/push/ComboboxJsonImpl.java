package dao.push;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import module.DownloadInfo;
import module.push.*;
public class ComboboxJsonImpl extends JdbcDaoSupport {
	
	public List<TargetCust> getcust(String userId,String type){
		String sql="";
		if("GROUP".equals(type)){
		 sql="select ID,FILE_NAME from MK_VGOP.TB_DOWNLOAD_INFO  where manager_id='"+userId+"' and file_type='group_list' and CUSTLIST_PATH!='none' ORDER BY ID ";
		}else if("TAG".equals(type)){
		 sql="select ID,FILE_NAME from MK_VGOP.TB_DOWNLOAD_INFO  where manager_id='"+userId+"' and file_type='tag_list' and CUSTLIST_PATH!='none' ORDER BY ID ";	
		}
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		   List<TargetCust> tagList= new ArrayList<TargetCust>();
		   for(Map<String,Object> row:list){
			    TargetCust cust= new TargetCust();
				cust.setCustid((String)row.get("ID"));
				cust.setCustname((String)row.get("FILE_NAME"));
				tagList.add(cust);
	}
		   return tagList;
}
	public List<UploadInfo> getupload(String userId){
		String sql="select * from MK_VGOP.TB_UPLOAD_CUST_INFO where creator='"+userId+"' order by UPLOAD_TIME desc";
		 List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		 List<UploadInfo> tagList= new ArrayList<UploadInfo>();
		 for(Map<String,Object> row:list){
			    UploadInfo cust= new UploadInfo();
				cust.setFilename((String)row.get("FILE_NAME"));
				cust.setUploadtime(row.get("UPLOAD_TIME").toString().substring(0,4)+"年"+row.get("UPLOAD_TIME").toString().substring(4,6)+"月"+row.get("UPLOAD_TIME").toString().substring(6,8)+"日");
				cust.setUploadfilename((String)row.get("UPLOAD_FILE_NAME"));
				tagList.add(cust);
	}
		 return tagList;
	}
	
	public List<DownloadInfo> getcustomlist(String userId,String type,Integer begin,Integer end ){
		String sql="select *  FROM (select FILE_NAME,ID,CREATE_TIME,FILE_TYPE,COUNT,REGION_NAME, ROW_NUMBER() OVER (ORDER BY create_time desc) AS RN from mk_vgop.tb_download_info where MANAGER_ID='"+userId+"' and FILE_TYPE='"+type+"' and DOWNLOAD_REASON is not null) "+
            "WHERE RN<="+end+" AND RN>="+begin+"";			
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		 List<DownloadInfo> custList= new ArrayList<DownloadInfo>();
		 for(Map<String,Object> row:list){
			 DownloadInfo cust= new DownloadInfo();
				cust.setFile_name((String)row.get("FILE_NAME"));
				cust.setId((String)row.get("ID"));
				String time=row.get("CREATE_TIME").toString().substring(0,4)+"年"+row.get("create_time").toString().substring(4,6)+"月"+row.get("create_time").toString().substring(6,8)+"日";
				cust.setCreate_time(time);
				if("tag_list".equals((String)row.get("FILE_TYPE"))){
					cust.setFile_type("标签清单");
				}else if ("group_list".equals((String)row.get("file_type"))){
					cust.setFile_type("客户群清单");
				}
				cust.setCount((Integer)row.get("COUNT"));
				cust.setRegion_name((String)row.get("REGION_NAME"));
				custList.add(cust);
	}
		 return custList;
	}
	public List<DownloadInfo> getselectcustomlist(String userId,String custid,String custname){
		String sql=" select FILE_NAME,ID,CREATE_TIME,FILE_TYPE,COUNT,REGION_NAME, ROW_NUMBER() OVER (ORDER BY create_time desc) AS RN from mk_vgop.tb_download_info where MANAGER_ID='"+userId+"' and id='"+custid+"' and file_name='"+custname+"' and DOWNLOAD_REASON is not null";			
		List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		 List<DownloadInfo> custList= new ArrayList<DownloadInfo>();
		 for(Map<String,Object> row:list){
			 DownloadInfo cust= new DownloadInfo();
				cust.setFile_name((String)row.get("FILE_NAME"));
				cust.setId((String)row.get("ID"));
				String time=row.get("CREATE_TIME").toString().substring(0,4)+"年"+row.get("create_time").toString().substring(4,6)+"月"+row.get("create_time").toString().substring(6,8)+"日";
				cust.setCreate_time(time);
				if("tag_list".equals((String)row.get("FILE_TYPE"))){
					cust.setFile_type("标签清单");
				}else if ("group_list".equals((String)row.get("file_type"))){
					cust.setFile_type("客户群清单");
				}
				cust.setCount((Integer)row.get("COUNT"));
				cust.setRegion_name((String)row.get("REGION_NAME"));
				custList.add(cust);
	}
		 return custList;
	}
	
	public Integer countlist(String userId,String type){
		String sql="select count(*) from mk_vgop.tb_download_info where MANAGER_ID='"+userId+"' and FILE_TYPE='"+type+"' and DOWNLOAD_REASON is not null ";
	    return (int)getJdbcTemplate().queryForInt(sql);  
	}
        
}
