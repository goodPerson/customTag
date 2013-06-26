package action;

import java.io.IOException;
import java.io.PrintWriter;
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
import dao.TagInfoDaoImpl;

public class TagInfoAction extends ActionSupport {
	
	private String message="���ı�ǩ";
	private String tag_id="";
	private String tag_name="";
	private String create_time="";
	private String end_time="";
	private String profile;
	private String mes;
	private String name;
	private int a ;
	private String id;
	private String attr_table="";                              //����ѡ���
	private String attr_value="";                              // ����ֵ
	private String hre;
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


	private List<CustomTag> listTag= new ArrayList<CustomTag>();
	private List<Attr> listAttr= new ArrayList<Attr>();
	private String title="sss";
	
	//ywz 20130521  begin
	   private 	ArrtClassDaoImpl attrClassDao;                                //��ǩ���Dao
	   private  CustTagAttrInfoDaoImpl custTagAttrDao;     //�ͻ�Ⱥɸѡ����Dao
	   private List  baisAttr;                                                                                                //��������
	   private List  voiceAttr;																							   //��������
       private List  flowAttr;                    																			   //��������
	   private List  terminalAttr;																						   //�ն�����
	   private List  groupAttr;                                                                                             //��������
	   private List  smsMmsAttr;																						   //�̲�������
	   private List  servAttr;                                                                                                //ҵ������
	   private List  regionAttr;                                                                                            //��������
	   private List  qudaoAttr;                                                                                            //��������
	   private List  tagAttr;                                                                                                 //��ǩ����	
	   private List<GroupTagAttrInfo> groupTagList= new ArrayList<GroupTagAttrInfo>();  //ɸѡ���ԣ�
	   private JSONArray jsonAttr=new JSONArray();
	 //  static ApplicationContext cxt;
	   
		public  void initTag(){
			XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
			tagDao=(TagInfoDaoImpl)factory.getBean("customTagDao");
			//if (null==cxt)
			// cxt=new ClassPathXmlApplicationContext("applicationContext.xml");
			//tagDao=(TagInfoDaoImpl)cxt.getBean("customTagDao");
			
			
		}

		public  void initGroupAttr(){
			XmlBeanFactory factory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
			custTagAttrDao=(CustTagAttrInfoDaoImpl)factory.getBean("custTagAttrInfoDaoImpl");		
			//if (null==cxt)
			//cxt=new ClassPathXmlApplicationContext("applicationContext.xml");
			//custTagAttrDao=(CustTagAttrInfoDaoImpl)cxt.getBean("custTagAttrInfoDaoImpl");

		}	
		
		//�������dao
		public  void initTagUnifyView(){
			XmlBeanFactory factory=new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
			attrClassDao=(ArrtClassDaoImpl) factory.getBean("arrtClassDaoImpl"); 
			//if (null==cxt)
			// cxt=new ClassPathXmlApplicationContext("applicationContext.xml");
			//attrClassDao=(ArrtClassDaoImpl) cxt.getBean("arrtClassDaoImpl"); 
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


	private String userId;
	   private String userName;
	   private String regionId;
	   private String regionName;
	   //ywz 20130521  end
	
	   
	   
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


	private static TagInfoDaoImpl tagDao ;
	
	
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

	
	
	
	@Override
	public String execute() throws Exception{
		//this.addPerson();
	//	if (null==custTagAttrDao)
		this.initGroupAttr();
	//	if (null==tagDao)
		this.initTag();
	//	if (null==attrClassDao)
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
	
	//��ȡ�����б�
	public void listAttr() throws IOException{
	//	if (null==tagDao)
		this.initTag();

		  HttpServletResponse response = ServletActionContext.getResponse();
		  response.setCharacterEncoding("gbk");
		  response.setContentType("text/html;charset=gbk");
		  response.addHeader("Content-Type", "text/html;charset=gbk");	
		  HttpServletRequest request = ServletActionContext.getRequest();
		  
		  String type1 = URLDecoder.decode(request.getParameter("type_1"),"utf-8"); //�����������ͣ�1��ʾ�������࣬2��ʾ���ؼ�������
		  String type2 = URLDecoder.decode(request.getParameter("type_2"),"utf-8");

		  this.listAttr=tagDao.listAtrr(type1,type2);
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
		//if (null==tagDao)
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
		  newTag.setTag_creator("֣��Զ");
		  newTag.setTag_region("ʯ��ׯ");
		  newTag.setTag_statement("--");
		  newTag.setCount_subs(0);
		  newTag.setIs_share("0");
		  newTag.setTag_status("0");
		  tagDao.addTag(newTag);
		  //GetLog.getLog("������Ⱥ", "����"+tag_name+"��Ⱥ");
		  PrintWriter pWriter = response.getWriter();
		  
		  String aa ="�����ɹ�";
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
		  hre=request.getParameter("href");
		//  if (null==attrClassDao)
		  this.initTagUnifyView();
			baisAttr=this.attrClassDao.getListSecName("��������");                                                                                                //��������
			voiceAttr=this.attrClassDao.getListSecName("��������");																								//��������
			flowAttr=this.attrClassDao.getListSecName("��������");                    																			//��������
			terminalAttr=this.attrClassDao.getListSecName("�ն�����");																							//�ն�����
			groupAttr=this.attrClassDao.getListSecName("��������");                                                                                             //��������
			smsMmsAttr=this.attrClassDao.getListSecName("��/��������");																				        //�̲�������
			servAttr=this.attrClassDao.getListSecName("ҵ������");                                                                                                 //ҵ������
			regionAttr=this.attrClassDao.getListSecName("��������");                                                                                              //��������
			qudaoAttr=this.attrClassDao.getListSecName("��������");                                                                                              //��������
			tagAttr=this.attrClassDao.getListSecName("��ǩ����");                                                                                                   //��ǩ����        
          this.title = URLDecoder.decode(request.getParameter("title_name"), "utf-8");
          this.id  =request.getParameter("id");
          this.initGroupAttr();
          groupTagList=custTagAttrDao.getGroupTags(this.id);
          getTableAttr(groupTagList);
          return SUCCESS;
             
	}
	
	//����ɸѡ������ֵ
	
	public void getTableAttr(List<GroupTagAttrInfo> tableAttrs){
		this.attr_table="";	
		jsonAttr=JSONArray.fromObject(tableAttrs); 
		
		 for(int i=0;i<tableAttrs.size();i++){
			 String group_id =tableAttrs.get(i).getTag_id();
			 String group_name=tableAttrs.get(i).getTag_name();
			 String attr_id =tableAttrs.get(i).getAttr_id();
			 String attr_name =tableAttrs.get(i).getAttr_name();
			 String attr_form =tableAttrs.get(i).getAttr_from();
			 String attr_table =tableAttrs.get(i).getAttr_table();
			 String attr_lvl =tableAttrs.get(i).getAttr_lvl();
			 String form_attr_value_type =tableAttrs.get(i).getAttr_type();
			 String form_attr_value_betn1 =tableAttrs.get(i).getAttr_value_type1();
			 String form_attr_value1 =tableAttrs.get(i).getAttr_value1();
			 String form_attr_value_betn2 =tableAttrs.get(i).getAttr_value_type2();
			 String form_attr_value2 =tableAttrs.get(i).getAttr_value2();
	//                                        3���Ա�ʾʶ��0�������ͣ�4һ�����ԣ�1�������ƣ�2����	
			 if(attr_id.equals("CITY_ID") || attr_id.equals("COUNTY_ID") || attr_id.equals("SUBS_STAT")||attr_id.equals("BRAND_ID") ) continue;
			 
			 if(form_attr_value_type.equals("������")){
				  String bt_id=attr_id+"_tr' title='"+form_attr_value_type+","+attr_lvl+","+attr_table;
				 //this.attr_value=this.attr_value+"$(\"#"+bt_id+"\").children(\":eq(1)\").find('select').combobox(\"setValue\",\""+form_attr_value_type+"\");";
				 this.attr_table=this.attr_table+"<tr id='"+attr_id+"_tr' title='"+form_attr_value_type+","+attr_lvl+","+attr_id+","+attr_table+"'><td width='80px'>"+attr_name+"</td>"
                         +  "<td><select class='easyui-combobox' name='state' style='width:80px;height:25px' >"
                         +     "<option value='>' selected>����</option>"
						  +     "<option value='>=' >���ڵ���</option>"
                         +      "<option value='<' >С��</option>"
						  +      "<option value='<=' >С�ڵ���</option>"
                         +      "<option value='='>����</option>"
                         +      "</select></td>"
                         +  "<td><input id='tag_name_txt' type='text'  value='"+form_attr_value1+"' style='width:100px; height:25px;border:1px solid  #CCC;'></td>"
                         +   "<td><select class='easyui-combobox' name='state' style='width:80px;height:25px'>"
                         +     "<option value='>' selected>����</option>"
						  +     "<option value='>=' >���ڵ���</option>"
                         +      "<option value='<' >С��</option>"
						  +      "<option value='<=' >С�ڵ���</option>"
                         +      "<option value='='>����</option>"
                         +       "</select></td>"
                         +    "<td ><input id='tag_name_txt' type='text'  value='"+form_attr_value2+"' style='width:100px; height:25px;border:1px solid  #CCC;'></td>"
                         +    "<td width='80px'><label style='cursor: pointer;'  id='"+attr_id+"&"+form_attr_value_type+"'  onClick=$.consitAttr(this)>����</label> <span id='"+attr_id+"_dt' onClick=$.deletrAttr(this.id)><lable id='"+attr_id+"del' style='cursor: pointer;'>ɾ��</label></span></td></tr>";
				 
			 }else if(form_attr_value_type.equals("���")){
				 this.attr_table=this.attr_table+"<tr id='"+attr_id+"_tr' title='"+form_attr_value_type+","+attr_lvl+","+attr_id+","+attr_table+"'><td width='80px'>"+attr_name+"</td>"
	                        +  "<td colspan=4><select class='easyui-combobox' name='state' style='width:250px;height:25px' data-options='valueField:\"id\",textField:\"text\",url:\"getAttrTableAction.action?table_name="+attr_table+"\" '></td>"
	                         +  "<td width='80px'><label style='cursor: pointer;' id='"+attr_id+"&"+form_attr_value_type+"&"+attr_table+"'  onClick=$.consitAttr(this)>����</label> <span id='"+attr_id+"_dt' onClick=$.deletrAttr(this.id)><lable  style='cursor: pointer;'>ɾ��</label></span></td></tr>"; 								 
			 }else if(form_attr_value_type.equals("�Ƿ����")){
				 this.attr_table=this.attr_table+"<tr id='"+attr_id+"_tr' title='"+form_attr_value_type+","+attr_lvl+","+attr_id+","+attr_table+"'><td width='80px'>"+attr_name+"</td>"
	                        +  "<td colspan=4><select class='easyui-combobox' name='state' style='width:250px;height:25px'>"
	                        +   "<option value='1' selected>��</option>"
	                          +   "<option value='0' >��</option>"
	                          +    "</select></td>"
	                         +  "<td width='80px'><label style='cursor: pointer;' id='"+attr_id+"&"+form_attr_value_type+"'  onClick=$.consitAttr(this)>���� </label><span id='"+attr_id+"_dt' onClick=$.deletrAttr(this.id)><lable  style='cursor: pointer;'>ɾ��</label></span></td></tr>"; 				 				 
			 }else if(form_attr_value_type.equals("����")){
				 this.attr_table=this.attr_table+"<tr id='"+attr_id+"_tr' title='"+form_attr_value_type+","+attr_lvl+","+attr_id+","+attr_table+"'><td width='80px'>"+attr_name+"</td>"
	                          + "<td colspan=4><input style='width:250px;height:25px' type='text'/></td>"
	                           +  "<td width='80px'><span id='"+attr_id+"_dt' onClick=$.deletrAttr(this)><lable style='cursor: pointer;'>ɾ��</label></span></td></tr>";  				 
			 }			 
		 }		
		//return this.attr_table;		
	}
	
	
	
	

public void delTag() throws IOException {
	//if (null==tagDao)
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
	//if (null==tagDao)
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
	//if (null==tagDao)
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
	//if (null==tagDao)
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

}
