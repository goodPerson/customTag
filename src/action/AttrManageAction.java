package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import common.GetLog;
import common.Session;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import module.AttrUnify;
import module.Region;

import dao.RegionDaoImpl;
import dao.TagAttrDaoImpl;



public class AttrManageAction {
	private static TagAttrDaoImpl AttrDao;
	private List<AttrUnify> listAttrName;
	private List<AttrUnify> listAttrName1;
	private List<AttrUnify> listAttrName2;
	private String attr_classify ;
	private String attr_classify_one ;
	private String attr_classify_two ;
	private String attr_name;
	
	static ApplicationContext factory=null;
	
	public static void initattr(){
    	XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
    	AttrDao=(TagAttrDaoImpl) factory.getBean("TagAttrDao");
    }
	
	
	
	public void getAttr()  throws IOException{
		if (null==AttrDao)
			this.initattr();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest  request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		listAttrName=AttrDao.listattr();
		JSONArray listCountyName=new JSONArray();
		JSONObject object=new JSONObject();
		for (int i=0; i<listAttrName.size();i++){
				AttrUnify region=listAttrName.get(i);			
				object.put("id",region.getAttr_classify());
				object.put("text", region.getAttr_classify());
			listCountyName.add(object);
		}
		PrintWriter print=response.getWriter();
		print.print(listCountyName.toString());
		print.flush();
		print.close();	
	}
	
	public void getAttr1() throws IOException{
		if (null==AttrDao)
			this.initattr();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest  request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
//		String attr = request.getParameter("attr");
		String attr =URLDecoder.decode(request.getParameter("attr"),"utf-8");
		listAttrName1=AttrDao.listattr1(attr);
		JSONArray listCountyName=new JSONArray();
		JSONObject object=new JSONObject();
		for (int i=0; i<listAttrName1.size();i++){
				AttrUnify region=listAttrName1.get(i);			
				object.put("id", region.getAttr_classify_one());
				object.put("text", region.getAttr_classify_one());
			listCountyName.add(object);
		}
		PrintWriter print=response.getWriter();
		print.print(listCountyName.toString());
		print.flush();
		print.close();
		
	}
	
	public void getAttr2() throws IOException{
		if (null==AttrDao)
			this.initattr();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest  request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String attr1 =URLDecoder.decode(request.getParameter("attr1"),"utf-8");
		listAttrName2=AttrDao.listattr2(attr1);
		JSONArray listCountyName=new JSONArray();
		JSONObject object=new JSONObject();
		for (int i=0; i<listAttrName2.size();i++){
				AttrUnify region=listAttrName2.get(i);			
				object.put("id",region.getAttr_classify_two());
				object.put("text",region.getAttr_classify_two());
			listCountyName.add(object);
		}
		PrintWriter print=response.getWriter();
		print.print(listCountyName.toString());
		print.flush();
		print.close();
	}
	
	public String getAttrList() throws IOException{
		if (null==AttrDao)
			this.initattr();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest  request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		HttpSession session=request.getSession();
		String userName=session.getAttribute("userName").toString();

		if("".equals(request.getParameter("attr_classify")) || request.getParameter("attr_classify") == null){
			attr_classify="基本属性";
		}else{
		 attr_classify = URLDecoder.decode(request.getParameter("attr_classify"),"utf-8");
		 }
		if("".equals(request.getParameter("attr_classify_one")) || request.getParameter("attr_classify_one")==null){
			attr_classify_one="";   
		}else{
			attr_classify_one = URLDecoder.decode(request.getParameter("attr_classify_one"),"utf-8");
			attr_classify_one =attr_classify_one.trim();
		}
		if("".equals(request.getParameter("attr_classify_two")) || request.getParameter("attr_classify_two")==null){
			attr_classify_two="";
		}else{
			 attr_classify_two = URLDecoder.decode(request.getParameter("attr_classify_two"),"utf-8");
		}
		if("".equals(request.getParameter("attr_name")) || request.getParameter("attr_name")==null){
			attr_name="";
		}else{
			attr_name = URLDecoder.decode(request.getParameter("attr_name"),"utf-8");
		}
		listAttrName1=AttrDao.listattr1(attr_classify);
	   listAttrName =AttrDao.listAttr(attr_classify, attr_classify_one, attr_classify_two,attr_name);
	   GetLog.getLog("查询属性", "查询", attr_classify, userName+"查询"+attr_classify);
		return "success";
	}
	
	public String getAttrDesc() throws IOException{
		if (null==AttrDao)
			this.initattr();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest  request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		HttpSession session=request.getSession();
		String userName=session.getAttribute("userName").toString();
		if("".equals(request.getParameter("attr_name")) || request.getParameter("attr_name")==null){
			attr_name="";
		}else{
			attr_name = URLDecoder.decode(request.getParameter("attr_name"),"utf-8");
		}
		listAttrName=AttrDao.Attr(attr_name);
		 GetLog.getLog("查询属性", "查询", attr_name, userName+"查询"+attr_name);
		return "success";
	}
	
	public void renameAttr() throws IOException{ 
		if (null==AttrDao)
		  this.initattr();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  String name=request.getParameter("name");
		  String num=request.getParameter("num");
		  AttrDao.renameAttr(name, num);
	}
	
	public void delAttr() throws IOException{ 
		if (null==AttrDao)
		 this.initattr();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  String num= request.getParameter("num");
		  String [] nums=num.split(",");
		  
		  for (int i=0;i<nums.length;i++){
			  AttrDao.delAttr(nums[i]);
		   }
	}
	
	public void addAttr() throws  IOException{ 
		if (null==AttrDao)
		 this.initattr();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  Calendar date = Calendar.getInstance();
		  String time= new SimpleDateFormat("HHmmss").format(date.getTime());
		  int num =Integer.parseInt(time);
		  String Attr_name = request.getParameter("Attr_name");
		  String classify = request.getParameter("classify");
		  String classify1 = request.getParameter("classify1");
		  String classify2 = request.getParameter("classify2");
		  AttrUnify attr =new AttrUnify();
		  attr.setIs_importtant_attr("否");
		  attr.setNum_order(num);
		  attr.setAttr_classify(classify);
		  attr.setAttr_classify_one(classify1);
		  attr.setAttr_classify_two(classify2);
		  attr.setAttr_name("--");
		  attr.setAttr_type("--");
		  attr.setAttr_desc(Attr_name);
		  attr.setUnit("--");
		  attr.setUpdate_cycle("--");
		  attr.setStatis_requmts("--");
		  attr.setVgop_gat_tab("--");
		  attr.setDim_tab("--");
		  attr.setValue_scope("--");
		  attr.setValue_type("--");
		  attr.setIs_goalcust_choose_condt("--");
		  attr.setRemark("--");
		  attr.setIs_show("--");
		  attr.setDay_mon("--");
		  attr.setIs_write_staits_requmts("否");
		  attr.setIs_new("是");
		  AttrDao.addAttr(attr);
		  
	}

	public TagAttrDaoImpl getAttrDao() {
		return AttrDao;
	}
	public void setAttrDao(TagAttrDaoImpl attrDao) {
		AttrDao = attrDao;
	}
	public List<AttrUnify> getListAttrName() {
		return listAttrName;
	}
	public void setListAttrName(List<AttrUnify> listAttrName) {
		this.listAttrName = listAttrName;
	}
	
	public List<AttrUnify> getListAttrName1() {
		return listAttrName1;
	}
	public void setListAttrName1(List<AttrUnify> listAttrName1) {
		this.listAttrName1 = listAttrName1;
	}
	public String getAttr_classify() {
		return attr_classify;
	}
	public void setAttr_classify(String attr_classify) {
		this.attr_classify = attr_classify;
	}
	public String getAttr_classify_one() {
		return attr_classify_one;
	}
	public void setAttr_classify_one(String attr_classify_one) {
		this.attr_classify_one = attr_classify_one;
	}
	public String getAttr_classify_two() {
		return attr_classify_two;
	}



	public void setAttr_classify_two(String attr_classify_two) {
		this.attr_classify_two = attr_classify_two;
	}
	

}
