package common;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.JoinPoint;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import dao.OperateLogDaoImpl;

public class GetLog {
	private static  OperateLogDaoImpl operateLogDao=null;
	private static XmlBeanFactory factory =null;
    public static  void initOperate(){
    	if (null==factory)
    		factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		 operateLogDao=(OperateLogDaoImpl) factory.getBean("operateLogDaoImpl");
    }   
    /**
     * 获得日志
     * @param operateType   操作类型
     * @param actionName    Action名称
     */

	public static void getLog(String columnName,String operateType,String operateName, String operatePara) {
		  if (null==operateLogDao)
			  initOperate();				  
		  HttpServletRequest  request=ServletActionContext.getRequest();
		  HttpSession session=request.getSession();
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");   	  
	   	  String  userId=(String) session.getAttribute("userId");
	   	  String  userName=(String) session.getAttribute("userName");
	   	  String  regionId=(String) session.getAttribute("regionId");
	   	  String  regionName=(String) session.getAttribute("regionName"); 	  
	   	  String createTime=sdf.format(new Date());    	  
 	      operateLogDao.addOperateLog(    userId,  userName,  regionId,  regionName,
 	    		    columnName, operateType, operateName , operatePara, createTime);
      }
		
}