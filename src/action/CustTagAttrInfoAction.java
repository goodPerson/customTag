package action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javassist.bytecode.Descriptor.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.AttrTable;
import module.ExportUserInfo;
import module.Region;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import common.PrintExcelUtil;

import dao.AttrTableDaoImpl;
import dao.CustTagAttrInfoDaoImpl;
import dao.CustomgroupInfoDaoImpl;

public class CustTagAttrInfoAction {
	private  CustTagAttrInfoDaoImpl custTagAttrInfoDao;
	private   AttrTableDaoImpl attrTableDao;
	private  CustomgroupInfoDaoImpl custGroupDao;
	private int tagUserCounts;
	private String downPath;
	 /*下载导出所需要的参数*/
	String contentType;//内容类型
	FileInputStream downloadFile;//
	String fileName;//文件名
	  // static ApplicationContext factory=null;
	public  void initCustTagAttr(){
		XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		//if (null==factory)
		//	factory = new ClassPathXmlApplicationContext("applicationContext.xml");
		custTagAttrInfoDao=(CustTagAttrInfoDaoImpl) factory.getBean("custTagAttrInfoDaoImpl");
		
	}
	public  void initCustGroupInfo(){
		XmlBeanFactory factory =new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		//if (null==factory)
		//	factory = new ClassPathXmlApplicationContext("applicationContext.xml");
		custGroupDao=(CustomgroupInfoDaoImpl) factory.getBean("customgroupInfoDaoImpl");
	}
	
	public  void initAttrTable(){
		XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
	//	if (null==factory)
			//factory = new ClassPathXmlApplicationContext("applicationContext.xml");
		attrTableDao=(AttrTableDaoImpl) factory.getBean("attrTableDaoImpl");
		
	}
	/**
	 * 修改标签
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String updateGroupTag() throws UnsupportedEncodingException{
		//if (null==custTagAttrInfoDao)
		this.initCustTagAttr();
		String flag="";
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
		String tag_id=request.getParameter("tag_id");
		String tag_attrs=URLDecoder.decode(request.getParameter("tag_attrs"), "utf-8");
		String stamt=URLDecoder.decode(request.getParameter("stamt"), "utf-8");		
		String persons=URLDecoder.decode(request.getParameter("persons"), "utf-8");		
		String sql=URLDecoder.decode(request.getParameter("sql"), "utf-8");
				sql=sql.replace("'", "'||Chr(39)||'");		
		
		if (custTagAttrInfoDao.updateGroupTag(tag_id, tag_attrs, stamt,persons,sql))
			flag="success";
		else
			flag="false";
		return flag;
	}
	/*导出标签*/
	public String exportTag(){
		//if (null==custTagAttrInfoDao)
		this.initCustTagAttr();
		
		return "success";
	}
	/*筛选标签*/
	public String filterTagExport() throws Exception{
		//if (null==custTagAttrInfoDao)
		this.initCustTagAttr();
		//if (null==custGroupDao)
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
		//if (null==custTagAttrInfoDao)
		this.initCustTagAttr();

		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setHeader("Content-Type", "text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
		String attrsql=URLDecoder.decode(request.getParameter("sql"),"utf-8");
		tagUserCounts=custTagAttrInfoDao.getUserTagConts(attrsql);
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
		//if (null==attrTableDao)
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
