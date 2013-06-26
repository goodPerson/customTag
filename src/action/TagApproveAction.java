package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import module.TagAprove;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionSupport;
import common.GetLog;

import dao.ApproverInfoDaoImpl;
import dao.TabRequestDetlDaoImpl;
import dao.TagApproveImpl;




public class TagApproveAction extends ActionSupport{
	private  TagApproveImpl tagapprove ;
	private String userId;
	private String jspmes;
	private String role;
	private static  ApproverInfoDaoImpl  approverInfoDao;

	private String url1="./img/maintag/finished.png";
	private String url2="./img/maintag/none_finish.png" ;
	private List<TagAprove> listtag= new ArrayList<TagAprove>();
	
	//分页功能参数  start
	
	private int pageNo;  //当前页
	private int pageCounts;  //总页数
	private int totalRecords; //总记录数
	
	//分页功能参数  end
	
	//static ApplicationContext cxt=null;
	public  void initTag(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		tagapprove=(TagApproveImpl)factory.getBean("TagApprove");
		//if (null==cxt)
		  //cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
		//tagapprove=(TagApproveImpl)cxt.getBean("TagApprove");
	}
	public static  void initApproverInfo(){
		XmlBeanFactory factory =new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		approverInfoDao=(ApproverInfoDaoImpl) factory.getBean("approverInfoDaoImpl");	
		//if (null==cxt)
		//  cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
		//approverInfoDao=(ApproverInfoDaoImpl) cxt.getBean("approverInfoDaoImpl");
	}
	
	public String listtgappro()  throws Exception{
		//if (null==tagapprove)
			this.initTag();
		//if (null==approverInfoDao)
			this.initApproverInfo();
        int pageSize=15;
		HttpServletRequest request = ServletActionContext.getRequest();
		
		jspmes=request.getParameter("jspmes");
		String pageNoS=request.getParameter("pageNo");
		
		if (null==pageNoS || pageNoS.trim().length()==0){
			pageNo=1;
		}else{
			pageNo=Integer.parseInt(pageNoS);
		}
		//无分页
		//listtag=tagapprove.listtag(userId, jspmes);
		//分页
	    List<TagAprove> tempListtag=null;
	    tempListtag=tagapprove.listtagPage(userId, jspmes, pageNo, pageSize);		
		pageCounts=tagapprove.getPageInfo().getTotalPages();		
		if (pageNo<=1){
			pageNo=1;
		}else if (pageNo>=pageCounts){
			pageNo=pageCounts;
		}
			
		totalRecords=tagapprove.getPageInfo().getTotalRows();
		if (totalRecords<1)
			totalRecords=1;
		listtag=tagapprove.listtagPage(userId, jspmes, pageNo, pageSize);
		HttpSession session=request.getSession();
		String id=session.getAttribute("userId").toString();
		role=approverInfoDao.getRoleById(id);
		
		switch (Integer.parseInt(jspmes)){
		case  0 :url1="./img/maintag/finished_gray.png";break;
		case  1:url2="./img/maintag/no_fished_gray.png";break;
			
		}
		GetLog.getLog("标签管理", "浏览", "标签浏览",jspmes);
		return 	SUCCESS;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public TagApproveImpl getTagapprove() {
		return tagapprove;
	}

	public void setTagapprove(TagApproveImpl tagapprove) {
		this.tagapprove = tagapprove;
	}

	public String getJspmes() {
		return jspmes;
	}

	public void setJspmes(String jspmes) {
		this.jspmes = jspmes;
	}

	public List<TagAprove> getListtag() {
		return listtag;
	}

	public void setListtag(List<TagAprove> listtag) {
		this.listtag = listtag;
	}

	public String getUrl1() {
		return url1;
	}

	public void setUrl1(String url1) {
		this.url1 = url1;
	}

	public String getUrl2() {
		return url2;
	}

	public void setUrl2(String url2) {
		this.url2 = url2;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public ApproverInfoDaoImpl getApproverInfoDao() {
		return approverInfoDao;
	}
	public void setApproverInfoDao(ApproverInfoDaoImpl approverInfoDao) {
		this.approverInfoDao = approverInfoDao;
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
}
