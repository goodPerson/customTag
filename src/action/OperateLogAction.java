package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.OperateLog;
import module.TagAprove;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionSupport;
import common.GetLog;

import dao.OperateLogDaoImpl;
import dao.TagApproveImpl;
/**
 * 日志操作
 * @author ywz
 *@date 20130624
 */
public class OperateLogAction extends ActionSupport{
	private String userNamePar;      
	private String regionNamePar;   
	private String columnNamePar;  
	private String operateTypePar;  
	private String operateNamePar;
	private String operateParaPar;   
	
	//分页功能参数  start
	
	private int pageNo;  //当前页
	private int pageCounts;  //总页数
	private int totalRecords; //总记录数
	
	//分页功能参数  end
	private static  OperateLogDaoImpl operateLogDao;
	private List<OperateLog> listOLog= new ArrayList<OperateLog>();
	static ApplicationContext cxt=null;
	public static  void initOperateLog(){
		//XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		//operateLogDao=(OperateLogDaoImpl)factory.getBean("operateLogDaoImpl");
		//if (null==cxt)
		  cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
		operateLogDao=(OperateLogDaoImpl)cxt.getBean("operateLogDaoImpl");
	}
	public OperateLogAction(){
		if (null==cxt)
		  cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
		if (null==operateLogDao)
		operateLogDao=(OperateLogDaoImpl)cxt.getBean("operateLogDaoImpl");
	}
	
	/**
	 * 查询日志记录
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String findOperateLog() throws UnsupportedEncodingException{
	    int pageSize=15;
		//if (null==operateLogDao)
			//this.initOperateLog();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest    request  =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
       String pageNoS=request.getParameter("pageNo");
		
		if (null==pageNoS || pageNoS.trim().length()==0){
			pageNo=1;
		}else{
			pageNo=Integer.parseInt(pageNoS);
		}
		 userNamePar      =URLDecoder.decode(request.getParameter("userName"),"utf-8");
         regionNamePar   =URLDecoder.decode(request.getParameter("regionName"),"utf-8");
         columnNamePar  =URLDecoder.decode(request.getParameter("columnName"),"utf-8");
         operateTypePar   =URLDecoder.decode(request.getParameter("operateType"),"utf-8");
         operateNamePar =URLDecoder.decode(request.getParameter("operateName"),"utf-8");
        // operatePara    =URLDecoder.decode(request.getParameter("operatePara"),"utf-8");
        List<OperateLog>  tempListOLog= operateLogDao.findOperateLog(userNamePar, regionNamePar, columnNamePar, operateTypePar, operateNamePar, "", pageNo, pageSize);
        pageCounts=operateLogDao.getPageInfo().getTotalPages();		
        if (pageNo<=1){
			pageNo=1;
		}else if (pageNo>=pageCounts){
			pageNo=pageCounts;
		}
			
		totalRecords=operateLogDao.getPageInfo().getTotalRows();
		if (totalRecords<1)
			totalRecords=0;		
		listOLog=operateLogDao.findOperateLog(userNamePar, regionNamePar, columnNamePar, operateTypePar, operateNamePar, "", pageNo, pageSize);
		GetLog.getLog("日志管理", "查找", "日志查找", userNamePar+","+regionNamePar+","+columnNamePar+","+operateTypePar+","+operateNamePar);
		return SUCCESS;
	}

	/**
	 *获取用户名
	 * @throws IOException 
	 */
	public void getUserName() throws IOException{
		//if (null==operateLogDao)
			//this.initOperateLog();
		HttpServletRequest request   =ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		JSONArray listJsonUserName=new JSONArray();
		JSONObject userName=new JSONObject();
		List listUserName=operateLogDao.getUserName();
		for(int i=listUserName.size();i>=0;i--){
			if(i!=listUserName.size()){
				userName.put("id", listUserName.get(i));
				userName.put("text", listUserName.get(i));
			}else{
				userName.put("id", "");
				userName.put("text","-请选择-");
			}
			listJsonUserName.add(userName);
		}
		PrintWriter print=response.getWriter();
		print.print(listJsonUserName.toString());
		print.flush();
		print.close();
	}
	
	/**
	 *获取地域名
	 * @throws IOException 
	 */
	public void getRegionName() throws IOException{
		//if (null==operateLogDao)
		//	this.initOperateLog();
		HttpServletRequest request   =ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		JSONArray listJsonRegionName=new JSONArray();
		JSONObject regionName=new JSONObject();
		List listRegionName=operateLogDao.getRegionName();
		for(int i=listRegionName.size();i>=0;i--){
			if(i!=listRegionName.size()){
				regionName.put("id", listRegionName.get(i));
				regionName.put("text", listRegionName.get(i));
			}else{
				regionName.put("id", "");
				regionName.put("text","-请选择-");
			}
			listJsonRegionName.add(regionName);
		}
		PrintWriter print=response.getWriter();
		print.print(listJsonRegionName.toString());
		print.flush();
		print.close();
	}
	/**
	 *获取栏目名称
	 * @throws IOException 
	 */
	public void getColumnName() throws IOException{
		// initOperateLog();
		HttpServletRequest request   =ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		JSONArray listJsonColumnName=new JSONArray();
		JSONObject columnName=new JSONObject();
		List listColumnName=operateLogDao.getColumnName();
		for(int i=listColumnName.size();i>=0;i--){
			if(i!=listColumnName.size()){
				columnName.put("id", listColumnName.get(i));
				columnName.put("text", listColumnName.get(i));
			}else{
				columnName.put("id", "");
				columnName.put("text","-请选择-");
			}
			listJsonColumnName.add(columnName);
		}
		PrintWriter print=response.getWriter();
		print.print(listJsonColumnName.toString());
		print.flush();
		print.close();
	}
	
	/**
	 *获取操作类型
	 * @throws IOException 
	 */
	public void getOperateType() throws IOException{
		//if (null==operateLogDao)
		//	this.initOperateLog();
		HttpServletRequest request   =ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		JSONArray listJsonOperateType=new JSONArray();
		JSONObject operateType=new JSONObject();
		List listOperateType=operateLogDao.getOperateType();
		for(int i=listOperateType.size();i>=0;i--){
			if(i!=listOperateType.size()){
				operateType.put("id", listOperateType.get(i));
				operateType.put("text", listOperateType.get(i));
			}else{
				operateType.put("id", "");
				operateType.put("text","-请选择-");
			}
			listJsonOperateType.add(operateType);
		}
		PrintWriter print=response.getWriter();
		print.print(listJsonOperateType.toString());
		print.flush();
		print.close();
	}
	
	/**
	 *获取操作名称
	 * @throws IOException 
	 */
	public void getOperateName() throws IOException{
		//if (null==operateLogDao)
		//	this.initOperateLog();
		HttpServletRequest request   =ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		JSONArray listJsonOperateName=new JSONArray();
		JSONObject operateName=new JSONObject();
		List listOperateName=operateLogDao.getOperateName();
		for(int i=listOperateName.size();i>=0;i--){
			if(i!=listOperateName.size()){
				operateName.put("id", listOperateName.get(i));
				operateName.put("text", listOperateName.get(i));
			}else{
				operateName.put("id", "");
				operateName.put("text","-请选择-");
			}
			listJsonOperateName.add(operateName);
		}
		PrintWriter print=response.getWriter();
		print.print(listJsonOperateName.toString());
		print.flush();
		print.close();
	}
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageCounts() {
		return pageCounts;
	}
	public void setPageCounts(int pageCounts) {
		this.pageCounts = pageCounts;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public List<OperateLog> getListOLog() {
		return listOLog;
	}
	public void setListOLog(List<OperateLog> listOLog) {
		this.listOLog = listOLog;
	}
	public String getUserNamePar() {
		return userNamePar;
	}
	public void setUserNamePar(String userNamePar) {
		this.userNamePar = userNamePar;
	}
	public String getRegionNamePar() {
		return regionNamePar;
	}
	public void setRegionNamePar(String regionNamePar) {
		this.regionNamePar = regionNamePar;
	}
	public String getOperateTypePar() {
		return operateTypePar;
	}
	public void setOperateTypePar(String operateTypePar) {
		this.operateTypePar = operateTypePar;
	}
	public String getOperateNamePar() {
		return operateNamePar;
	}
	public void setOperateNamePar(String operateNamePar) {
		this.operateNamePar = operateNamePar;
	}
	public String getOperateParaPar() {
		return operateParaPar;
	}
	public void setOperateParaPar(String operateParaPar) {
		this.operateParaPar = operateParaPar;
	}
	public String getColumnNamePar() {
		return columnNamePar;
	}
	public void setColumnNamePar(String columnNamePar) {
		this.columnNamePar = columnNamePar;
	}

}
