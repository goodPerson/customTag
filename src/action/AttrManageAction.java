package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import common.GetLog;

import module.AttrUnify;
import module.OperateLog;
import module.Region;

import dao.RegionDaoImpl;
import dao.TagAttrDaoImpl;



public class AttrManageAction {
	private  TagAttrDaoImpl AttrDao;
	private List<AttrUnify> listAttrName;
	private List<AttrUnify> listAttrName1;
	private List<AttrUnify> listAttrName2;
	private String attr_classifyPar ;
	private String attr_classify_onePar ;
	private String attr_classify_twoPar ;
	//分页功能参数  start
	
	private int pageNo;  //当前页
	private int pageCounts;  //总页数
	private int totalRecords; //总记录数
	
	//分页功能参数  end
	//static ApplicationContext factory=null;
	
	public  void initattr(){
    	XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		//if (null==factory)
		//	factory = new ClassPathXmlApplicationContext("applicationContext.xml");
    	AttrDao=(TagAttrDaoImpl) factory.getBean("TagAttrDao");
    }
	
	
	
	public void getAttr()  throws IOException{
		//if (null==AttrDao)
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
		//if (null==AttrDao)
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
		//if (null==AttrDao)
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
		int pageSize=15;
	//	if (null==AttrDao)
			this.initattr();
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest  request   =ServletActionContext.getRequest();
		response.setCharacterEncoding("gbk");
		response.addHeader("Content-Type", "text/html;charset=gbk");
		String pageNoS=request.getParameter("pageNo");
		if (null==pageNoS || pageNoS.trim().length()==0){
			pageNo=1;
		}else{
			pageNo=Integer.parseInt(pageNoS);
		}
		if("".equals(request.getParameter("attr_classify")) || request.getParameter("attr_classify") == null){
			attr_classifyPar="基本属性";
		}else{
		 attr_classifyPar = URLDecoder.decode(request.getParameter("attr_classify"),"utf-8");
		 }
		if("".equals(request.getParameter("attr_classify_one")) || request.getParameter("attr_classify_one")==null){
			attr_classify_onePar="";   
		}else{
			attr_classify_onePar = URLDecoder.decode(request.getParameter("attr_classify_one"),"utf-8");
		}
		if("".equals(request.getParameter("attr_classify_two")) || request.getParameter("attr_classify_two")==null){
			attr_classify_twoPar="";
		}else{
			 attr_classify_twoPar = URLDecoder.decode(request.getParameter("attr_classify_two"),"utf-8");
		}
		 List<AttrUnify> templistAttrName =AttrDao.listAttr(attr_classifyPar, attr_classify_onePar, attr_classify_twoPar,pageNo,pageSize);	
       pageCounts=AttrDao.getPageInfo().getTotalPages();		
       if (pageNo<=1){
			pageNo=1;
		}else if (pageNo>=pageCounts){
			pageNo=pageCounts;
		}
			
		totalRecords=AttrDao.getPageInfo().getTotalRows();
		if (totalRecords<1)
			totalRecords=1;		
		
		listAttrName =AttrDao.listAttr(attr_classifyPar, attr_classify_onePar, attr_classify_twoPar,pageNo,pageSize);	
		GetLog.getLog("属性管理", "查找", "属性查找", attr_classifyPar+","+attr_classify_onePar+","+attr_classify_twoPar);
		return "success";
	}
	
	public void renameAttr() throws IOException{ 
	//	if (null==AttrDao)
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
		//if (null==AttrDao)
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
	//	if (null==AttrDao)
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

	public String getAttr_classifyPar() {
		return attr_classifyPar;
	}
	public void setAttr_classifyPar(String attr_classifyPar) {
		this.attr_classifyPar = attr_classifyPar;
	}
	public String getAttr_classify_onePar() {
		return attr_classify_onePar;
	}
	public void setAttr_classify_onePar(String attr_classify_onePar) {
		this.attr_classify_onePar = attr_classify_onePar;
	}
	public String getAttr_classify_twoPar() {
		return attr_classify_twoPar;
	}
	public void setAttr_classify_twoPar(String attr_classify_twoPar) {
		this.attr_classify_twoPar = attr_classify_twoPar;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageCounts() {
		return pageCounts;
	}
	public void setPageCounts(int pageCounts) {
		this.pageCounts = pageCounts;
	}
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	

}
