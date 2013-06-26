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



public class DownLoadAction extends ActionSupport{
	//private DownLoadInfoImpl downloadinfo =new DownLoadInfoImpl();
	private   DownLoadInfoImpl downloadinfo;
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
    private List<DownloadInfo> listDown= new ArrayList<DownloadInfo>();
    
   // static ApplicationContext factory=null;
	public  void initTag(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		//if (null==factory)
			//factory = new ClassPathXmlApplicationContext("applicationContext.xml");
		downloadinfo=(DownLoadInfoImpl)factory.getBean("DownLoad");
	}
	
	public void addDownload() throws IOException{
	   //	if (null==downloadinfo)
		   this.initTag();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  Calendar date = Calendar.getInstance();
		  String time= new SimpleDateFormat("yyyyMMddHHmmss").format(date.getTime());
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
		  regionId=(String) request.getSession().getAttribute("regionId");
		  DownloadInfo down = new DownloadInfo();
		  down.setFile_name(group_name+"用户清单");
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
		 // GetLog.getLog("下载清单", group_name+"用户清单");
		  
		  downloadinfo.addDownload(down);
	}
	
	
	public String getDownInfo() throws Exception{
		//if (null==downloadinfo)
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

	public List<DownloadInfo> getListDown() {
		return listDown;
	}
	public void setListDown(List<DownloadInfo> listDown) {
		this.listDown = listDown;
	}
	
	

}
