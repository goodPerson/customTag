package action;


import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.Attr;
import module.CustomTag;
import module.MainTag;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionSupport;
import common.GetLog;

import dao.MainTagDaoImpl;
import dao.TagInfoDaoImpl;

public class MainTanAction extends ActionSupport {
	
	//private MainTagDaoImpl tagDao =new MainTagDaoImpl(); //数据源
	private  MainTagDaoImpl tagDao; //数据源
	private List<MainTag>mainTagList = new  ArrayList<MainTag>();//核心标签LIST
	private int serv_type=0;//0表示
	private String serv_name="";//
	private String serv_name_src="img/maintag/duanxin.png";         //短信图标
	private String url0="./img/maintag/serv2.png";                           //业务类
	private String url1="./img/maintag/like2.png";                            //喜爱类
	private String url2="./img/maintag/event2.png";                         //事件类
	private String url3="./img/maintag/terminal2.png";                     //终端类
	private String url4="./img/maintag/kehu2.png";                          //身份类
	private String url5="./img/maintag/jiazhi2.png";                          //价值类
	private String url6="./img/maintag/jiaowangq2.png";                  //交往圈类
	private String url7="./img/maintag/yuyinhui.png";                       //语音类
	private String url8="./img/maintag/taocanhui.png";                     //位置类	
	
	//static ApplicationContext cxt=null;
	//初始化数据源
	public  void initTagDao(){
		XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		tagDao=(MainTagDaoImpl)factory.getBean("MainTagDao");
		//if (null==cxt)
			//cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
		//tagDao=(MainTagDaoImpl)cxt.getBean("MainTagDao");
		
	}
	
	@Override
	public String execute() throws Exception{
		
		
		return "";
	}
	
	
	//初始化核心标签内容
	public String  initMainTag() throws IOException{
		//  if (null==tagDao)
		  this.initTagDao();
		  HttpServletRequest request = ServletActionContext.getRequest();	
		  request.setCharacterEncoding("GBK");
          this.serv_type=( Integer.parseInt(request.getParameter("serv_type").toString()));
          this.serv_name=( request.getParameter("serv_name").toString());   
          if(this.serv_name.equals("0")) { 
        	  this.serv_name="短信";                
          }else{
        	  this.serv_name=URLDecoder.decode(request.getParameter("serv_name"), "utf-8");
        	  this.serv_name_src=URLDecoder.decode(request.getParameter("serv_name_src"), "utf-8");        	 
          }
          
    	  switch(this.serv_type){
	  		case 0:
	  	 	  this.url0="./img/maintag/serv1.png";
	  	 	  break;
	  		case 1:
	  	 	  this.url1="./img/maintag/like1.png";
	  	 	  break;
	  		case 2:
	  	 	  this.url2="./img/maintag/event1.png";
	  	 	  break;
	  		case 3:
	  	 	  this.url3="./img/maintag/terminal1.png";
	  	 	  break;
	  		case 4:
	  	 	  this.url4="./img/maintag/kehu1.png";
	  	 	  break;
	  		case 5:
	  	 	  this.url5="./img/maintag/jiazhi1.png";
	  	 	  break;
	  		case 6:
	  	 	  this.url6="./img/maintag/jiaowangq1.png";
	  	 	  break;   
	  		case 7:
		  	 	  this.url7="./img/maintag/yuyinlan.png";
		  	 	  break; 
	  		case 8:
		  	 	  this.url8="./img/maintag/taocanlan.png";
		  	 	  break; 
	  }
          
		  this.mainTagList=this.tagDao.listTag(serv_type, serv_name);	
		  GetLog.getLog("标签地图", "浏览", serv_name+"浏览", "");
          return SUCCESS;
	}
	
	public String getUrl7() {
		return url7;
	}


	public void setUrl7(String url7) {
		this.url7 = url7;
	}


	public String getUrl8() {
		return url8;
	}


	public void setUrl8(String url8) {
		this.url8 = url8;
	}


	
	
	public String getUrl0() {
		return url0;
	}


	public void setUrl0(String url0) {
		this.url0 = url0;
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


	public String getUrl4() {
		return url4;
	}


	public void setUrl4(String url4) {
		this.url4 = url4;
	}


	public String getUrl5() {
		return url5;
	}


	public void setUrl5(String url5) {
		this.url5 = url5;
	}


	public String getUrl6() {
		return url6;
	}


	public void setUrl6(String url6) {
		this.url6 = url6;
	}

	public String getServ_name_src() {
		return serv_name_src;
	}


	public void setServ_name_src(String serv_name_src) {
		this.serv_name_src = serv_name_src;
	}


	public String getServ_name() {
		return serv_name;
	}


	public void setServ_name(String serv_name) {
		this.serv_name = serv_name;
	}


	public int getServ_type() {
		return serv_type;
	}


	public void setServ_type(int serv_type) {
		this.serv_type = serv_type;
	}


	public List<MainTag> getMainTagList() {
		return mainTagList;
	}


	public void setMainTagList(List<MainTag> mainTagList) {
		this.mainTagList = mainTagList;
	}


	public MainTagDaoImpl getTagDao() {
		return tagDao;
	}


	public void setTagDao(MainTagDaoImpl tagDao) {
		this.tagDao = tagDao;
	}


}
