package action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import module.CustTagAndGroupMonitorM;
import module.TagSubsDayDetail;
import module.TagSubsMonthDetail;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import com.opensymphony.xwork2.ActionSupport;

import common.CommonUtil;
import common.PrintExcelUtil;

import dao.TagSubsDetImpl;

public class TagSubsDetailAction extends ActionSupport {
	/**下载渠道经理详细信息所需要的参数*/
	String contentType;//内容类型
	FileInputStream downloadFile;//
	String fileName;//文件名
	private  TagSubsDetImpl   tsdi=null;
	private  HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	String regionNameS=session.getAttribute("regionName").toString();
	
	private  void inittagSubsDao(){
		XmlBeanFactory  factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		tsdi=(TagSubsDetImpl) factory.getBean("tagsubdet");
	}
	/**
	 * 导出月明细下载
	 * @return
	 * @throws Exception 
	 */
	public String exportMdet() throws Exception{
		inittagSubsDao();
		   response.setCharacterEncoding("utf-8");
		   response.addHeader("Content-Type", "text/html;charset=utf-8");
		   String title="";
		   String statisMonth   =request.getParameter("statisMonth");
		   if("".equals(statisMonth)){
			   statisMonth="0";
		   }
		   String userName      =CommonUtil.requestFormat(request.getParameter("userName"));
		   String regionName  =CommonUtil.requestFormat(request.getParameter("regionName"));
		   String countryName =CommonUtil.requestFormat(request.getParameter("countryName"));
		   if (!"".equals(regionName)){
			   title+=regionName+"_";			   
		   }
		   if (!"".equals(countryName)){
			   title+=countryName+"_";
		   }
		   title+="客户标签明细月统计";
		   
		   TagSubsMonthDetail tsmd=new TagSubsMonthDetail();
		   tsmd.setStatisMonth(Integer.parseInt(statisMonth));
		   tsmd.setUserName(userName);
		   tsmd.setRegionName(regionName);
		   tsmd.setCountryName(countryName);
		   
		   List<TagSubsMonthDetail>  listTagM=tsdi.getListTsmd(regionNameS,tsmd);	
		   String  exportType = "xls";
			// 定义表头
			String header = "月份 用户姓名 地域名称 区县名称 访问次数 客户清单下载次数 客户分群创建个数 标签新增创建个数  ";
			// 获取数据
			List<Object[]> datalist = new ArrayList<Object[]>();
			for (int i = 0; i < listTagM.size(); i++) {
				TagSubsMonthDetail t = (TagSubsMonthDetail) listTagM.get(i);
				Object[]	obj={((TagSubsMonthDetail) t).getStatisMonth(),((TagSubsMonthDetail) t).getUserName(),((TagSubsMonthDetail) t).getRegionName(),
						((TagSubsMonthDetail) t).getCountryName(),((TagSubsMonthDetail) t).getAccessCnt(),((TagSubsMonthDetail) t).getDownloadCnt(),
						((TagSubsMonthDetail) t).getGroupCreateCnt(),((TagSubsMonthDetail) t).getTagCreateCnt()};
				datalist.add(obj);
			}
			finputStream(title,exportType,  header,  datalist);		   
		return "exportMdet";
	}
	/**
	 * 获取用户使用_月_明细
	 * @return
	 * @throws IOException 
	 */
	public void getTagSubsM() throws IOException{
		   inittagSubsDao();
		   response.setCharacterEncoding("utf-8");
		   response.addHeader("Content-Type", "text/html;charset=utf-8");
		   
		   String statisMonth   =CommonUtil.requestFormat(request.getParameter("statisMonth"));
		   if("".equals(statisMonth)){
			   statisMonth="0";
		   }
		   String userName      =CommonUtil.requestFormat(request.getParameter("userName"));
		   String regionName  =CommonUtil.requestFormat(request.getParameter("regionName"));
		   String countryName =CommonUtil.requestFormat(request.getParameter("countryName"));
		    int pageno=0;
			int pagesize=0;
			
			if (request.getParameter("page")==null || ""==request.getParameter("page")){
				pageno=1;
			}else{
				pageno=Integer.parseInt(request.getParameter("page"));
			}
			if(request.getParameter("rows")==null || ""==request.getParameter("rows")){
				pagesize=10;
			}else{
				pagesize=Integer.parseInt(request.getParameter("rows"));
			}
		   
		   
		   TagSubsMonthDetail tsmd=new TagSubsMonthDetail();
		   tsmd.setStatisMonth(Integer.parseInt(statisMonth));
		   tsmd.setUserName(userName);
		   tsmd.setRegionName(regionName);
		   tsmd.setCountryName(countryName);
		   
		   List<TagSubsMonthDetail>  listTagM=tsdi.getListTsmd(regionNameS,tsmd, pageno, pagesize);		
		   int totalRecord=tsdi.getPageInfo().getTotalRows();
		   
		   JSONArray jsonArray=new JSONArray();
		   for(TagSubsMonthDetail tsmdt:listTagM){
			   JSONObject obj=new JSONObject();
			   obj.put("statisMonth", tsmdt.getStatisMonth());
			   obj.put("userId", tsmdt.getUserId());
			   obj.put("userName", tsmdt.getUserName());
			   obj.put("regionName", tsmdt.getRegionName());
			   obj.put("countryName", tsmdt.getCountryName());
			   obj.put("accessCnt", tsmdt.getAccessCnt());
			   obj.put("downloadCnt", tsmdt.getDownloadCnt());
			   obj.put("groupCreateCnt", tsmdt.getGroupCreateCnt());
			   obj.put("tagCreateCnt", tsmdt.getTagCreateCnt());			   
			   jsonArray.add(obj);			   
		   }
		   
		   JSONObject  jsonFinal=new JSONObject();
		   jsonFinal.put("total", totalRecord);
		   jsonFinal.put("rows", jsonArray);
		   
		   printWriter(jsonFinal.toString());
		  
	}
	
	/**
	 * 导出明细日统计
	 * @return
	 * @throws Exception
	 */
	public String exportDdet() throws Exception{
		   inittagSubsDao();
		   response.setCharacterEncoding("utf-8");
		   response.addHeader("Content-Type", "text/html;charset=utf-8");
		   String title="";
		   
		   String starTime         =request.getParameter("starTime");
		   String endTime        =request.getParameter("endTime");
		   String userName      =CommonUtil.requestFormat(request.getParameter("userName"));
		   String regionName  =CommonUtil.requestFormat(request.getParameter("regionName"));
		   String countryName =CommonUtil.requestFormat(request.getParameter("countryName"));
		   
		   if (!"".equals(regionName)){
			   title+=regionName+"_";			   
		   }
		   if (!"".equals(countryName)){
			   title+=countryName+"_";
		   }
		   title+="客户标签明细日统计";
		   
		   
		   TagSubsDayDetail tsdd=new TagSubsDayDetail();
		  // tsdd.setStatisDate(Integer.parseInt(statisDate));
		   tsdd.setUserName(userName);
		   tsdd.setRegionName(regionName);
		   tsdd.setCountryName(countryName);
		   
		   List<TagSubsDayDetail>  listTagD=tsdi.getListTsdd(regionNameS,starTime,endTime,tsdd);	
		   String  exportType = "xls";
			// 定义表头
			String header = "日期 用户姓名 地域名称 区县名称 访问次数 客户清单下载次数 客户分群创建个数 标签新增创建个数  ";
			// 获取数据
			List<Object[]> datalist = new ArrayList<Object[]>();
			for (int i = 0; i < listTagD.size(); i++) {
				TagSubsDayDetail t = (TagSubsDayDetail) listTagD.get(i);
				Object[]	obj={((TagSubsDayDetail) t).getStatisDate(),((TagSubsDayDetail) t).getUserName(),((TagSubsDayDetail) t).getRegionName(),
						((TagSubsDayDetail) t).getCountryName(),((TagSubsDayDetail) t).getAccessCnt(),((TagSubsDayDetail) t).getDownloadCnt(),
						((TagSubsDayDetail) t).getGroupCreateCnt(),((TagSubsDayDetail) t).getTagCreateCnt()};
				datalist.add(obj);
			}
			finputStream(title,exportType,  header,  datalist);		  
		return "exportDdet";
	}
	
	/**
	 * 获取用户使用_日_明细
	 * @throws IOException
	 */
	public void getTagSubsD() throws IOException{
		   inittagSubsDao();
		   response.setCharacterEncoding("utf-8");
		   response.addHeader("Content-Type", "text/html;charset=utf-8");
		   
		   /*
		   String statisDate   =request.getParameter("statisDate");
		   if("".equals(statisDate)){
			   statisDate="0";
		   }
		   */
		   String starTime         =request.getParameter("starTime");
		   String endTime        =request.getParameter("endTime");
		   String userName      =CommonUtil.requestFormat(request.getParameter("userName"));
		   String regionName  =CommonUtil.requestFormat(request.getParameter("regionName"));
		   String countryName =CommonUtil.requestFormat(request.getParameter("countryName"));
		   int pageno=0;
			int pagesize=0;
			
			if (request.getParameter("page")==null || ""==request.getParameter("page")){
				pageno=1;
			}else{
				pageno=Integer.parseInt(request.getParameter("page"));
			}
			if(request.getParameter("rows")==null || ""==request.getParameter("rows")){
				pagesize=10;
			}else{
				pagesize=Integer.parseInt(request.getParameter("rows"));
			}
		   
		   TagSubsDayDetail tsdd=new TagSubsDayDetail();
		  // tsdd.setStatisDate(Integer.parseInt(statisDate));
		   tsdd.setUserName(userName);
		   tsdd.setRegionName(regionName);
		   tsdd.setCountryName(countryName);
		   
		   //List<TagSubsDayDetail>  listTagD=tsdi.getListTsdd(tsdd, pageno, pagesize);	
		   List<TagSubsDayDetail>  listTagD=tsdi.getListTsdd(regionNameS,starTime,endTime,tsdd, pageno, pagesize);	
		   int totalRecord=tsdi.getPageInfo().getTotalRows();
		   
		   
		   JSONArray jsonArray=new JSONArray();
		   for(TagSubsDayDetail tsddt:listTagD){
			   JSONObject obj=new JSONObject();
			   obj.put("statisDate", tsddt.getStatisDate());
			   obj.put("userId", tsddt.getUserId());
			   obj.put("userName", tsddt.getUserName());
			   obj.put("regionName", tsddt.getRegionName());
			   obj.put("countryName", tsddt.getCountryName());
			   obj.put("accessCnt", tsddt.getAccessCnt());
			   obj.put("downloadCnt", tsddt.getDownloadCnt());
			   obj.put("groupCreateCnt", tsddt.getGroupCreateCnt());
			   obj.put("tagCreateCnt", tsddt.getTagCreateCnt());			   
			   jsonArray.add(obj);			   
		   }
		   
		   JSONObject  jsonFinal=new JSONObject();
		   jsonFinal.put("total", totalRecord);
		   jsonFinal.put("rows", jsonArray);
		   
		   printWriter(jsonFinal.toString());
		  
	}
	/**
	 * 获取月用户名
	 * @throws IOException 
	 */
	public void getUserName() throws IOException{
		 inittagSubsDao();
		 response.setCharacterEncoding("gbk");
		 response.setContentType("text/html;charset=gbk");
		 
		 List<Map<String,Object>> list=tsdi.getUserName(regionNameS);
		    JSONArray  jsonArray=new JSONArray();
			for(Map<String,Object> map: list){
				JSONObject obj=new JSONObject();
				obj.put("id", map.get("USER_NAME"));
				obj.put("text", map.get("USER_NAME"));
				jsonArray.add(obj);
			}
			printWriter(jsonArray.toString());
	}
	/**
	 * 获取月区县的名称
	 * @throws IOException 
	 */
	public void getCountyNamel() throws IOException{
		inittagSubsDao();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		List<Map<String,Object>> list=null;
		String rCityName=CommonUtil.requestFormat(request.getParameter("rCityName"));
		if (!"".equals(rCityName)){
			list=tsdi.getCountyName(rCityName);
		}else{
			list=tsdi.getCountyName(regionNameS);
		}
		JSONArray  jsonArray=new JSONArray();
		for(Map<String,Object> map: list){
			JSONObject obj=new JSONObject();
			obj.put("id", map.get("COUNTRY_NAME"));
			obj.put("text", map.get("COUNTRY_NAME"));
			jsonArray.add(obj);
		}
		printWriter(jsonArray.toString());
				
	}
    
	/**
	 * 获取日用户名
	 * @throws IOException 
	 */
	public void getUserNameD() throws IOException{
		 inittagSubsDao();
		 response.setCharacterEncoding("gbk");
		 response.setContentType("text/html;charset=gbk");
		
		 List<Map<String,Object>> list=tsdi.getUserNameD(regionNameS);
		    JSONArray  jsonArray=new JSONArray();
			for(Map<String,Object> map: list){
				JSONObject obj=new JSONObject();
				obj.put("id", map.get("USER_NAME"));
				obj.put("text", map.get("USER_NAME"));
				jsonArray.add(obj);
			}
			printWriter(jsonArray.toString());
	}
	/**
	 * 获取日区县的名称
	 * @throws IOException 
	 */
	public void getCountyNamelD() throws IOException{
		inittagSubsDao();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");		
		String rCityName=CommonUtil.requestFormat(request.getParameter("rCityName"));
		List<Map<String,Object>> list=null;
		if(!"".equals(rCityName)){
			 list=tsdi.getCountyNameD(rCityName);
			
		}else{
			list=tsdi.getCountyNameD(regionNameS);
		}		
		 
		JSONArray  jsonArray=new JSONArray();
		for(Map<String,Object> map: list){
			JSONObject obj=new JSONObject();
			obj.put("id", map.get("COUNTRY_NAME"));
			obj.put("text", map.get("COUNTRY_NAME"));
			jsonArray.add(obj);
		}
		printWriter(jsonArray.toString());
				
	}
    
	/**
	 * 获取用户明细统计
	 * @return
	 */
	public String getConutTag(){
		return "getConutTag";
	}
	
	private void finputStream(String title,String exportType, String header, List<Object[]> datalist) throws Exception{
		FileInputStream result = PrintExcelUtil.getDownloadFile(exportType,
				title, title, header, datalist);
		contentType = "application/vnd.ms-excel;charset=utf-8";
		downloadFile = result;
		fileName = title+".xls";
		fileName = new String(fileName.getBytes(), "ISO8859-1");
	}	
	
	private void printWriter(String jsonArray) throws IOException{
		PrintWriter print=response.getWriter();
		print.write(jsonArray);
		print.flush();
		print.close();
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public FileInputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(FileInputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
