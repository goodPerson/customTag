package action.push;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import module.DownloadInfo;
import module.push.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionSupport;

import dao.push.ComboboxJsonImpl;
import dao.push.CreatePlanImpl;

public class CreatePlanAction extends ActionSupport{
	private String path;//导入的文件的路径
	private String fileName = "";
	private String dirPath ="/app1/newmapfile";
	//	/app1/newmapfile
	private File file;
	private String pastname;
	private static String oldname;
	private static String uploadname;
	private int pageno;
	private int pagesize;
	private final static int BUFFER_SIZE = 1024 * 1024;
	private static ComboboxJsonImpl custjson;
	private static CreatePlanImpl create;
	private List<TargetCust> custlist;
	private List<UploadInfo> uploadlist;
	private String msg;
	private List<DownloadInfo> downlist;
	private String custname;
	private String custtype;
	private String custid;


	public static void initTag(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		custjson=(ComboboxJsonImpl)factory.getBean("jsonImpl");

	}

	public static void initCreate(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		create=(CreatePlanImpl)factory.getBean("createImpl");
	}	

	public String entryplan_create(){
		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest   request = ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		custname=request.getParameter("filename");
		custtype=request.getParameter("filetype");
		if ("标签清单".equals(custtype)) {
			custtype="TAG";
		}else if("客户群清单".equals(custtype)){
			custtype="GROUP";
		}

		custid=request.getParameter("id");
		return SUCCESS;
	}

	public void getCust() throws IOException{
		this.initTag();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String type=request.getParameter("type");
		String userId=(String) request.getSession().getAttribute("userId");
		custlist=custjson.getcust(userId,type);
		JSONArray list=new JSONArray();
		JSONObject object=new JSONObject();
		for(int i=0;i<custlist.size();i++){			 
			TargetCust cust= custlist.get(i);
			object.put("id", cust.getCustid());
			object.put("text", cust.getCustname());
			list.add(object);
		}
		PrintWriter print=response.getWriter();
		print.print(list.toString());
		print.flush();
		print.close();

	}

	public void datagridjson () throws IOException{
		this.initTag();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String userId=(String) request.getSession().getAttribute("userId");
		String userName=(String) request.getSession().getAttribute("userName");
		uploadlist=custjson.getupload(userId);
		JSONArray list=new JSONArray();
		JSONObject object=new JSONObject();
		for(int i=0;i<uploadlist.size();i++){		
			UploadInfo upload=uploadlist.get(i);
			object.put("creator", userName);
			object.put("filename", upload.getFilename());
			object.put("time", upload.getUploadtime());
			object.put("upload", upload.getUploadfilename());
			object.put("operate","<a href='javascript:Delfile();'>删除</a>");
			list.add(object);
		}
		PrintWriter print=response.getWriter();
		print.print(list.toString());
		print.flush();
		print.close();

	}


	public void delupload (){
		this.initCreate();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String upload=request.getParameter("upload");
		try {
			create.delUpload(upload);
			msg="删除成功";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			msg="删除失败";
		}

	}


	public void deluploadbyplanid(){
		if (create==null) {
			this.initCreate();
		}		
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String planid=request.getParameter("planId");
		String creator=request.getParameter("creator");
		if (planid!=null&&!"".equals(planid)&&creator!=null&&!"".equals(creator)) {

			try {
				create.delUploadByPlanId(planid,creator);
				msg="删除成功";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				msg="删除失败";
			}

		}
	}



	private static void copy(File src, File dst) {

		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);

				out = new BufferedOutputStream(new FileOutputStream(dst), BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (true) {
					int temp = in.read(buffer);
					if (temp == -1)
						break;
					out.write(buffer, 0, temp);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String importNames() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();		
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");

		//		fileName=URLDecoder.decode(request.getParameter("fileName"),"utf-8");		
		if (fileName != null) {
			fileName = URLDecoder.decode(fileName, "UTF-8");
		}
		pastname=fileName;
		int i=fileName.lastIndexOf("\\");
		oldname=fileName.substring(i+1);
		int lastPosi=fileName.lastIndexOf(".");
		fileName=fileName.substring(lastPosi);

		File uploadDir = new File(dirPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		String uploadFileName = new Date().getTime() + fileName;
		uploadname=uploadFileName;
		File uploadFile = new File(dirPath, uploadFileName);
		if (!uploadFile.exists()) {
			try {
				uploadFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (file != null) {
			copy(file, uploadFile);// 上传excel文件
		}
		this.initCreate();
		Calendar date = Calendar.getInstance();
		String time= new SimpleDateFormat("yyyyMMdd HHmmss").format(date.getTime());
		String userId=(String)request.getSession().getAttribute("userId");
		String id=request.getParameter("id");
		UploadInfo upload=new UploadInfo();
		upload.setPlanid(id);
		upload.setCreateid(userId);
		upload.setFilename(oldname);
		upload.setUploadfilename(uploadname);
		upload.setUploadtime(time);
		create.addUpload(upload);
		return "success";

	}
	public void addPlan() throws IOException{
		this.initCreate();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		Calendar date = Calendar.getInstance();
		String time= new SimpleDateFormat("yyyyMMdd HHmmss").format(date.getTime());
		String userId=(String) request.getSession().getAttribute("userId");
		String userName=(String) request.getSession().getAttribute("userName");
		String regionId=(String)request.getSession().getAttribute("companyid");
		if("1".equals(regionId)){
			regionId="999";
		}else if("320".equals(regionId.substring(0, 3))){
			regionId="310";
		}else{
			regionId=regionId.substring(0, 3);
		}
		String regionName=(String) request.getSession().getAttribute("regionName");
		String id=request.getParameter("id");
		String planname=request.getParameter("planname");
		String starttime=request.getParameter("start_date");
		String endtime=request.getParameter("end_date");
		String product=request.getParameter("product");
		String custtype=request.getParameter("custtype");
		String custid =request.getParameter("custid");
		String chnl=request.getParameter("chnl");
		String comment=request.getParameter("comment");
		String sp_serv="";
		String sp_enterprise="";
		String fav_id="";
		String product_id="";
		String type1=request.getParameter("type");
		if("prevelige".equals(type1)){
			fav_id=request.getParameter("value1");
		}else if("product".equals(type1)){
			product_id=request.getParameter("value1");
		}else if("pre_product".equals(type1)){
			product_id=request.getParameter("value1");
			fav_id=request.getParameter("value1Pri");
		}else if("sp".equals(type1)){
			sp_serv=request.getParameter("value1");
			sp_enterprise=request.getParameter("value2");
		}
		PlanInfo plan=new PlanInfo();
		plan.setPlanid(id);
		plan.setPlanname(planname);
		plan.setPlanregionid(regionId);
		plan.setPlanregionname(regionName);
		plan.setStarttime(starttime);
		plan.setEndtime(endtime);
		plan.setPushtime(time);
		plan.setCusttype(custtype);
		plan.setTargetcustid(custid);                                                         
		plan.setPushchanlid(chnl);
		plan.setProductid(product_id);
		plan.setProducttype(type1);
		plan.setSpenterpriseid(sp_enterprise);
		plan.setSpserved(sp_serv);
		plan.setFavid(fav_id);
		plan.setCreaterid(userId);
		plan.setCreatername(userName);
		plan.setCreaterregionId(regionId);
		plan.setPlanstate("0");
		plan.setPlancomment(comment);
		String result="";
		int resultcount=create.addPlan(plan);
		System.out.println("add==============="+resultcount);
		if (resultcount>0) {
			result="ok";
			create.wrightlog(userId, userName, time, id, "营销活动创建");
		}else {
			result="fail";
		}
		PrintWriter print=response.getWriter();
		print.print(result);
		print.flush();
		print.close();
	}

	public String updateplan(){
		this.initCreate();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String plan_id=request.getParameter("plan_id");
		System.out.println("plan_id="+plan_id);
		int resultcount= create.updateplan(plan_id);
		String userId=(String) request.getSession().getAttribute("userId");
		String userName=(String) request.getSession().getAttribute("userName");
		Calendar date = Calendar.getInstance();
		String time= new SimpleDateFormat("yyyyMMdd HH:mm:ss").format(date.getTime());
		System.out.println("update==============="+resultcount);
		if (resultcount>0) {
			create.wrightlog(userId, userName, time, plan_id, "营销活动生成");
			return SUCCESS;
		}else {
			return ERROR;
		}
		
	}

	public void downlist() throws IOException{
		this.initTag();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
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
		int begin=(pageno-1)*pagesize+1;
		int end=pageno*pagesize;
		String userId=(String) request.getSession().getAttribute("userId");
		//(String) request.getSession().getAttribute("userId");
		String type =request.getParameter("type");
		int count=custjson.countlist(userId, type);
		downlist= custjson.getcustomlist(userId, type,begin,end);
		JSONArray list=new JSONArray();
		JSONObject object=new JSONObject();
		for(int i=0;i<downlist.size();i++){		
			DownloadInfo upload=downlist.get(i);
			object.put("filename", upload.getFile_name());
			object.put("id", upload.getId());
			object.put("time", upload.getCreate_time());
			object.put("type", upload.getFile_type());
			object.put("count",upload.getCount());
			object.put("region",upload.getRegion_name());
			list.add(object);
		}
		JSONObject jsonObjectFinal1 = new JSONObject();
		jsonObjectFinal1.put("total", count);
		jsonObjectFinal1.put("rows", list);
		PrintWriter print=response.getWriter();
		print.print(jsonObjectFinal1.toString());
		print.flush();
		print.close();
	}


	public void selectedcustlist() throws IOException{
		this.initTag();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest   request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk"); 
		String userId=(String) request.getSession().getAttribute("userId");
		//(String) request.getSession().getAttribute("userId");
		String custid =request.getParameter("custid");
		String custname =request.getParameter("custname"); 
		downlist= custjson.getselectcustomlist(userId, custid,custname);
		JSONArray list=new JSONArray();
		JSONObject object=new JSONObject();
		for(int i=0;i<downlist.size();i++){		
			DownloadInfo upload=downlist.get(i);
			object.put("filename", upload.getFile_name());
			object.put("id", upload.getId());
			object.put("time", upload.getCreate_time());
			object.put("type", upload.getFile_type());
			object.put("count",upload.getCount());
			object.put("region",upload.getRegion_name());
			list.add(object);
		}
		JSONObject jsonObjectFinal1 = new JSONObject(); 
		jsonObjectFinal1.put("rows", list);
		PrintWriter print=response.getWriter();
		print.print(jsonObjectFinal1.toString());
		print.flush();
		print.close();
	}


	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getDirPath() {
		return dirPath;
	}

	public void setDirPath(String dirPath) {
		this.dirPath = dirPath;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public static int getBufferSize() {
		return BUFFER_SIZE;
	}

	public String getPastname() {
		return pastname;
	}

	public void setPastname(String pastname) {
		this.pastname = pastname;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getCusttype() {
		return custtype;
	}

	public void setCusttype(String custtype) {
		this.custtype = custtype;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}



}
