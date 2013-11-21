package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import module.ApproverInfo;
import module.TabRequestDetl;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import common.GetLog;

import dao.ApproverInfoDaoImpl;
import dao.RegionDaoImpl;
import dao.TabRequestDetlDaoImpl;
import dao.TagApproveDaoImpl;
/**
 * 标签申请  审批  Action
 * @author ywz
 *
 */
public class TabRequestDeltAction extends ActionSupport {
	static TabRequestDetlDaoImpl tabRequestDetlDao;
	static TagApproveDaoImpl   tagApproveDao;
	TabRequestDetl tbrquestDel;
	static ApproverInfoDaoImpl  approverInfoDao;
	private String state;
	static ApplicationContext cxt;
	public static  void initTabRequestDetl(){
		XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		tabRequestDetlDao=(TabRequestDetlDaoImpl) factory.getBean("tabRequestDetlDaoImpl");

	}
	public static  void initTagApprove(){
		XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		tagApproveDao=(TagApproveDaoImpl) factory.getBean("tagApproveDaoImpl");
	}
	public static  void initApproverInfo(){
		XmlBeanFactory factory =new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		approverInfoDao=(ApproverInfoDaoImpl) factory.getBean("approverInfoDaoImpl");	
	}
	public String execute(){
		return "success";
	}
	public void getAppro() throws IOException{		
			this.initApproverInfo();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest    request  =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.setHeader("Content-Type", "text/html;charset=gbk");
	    request.setCharacterEncoding("gbk");
	    HttpSession session=request.getSession();
	    String regionName=session.getAttribute("regionName").toString();
	    List<ApproverInfo>  listAppro=null;
	    if (!regionName.equals("")){
	    	   listAppro=approverInfoDao.getApprover(regionName); 
	    	   JSONArray listJsonAppro=new JSONArray();
	   		   JSONObject object=new JSONObject();

	   		for(int i=listAppro.size();i>=0;i--){			 
	   			if (i!=listAppro.size()){
	   				ApproverInfo appInfo=listAppro.get(i);
	   		     	object.put("id", appInfo.getUser_id());
	   		    	object.put("text", appInfo.getUser_name());
	   			}else{
	   				object.put("id", "");
	   				object.put("text", "-请选择-");
	   			}
	   			listJsonAppro.add(object);
	   		}
	   		
	   		PrintWriter print=response.getWriter();
	   		print.print(listJsonAppro.toString());
	   		print.flush();
	   		print.close();   
	    }     
	   
	}
	
	public void getApproName() throws IOException{		
		this.initApproverInfo();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpServletRequest    request  =ServletActionContext.getRequest();
	response.setCharacterEncoding("gbk");
	response.setContentType("text/html;charset=gbk");
	response.setHeader("Content-Type", "text/html;charset=gbk");
    request.setCharacterEncoding("gbk");
    HttpSession session=request.getSession();
    String regionName=session.getAttribute("regionName").toString();
    List<ApproverInfo>  listAppro=null;
    if (!regionName.equals("")){
    	   listAppro=approverInfoDao.getApprover(regionName); 
    	   JSONArray listJsonAppro=new JSONArray();
   		   JSONObject object=new JSONObject();

   		for(int i=listAppro.size();i>=0;i--){			 
   			if (i!=listAppro.size()){
   				ApproverInfo appInfo=listAppro.get(i);
   		     	object.put("id", appInfo.getUser_name());
   		    	object.put("text", appInfo.getUser_name());
   			}else{
   				object.put("id", "");
   				object.put("text", "-请选择-");
   			}
   			listJsonAppro.add(object);
   		}
   		
   		PrintWriter print=response.getWriter();
   		print.print(listJsonAppro.toString());
   		print.flush();
   		print.close();   
    }     
   
}
	
	/**
	 *  添加申请详细信息       申请人信息和审批人信息
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String addTabRequestDelt() throws UnsupportedEncodingException{
		  if (null==tabRequestDetlDao)
			 this.initTabRequestDetl();
		  if(null== tagApproveDao)
			  this.initTagApprove();
		  if(null== approverInfoDao)			  
			  this.initApproverInfo();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  Calendar date = Calendar.getInstance();
		    String req_id= new SimpleDateFormat("yyyyMMddHHmmss").format(date.getTime());		   
		    String activename=request.getParameter("activename");
			String requestreson=request.getParameter("requestreson");
			String[] activescopeArray=request.getParameterValues("activescope");
			String activescope="";
			if (activescopeArray!=null){	
				for (int i=0;i<activescopeArray.length;i++){
					activescope+=activescopeArray[i]+",";
				}
			}else{
				activescope="";
			}

			String req_time_limit=request.getParameter("starttime")+","+request.getParameter("endtime");
			String requirecounts="";
			String[] marketArray=request.getParameterValues("market");
			String market="";
			if(marketArray!=null){
				for (int i=0;i<marketArray.length;i++){
					market+=marketArray[i]+",";
				}
			}

			String[] brankArray=request.getParameterValues("brank");
			String brank="";
			if (brankArray!=null){
				for (int i=0;i<brankArray.length;i++){
					brank+=brankArray[i]+",";
				}
			}
			String datagettype="";
			String contion=request.getParameter("contion");
			String verifierid=request.getParameter("verifier");
			String verifier="";
			if (!verifierid.equals("")){
				verifier=approverInfoDao.getNameById(verifierid);
			}
			String remark=request.getParameter("remark");
			String req_reson=request.getParameter("req_reson");   //申请人
		    HttpSession session = request.getSession();
		    String userId=(String) session.getAttribute("userId");
			//String req_reson="测试";
			//String ddd="";
		    GetLog.getLog("客户标签", "创建", req_id, req_reson+"申请标签"+req_id);
			//req_id,  req_name, req_resons, req_scope, req_time_limit, cus_need_counts,req_target, cus_brand, req_getdata_type, screen_condition, remark, req_reson, req_time
			if (tabRequestDetlDao.addTagReqDetl(req_id, activename, requestreson, activescope, req_time_limit, requirecounts, market, 
					brank, datagettype, contion, remark, req_reson, req_id,verifier)){
				if (tagApproveDao.addTagApprove(req_id, activename, req_reson, userId, req_id, verifier, verifierid, "0")){
					return "success";
				}else{
					return "false";
				}				
			}else{				
				return "false";
			}		
	}

	/**
	 * 待审核信息展示
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getTabRequestDetl() throws UnsupportedEncodingException{
		this.initTabRequestDetl();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  HttpServletRequest request = ServletActionContext.getRequest();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  request.setCharacterEncoding("gbk");
		  String req_id=request.getParameter("req_id");  //申请Id
		  //String req_id="20130603115201";
		  tbrquestDel=tabRequestDetlDao.getTabRequestDetl(req_id);
		  if (tbrquestDel.equals(null))
			  return "fail";
		return "success";
	}
   
    /**
     * 审核申请
     * @return
     * @throws UnsupportedEncodingException 
     */
	public String verifyTag() throws UnsupportedEncodingException{
		this.initTagApprove();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  HttpServletRequest request = ServletActionContext.getRequest();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  request.setCharacterEncoding("gbk");
		  String userId=(String) request.getSession().getAttribute("userId");
		  String req_id=request.getParameter("req_id");
		  state=tagApproveDao.getState(req_id);
		  String remark=URLDecoder.decode(request.getParameter("remark"), "utf-8");
		  GetLog.getLog("标签管理", "修改", "审核申请", req_id+","+userId);
		  if( tagApproveDao.updateTagApprove(req_id, "1",remark))			
			  return "success";		  
		  return "fail";
	}
	/**
	 * 驳回申请
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String rejectTag() throws UnsupportedEncodingException{
		 this.initTagApprove();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  HttpServletRequest request = ServletActionContext.getRequest();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  request.setCharacterEncoding("gbk");
		  String req_id=request.getParameter("req_id");
		  String userId=(String) request.getSession().getAttribute("userId");
		  String remark=URLDecoder.decode(request.getParameter("remark"), "utf-8");
		  GetLog.getLog("标签管理", "修改", "回退申请", req_id+","+userId+",");
		  
		  if( tagApproveDao.updateTagApprove(req_id, "2",remark))
		    return "success";
		  return "fail";
	}
	
	public TabRequestDetlDaoImpl getTabRequestDetlDao() {
		return tabRequestDetlDao;
	}

	public void setTabRequestDetlDao(TabRequestDetlDaoImpl tabRequestDetlDao) {
		this.tabRequestDetlDao = tabRequestDetlDao;
	}
	public TagApproveDaoImpl getTagApproveDao() {
		return tagApproveDao;
	}
	public void setTagApproveDao(TagApproveDaoImpl tagApproveDao) {
		this.tagApproveDao = tagApproveDao;
	}
	public TabRequestDetl getTbrquestDel() {
		return tbrquestDel;
	}
	public void setTbrquestDel(TabRequestDetl tbrquestDel) {
		this.tbrquestDel = tbrquestDel;
	}
	public ApproverInfoDaoImpl getApproverInfoDao() {
		return approverInfoDao;
	}
	public void setApproverInfoDao(ApproverInfoDaoImpl approverInfoDao) {
		this.approverInfoDao = approverInfoDao;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}		
}
