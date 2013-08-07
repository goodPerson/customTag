package action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javassist.bytecode.Descriptor.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.AttrTable;
import module.CustomGroup;
import module.ExportUserInfo;
import module.Region;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import common.GetLog;
import common.PrintExcelUtil;

import dao.AttrTableDaoImpl;
import dao.CustTagAttrInfoDaoImpl;
import dao.CustomgroupInfoDaoImpl;

public class CustTagAttrInfoAction {
	private static CustTagAttrInfoDaoImpl custTagAttrInfoDao;
	private static  AttrTableDaoImpl attrTableDao;
	private static CustomgroupInfoDaoImpl custGroupDao;
	private int tagUserCounts;
	private String downPath;
	 /*下载导出所需要的参数*/
	String contentType;//内容类型
	FileInputStream downloadFile;//
	String fileName;//文件名
	String userId;
	String userName;
	String regionName;
	String profile;
	String tag_name;
	String create_time;
	String end_time;
	String tag_id;
	   static ApplicationContext factory=null;
	public static void initCustTagAttr(){
		//XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		if (null==factory)
			factory = new ClassPathXmlApplicationContext("applicationContext.xml");
		custTagAttrInfoDao=(CustTagAttrInfoDaoImpl) factory.getBean("custTagAttrInfoDaoImpl");
		
	}
	public static void initCustGroupInfo(){
		//XmlBeanFactory factory =new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		if (null==factory)
			factory = new ClassPathXmlApplicationContext("applicationContext.xml");
		custGroupDao=(CustomgroupInfoDaoImpl) factory.getBean("customgroupInfoDaoImpl");
	}
	
	public static void initAttrTable(){
		//XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		if (null==factory)
			factory = new ClassPathXmlApplicationContext("applicationContext.xml");
		attrTableDao=(AttrTableDaoImpl) factory.getBean("attrTableDaoImpl");
		
	}
	/**
	 * 修改标签
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String updateGroupTag() throws UnsupportedEncodingException{
		if (null==custTagAttrInfoDao)
		this.initCustTagAttr();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");		
		response.addHeader("Content-Type", "text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
		userId=(String) request.getSession().getAttribute("userId");
		userName=(String) request.getSession().getAttribute("userName");
		regionName=(String) request.getSession().getAttribute("regionName");
        profile=URLDecoder.decode(request.getParameter("tag_introduce"), "utf-8");
		tag_name = URLDecoder.decode(request.getParameter("tag_name"), "utf-8");
		create_time=request.getParameter("create_time");
        end_time=request.getParameter("end_time");
        CustomGroup newTag = new CustomGroup();
        String share=request.getParameter("share");
         tag_id=request.getParameter("tag_id");
		  newTag.setTag_id(tag_id);
		  if("0".equals(share)){
	      newTag.setTag_name(tag_name+"（我的共享）");	  
		  }else{
	      newTag.setTag_name(tag_name);
		  }
		  newTag.setCreate_time(create_time);
		  newTag.setEnd_time(end_time);
		  newTag.setTag_type("myTag");
		  newTag.setTag_serv_type("--");
		  newTag.setProfile(profile);
		  newTag.setTag_creator(userName);
		  newTag.setTag_creator_id(userId);
		  newTag.setTag_region(regionName);
		  newTag.setTag_statement("--");
		  newTag.setTag_class("--");
		  newTag.setCount_subs(0);
		  if("0".equals(share)){
		  newTag.setIs_share("1");
		  }else{
		  newTag.setIs_share("0");  
		  }
		  newTag.setTag_status("0");
		  newTag.setCustlist_path("");
		  newTag.setTag_tec_stamt("");
		  String type=request.getParameter("type");
		  
		
		
		String flag="";
		
		tag_id=request.getParameter("tag_id");
		String tag_attrs=URLDecoder.decode(request.getParameter("tag_attrs"), "utf-8");
		String stamt=URLDecoder.decode(request.getParameter("stamt"), "utf-8");		
		String persons=URLDecoder.decode(request.getParameter("persons"), "utf-8");		
		String sql=URLDecoder.decode(request.getParameter("sql"), "utf-8");
				sql=sql.replace("'", "'||Chr(39)||'");		
	    if("0".equals(type)){
	    custTagAttrInfoDao.addTag(newTag);
	    GetLog.getLog("客户群", "创建", tag_id, userName+"创建客户群"+tag_id);
		if (custTagAttrInfoDao.updateGroupTag(tag_id, tag_attrs, stamt,persons,sql))
			flag="success";
		else
			flag="false";
		return flag;
		}else{
			if (custTagAttrInfoDao.updateGroupTag(tag_id, tag_attrs, stamt,persons,sql))
				flag="success";
			else
				flag="false";
			return flag;
		}
	}
	/*导出标签*/
	public String exportTag(){
		if (null==custTagAttrInfoDao)
		this.initCustTagAttr();
		
		return "success";
	}
	/*筛选标签*/
	public String filterTagExport() throws Exception{
		if (null==custTagAttrInfoDao)
		this.initCustTagAttr();
		if (null==custGroupDao)
		this.initCustGroupInfo();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
		
		String tag_id=request.getParameter("tag_id");
		String downPath=custGroupDao.getDownPath(tag_id);
		String dowPath="";
		PrintWriter print=response.getWriter();
		print.print(downPath);
		print.close();
		print.flush();			
	return "exportUser" ;		
	
	}
	/*获取筛选标签用户数*/
	public void filterTagCounts() throws IOException{
		//this.initCustTagAttr();
		if (null==custTagAttrInfoDao)
		this.initCustTagAttr();

		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
		String attrsql=URLDecoder.decode(request.getParameter("sql"),"utf-8");
		int date=custTagAttrInfoDao.getData();
		String data_time=date+"";
		tagUserCounts=custTagAttrInfoDao.getUserTagConts(attrsql,data_time.substring(0,6));
		int data=tagUserCounts;
		PrintWriter print=response.getWriter();
		print.print(data);
		print.close();
		print.flush();
	}
	
	/**
	 * 获取码值属性集合
	 * @return
	 * @throws IOException 
	 */
	public void getAttrTable() throws IOException{
		//this.initAttrTable();
		if (null==attrTableDao)
			this.initAttrTable();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		String table_name=request.getParameter("table_name");
		List<AttrTable> listAttr=new ArrayList<AttrTable>();			
		listAttr=attrTableDao.getAttrTableValue(table_name);
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");		
		JSONArray listJsonAttrTable=new JSONArray();
		JSONObject object=new JSONObject();

		for(int i=listAttr.size();i>=0;i--){			 
			if (i!=listAttr.size()){
			AttrTable attr=listAttr.get(i);
			object.put("id", attr.getAttr_table_id());
			object.put("text", attr.getAttr_table_text());
			}else{
				object.put("id", "");
				object.put("text", "-请选择-");
			}
			listJsonAttrTable.add(object);
		}		
		PrintWriter print=response.getWriter();
		print.print(listJsonAttrTable.toString());
		print.flush();
		print.close();
	}

	
	public CustTagAttrInfoDaoImpl getCustTagAttrInfoDao() {
		return custTagAttrInfoDao;
	}
	public void setCustTagAttrInfoDao(CustTagAttrInfoDaoImpl custTagAttrInfoDao) {
		this.custTagAttrInfoDao = custTagAttrInfoDao;
	}
	public int getTagUserCounts() {
		return tagUserCounts;
	}
	public void setTagUserCounts(int tagUserCounts) {
	}
	public FileInputStream getDownloadFile() {
		return downloadFile;
	}
	public void setDownloadFile(FileInputStream downloadFile) {
		this.downloadFile = downloadFile;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public CustomgroupInfoDaoImpl getCustGroupDao() {
		return custGroupDao;
	}
	public void setCustGroupDao(CustomgroupInfoDaoImpl custGroupDao) {
		this.custGroupDao = custGroupDao;
	}
	public String getDownPath() {
		return downPath;
	}
	public void setDownPath(String downPath) {
		this.downPath = downPath;
	}
	
}
