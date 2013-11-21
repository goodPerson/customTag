package action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.Cycle;
import module.OrderInfo;
import module.OrderInfoM;
import module.Right;
import module.SystemManager;
import module.UserInfo;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import common.GetLog;
import common.Session;
import common.push.RegionFormat;

import dao.CycleImpl;
import dao.MainTagDaoImpl;
import dao.OrderInfoImpl;
import dao.OrderInfoMImpl;
import dao.Idao.IRight;

public class HomeAction extends ActionSupport{
	@Resource
	private SystemManager systemManager;
	private OrderInfoImpl orderInfodao=null;
	private CycleImpl  cycleDao=null;
	private OrderInfoMImpl orderInfoMdao=null;
	private IRight     rightDao;

	private List<OrderInfo> listOrder=null;
	private List<OrderInfo> listOrderTag=null;
	private List<OrderInfo> listAccess=null;
	private List<OrderInfo> listDown=null;

	private List<OrderInfoM> listOrderM=null;
	private List<OrderInfoM> listOrderTagM=null;
	private List<OrderInfoM> listAccessM=null;
	private List<OrderInfoM> listDownM=null;
	static ApplicationContext context=null;
	private List<Cycle> listCycle=null;
	private String areaDate;
	private String tagDate;
	private String accessDate;
	private String downDate;

	private String areaMonth;
	private String tagMonth;
	private String accessMonth;
	private String downMonth;

	private String url;
	private void  intiOrder(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		orderInfodao=(OrderInfoImpl) factory.getBean("orderInfoImpl");		
	}

	private void initCycle(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		cycleDao=(CycleImpl) factory.getBean("cycleImpl");		
	}

	private void initOrderM(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		orderInfoMdao= (OrderInfoMImpl) factory.getBean("orderInfoMImpl");				
	}

	private void initRight(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		rightDao= (IRight) factory.getBean("right");		
	}

	private void initWebService(){		
		try {
			context = new ClassPathXmlApplicationContext("applicationContext-cxf.xml");
			systemManager=(SystemManager)context.getBean("systemManager");
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public String homeAction() throws UnsupportedEncodingException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
    
      String  bass_user_id= URLDecoder.decode(request.getParameter("userId"),"utf-8");
	  String  bass_user_name= URLDecoder.decode(request.getParameter("userName"),"utf-8");
	  String  bass_user_regionid= URLDecoder.decode(request.getParameter("regionId"),"utf-8");
	  String  bass_user_regionname= URLDecoder.decode(request.getParameter("regionName"),"utf-8");
	  

		   
		 /* kong功能调用
		initWebService();
		String aaaString=request.getParameter("userId");
		UserInfo userInfo = systemManager.getUserInfo(request.getParameter("userId"));
		String bass_user_id=userInfo.getUser().getUserIdAccounts();
		String  bass_user_name=userInfo.getUser().getUserName();
		String  bass_user_regionid=userInfo.getUser().getRegionDataId();
		String  bass_user_regionname=userInfo.getRegion().getRegionName();
		String  company_id=userInfo.getUser().getCompanyId();
		
		String proregionid=company_id;
		if("1".equals(proregionid)){
			proregionid="999";
		}else{
			proregionid=proregionid.substring(0, 3);
		}
		
		String proregionName=RegionFormat.ToPinyinRegionName(proregionid);
		proregionid=RegionFormat.ToPinyin(proregionid);	
        */
	  //金库参数 主账号   票据
      // String ticket=URLDecoder.decode(request.getParameter("ticket"), "utf-8"); //票据
	  // String masterId=URLDecoder.decode(request.getParameter("masterId"), "utf-8");//主账号
	  
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		session.put("userId", bass_user_id);
		session.put("userName", bass_user_name);
		session.put("regionId", bass_user_regionid);
		session.put("regionName", bass_user_regionname);
		//session.put("ticket", ticket);  //票据
		//session.put("masterId", masterId);  //主账号
//		session.put("userInfo", userInfo);   //协从人信息
//孔斌		
		/*
		session.put("companyid", company_id);			
		session.put("proregionid", proregionid);
		session.put("proregionName", proregionName);
		*/


		//session.put("companyid", "1");    //调试时使用

		/*
			 initRight();
			Right rights=new Right();
	        rights.setUserId(bass_user_id);
	        List<Right> listRgt=rightDao.listRight(rights);
	        StringBuffer strListReg= new StringBuffer();
	        for (Right rt: listRgt ){
	        	strListReg.append(rt.getModuleUrl()+",");	        	
	        }
	        String strUrl=strListReg.toString().replace("[", "")
	                               .replace("]", "").replace("http://www.hebmcbass.com/customTag/", "");
		 */

		String rightstemp="areaOrder,initMainTagAction,initMainTagAction,myTagAction,access,listtTgApproAction,"
				+"getAttrListAction,attrRequestForm_attr,attrList_attr,attrWaitList_attr,TaginfoAction,TaginfoAction,"
				+"TaginfoAction,initAttrTagAction,mainMethod,querydown,marRetlist,plan_create,marRetlist,onlineHelp,getConutTag_tagsub";

		//session.put("right", strUrl);                //调试注销
		session.put("right", rightstemp);   //调试使用


		//读取cookies

		Cookie[] cookies=request.getCookies();
		boolean   flagbool=false;
		if (cookies!=null){
			int j=cookies.length;
			for (int i=0;i<j;i++){
				Cookie c=cookies[i];	        		
				if (c.getName().equalsIgnoreCase("onlineHelp") && c.getValue().equalsIgnoreCase("onlineHelp")){
					flagbool=true;        			
				}else{
					writeCookie();
				}
			}

		}else{
			writeCookie();
		}

		if (flagbool){
			url="areaOrder.action";
		}else{
			url="onlineHelp.action";
		}


		//			initCycle();
		//			listCycle=cycleDao.getListAll();
		GetLog.getLog("首页", "登陆", "登陆首页", bass_user_name+"登陆首页");
		return SUCCESS;
	}

	public String iframeAction(){
		return SUCCESS;
	}	

	public String areaOrder(){
		this.intiOrder();		
		this.initOrderM();
		listOrder=orderInfodao.listOrderInfoByArea();
		listOrderTag=orderInfodao.listOrderInfoByTag();			
		areaDate=orderInfodao.getAreaDate();
		tagDate=orderInfodao.getTagDate();
		listAccess=orderInfodao.listOrderInfoByAccess();
		listDown=orderInfodao.listOrderInfoByDown();
		accessDate=orderInfodao.getAccessDate();
		downDate=orderInfodao.getDownLoadDate();

		listOrderM=orderInfoMdao.listOrderInfoByAreaM();
		listOrderTagM=orderInfoMdao.listOrderInfoByTagM();
		listAccessM=orderInfoMdao.listOrderInfoByAccessM();
		listDownM=orderInfoMdao.listOrderInfoByDownM();
		areaMonth=orderInfoMdao.getAreaMonth();
		tagMonth=orderInfoMdao.getTagMonth();
		accessMonth=orderInfoMdao.getAccessMonth();
		downMonth=orderInfoMdao.getDownLoadMonth();			

		return SUCCESS;
	}

	public String onlineHelp(){
		return SUCCESS;
	}

	private void writeCookie(){
		HttpServletResponse response=ServletActionContext.getResponse();
		Cookie flag=new Cookie("onlineHelp","onlineHelp");
		flag.setMaxAge(60*60*24*365);
		response.addCookie(flag);
	}

	public List<OrderInfo> getListOrder() {
		return listOrder;
	}
	public void setListOrder(List<OrderInfo> listOrder) {
		this.listOrder = listOrder;
	}
	public List<OrderInfo> getListOrderTag() {
		return listOrderTag;
	}
	public void setListOrderTag(List<OrderInfo> listOrderTag) {
		this.listOrderTag = listOrderTag;
	}
	public List<Cycle> getListCycle() {
		return listCycle;
	}
	public void setListCycle(List<Cycle> listCycle) {
		this.listCycle = listCycle;
	}
	public String getAreaDate() {
		return areaDate;
	}
	public void setAreaDate(String areaDate) {
		this.areaDate = areaDate;
	}
	public String getTagDate() {
		return tagDate;
	}
	public void setTagDate(String tagDate) {
		this.tagDate = tagDate;
	}
	public List<OrderInfo> getListAccess() {
		return listAccess;
	}
	public void setListAccess(List<OrderInfo> listAccess) {
		this.listAccess = listAccess;
	}
	public List<OrderInfo> getListDown() {
		return listDown;
	}
	public void setListDown(List<OrderInfo> listDown) {
		this.listDown = listDown;
	}
	public String getAccessDate() {
		return accessDate;
	}
	public void setAccessDate(String accessDate) {
		this.accessDate = accessDate;
	}
	public String getDownDate() {
		return downDate;
	}
	public void setDownDate(String downDate) {
		this.downDate = downDate;
	}
	public List<OrderInfoM> getListOrderM() {
		return listOrderM;
	}
	public void setListOrderM(List<OrderInfoM> listOrderM) {
		this.listOrderM = listOrderM;
	}
	public List<OrderInfoM> getListOrderTagM() {
		return listOrderTagM;
	}
	public void setListOrderTagM(List<OrderInfoM> listOrderTagM) {
		this.listOrderTagM = listOrderTagM;
	}
	public List<OrderInfoM> getListAccessM() {
		return listAccessM;
	}
	public void setListAccessM(List<OrderInfoM> listAccessM) {
		this.listAccessM = listAccessM;
	}
	public List<OrderInfoM> getListDownM() {
		return listDownM;
	}
	public void setListDownM(List<OrderInfoM> listDownM) {
		this.listDownM = listDownM;
	}
	public String getAreaMonth() {
		return areaMonth;
	}
	public void setAreaMonth(String areaMonth) {
		this.areaMonth = areaMonth;
	}
	public String getTagMonth() {
		return tagMonth;
	}
	public void setTagMonth(String tagMonth) {
		this.tagMonth = tagMonth;
	}
	public String getAccessMonth() {
		return accessMonth;
	}
	public void setAccessMonth(String accessMonth) {
		this.accessMonth = accessMonth;
	}
	public String getDownMonth() {
		return downMonth;
	}
	public void setDownMonth(String downMonth) {
		this.downMonth = downMonth;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}	

}
