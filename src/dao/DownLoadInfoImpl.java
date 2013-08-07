package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import module.DownloadInfo;
import module.DownloadInfoRowMap;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class DownLoadInfoImpl extends JdbcDaoSupport{
	
	public void addDownload(DownloadInfo down){
		try {
			String sql="insert into mk_vgop.tb_download_info ( FILE_NAME,ID,CREATE_TIME,FILE_TYPE,COUNT,REGION_ID,REGION_NAME,STATUS,COLUMN,COLUMN_DESC,SQL,MANAGER_ID,MANAGER,CUSTLIST_PATH) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params= new Object[]{down.getFile_name(),down.getId(),down.getCreate_time(),down.getFile_type(),down.getCount(),down.getRegion_id(),down.getRegion_name(),down.getStatus(),down.getColumn(),down.getColumn_desc(),down.getSql(),down.getManager_id(),down.getManager(),down.getCustlist_path()};
		 this.getJdbcTemplate().update(sql,params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public List<DownloadInfo> queryDown(String userId){
		String sql="select file_name,create_time,file_type,count,region_name,status,manager,MANAGER_ID,custlist_path,DOWNLOAD_REASON from mk_vgop.tb_download_info where manager_id='"+userId+"' order by create_time desc";	
	    List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
	    List<DownloadInfo> tagList= new ArrayList<DownloadInfo>();
	    for(Map<String,Object> row:list){
	    	DownloadInfo tag= new DownloadInfo();
			tag.setFile_name((String)row.get("file_name"));
//			String time=row.get("create_time").toString().substring(0,4)+"��"+row.get("create_time").toString().substring(4,6)+"��"+row.get("create_time").toString().substring(6,8)+"��";
			tag.setCreate_time((String)row.get("create_time"));
			if("tag_list".equals((String)row.get("file_type"))){
				tag.setFile_type("��ǩ�嵥");
			}else if ("group_list".equals((String)row.get("file_type"))){
				tag.setFile_type("�ͻ�Ⱥ�嵥");
			}

//			tag.setFile_type((String)row.get("file_type"));
			tag.setCount((Integer)row.get("count"));
			tag.setRegion_name((String)row.get("region_name"));
			if("1".equals((String)row.get("status"))){
				tag.setStatus("�ļ�������");
			}else if ("2".equals((String)row.get("status"))){
				tag.setStatus("������");
			}
			//tag.setStatus((String)row.get("status"));
			tag.setManager((String)row.get("manager"));
			tag.setManager_id((String)row.get("MANAGER_ID"));
			tag.setCustlist_path((String)row.get("custlist_path"));
			tag.setDownLoadReason((String)row.get("DOWNLOAD_REASON"));
			tagList.add(tag);
		}
		return tagList;
	}
	
	public int getList(String userId,String id){
		String sql="select count(*) from mk_vgop.tb_download_info where manager_id='"+userId+"' and id='"+id+"'";
		return (int)getJdbcTemplate().queryForInt(sql) ;
	}

	public DownloadInfo getDownInfo(String createTime ,String userId){
		String sql="select  FILE_NAME,ID,CREATE_TIME,FILE_TYPE,COUNT,REGION_ID,REGION_NAME,STATUS,COLUMN,COLUMN_DESC,SQL,MANAGER_ID,MANAGER,CUSTLIST_PATH,DOWNLOAD_REASON  from mk_vgop.tb_download_info"
				         +" where CREATE_TIME='"+ createTime +"' and MANAGER_ID='"+ userId +"' ";		
		return this.getJdbcTemplate().queryForObject(sql, new DownloadInfoRowMap());
	}
	
	public boolean  updateReason(String createTime, String downLoadReason){
		boolean flag=false;
		String  sql="update mk_vgop.tb_download_info set DOWNLOAD_REASON='"+ downLoadReason +"' where CREATE_TIME='"+ createTime +"' ";
	   int flagCount=this.getJdbcTemplate().update(sql);
	   if (flagCount>0){
		   flag=true;
	   }
	   return flag;
	}
}
