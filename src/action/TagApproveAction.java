package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import common.GetLog;
import module.TagAprove;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionSupport;

import dao.ApproverInfoDaoImpl;
import dao.TagApproveImpl;




public class TagApproveAction extends ActionSupport{
	//private TagApproveImpl tagapprove =new TagApproveImpl();
	private static TagApproveImpl tagapprove;
	private String userId;
	private String jspmes;
	private String role;
	private static  ApproverInfoDaoImpl  approverInfoDao;

	private String url1="./img/maintag/finished.png";
	private String url2="./img/maintag/none_finish.png" ;
	private String url3="./img/maintag/my_tag.png" ;
	private List<TagAprove> listtag= new ArrayList<TagAprove>();
	private List<TagAprove> myListtag=null;
			
	static ApplicationContext factory=null;
	public static  void initTag(){
		//XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		if (null==factory)
			factory = new ClassPathXmlApplicationContext("applicationContext.xml");
		tagapprove=(TagApproveImpl)factory.getBean("TagApprove");
	}
	public static  void initApproverInfo(){
		//XmlBeanFactory factory =new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		if (null==factory)
			factory = new ClassPathXmlApplicationContext("applicationContext.xml");
		approverInfoDao=(ApproverInfoDaoImpl) factory.getBean("approverInfoDaoImpl");		
	}
	
	public String listtgappro()  throws Exception{
		if (null==tagapprove)
		this.initTag();
		if(null==approverInfoDao)
		this.initApproverInfo();
		HttpServletRequest request = ServletActionContext.getRequest();
		jspmes=request.getParameter("jspmes");
		
		listtag=tagapprove.listtag(userId, jspmes);
		HttpSession session=request.getSession();
		String id=session.getAttribute("userId").toString();
		role=approverInfoDao.getRoleById(id);
		

		switch (Integer.parseInt(jspmes)){
		case  0 :url1="./img/maintag/finished_gray.png";break;
		case  1:url2="./img/maintag/no_fished_gray.png";break;			
		}
	    url3="./img/maintag/my_tag_gray.png" ;
		return 	SUCCESS;
	}
	/**
	 * ÎÒµÄ±êÇ©
	 * @return
	 */
	public String myListtgappro(){
		if (null==tagapprove)
			this.initTag();
		HttpServletRequest  request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String id=session.getAttribute("userId").toString();
		myListtag=tagapprove.myListtag(id);
		url1="./img/maintag/finished_gray.png";
	    url2="./img/maintag/no_fished_gray.png" ;
	    url3="./img/maintag/my_tag.png" ;
		return SUCCESS;
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
	public List<TagAprove> getMyListtag() {
		return myListtag;
	}
	public void setMyListtag(List<TagAprove> myListtag) {
		this.myListtag = myListtag;
	}
	public String getUrl3() {
		return url3;
	}
	public void setUrl3(String url3) {
		this.url3 = url3;
	}
	
}
