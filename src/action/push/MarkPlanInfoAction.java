package action.push;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.PlanAccess;
import module.push.MarkPlanInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

import com.ibm.db2.jcc.b.o;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;

import dao.push.MarkPlanInfoImpl;

public class MarkPlanInfoAction extends ActionSupport{
	private MarkPlanInfoImpl markPlanInfoImpl;	
	private List<MarkPlanInfo> markPlanInfoList=new ArrayList<MarkPlanInfo>();
	private List<MarkPlanInfo> planNameList=new ArrayList<MarkPlanInfo>();
	String userId;
	private int count;

	public void initMarkPlanInfoImpl() {
		XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		markPlanInfoImpl=(MarkPlanInfoImpl)factory.getBean("markPlanInfoImpl");
	}

	public void getMarkPlanInfoList() throws IOException {
		if (markPlanInfoImpl==null) {
			this.initMarkPlanInfoImpl();
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		int pageno;
		int pagesize;
		if (request.getParameter("page")==null || "".equals(request.getParameter("page"))){
			pageno=1;
		}else{
			pageno=Integer.parseInt(request.getParameter("page"));

		}
		if(request.getParameter("rows")==null || "".equals(request.getParameter("rows"))){
			pagesize=10;
		}else{
			pagesize=Integer.parseInt(request.getParameter("rows"));
		}

		String planName="";
		if(request.getParameter("planName")==null || "".equals(request.getParameter("planName"))){
			planName="";
		}else{
			planName=URLDecoder.decode(request.getParameter("planName"),"utf-8");
		}
		
		String regionId=(String)request.getSession().getAttribute("regionId");

        String userId=(String) request.getSession().getAttribute("userId");
		int begin=(pageno-1)*pagesize+1;
		int end=pageno*pagesize;
		markPlanInfoList=markPlanInfoImpl.getMarkPlanInfoList(userId,regionId,planName, begin, end);
		count=markPlanInfoImpl.getMarkPlanInfoCount(userId,regionId,planName); 
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < markPlanInfoList.size(); i++) {
			MarkPlanInfo markPlanInfo=markPlanInfoList.get(i);
			JSONObject object=new JSONObject();
			object.put("plan_id", markPlanInfo.getPlan_id());
			object.put("plan_name", markPlanInfo.getPlan_name());
			object.put("plan_region_name", markPlanInfo.getPlan_region_name());
			object.put("start_time", markPlanInfo.getStart_time());
			object.put("end_time", markPlanInfo.getEnd_time());
			object.put("creator_id", markPlanInfo.getCreator_id());
			object.put("creator_name", markPlanInfo.getCreator_name());
			object.put("paln_state", markPlanInfo.getPaln_state());
			object.put("operate","<a href='javascript:PlanAccess();' style='text-decoration: none;'>效果</a>");
			jsonArray.add(object);
		}

		JSONObject jsonObjectFinal1 = new JSONObject();
		jsonObjectFinal1.put("total", count);
		jsonObjectFinal1.put("rows", jsonArray);
		PrintWriter print=response.getWriter();
		print.print(jsonObjectFinal1);
		print.flush();
		print.close();
	}

	public void getPlanNameList() throws IOException {
		if (markPlanInfoImpl==null) {
			this.initMarkPlanInfoImpl();
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String planName="";
		if(request.getParameter("planName")==null || "".equals(request.getParameter("planName"))){
			planName="";
		}else{
			planName=URLDecoder.decode(request.getParameter("planName"),"utf-8");
		}
		String userId=(String) request.getSession().getAttribute("userId");
		planNameList=markPlanInfoImpl.getPlanNameList(userId, planName);
		JSONArray table = new JSONArray();
		if (planNameList!=null) {
			for (int i = 0; i < planNameList.size(); i++) {
				JSONObject tr= new JSONObject(); 
				tr.put("plan_id", planNameList.get(i).getPlan_id());
				tr.put("plan_name", planNameList.get(i).getPlan_name());
				table.add(tr);
			}
		}

		//JSONObject jsonObjectFinal1 = new JSONObject();
		//jsonObjectFinal1.put("total", planNameList.size());
		//jsonObjectFinal1.put("rows", table);

		PrintWriter printWriter = response.getWriter();
		printWriter.print(table.toString());
		printWriter.flush();
		printWriter.close();


	}

	public void delMarkt() throws IOException {
		if (markPlanInfoImpl==null) {
			this.initMarkPlanInfoImpl();
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String planId="";
		if(request.getParameter("planId")==null || "".equals(request.getParameter("planId"))){
			planId="";
		}else{
			planId=request.getParameter("planId");
		}
		String userId=(String) request.getSession().getAttribute("userId");
		int delcount=markPlanInfoImpl.delMarkt(planId,userId);
		JSONArray array = new JSONArray();
		JSONObject object=new JSONObject();
		if (delcount>0) {
			object.put("delresult", "删除成功！");
		}else {
			object.put("delresult", "删除失败！");
		}
		array.add(object);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(array.toString());
		printWriter.flush();
		printWriter.close();
	}
	
	public void getplanaccess() throws IOException{
		if (markPlanInfoImpl==null) {
			this.initMarkPlanInfoImpl();
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String plan_id=request.getParameter("plan_id");
		List<PlanAccess> access=markPlanInfoImpl.getplan(plan_id);
		JSONArray jsonArray = new JSONArray();
		for (int i=0;i<access.size();i++){
			PlanAccess plan=access.get(i);
			JSONObject object=new JSONObject();
			object.put("date_stamp", plan.getDate_stamp());
			object.put("plan_id", plan.getPlan_id());
			object.put("plan_name", plan.getPlan_name());
			object.put("commend_cnt", plan.getCommend_cnt());
			object.put("success_cnt", plan.getSuccess_cnt());
			object.put("success_rate", plan.getSuccess_rate());
			jsonArray.add(object);
		}
		JSONObject jsonObjectFinal1 = new JSONObject();
		jsonObjectFinal1.put("total", 1);
		jsonObjectFinal1.put("rows", jsonArray);
		PrintWriter print=response.getWriter();
		print.print(jsonObjectFinal1);
		print.flush();
		print.close();
	}
	
	public void pie() throws IOException{
		if (markPlanInfoImpl==null) {
			this.initMarkPlanInfoImpl();
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String plan_id=request.getParameter("plan_id");
		List<PlanAccess> access=markPlanInfoImpl.getplan(plan_id);
		JSONArray jsonArray = new JSONArray();
		for (int i=0;i<access.size();i++){
			PlanAccess plan=access.get(i);
			JSONObject object=new JSONObject();
			object.put("date_stamp", plan.getDate_stamp());
			object.put("plan_id", plan.getPlan_id());
			object.put("plan_name", plan.getPlan_name());
			object.put("fial_cnt", (plan.getCommend_cnt())-plan.getSuccess_cnt());
			object.put("success_cnt", plan.getSuccess_cnt());
			object.put("success_rate", plan.getSuccess_rate());
			jsonArray.add(object);
		}
		PrintWriter print=response.getWriter();
		print.print(jsonArray);
		print.flush();
		print.close();
		
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}



}
