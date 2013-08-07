package action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import com.opensymphony.xwork2.ActionSupport;
import dao.ArrtClassDaoImpl;
 /**
  * 统一视图标签
  * @author ywz
  *
  */
public class ArrtClassAction extends ActionSupport {

   private String threeName;                                                                                        //第三级属性名称参数
   private String secName;                                                                                           //第二级属性名称参数
   //private	ArrtClassDaoImpl attrClassDao=new ArrtClassDaoImpl();                              //dao层
   private static	ArrtClassDaoImpl attrClassDao;                              //dao层
   private List  listThreeClassName;                                                                              //第三级属性名称List
   private List  listSecClassName;                                                                                 //第二级属性名称List
   private List  baisAttr;                                                                                               //基本属性
   private List  voiceAttr;																								//语音属性
   private List  flowAttr;                    																			//流量属性
   private List  terminalAttr;																							//终端属性
   private List  groupAttr;                                                                                           //集团属性
   private List  smsMmsAttr;																						//短彩信属性
   private List  keyAttr;                                                                                                //重点属性
   private List  busLike;                                                                                               //业务偏好
   private List  contentLike;                                                                                         //内容偏好
	
   static ApplicationContext factory=null;
   
	public static void initTagUnifyView(){
		XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		attrClassDao=(ArrtClassDaoImpl) factory.getBean("arrtClassDaoImpl"); 
	}
	/**
	 * 获取第三级属性
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getListThreeName() throws UnsupportedEncodingException{
		if (null==attrClassDao)
			this.initTagUnifyView();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		request.setCharacterEncoding("gbk");
	    threeName=URLDecoder.decode(request.getParameter("threeName"), "utf-8");
		listThreeClassName=this.attrClassDao.getListByName(threeName);
		return SUCCESS;
	}
	/**
	 * 获取二级属性
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String getListSecName() throws UnsupportedEncodingException{
		if (null==attrClassDao)
			this.initTagUnifyView();
		baisAttr=this.attrClassDao.getListSecName("基本属性");                                                                                              //基本属性
		voiceAttr=this.attrClassDao.getListSecName("语音属性");																								//语音属性
		flowAttr=this.attrClassDao.getListSecName("流量属性");                    																			//流量属性
		terminalAttr=this.attrClassDao.getListSecName("终端属性");																							//终端属性
		groupAttr=this.attrClassDao.getListSecName("集团属性");                                                                                           //集团属性
		smsMmsAttr=this.attrClassDao.getListSecName("短信/彩信属性");																						//短彩信属性
		keyAttr=this.attrClassDao.getListSecName("重点业务");                                                                                                //重点属性
		busLike=this.attrClassDao.getListSecName("业务偏好");                                                                                               //业务偏好
		contentLike=this.attrClassDao.getListSecName("内容偏好");                                                                                         //内容偏好	
		return SUCCESS;
	}	
	


	public String getThreeName() {
		return threeName;
	}
	public void setThreeName(String threeName) {
		this.threeName = threeName;
	}	
	public ArrtClassDaoImpl getAttrClassDao() {
		return attrClassDao;
	}
	public void setAttrClassDao(ArrtClassDaoImpl attrClassDao) {
		this.attrClassDao = attrClassDao;
	}

	public List getListSecClassName() {
		return listSecClassName;
	}

	public void setListSecClassName(List listSecClassName) {
		this.listSecClassName = listSecClassName;
	}

	public List getListThreeClassName() {
		return listThreeClassName;
	}
	public void setListThreeClassName(List listThreeClassName) {
		this.listThreeClassName = listThreeClassName;
	}

	public String getSecName() {
		return secName;
	}
	public void setSecName(String secName) {
		this.secName = secName;
	}
	public List getBaisAttr() {
		return baisAttr;
	}
	public void setBaisAttr(List baisAttr) {
		this.baisAttr = baisAttr;
	}
	public List getVoiceAttr() {
		return voiceAttr;
	}
	public void setVoiceAttr(List voiceAttr) {
		this.voiceAttr = voiceAttr;
	}
	public List getFlowAttr() {
		return flowAttr;
	}
	public void setFlowAttr(List flowAttr) {
		this.flowAttr = flowAttr;
	}
	public List getTerminalAttr() {
		return terminalAttr;
	}
	public void setTerminalAttr(List terminalAttr) {
		this.terminalAttr = terminalAttr;
	}
	public List getGroupAttr() {
		return groupAttr;
	}
	public void setGroupAttr(List groupAttr) {
		this.groupAttr = groupAttr;
	}
	public List getSmsMmsAttr() {
		return smsMmsAttr;
	}
	public void setSmsMmsAttr(List smsMmsAttr) {
		this.smsMmsAttr = smsMmsAttr;
	}
	public List getKeyAttr() {
		return keyAttr;
	}
	public void setKeyAttr(List keyAttr) {
		this.keyAttr = keyAttr;
	}
	public List getBusLike() {
		return busLike;
	}
	public void setBusLike(List busLike) {
		this.busLike = busLike;
	}
	public List getContentLike() {
		return contentLike;
	}
	public void setContentLike(List contentLike) {
		this.contentLike = contentLike;
	}
	
}


