package common;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class Session {
	static  HttpServletRequest request = ServletActionContext.getRequest();
	static  HttpServletResponse response=ServletActionContext.getResponse();
	static String userId;
	static String userName;
	static String regionId;
	static String regionName;		
	/**
	 * …Ë÷√Session
	 * @throws UnsupportedEncodingException 
	 */
	public static void setSession() throws UnsupportedEncodingException{

		  String  bass_user_id= URLDecoder.decode(request.getParameter("userId"),"utf-8");
		  String  bass_user_name= URLDecoder.decode(request.getParameter("userName"),"utf-8");
		  String  bass_user_regionid= URLDecoder.decode(request.getParameter("regionId"),"utf-8");
		  String  bass_user_regionname= URLDecoder.decode(request.getParameter("regionName"),"utf-8");
	        ActionContext actionContext = ActionContext.getContext();
	        Map session = actionContext.getSession();
	        session.put("userId", bass_user_id);
	        session.put("userName", bass_user_name);
	        session.put("regionId", bass_user_regionid);
	        session.put("regionName", bass_user_regionname);
	}
    /**ªÒ»°Session*/
	public static void getSession(){
		HttpSession session=request.getSession();
		 userId                =session.getAttribute("userId").toString();
		 userName         =session.getAttribute("userName").toString();
		 regionId            =session.getAttribute("regionId").toString();
		 regionName    =session.getAttribute("regionName").toString();		
	}
	public static String getUserId() {
		return userId;
	}
	public static void setUserId(String userId) {
		Session.userId = userId;
	}
	public static String getUserName() {
		return userName;
	}
	public static void setUserName(String userName) {
		Session.userName = userName;
	}
	public static String getRegionId() {
		return regionId;
	}
	public static void setRegionId(String regionId) {
		Session.regionId = regionId;
	}
	public static String getRegionName() {
		return regionName;
	}
	public static void setRegionName(String regionName) {
		Session.regionName = regionName;
	}
	
}
