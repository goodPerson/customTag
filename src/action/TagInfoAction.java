package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.Attr;
import module.CustomTag;
import module.GroupTagAttrInfo;
import module.MainTag;
import module.Structure;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import common.GetLog;

import dao.ArrtClassDaoImpl;
import dao.CustTagAttrInfoDaoImpl;
import dao.RegionDaoImpl;
import dao.StructureImpl;
import dao.TagInfoDaoImpl;

public class TagInfoAction extends ActionSupport {
	
	private String message="核心标签";
	private String tag_id="";
	private String tag_name="";
	private String create_time="";
	private String end_time="";
	private String profile;
	private String mes;
	private String name;
	private int a ;
	private String id;
	private String attr_table="";                              //属性选择框
	private String attr_value="";                              // 属性值
	private String hre;
	private String starttime;
	private String endtime;
	private String count;
	private String type;
   private String userId;
   private String userName;
   private String regionId;
   private String regionName;
	   
	

	private static TagInfoDaoImpl tagDao ;	


	private List<CustomTag> listTag= new ArrayList<CustomTag>();
	private List<Attr> listAttr= new ArrayList<Attr>();
	private String title="sss";
	
	//ywz 20130521  begin
	   private static	ArrtClassDaoImpl attrClassDao;                                //标签类别Dao
	   private static CustTagAttrInfoDaoImpl custTagAttrDao;     //客户群筛选属性Dao
	   private static RegionDaoImpl regionDao;//客户群筛选属性Dao
	   private StructureImpl structDao;
	   private List  baisAttr;                                                                                                //基本属性
	   private List  voiceAttr;																							   //语音属性
       private List  flowAttr;                    																			   //流量属性
	   private List  terminalAttr;																						   //终端属性
	   private List  groupAttr;                                                                                             //集团属性
	   private List  smsMmsAttr;																						   //短彩信属性
	   private List  servAttr;                                                                                                //业务属性
	   private List  regionAttr;                                                                                            //区域属性
	   private List  qudaoAttr;                                                                                            //渠道属性
	   private List  tagAttr;                                                                                                 //标签属性	
	   private int date;
	   private String cycleDay;                                                                                           //数据日更新周期
	   private String mon;
	   private List<GroupTagAttrInfo> groupTagList= new ArrayList<GroupTagAttrInfo>();  //筛选属性；
	   private List<Structure> listStruct;
	   private JSONArray jsonAttr=new JSONArray();
	   static ApplicationContext cxt;
	   static ApplicationContext factory=null;
	   private int lvl_id;
	   private String structAttr;
	   private String structValue;
	   private String attrDesc;
	   private String attrTypeC;
	   
	   
		String tagIntroduce;
		String createTagDate;
		String endTagDate;
		String cityName;     
		String countyName;   
		String userState;    
	 //ywz 20130521  end    
	public static void initTag(){
			//XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
			//tagDao=(TagInfoDaoImpl)factory.getBean("customTagDao");
			if (null==cxt)
			 cxt=new ClassPathXmlApplicationContext("applicationContext.xml");
			tagDao=(TagInfoDaoImpl)cxt.getBean("customTagDao");
			
			
		}
		
	public static void initRegion(){
	    	//XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
				factory = new ClassPathXmlApplicationContext("applicationContext.xml");
	    	regionDao=(RegionDaoImpl) factory.getBean("regionDaoImpl");
	    }

	public static void initGroupAttr(){
			//XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
			//custTagAttrDao=(CustTagAttrInfoDaoImpl)factory.getBean("custTagAttrInfoDaoImpl");		
			if (null==cxt)
			cxt=new ClassPathXmlApplicationContext("applicationContext.xml");
			custTagAttrDao=(CustTagAttrInfoDaoImpl)cxt.getBean("custTagAttrInfoDaoImpl");

		}	
	//初始化构建条件
	public void initStruct(){
			XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
			structDao=(StructureImpl) factory.getBean("structureImp");
		}
		
	//初始化属性类别dao
	public static void initTagUnifyView(){
			//XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
			//attrClassDao=(ArrtClassDaoImpl) factory.getBean("arrtClassDaoImpl"); 
			if (null==cxt)
			 cxt=new ClassPathXmlApplicationContext("applicationContext.xml");
			attrClassDao=(ArrtClassDaoImpl) cxt.getBean("arrtClassDaoImpl"); 
		}
	
	@Override
	public String execute() throws Exception{
		//this.addPerson();
		if (null==custTagAttrDao)
		this.initGroupAttr();
		if (null==tagDao)
		this.initTag();
		if (null==attrClassDao)
		this.initTagUnifyView();
		 HttpServletRequest request = ServletActionContext.getRequest();
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
	      
		
		return SUCCESS;
	}
	
	//获取属性列表
	public void listAttr() throws IOException{
		if (null==tagDao)
		this.initTag();

		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  
		  String type1 = URLDecoder.decode(request.getParameter("type_1"),"utf-8"); //属性搜索类型，1表示按二级类，2表示按关键字搜索
		  String type2 = URLDecoder.decode(request.getParameter("type_2"),"utf-8");
		  String type3 = URLDecoder.decode(request.getParameter("type3"),"utf-8");
         
		  if("语音属性".equals(type3) || "流量属性".equals(type3)){
			  this.listAttr=tagDao.listAtrrNew(type1,type2,type3);
		  }else{
			  this.listAttr=tagDao.listAtrr(type1,type2);
		  }
		  
	      JSONArray table = new JSONArray();

	        if(listAttr != null)
	        {	  	   
		      int tr_count=listAttr.size()/4;	
		      if(listAttr.size()%4>0){
		    	  tr_count=tr_count+1;
		      }
		     
		      for(int i=0;i<tr_count;i++)
		      { 
		    	  JSONArray tr = new JSONArray();  
		    	  for(int td_count=4*i;td_count<4*(i+1);td_count++){
		    		    if(td_count<listAttr.size()){
		    		    JSONObject td = new JSONObject(); 
		            	td.put("attr_id",listAttr.get(td_count).getAttr_id());	
		            	td.put("attr_name", listAttr.get(td_count).getAttr_name());	
		            	td.put("attr_type",listAttr.get(td_count).getAttr_type());
		            	td.put("attr_unit",listAttr.get(td_count).getAttr_unit());
		            	td.put("attr_table",listAttr.get(td_count).getAttr_table());
		            	td.put("attr_is_tab",listAttr.get(td_count).getAttr_is_tab());
		            	tr.add(td);
		    		    }
		    	  }
		    	  table.add(tr);
		      }	            
	            JSONObject jsonObjectFinal1 = new JSONObject();
	            jsonObjectFinal1.put("total", listAttr.size());
	            jsonObjectFinal1.put("rows", table);
	            PrintWriter printWriter = response.getWriter();
	            printWriter.print(jsonObjectFinal1.toString());
	            printWriter.flush();
	            printWriter.close();
	        }		
	}
	

	
	public void addTag() throws IOException {
		if (null==tagDao)
		  this.initTag();
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  Calendar date = Calendar.getInstance();
		  String time= new SimpleDateFormat("yyyyMMddHHmmss").format(date.getTime());
//		  String tag_id = request.getParameter("tag_id").toString();
          tag_id =time;
          profile=request.getParameter("tag_introduce");
		  tag_name = request.getParameter("tag_name");
		  create_time=request.getParameter("create_time");
          end_time=request.getParameter("end_time");
		  CustomTag newTag = new CustomTag();
		  newTag.setTag_id(tag_id);
		  newTag.setTag_name(tag_name);
		  newTag.setCreate_time(create_time);
		  newTag.setEnd_time(end_time);
		  newTag.setTag_type("myTag");
		  newTag.setProfile(profile);
		  newTag.setTag_creator("郑声远");
		  newTag.setTag_region("石家庄");
		  newTag.setTag_statement("--");
		  newTag.setCount_subs(0);
		  newTag.setIs_share("0");
		  newTag.setTag_status("0");
		  tagDao.addTag(newTag);
//		  GetLog.getLog("创建分群", "创建"+tag_name+"分群");
		  PrintWriter pWriter = response.getWriter();
		  
		  String aa ="创建成功";
		  pWriter.print(aa);
		  pWriter.flush();
		  pWriter.close();
		  		
	}
	
	public String initAttr()throws IOException{
		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  String region_id=request.getParameter("regionId");
		  starttime=request.getParameter("starttime");
		  endtime=request.getParameter("endtime");
		  count=URLDecoder.decode(request.getParameter("count"), "utf-8");
		  type=request.getParameter("type");
		  if("1".equals(type)){
		   count=count.substring(0, count.length()-1);	  
		  }else{
			count="";
		  }
		  
		  hre=request.getParameter("href");
		  if (null==attrClassDao)
		  this.initTagUnifyView();
			baisAttr=this.attrClassDao.getListSecName("基本属性");                                                                                                //基本属性
			voiceAttr=this.attrClassDao.getListSecName("语音属性");																								//语音属性
			flowAttr=this.attrClassDao.getListSecName("流量属性");                    																			//流量属性
			terminalAttr=this.attrClassDao.getListSecName("终端属性");																							//终端属性
			groupAttr=this.attrClassDao.getListSecName("集团属性");                                                                                             //集团属性
			smsMmsAttr=this.attrClassDao.getListSecName("短/彩信属性");																				        //短彩信属性
			servAttr=this.attrClassDao.getListSecName("业务属性");                                                                                                 //业务属性
			regionAttr=this.attrClassDao.getListSecName("区域属性");                                                                                              //区域属性
			qudaoAttr=this.attrClassDao.getListSecName("渠道属性");                                                                                              //渠道属性
			tagAttr=this.attrClassDao.getListSecName("标签");                                                                                                   //标签属性        
          this.title = URLDecoder.decode(request.getParameter("title_name"), "utf-8");
          this.id  =request.getParameter("id");
           if(title.equals("请输入客户群名称")){
        	    title="";
           }
           tagIntroduce     =URLDecoder.decode(request.getParameter("tag_introduce"), "utf-8");//  群简介
           createTagDate  =URLDecoder.decode(request.getParameter("create_tag_date"), "utf-8"); //  有效开始时间
           endTagDate      =URLDecoder.decode(request.getParameter("end_tag_date"), "utf-8"); //    有效结束时间
           cityName           =URLDecoder.decode(request.getParameter("cityName"), "utf-8");  //  区域地市
           countyName     =URLDecoder.decode(request.getParameter("countyName"), "utf-8");  //区域区县
           userState           =URLDecoder.decode(request.getParameter("userState"), "utf-8");  //区域区县用户状态
          this.initRegion();
          String reg_id=(String) request.getSession().getAttribute("regionId");
          lvl_id=regionDao.getlvl(reg_id);
          this.initGroupAttr();
          groupTagList=custTagAttrDao.getGroupTags(this.id);
          getTableAttr(groupTagList);
          date=custTagAttrDao.getMonth();
         
          mon=(String.valueOf(date)).substring(0,4)+"年"+(String.valueOf(date)).substring(4,6)+"月";
          cycleDay=(String.valueOf(custTagAttrDao.getData())).substring(0, 4)+"年"+(String.valueOf(custTagAttrDao.getData())).substring(4, 6)+"月"+(String.valueOf(custTagAttrDao.getData())).substring(6, 8)+"日";
          
           return SUCCESS;
             
	}
	
	public String buildContion( ) throws IOException{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
	    response.setCharacterEncoding("gbk");
	    response.setContentType("text/html;charset=gbk");
	    response.addHeader("Content-Type", "text/html;charset=gbk");	
	    String region_id=(String) request.getSession().getAttribute("regionId");
	    attrTypeC= URLDecoder.decode(request.getParameter("attrType"), "utf-8");
	    String attrName=URLDecoder.decode(request.getParameter("attrName"), "utf-8");
	   
		//构建开始
	
        initStruct();
        listStruct= structDao.getListStructure(region_id,attrTypeC,attrName);
        
        String structAttrT="";
//        String structValueT="";
        StringBuffer structAttrBuf=new StringBuffer();
//        StringBuffer structValueBuf=new StringBuffer();
        for (int i=0;i<listStruct.size();i++){
//        	['百度',   23],
      	  structAttrBuf.append("	['"+listStruct.get(i).getAttrDim_desc()+"',"+ listStruct.get(i).getSubsCnt() +"],");
//      	  structValueBuf.append(listStruct.get(i).getSubsCnt()+",");
      	  attrDesc=listStruct.get(i).getAttrDesc();
        }
        structAttrT+=structAttrBuf.toString();
//        structValueT+=structValueBuf.toString();
        if (!"".equals(structAttrT)){
      	  structAttr      =structAttrT.substring(0, structAttrT.lastIndexOf(","));
        }else{
      	  structAttr="0";
        }
//        if (!"".equals(structValueT)){
//      	  structValue   =structValueT.substring(0, structValueT.lastIndexOf(","));
//        }else{
//      	  structValue="0";
//        }
		return SUCCESS;
	}
	
	//属性筛选条件框值
	
	public void getTableAttr(List<GroupTagAttrInfo> tableAttrs){
		this.attr_table="";	
		jsonAttr=JSONArray.fromObject(tableAttrs); 	 
		//return this.attr_table;		
	}
	
	
	
	

public void delTag() throws IOException {
	if (null==tagDao)
	  this.initTag();
	  HttpServletResponse response = ServletActionContext.getResponse();
	  response.setCharacterEncoding("gbk");
	  response.setContentType("text/html;charset=gbk");
	  response.addHeader("Content-Type", "text/html;charset=gbk");	
	  HttpServletRequest request = ServletActionContext.getRequest();
	  String id=request.getParameter("tag_id");
	  String ids[]=id.split(",");
	  for (int i=0;i<ids.length;i++){
		  tagDao.delTag(ids[i]);
	  }
}
public void shareTag() throws IOException {
	if (null==tagDao)
	 this.initTag();
	  HttpServletResponse response = ServletActionContext.getResponse();
	  response.setCharacterEncoding("gbk");
	  response.setContentType("text/html;charset=gbk");
	  response.addHeader("Content-Type", "text/html;charset=gbk");	
	  HttpServletRequest request = ServletActionContext.getRequest();
	  String id=request.getParameter("tag_id");
	   String [] ids = id.split(",");
	   for (int i=0;i<ids.length;i++){
	     tagDao.shareTag(ids[i]);
	   }
}
public void renameTag() throws IOException{
	if (null==tagDao)
	  this.initTag();
	  HttpServletResponse response = ServletActionContext.getResponse();
	  response.setCharacterEncoding("gbk");
	  response.setContentType("text/html;charset=gbk");
	  response.addHeader("Content-Type", "text/html;charset=gbk");	
	  HttpServletRequest request = ServletActionContext.getRequest();
	  String name=request.getParameter("name");
	  String id=request.getParameter("id");
	  tagDao.renameTag(name, id);
}
public void saveTag() throws IOException{
	if (null==tagDao)
	 this.initTag();
	  HttpServletResponse response = ServletActionContext.getResponse();
	  response.setCharacterEncoding("gbk");
	  response.setContentType("text/html;charset=gbk");
	  response.addHeader("Content-Type", "text/html;charset=gbk");	
	  HttpServletRequest request = ServletActionContext.getRequest();
	  String tag_sta=request.getParameter("tag_sta");
	  String name=request.getParameter("name");
	  tagDao.renameTag(tag_sta, name);
}

/**
 * 获取“其他”类型的输入样例
 * @return
 * @throws IOException 
 */
public String getModel() throws IOException{
	this.initTag();
	HttpServletResponse response=ServletActionContext.getResponse();
//	response.setCharacterEncoding("gbk");
//	response.setContentType("text/html;charset=gbk");
//	response.addHeader("Content-Type", "text/html;charset=gbk");
	HttpServletRequest request=ServletActionContext.getRequest();
	String attrName=URLDecoder.decode(request.getParameter("attrName"), "utf-8").trim();
	if (!"".equals(attrName) || attrName!=null ){
		String valueScope=tagDao.getModle(attrName);
		PrintWriter out=response.getWriter();
		out.print(valueScope);
		out.flush();
		out.close();
	}
	return SUCCESS;
}

/**
 * 获取属性路径
 * @throws IOException 
 */
public void getAttrPath() throws IOException{
	initTagUnifyView();
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpServletResponse response=ServletActionContext.getResponse();
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	String attrName=URLDecoder.decode(request.getParameter("attrName"), "utf-8");
	String attrPath=attrClassDao.getAttrPaht(attrName);
	PrintWriter out=response.getWriter();
	out.print(attrPath);
	out.flush();
	out.close();		
}

public List<Attr> getListAttr() {
	return listAttr;
}
public void setListAttr(List<Attr> listAttr) {
	this.listAttr = listAttr;
}
public ArrtClassDaoImpl getAttrClassDao() {
	return attrClassDao;
}
public void setAttrClassDao(ArrtClassDaoImpl attrClassDao) {
	this.attrClassDao = attrClassDao;
}
public List getBaisAttr() {
	return baisAttr;
}
public void setBaisAttr(List baisAttr) {
	this.baisAttr = baisAttr;
}
public List getFlowAttr() {
	return flowAttr;
}
public void setFlowAttr(List flowAttr) {
	this.flowAttr = flowAttr;
}
public List getTerminalAttr() {
	return terminalAttr;
}
public void setTerminalAttr(List terminalAttr) {
	this.terminalAttr = terminalAttr;
}
public List getGroupAttr() {
	return groupAttr;
}
public void setGroupAttr(List groupAttr) {
	this.groupAttr = groupAttr;
}
public List getSmsMmsAttr() {
	return smsMmsAttr;
}
public void setSmsMmsAttr(List smsMmsAttr) {
	this.smsMmsAttr = smsMmsAttr;
}

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getRegionId() {
	return regionId;
}
public void setRegionId(String regionId) {
	this.regionId = regionId;
}
public String getRegionName() {
	return regionName;
}
public void setRegionName(String regionName) {
	this.regionName = regionName;
}
public String getHre() {
	return hre;
}
public void setHre(String hre) {
	this.hre = hre;
}
public int getLvl_id() {
	return lvl_id;
}
public void setLvl_id(int lvl_id) {
	this.lvl_id = lvl_id;
}
public String getStarttime() {
	return starttime;
}
public void setStarttime(String starttime) {
	this.starttime = starttime;
}
public String getEndtime() {
	return endtime;
}
public void setEndtime(String endtime) {
	this.endtime = endtime;
}
public String getCount() {
	return count;
}
public void setCount(String count) {
	this.count = count;
}
public String getMon() {
	return mon;
}
public void setMon(String mon) {
	this.mon = mon;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getStructAttr() {
	return structAttr;
}
public void setStructAttr(String structAttr) {
	this.structAttr = structAttr;
}
public String getStructValue() {
	return structValue;
}
public void setStructValue(String structValue) {
	this.structValue = structValue;
}
public String getAttr_value() {
	return attr_value;
}
public void setAttr_value(String attr_value) {
	this.attr_value = attr_value;
}
public String getAttr_table() {
	return attr_table;
}
public void setAttr_table(String attr_table) {
	this.attr_table = attr_table;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}

public List getVoiceAttr() {
	return voiceAttr;
}
public void setVoiceAttr(List voiceAttr) {
	this.voiceAttr = voiceAttr;
}
public String getTitle() {
	return title;
}
public List getServAttr() {
	return servAttr;
}
public void setServAttr(List servAttr) {
	this.servAttr = servAttr;
}
public List getRegionAttr() {
	return regionAttr;
}
public void setRegionAttr(List regionAttr) {
	this.regionAttr = regionAttr;
}
public List getQudaoAttr() {
	return qudaoAttr;
}
public void setQudaoAttr(List qudaoAttr) {
	this.qudaoAttr = qudaoAttr;
}
public List getTagAttr() {
	return tagAttr;
}
public void setTagAttr(List tagAttr) {
	this.tagAttr = tagAttr;
}
public void setTitle(String title) {
	this.title = title;
}
public List<CustomTag> getListTag() {
	return listTag;
}
public void setListTag(List<CustomTag> listTag) {
	this.listTag = listTag;
}

public int getA() {
	return a;
}
public void setA(int a) {
	this.a = a;
}
public TagInfoDaoImpl getTagDao() {
	return tagDao;
}
public void setTagDao(TagInfoDaoImpl tagDao) {
	this.tagDao = tagDao;
}

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public JSONArray getJsonAttr() {
	return jsonAttr;
}
public void setJsonAttr(JSONArray jsonAttr) {
	this.jsonAttr = jsonAttr;
}
public List<GroupTagAttrInfo> getGroupTagList() {
	return groupTagList;
}
public void setGroupTagList(List<GroupTagAttrInfo> groupTagList) {
	this.groupTagList = groupTagList;
}
public String getAttrDesc() {
	return attrDesc;
}
public void setAttrDesc(String attrDesc) {
	this.attrDesc = attrDesc;
}

public String getAttrTypeC() {
	return attrTypeC;
}

public void setAttrTypeC(String attrTypeC) {
	this.attrTypeC = attrTypeC;
}

public String getCycleDay() {
	return cycleDay;
}

public void setCycleDay(String cycleDay) {
	this.cycleDay = cycleDay;
}


public String getTagIntroduce() {
	return tagIntroduce;
}

public void setTagIntroduce(String tagIntroduce) {
	this.tagIntroduce = tagIntroduce;
}

public String getCreateTagDate() {
	return createTagDate;
}

public void setCreateTagDate(String createTagDate) {
	this.createTagDate = createTagDate;
}

public String getEndTagDate() {
	return endTagDate;
}

public void setEndTagDate(String endTagDate) {
	this.endTagDate = endTagDate;
}

public String getCityName() {
	return cityName;
}

public void setCityName(String cityName) {
	this.cityName = cityName;
}

public String getCountyName() {
	return countyName;
}

public void setCountyName(String countyName) {
	this.countyName = countyName;
}

public String getUserState() {
	return userState;
}

public void setUserState(String userState) {
	this.userState = userState;
}

}
