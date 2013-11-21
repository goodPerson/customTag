package action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import module.AttrRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionSupport;

import dao.ApproverInfoDaoImpl;
import dao.Idao.IAttrRequest;

public class AttrRequesAction extends ActionSupport {
	private IAttrRequest   attrRequestDao;
	private   ApproverInfoDaoImpl  approverInfoDao;
	private List<AttrRequest> listAttrReq;          //我的属性列表
	private AttrRequest attrReqObj;
	private String role;
	private String  url1;
	private String url2;
	private String url3;
	Integer approvFlag;
	
	private void initAttrRequest(){
		XmlBeanFactory factory =new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		attrRequestDao=(IAttrRequest) factory.getBean("attrRequest");
	}
	
	private  void initApproverInfo(){
		XmlBeanFactory factory =new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));		
		approverInfoDao=(ApproverInfoDaoImpl) factory.getBean("approverInfoDaoImpl");		
	}
	
	//添加属性申请
	public String addAttrRequest() throws UnsupportedEncodingException{
		initAttrRequest();
		String returnFlag="";
		HttpServletRequest request=ServletActionContext.getRequest();
		String  attrName=URLDecoder.decode(request.getParameter("attrname"), "utf-8");                                         //属性名称
		String  requestReson=URLDecoder.decode(request.getParameter("requestreson"),"utf-8");                            //申请原因
		String  verifier=URLDecoder.decode(request.getParameter("verifier"), "utf-8");                                                 //申请人
		String  remark=URLDecoder.decode(request.getParameter("remark"), "utf-8");                                                //备注
		HttpSession session=request.getSession();
		Integer  regionId=Integer.parseInt(session.getAttribute("regionId").toString());                                                  //区域Id
		String  regionName=session.getAttribute("regionName").toString();                                  								  //区域名称
		String  userId=session.getAttribute("userId").toString();
		String  userName=session.getAttribute("userName").toString();
		Calendar cal=Calendar.getInstance();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String  requestId=sdf.format(cal.getTime());
		AttrRequest attrReq=new AttrRequest();
		attrReq.setAttrRequestIid(requestId);
		attrReq.setAttrApporver(verifier);
		attrReq.setAttrName(attrName);
		attrReq.setAttrReason(requestReson);
		attrReq.setAttrRegionId(regionId);
		attrReq.setAttrRegionName(regionName);
		attrReq.setAttrRemark(remark);
		attrReq.setAttrRequestName(userName);
		attrReq.setAttrRequestPersonId(userId);
		if (attrRequestDao.AddAttrRequest(attrReq)){
			returnFlag="addattrrequest";
		}else{
			returnFlag="addfalse";
		}
		return returnFlag;
	}

	public String attrRequestForm(){
		return "reqForm";
	}
	//我的申请
	public String attrList(){
		initAttrRequest();		
		HttpServletRequest  request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String userId=session.getAttribute("userId").toString();
		String attrType=request.getParameter("attrType");              //属性申请分类
		if ("1".equals(attrType)){
			url1="./img/maintag/finished_gray.png";
		    url2="./img/maintag/no_fished_gray.png" ;
		    url3="./img/maintag/my_tag.png" ;
		}
		AttrRequest attrReq=new AttrRequest();
		attrReq.setAttrRequestPersonId(userId);
		listAttrReq=attrRequestDao.listAttrR(attrReq);	
		return "attrList";
	}

	public String attrWaitList(){
		initAttrRequest();	
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String userName=session.getAttribute("userName").toString();
		String attrType=request.getParameter("attrType");              //属性申请分类
		AttrRequest  attrReq=new AttrRequest();
		attrReq.setAttrApporver(userName);
		listAttrReq=attrRequestDao.listAttrRWait(attrReq);
		initApproverInfo();
		String userId=session.getAttribute("userId").toString();
		role=approverInfoDao.getRoleById(userId);
		url1="./img/maintag/finished_gray.png";
	    url2="./img/maintag/none_finish.png" ;
	    url3="./img/maintag/my_tag_gray.png" ;		
		return "waitList";
	}
	
	public String atrrAlreadyList(){
		initAttrRequest();
		url1="./img/maintag/finished.png";
	    url2="./img/maintag/no_fished_gray.png" ;
	    url3="./img/maintag/my_tag_gray.png" ;		
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String userName=session.getAttribute("userName").toString();
		String attrType=request.getParameter("attrType");              //属性申请分类
		AttrRequest  attrReq=new AttrRequest();
		attrReq.setAttrApporver(userName);
		listAttrReq=attrRequestDao.listAttrRalready(attrReq);		
		return "alreadyList";
	}
	
	public String approvAttr(){
		initAttrRequest();
		HttpServletRequest request=ServletActionContext.getRequest();
		String requestId=request.getParameter("requestId");
		attrReqObj=attrRequestDao.findAttrReq(requestId);
		return "approvattr";
	}
	
	public String approveReq(){
		initAttrRequest();		
		HttpServletRequest  request=ServletActionContext.getRequest();
		String requestId=request.getParameter("requestId");     //申请Id
		 approvFlag=Integer.parseInt(request.getParameter("approvFlag"));  //审批标志
		AttrRequest attr=new AttrRequest();
		attr.setAttrRequestIid(requestId);
		attr.setAttrState(approvFlag);
		attrRequestDao.updateAttr(attr);
		return "appReq";
	}
	
	public List<AttrRequest> getListAttrReq() {
		return listAttrReq;
	}

	public void setListAttrReq(List<AttrRequest> listAttrReq) {
		this.listAttrReq = listAttrReq;
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

	public String getUrl3() {
		return url3;
	}

	public void setUrl3(String url3) {
		this.url3 = url3;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public AttrRequest getAttrReqObj() {
		return attrReqObj;
	}

	public void setAttrReqObj(AttrRequest attrReqObj) {
		this.attrReqObj = attrReqObj;
	}

	public Integer getApprovFlag() {
		return approvFlag;
	}

	public void setApprovFlag(Integer approvFlag) {
		this.approvFlag = approvFlag;
	}
	
}
