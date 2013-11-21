package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import module.DownloadInfo;
import module.DownloadInfoRowMap;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.Pagination;

public class DownLoadInfoImpl extends JdbcDaoSupport{
	private Pagination pageInfo;
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
	
	public List<DownloadInfo> queryDown(String userId,int pageNo,int pageSize){
		String sql="select file_name,id,create_time,file_type,count,region_name,status,manager,MANAGER_ID,custlist_path,DOWNLOAD_REASON,DOWNLOAD_FLAG,rownumber() over(ORDER BY create_time desc ) AS rn  from mk_vgop.tb_download_info where manager_id='"+userId+"' and DOWNLOAD_FLAG=0  ";	
	 
		 pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		// List<Map<String,Object>> listTemp=pageInfo.getResultList();
		//List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		 List<Map<String,Object>> list=pageInfo.getResultList();
	    List<DownloadInfo> tagList= new ArrayList<DownloadInfo>();
	    for(Map<String,Object> row:list){
	    	DownloadInfo tag= new DownloadInfo();
			tag.setFile_name((String)row.get("file_name"));
			tag.setId((String)row.get("id"));
//			String time=row.get("create_time").toString().substring(0,4)+"年"+row.get("create_time").toString().substring(4,6)+"月"+row.get("create_time").toString().substring(6,8)+"日";
			tag.setCreate_time((String)row.get("create_time"));
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
			tag.setManager_id((String)row.get("MANAGER_ID"));
			tag.setCustlist_path((String)row.get("custlist_path"));
			tag.setDownLoadReason((String)row.get("DOWNLOAD_REASON"));
			tag.setDownLoagFlag((Integer)row.get("DOWNLOAD_FLAG"));
			tagList.add(tag);
		}
		return tagList;
	}
	
	public int getList(String userId,String id){
		String sql="select count(*) from mk_vgop.tb_download_info where manager_id='"+userId+"' and id='"+id+"'";
		return (int)getJdbcTemplate().queryForInt(sql) ;
	}

	public DownloadInfo getDownInfo(String createTime ,String userId){
		String sql="select  FILE_NAME,ID,CREATE_TIME,FILE_TYPE,COUNT,REGION_ID,REGION_NAME,STATUS,COLUMN,COLUMN_DESC,SQL,MANAGER_ID,MANAGER,CUSTLIST_PATH,DOWNLOAD_REASON,DOWNLOAD_FLAG  from mk_vgop.tb_download_info"
				         +" where CREATE_TIME='"+ createTime +"' and MANAGER_ID='"+ userId +"' order by CREATE_TIME desc with ur ";		
		return (DownloadInfo) this.getJdbcTemplate().queryForObject(sql, new DownloadInfoRowMap());
	}
	/**
	 * 添加下载原因
	 * @param createTime
	 * @param downLoadReason
	 * @return
	 */
	public boolean  updateReason(String createTime, String downLoadReason){
		boolean flag=false;
		String  sql="update mk_vgop.tb_download_info set DOWNLOAD_REASON='"+ downLoadReason +"' where CREATE_TIME='"+ createTime +"' ";
	   int flagCount=this.getJdbcTemplate().update(sql);
	   if (flagCount>0){
		   flag=true;
	   }
	   return flag;
	}
	/**
	 * 删除下载记录
	 * @param createTime
	 * @return
	 */
	public  boolean delShow(String createTime){
		boolean flag=false;
		String sql="update mk_vgop.tb_download_info set DOWNLOAD_FLAG=1 where CREATE_TIME='"+ createTime +"' ";
		int flagCount=this.getJdbcTemplate().update(sql);
		if (flagCount>0){
			flag=true;
		}
		return flag;		
	}

	public Pagination getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(Pagination pageInfo) {
		this.pageInfo = pageInfo;
	}
	
}
