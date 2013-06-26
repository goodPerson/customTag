package aop;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import dao.ArrtClassDaoImpl;
import dao.OperateLogDaoImpl;

/** 日志切面 */
public class LogAspectJ {
	// 取得日志记录器Logger
  // 	public Logger logger = Logger.getLogger(LogAspectJ.class);
	  private  OperateLogDaoImpl operateLogDao;
      public  void initOperate(){
    	  XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
  		 operateLogDao=(OperateLogDaoImpl) factory.getBean("operateLogDaoImpl");
      }   
	//此方法将用作前置通知
	public void myBeforeAdvice(JoinPoint joinPoint) {
		  this.initOperate();		
		  HttpServletRequest  request=ServletActionContext.getRequest();
		  HttpSession session=request.getSession();
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");   	  
	   	  String clazzName=joinPoint.getTarget().getClass().getName();  //类名
	   	  String  userId=(String) session.getAttribute("userId");
	   	  String  userName=(String) session.getAttribute("userName");
	   	  String  regionId=(String) session.getAttribute("regionId");
	   	  String  regionName=(String) session.getAttribute("regionName");
	   	  String methodName=joinPoint.getSignature().getName(); //方法名
	   	  StringBuffer sb=new StringBuffer();
	   	  Object[] obj=joinPoint.getArgs();
	   	  for(Object o:obj){
	   		  sb.append(o+",");
	   	  }
	   	  String param=sb.toString();  //参数组合    	  
	   	  String createTime=sdf.format(new Date());    	  
   	      operateLogDao.addOperateLog(userId,  userName,  regionId,  regionName, "", "", methodName , param, createTime);   	      
		 // operateLogDao.addOperateLog("111", "111", "111", "111", "111", "111", "111");
   	     // logger.info("记录日志");
	}
	
	public OperateLogDaoImpl getOperateLogDao() {
		return operateLogDao;
	}
	public void setOperateLogDao(OperateLogDaoImpl operateLogDao) {
		this.operateLogDao = operateLogDao;
	}
	
}
