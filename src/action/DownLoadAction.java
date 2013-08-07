package action;

import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.DownloadInfo;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionSupport;
import common.GetLog;

import dao.DownLoadInfoImpl;
import dao.RegionDaoImpl;



public class DownLoadAction extends ActionSupport{
	//private DownLoadInfoImpl downloadinfo =new DownLoadInfoImpl();
	private static  DownLoadInfoImpl downloadinfo;
	private static RegionDaoImpl regionDao;
	private String group_name;
	private Integer count;
	private String sql;
    private String group_id;
    private String column;
    private String column_desc;
    private String type;
    private String userId;
    private String userName;
    private String regionName;
    private String regionId;
    private String flag; //下载类型，0表示标签下载，1表示客户群下载
    private List<DownloadInfo> listDown= new ArrayList<DownloadInfo>();
    private DownloadInfo downInfo;
    
    private String downReason;
    private String createTime;
    private String fileName;
    
    static ApplicationContext factory=null;
	public static void initTag(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		downloadinfo=(DownLoadInfoImpl)factory.getBean("DownLoad");
	}
	
	public void addDownload() throws IOException{
	   	if (null==downloadinfo)
		   this.initTag();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  Calendar date = Calendar.getInstance();
		  String time= new SimpleDateFormat("yyyyMMddhhmmss").format(date.getTime());
		  group_name=request.getParameter("tag_name");
		  count=Integer.parseInt(request.getParameter("count"));
		 // sql=URLDecoder.decode(request.getParameter("sql"), "utf-8");
		//	sql=sql.replace("'", "'||Chr(39)||'");
		  String sql1=request.getParameter("sql");
		  sql=sql1.substring(0,sql1.length()-4);
		  group_id=request.getParameter("id");
		  String  column1=request.getParameter("col");
		  column=column1.substring(0,column1.length()-1);
		  column_desc=request.getParameter("col_desc");
		  type=request.getParameter("type");
		  userId=(String) request.getSession().getAttribute("userId");
		  userName=(String) request.getSession().getAttribute("userName");
		 // regionName=(String) request.getSession().getAttribute("regionName");
		  regionName=request.getParameter("region_name");
		  flag=request.getParameter("flag");
		  if(type.equals("group_list")){
		  regionId=(String) request.getSession().getAttribute("regionId");
		  }else{
			  regionId=request.getParameter("regionId");
		  }
		  DownloadInfo down = new DownloadInfo();
		  int count_id=downloadinfo.getList(userId, group_id);
		  if(count_id==0){
		  down.setFile_name(group_name+"用户清单");
		  }else{
	       down.setFile_name(group_name+"用户清单"+"("+count_id+")");	  
		  }
		  down.setId(group_id);
		  down.setCreate_time(time);
		  down.setCount(count);
		  down.setFile_type(type);
		  down.setRegion_id(regionId);
		  down.setRegion_name(regionName);
		  down.setStatus("1");
		  down.setColumn(column);
		  down.setColumn_desc(column_desc);
		  down.setSql(sql);
		  down.setManager_id(userId);
		  down.setManager(userName);
		  down.setCustlist_path("none");
		  if(flag.equals("0")){
		  GetLog.getLog("客户标签","下载",group_id,userName+"下载客户标签"+group_id); }
		  // 客户标签、下载、标签ID、操作内容
		  if(flag.equals("1")){
		  GetLog.getLog("客户群","下载",group_id,userName+"下载客户群"+group_id); }
		  downloadinfo.addDownload(down);
	}
	
	
	public String getDownInfo() throws Exception{
		if (null==downloadinfo)
		 this.initTag();
		 HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
	//	 userId=(String) request.getSession().getAttribute("userId");
		 userId=request.getParameter("userId");
		  listDown=downloadinfo.queryDown(userId);
		 return SUCCESS;
		
	}
	
	public String requestDownReason(){
		this.initTag();
		 HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		
		String userId=request.getParameter("userId");		
	    createTime=request.getParameter("createTime");
		downInfo=downloadinfo.getDownInfo(createTime, userId);
		 fileName=downInfo.getFile_name();
		return SUCCESS;
	}
	
	public String addReason(){	
		this.initTag();
	  HttpServletResponse response = ServletActionContext.getResponse();
	  response.setCharacterEncoding("gbk");
	  response.setContentType("text/html;charset=gbk");
	  response.addHeader("Content-Type", "text/html;charset=gbk");	
	  HttpServletRequest request = ServletActionContext.getRequest();
	  String reasonForm=request.getParameter("reasonForm");
	  String createTimeForm=request.getParameter("createTimeForm");
	  boolean  flag=downloadinfo.updateReason(createTimeForm, reasonForm);	  
	  if (flag){
		  return SUCCESS;
	  }else{
		  return "false";
	  }	  
	}

	public List<DownloadInfo> getListDown() {
		return listDown;
	}
	public void setListDown(List<DownloadInfo> listDown) {
		this.listDown = listDown;
	}

	public String getDownReason() {
		return downReason;
	}

	public void setDownReason(String downReason) {
		this.downReason = downReason;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}	
	

}
