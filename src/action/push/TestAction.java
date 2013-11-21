package action.push;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

import module.push.product;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import common.push.PinyinUtil;
import common.push.RegionFormat;
import dao.push.TestImpl;

public class TestAction extends ActionSupport{
	
	private JSONObject privilegeJson;//优惠
	private JSONObject priproJson;
	private List<String> privileges= new ArrayList<String>();//所有优惠
	private TestImpl testImpl;
	private List<product> productlist;
	private List<product> list_pro;
	private String type;
	private String combo_region;
	//private static String productcd;
	
	public void initTestImpl() {
		XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		testImpl=(TestImpl)factory.getBean("testImpl");
	}
	
	public JSONObject getNewList(List<product> src){
		List<String> firstChar = new ArrayList<String>();
		List<String> firstNum = new ArrayList<String>();
		JSONArray firsts = new JSONArray();
		JSONArray jsonArray = new JSONArray();
		for(int i=0;i<src.size();i++){
			JSONObject obj = new JSONObject();
			String first = PinyinUtil.getPinYinHeadChar(src.get(i).getProduct()).charAt(0)+"";
			if(i==0){
				firstChar.add(first);
			}else{
				if(!firstChar.contains(first)){
					firstChar.add(first);
				}
			}
			obj.put("FIRST_CHAR", first);
			obj.put("NAME", src.get(i).getProduct());
			obj.put("Value1", src.get(i).getFvalue());
			obj.put("Value2", src.get(i).getSvalue());
			jsonArray.add(obj);
		}
		Collections.sort(firstChar);
		for(int j=0;j<firstChar.size();j++){
			int a=firstChar.get(j).codePointAt(0);
			if (a<65) {
				firstNum.add(firstChar.get(j));
			}else {
				JSONObject obj = new JSONObject();
				obj.put("FIRST_CHAR", firstChar.get(j));
				firsts.add(obj);
			}
		}
		for (int i = 0; i < firstNum.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("FIRST_CHAR", firstNum.get(i));
			firsts.add(obj);
		}
		JSONObject jsonObjectFinal = new JSONObject();
		jsonObjectFinal.put("first", firsts);
		jsonObjectFinal.put("rows", jsonArray);
		return jsonObjectFinal;
	}
	
	String name="";
	String spname="";
	String spcode="";
	int length=0;
	public String searchPrivilege() throws IOException{
		if (testImpl==null) {
			this.initTestImpl();
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.addHeader("Content-Type", "text/html;charset=utf-8");
		String regionId=(String)request.getSession().getAttribute("companyid");
		if("1".equals(regionId)){
			regionId="999";
		}else{
			regionId=regionId.substring(0, 3);
		}
		String Operate_type="";
		if(request.getParameter("Operate_type")==null || "".equals(request.getParameter("Operate_type"))){
			Operate_type="1";
		}else{
			 Operate_type="2";	
		}
		if(request.getParameter("Operate_type")==null || "".equals(request.getParameter("Operate_type"))){
			combo_region="HB";
		}else{
			combo_region=request.getParameter("combo_region");	
		}
		String CREAT_UNIT=RegionFormat.ToPinyin(regionId);
		Calendar calendar=Calendar.getInstance();
		String datetime=new SimpleDateFormat("yyyyMMddHHmmss").format(calendar.getTime());
		if(request.getParameter("type")==null || "".equals(request.getParameter("type"))){
			type="prevelige";
		}else{
			type=request.getParameter("type");
		}
		
		if(request.getParameter("name")==null || "".equals(request.getParameter("name"))){
			name="";
		}else{
			name=URLDecoder.decode(request.getParameter("name"),"utf-8");
		}
		if(request.getParameter("spname")==null || "".equals(request.getParameter("spname"))){
			spname="";
		}else{
			spname=URLDecoder.decode(request.getParameter("spname"),"utf-8");
		}
		if(request.getParameter("spcode")==null || "".equals(request.getParameter("spcode"))){
			spcode="";
		}else{
			spcode=request.getParameter("spcode");
		}
		
		productlist = testImpl.findAllPrivilege(CREAT_UNIT,type,name,combo_region,Operate_type,spname,spcode);
		privilegeJson = getNewList(productlist);		
		length=productlist.size();
		return SUCCESS;
		
	}
	
	public String searchProPre() throws IOException{
		if (testImpl==null) {
			this.initTestImpl();
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.addHeader("Content-Type", "text/html;charset=utf-8");
	    String productcd =request.getParameter("productcd");
		String name="";
		if(request.getParameter("name")==null || "".equals(request.getParameter("name"))){
			name="";
		}else{
			name=URLDecoder.decode(request.getParameter("name"),"utf-8");
		}
		productlist = testImpl.findpreproduct(productcd,name);
		priproJson = getNewList(productlist);		
		
		return SUCCESS;
		
	}
	
	public void tishipre() throws IOException{
		if (testImpl==null) {
			this.initTestImpl();
		}
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.addHeader("Content-Type", "text/html;charset=utf-8");
		String name=URLDecoder.decode(request.getParameter("name"),"utf-8");
		String productcd=request.getParameter("productcd");
		productlist = testImpl.findpreproduct(productcd,name);
		JSONArray product_list = new JSONArray();
		if (productlist!=null) {
			for (int i = 0; i < productlist.size(); i++) {
				JSONObject product= new JSONObject(); 
				product.put("name", productlist.get(i).getProduct());
				product_list.add(product);
			}
		}
		
		PrintWriter printWriter = response.getWriter();
		printWriter.print(product_list.toString());
		printWriter.flush();
		printWriter.close();
		//priproJson = getNewList(productlist);		
		
	}
	
	public void tishiname() throws IOException{
		this.initTestImpl();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.addHeader("Content-Type", "text/html;charset=utf-8");
		String regionId=(String)request.getSession().getAttribute("companyid");
		if("1".equals(regionId)){
			regionId="999";
		}else{
			regionId=regionId.substring(0, 3);
		}
		String CREAT_UNIT=RegionFormat.ToPinyin(regionId);
		Calendar calendar=Calendar.getInstance();
		String datetime=new SimpleDateFormat("yyyyMMddHHmmss").format(calendar.getTime());
		if(request.getParameter("type")==null || "".equals(request.getParameter("type"))){
			type="prevelige";
		}else{
			type=request.getParameter("type");
		}
		String name=URLDecoder.decode(request.getParameter("name"),"utf-8");
		if(request.getParameter("spname")==null || "".equals(request.getParameter("spname"))){
			spname="";
		}else{
			spname=URLDecoder.decode(request.getParameter("spname"),"utf-8");
		}
		if(request.getParameter("spcode")==null || "".equals(request.getParameter("spcode"))){
			spcode="";
		}else{
			spcode=request.getParameter("spcode");
		}
		list_pro = testImpl.findAllPrivilege(CREAT_UNIT,type,name,"1","1",spname,spcode);	
		JSONArray product_list = new JSONArray();
		if (list_pro!=null) {
			for (int i = 0; i < list_pro.size(); i++) {
				JSONObject product= new JSONObject(); 
				product.put("name", list_pro.get(i).getProduct());
				product_list.add(product);
			}
		}
		
		PrintWriter printWriter = response.getWriter();
		printWriter.print(product_list.toString());
		printWriter.flush();
		printWriter.close();
	} 
	
	public void tishispname() throws IOException{
		this.initTestImpl();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.addHeader("Content-Type", "text/html;charset=utf-8"); 
		if(request.getParameter("type")==null || "".equals(request.getParameter("type"))){
			type="prevelige";
		}else{
			type=request.getParameter("type");
		}
		String spname=URLDecoder.decode(request.getParameter("spname"),"utf-8");
		List<Object[]> list = testImpl.spnameList(spname);	
		JSONArray jsonArray = new JSONArray();
		if (list!=null) {
			for (int i = 0; i < list.size(); i++) {
				JSONObject jsonObject= new JSONObject(); 
				Object[] objects=list.get(i);
				jsonObject.put("sp_code", objects[0]);
				jsonObject.put("sp_name", objects[1]);
				jsonArray.add(jsonObject);
			}
		}
		
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonArray.toString());
		printWriter.flush();
		printWriter.close();
	}
	
	public void getsp_nameList() throws IOException {
		if (testImpl==null) {
			this.initTestImpl();
		}
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.addHeader("Content-Type", "text/html;charset=utf-8");
		List<Object[]>list=new ArrayList<Object[]>();
		JSONArray jsonArray=new JSONArray();
		list=testImpl.getsp_nameList();
		for (int i = 0; i < list.size(); i++) {
			JSONObject jsonObject=new JSONObject();
			Object[] objects=list.get(i);
			jsonObject.put("id", objects[0]);
			jsonObject.put("text", objects[1]);
			jsonArray.add(jsonObject);
		}
		PrintWriter print=response.getWriter();
		print.print(jsonArray.toString());
		print.flush();
		print.close();
	}


	public JSONObject getPrivilegeJson() {
		return privilegeJson;
	}


	public void setPrivilegeJson(JSONObject privilegeJson) {
		this.privilegeJson = privilegeJson;
	}


	public List<String> getPrivileges() {
		return privileges;
	}


	public void setPrivileges(List<String> privileges) {
		this.privileges = privileges;
	}

	public TestImpl getTestImpl() {
		return testImpl;
	}

	public void setTestImpl(TestImpl testImpl) {
		this.testImpl = testImpl;
	}

	public List<product> getProductlist() {
		return productlist;
	}

	public void setProductlist(List<product> productlist) {
		this.productlist = productlist;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public JSONObject getPriproJson() {
		return priproJson;
	}

	public void setPriproJson(JSONObject priproJson) {
		this.priproJson = priproJson;
	}

	public String getCombo_region() {
		return combo_region;
	}

	public void setCombo_region(String combo_region) {
		this.combo_region = combo_region;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpname() {
		return spname;
	}

	public void setSpname(String spname) {
		this.spname = spname;
	}

	public String getSpcode() {
		return spcode;
	}

	public void setSpcode(String spcode) {
		this.spcode = spcode;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}
	
	
}
