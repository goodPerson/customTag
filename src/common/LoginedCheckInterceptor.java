package common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginedCheckInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation ai) throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest  request=(HttpServletRequest) ai.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		String url=ServletActionContext.getRequest().getRequestURI().toString();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setHeader("Pragma","No-cache");   
		response.setHeader("Cache-Control","no-cache");   
		response.setHeader("Cache-Control", "no-store");   
		response.setDateHeader("Expires",0);  
		
		if (url.indexOf("homeAction.action")!=-1 ){
			ai.invoke();
		}else{
			if (!ServletActionContext.getRequest().isRequestedSessionIdValid()){
					return "tologin";
			}else{
				HttpSession session=request.getSession();
				//String userId=session.getAttribute("userId").toString();
				//String userId = (String)session.getAttribute(SessionConstant.SESSION_USER);
				if (session.getAttribute("userId")==null ){
					return "tologin";
				}else{
					return ai.invoke();
				}
			}
		}
		return null;

	}

}
