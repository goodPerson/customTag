package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import module.DownloadInfo;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class DownLoadInfoImpl extends JdbcDaoSupport{
	
	public void addDownload(DownloadInfo down){
		try {
		String sql="insert into mk_vgop.tb_download_info values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params= new Object[]{down.getFile_name(),down.getId(),down.getCreate_time(),down.getFile_type(),down.getCount(),down.getRegion_id(),down.getRegion_name(),down.getStatus(),down.getColumn(),down.getColumn_desc(),down.getSql(),down.getManager_id(),down.getManager(),down.getCustlist_path()};
		 this.getJdbcTemplate().update(sql,params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public List<DownloadInfo> queryDown(String userId){
	    String sql="select file_name,create_time,file_type,count,region_name,status,manager,custlist_path from mk_vgop.tb_download_info where manager_id='"+userId+"' order by create_time desc";	
	    List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
	    List<DownloadInfo> tagList= new ArrayList<DownloadInfo>();
	    for(Map<String,Object> row:list){
	    	DownloadInfo tag= new DownloadInfo();
			tag.setFile_name((String)row.get("file_name"));
			tag.setCreate_time(((String)row.get("create_time").toString().substring(0,8)));
			if("tag_list".equals((String)row.get("file_type"))){
				tag.setFile_type("标签清单");
			}else if ("group_list".equals((String)row.get("file_type"))){
				tag.setFile_type("客户群清单");
			}

//			tag.setFile_type((String)row.get("file_type"));
			tag.setCount((Integer)row.get("count"));
			tag.setRegion_name((String)row.get("region_name"));
			if("1".equals((String)row.get("status"))){
				tag.setStatus("文件生成中");
			}else if ("2".equals((String)row.get("status"))){
				tag.setStatus("已生成");
			}
			//tag.setStatus((String)row.get("status"));
			tag.setManager((String)row.get("manager"));
			tag.setCustlist_path((String)row.get("custlist_path"));
			tagList.add(tag);
		}
		return tagList;
	}

}
