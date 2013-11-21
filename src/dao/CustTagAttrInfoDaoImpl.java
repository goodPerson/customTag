package dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.CustTagAttrInfo;
import module.CustomGroup;
import module.ExportUserInfo;
import module.GroupTagAttrInfo;
import module.MainTag;
import module.Region;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class CustTagAttrInfoDaoImpl extends JdbcDaoSupport {

	//CustTagAttrInfoDaoImpl custDao=new CustTagAttrInfoDaoImpl();
	 Calendar c = Calendar.getInstance();  
	 String yyyyMM=new SimpleDateFormat("yyyyMM").format(c.getTime());  
	

	/**
	 * 添加客户标签
	 * @return
	 */
	public boolean  addTag(CustomGroup tag){
		boolean boolFlag=false;
		String querySql="select count(TAG_NAME) from mk_vgop.tb_customgroup_info where  TAG_NAME='"+tag.getTag_name()+"'";
		int counts=this.getJdbcTemplate().queryForInt(querySql);
		if (0==counts){
			try {
				String sql="insert into mk_vgop.tb_customgroup_info (TAG_ID,TAG_NAME,TAG_TYPE,TAG_SERV_TYPE,TAG_CLASS,CREATE_TIME,END_TIME,PROFILE,COUNT_SUBS,TAG_STATEMENT,TAG_CREATOR,TAG_CREATOR_ID,TAG_REGION,IS_SHARE,TAG_STATUS,TAG_TEC_STAMT,CUSTLIST_PATH)"
						            +"  values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			    Object[] params= new Object[]{tag.getTag_id(),tag.getTag_name(),tag.getTag_type(),tag.getTag_serv_type(),tag.getTag_class(),tag.getCreate_time(),tag.getEnd_time(),tag.getProfile(),tag.getCount_subs(),tag.getTag_statement(),tag.getTag_creator(),tag.getTag_creator_id(),tag.getTag_region(),tag.getIs_share(),tag.getTag_status(),tag.getTag_tec_stamt(),tag.getCustlist_path()};
				this.getJdbcTemplate().update(sql,params);
				boolFlag=true;
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}			
		}
        return boolFlag;
		}
	
	/**
	 * 添加高级客户标签
	 * @return
	 */
	public  boolean addAdvanceTag(CustomGroup tag){
		  boolean boolFlag=false;

		 String querySql="select count(TAG_NAME) as counts from mk_vgop.tb_customgroup_info where TAG_NAME='"+ tag.getTag_name() +"' ";
		 int counts=this.getJdbcTemplate().queryForInt(querySql);
		 if (counts==0){
				  try {
					String sql="insert into mk_vgop.tb_customgroup_info (TAG_ID,TAG_NAME,TAG_TYPE,TAG_SERV_TYPE,TAG_CLASS,CREATE_TIME,END_TIME,PROFILE,COUNT_SUBS,TAG_STATEMENT,TAG_CREATOR,TAG_CREATOR_ID,TAG_REGION,IS_SHARE,TAG_STATUS,TAG_TEC_STAMT,CUSTLIST_PATH,TYPE_FLAG)"
				            +"  values('"+tag.getTag_id()+"','"+tag.getTag_name()+"','"+tag.getTag_type()+"','"+tag.getTag_serv_type()+"','"+tag.getTag_class()+"','"+tag.getCreate_time()+"','"+tag.getEnd_time()+"','"+tag.getProfile()+"',"+tag.getCount_subs()+",'"+tag.getTag_statement()+"','"+tag.getTag_creator()+"','"+tag.getTag_creator_id()+"','"+tag.getTag_region()+"','"+tag.getIs_share()+"','"+tag.getTag_status()+"','"+tag.getTag_tec_stamt()+"','"+tag.getCustlist_path()+"',"+tag.getTypeFlag()+")";
				    //Object[] params= new Object[]{tag.getTag_id(),tag.getTag_name(),tag.getTag_type(),tag.getTag_serv_type(),tag.getTag_class(),tag.getCreate_time(),tag.getEnd_time(),tag.getProfile(),tag.getCount_subs(),tag.getTag_statement(),tag.getTag_creator(),tag.getTag_creator_id(),tag.getTag_region(),tag.getIs_share(),tag.getTag_status(),tag.getStamtAdvance(),tag.getCustlist_path(),tag.getTypeFlag()};
					//this.getJdbcTemplate().update(sql,params);
					this.getJdbcTemplate().update(sql);
					boolFlag=true;
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		 }

             return boolFlag;
		}
	public boolean  upAdvanceTag(CustomGroup tag){
		boolean boolFlag=false;
		 String querySql="select count(TAG_ID) as counts from mk_vgop.tb_customgroup_info where  TAG_ID='"+ tag.getTag_id() +"' ";
		 int counts=this.getJdbcTemplate().queryForInt(querySql);
		 if (counts>0){
				try {
					String sql="update mk_vgop.tb_customgroup_info set TAG_NAME='"+ tag.getTag_name() +"',TAG_TYPE='"+tag.getTag_type() +"',TAG_SERV_TYPE='"+ tag.getTag_serv_type() +"',TAG_CLASS='"+ tag.getTag_class() +"',"
							          +" PROFILE='"+ tag.getProfile() +"',COUNT_SUBS="+ tag.getCount_subs() +","
							          +"TAG_STATEMENT='"+ tag.getTag_statement() +"',TAG_CREATOR='"+ tag.getTag_creator() +"',TAG_CREATOR_ID='"+ tag.getTag_creator_id() +"',TAG_REGION='"+ tag.getTag_region() +"',"
							          +"IS_SHARE='"+ tag.getIs_share() +"',TAG_STATUS='"+ tag.getTag_status() +"',TAG_TEC_STAMT='"+ tag.getTag_tec_stamt() +"',CUSTLIST_PATH='"+ tag.getCustlist_path() +"',TYPE_FLAG="+ tag.getTypeFlag() +" where TAG_ID='"+ tag.getTag_id() +"'";
					this.getJdbcTemplate().update(sql);
					boolFlag=true;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		return boolFlag;
	}
	public boolean addCustTag(){
		
		return true;
	}
	/**
	 * 修改客户标签
	 * @param id
	 * @param tagName
	 * @return
	 */
	public boolean updateGroupTag(String tag_id, String tag_attrs, String stamt,String persons,String sql){
		String updateSql="update MK_VGOP.TB_CUSTOMGROUP_INFO set tag_statement='"+stamt+"' , tag_status='1',count_subs="+persons.replace("人", "")+", TAG_TEC_STAMT='"+sql+"'  where tag_id='"+tag_id+"'";				
		//System.out.print(updateSql);
		this.getJdbcTemplate().update(updateSql)	;	
		
        String deleteSql="delete from MK_VGOP.TB_GROUP_CREATE_TAG_INFO_NEW  where  tag_id='"+tag_id+"'";
        this.getJdbcTemplate().update(deleteSql)	;		
		JSONArray array = JSONArray.fromObject(tag_attrs); 
		for(int i = 0; i < array.size(); i++){ 
		JSONObject jsonObject = array.getJSONObject(i);
		String attr1 = jsonObject.get("tag_id").toString();
		String attr2=jsonObject.get("tag_name").toString();
		String attr3 = jsonObject.get("group_id").toString();
		String attr4=jsonObject.get("group_name").toString();		
		String attr5=jsonObject.get("attr_tr_id").toString();
		if ("--".equals(attr5)){
			attr5="-";
		}
		String attr6=jsonObject.get("attr_id").toString();
		String attr7=jsonObject.get("attr_name").toString();
		String attr8=jsonObject.get("attr_from").toString();
		String attr9=jsonObject.get("attr_table").toString();
		String attr10=jsonObject.get("attr_lvl").toString();		
		String attr11=jsonObject.get("attr_type").toString();
		String attr12=jsonObject.get("attr_value_type1").toString();
		String attr13=jsonObject.get("attr_value1").toString();
		if (attr13.indexOf("'")!=-1){
			attr13=attr13.replace("'", "");
		}
	
		//String insertSql = "insert into MK_VGOP.TB_GROUP_CREATE_TAG_INFO_NEW  (TAG_ID,TAG_NAME,GROUP_ID,GROUP_NAME,ATTR_TR_ID,ATTR_ID,ATTR_NAME,ATTR_FORM,ATTR_TABLE,ATTR_LVL,FORM_ATTR_VALUE_TYPE,FORM_ATTR_VALUE_BETN1,FORM_ATTR_VALUE1)"
					//+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//Object[] objectnew=new Object[]{attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8,attr9,attr10,attr11,attr12,attr13};    
       //this.getJdbcTemplate().update(insertSql, objectnew)	;	
		String insertSql = "insert into MK_VGOP.TB_GROUP_CREATE_TAG_INFO_NEW  (TAG_ID,TAG_NAME,GROUP_ID,GROUP_NAME,ATTR_TR_ID,ATTR_ID,ATTR_NAME,ATTR_FORM,ATTR_TABLE,ATTR_LVL,FORM_ATTR_VALUE_TYPE,FORM_ATTR_VALUE_BETN1,FORM_ATTR_VALUE1)"
				+ " values ('"+attr1+"','"+attr2+"','"+attr3+"','"+attr4+"','"+attr5+"','"+attr6+"','"+attr7+"','"+attr8+"','"+attr9+"','"+attr10+"','"+attr11+"','"+attr12+"','"+attr13+"')";
		this.getJdbcTemplate().update(insertSql)	;	
		}        
		return true;
	}
	
	/**
	 * 修改高级客户标签
	 * @param id
	 * @param tagName
	 * @return
	 */
	public boolean updateAdvanceTag(String groupId, String groupName, String params){
		boolean flag=false;
		String sql = "select count(*) as counts from MK_VGOP.TB_GROUP_CONDITION where GROUP_ID='"
				+ groupId + "'";
		int counts=this.getJdbcTemplate().queryForInt(sql);
		if (counts==0){
			addSql( params, groupId,  groupName);
			flag=true;
		}else{
			try{
				String sqldel="delete from MK_VGOP.TB_GROUP_CONDITION where GROUP_ID='"+groupId+"' ";
				this.getJdbcTemplate().update(sqldel);
				addSql( params, groupId,  groupName);
				flag=true;
				}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

		
		return flag;
		
	}
	private void addSql(String params,String groupId, String groupName){
		String[] array=params.split("\\$");
		int arrylength=array.length;
		if (arrylength>1){
			for (int i=0;i<arrylength;i++){
				  String[] arraySun= array[i].split("@");		
				  String arraySun1="";
				       if (arraySun[1].indexOf("'||Chr(39)||'")!=-1){
				    	   arraySun1="["+arraySun[1].replace("'||Chr(39)||'","\"")+"]";
				       }else{
				    	   arraySun1=arraySun[1];
				       }
				         //arraySun3="["+arraySun[3].replaceAll("'||Chr(39)||'","\"")+"]";
					     String sqlin="insert into MK_VGOP.TB_GROUP_CONDITION  (GROUP_ID,GROUP_NAME,OPERATE_FLAG,ATTR_ID,ATTR_NAME,ATTR_TYPE,ATTR_TABLE,OPERATE_SIGN,OPERATE_VALUE,ORDER_ID) "
					    		           +" values ('"+groupId+"','"+groupName+"','"+arraySun[0]+"','"+arraySun1+"','"+arraySun[2]+"','"+arraySun[3]+"','"+arraySun[4]+"','"+arraySun[5]+"','"+arraySun[6]+"','"+i+"')";
					     this.getJdbcTemplate().update(sqlin);
					     			 
			}				
		}
		
	}
	/**
	 * 得到客户筛选属性
	 * @param id
	 * @return
	 */
	public List<GroupTagAttrInfo> getGroupTags(String tag_id){
		String selectSql="select TAG_ID,TAG_NAME, GROUP_ID,GROUP_NAME,ATTR_TR_ID,ATTR_ID,ATTR_NAME,ATTR_FORM,ATTR_TABLE,ATTR_LVL,FORM_ATTR_VALUE_TYPE,FORM_ATTR_VALUE_BETN1,FORM_ATTR_VALUE1 from  MK_VGOP.TB_GROUP_CREATE_TAG_INFO_NEW  where TAG_ID='"+tag_id+"' order by GROUP_NAME";				
		List<Map <String,Object>> listGroupAttrs=getJdbcTemplate().queryForList(selectSql);
		List<GroupTagAttrInfo> groupTagList= new ArrayList<GroupTagAttrInfo>();
		for(Map<String,Object> row:listGroupAttrs){
			GroupTagAttrInfo attr= new GroupTagAttrInfo();
			attr.setTag_id((String)row.get("TAG_ID"));
			attr.setTag_name((String)row.get("TAG_NAME"));
			attr.setGroup_id((String)row.get("GROUP_ID"));
			attr.setGroup_Name((String)row.get("GROUP_NAME"));
			attr.setAttr_tr_id((String)row.get("ATTR_TR_ID"));
			attr.setAttr_id((String)row.get("ATTR_ID"));
			attr.setAttr_name((String)row.get("ATTR_NAME"));
			attr.setAttr_from((String)row.get("ATTR_FORM"));
			attr.setAttr_table((String)row.get("ATTR_TABLE"));
			attr.setAttr_lvl((String)row.get("ATTR_LVL"));			
			attr.setAttr_type((String)row.get("FORM_ATTR_VALUE_TYPE"));
			attr.setAttr_value_type1((String)row.get("FORM_ATTR_VALUE_BETN1"));
			attr.setAttr_value1((String)row.get("FORM_ATTR_VALUE1"));

			groupTagList.add(attr);			
	}
          return groupTagList;
	}
	
	/**
	 * 获得用户属性
	 * @param sql
	 * @return
	 */
	public int getTagAttr(String sql){		
		return (int)getJdbcTemplate().queryForInt(sql) ;
	}
	/**
	 * 查询数据月份
	 */
	public int getMonth(){
		String sql="select DATE_VALUE from  MK_VGOP.TB_CUV_CUST_VIEW_SHOW_DATE where DATE_TYPE='月'";
		return (int)getJdbcTemplate().queryForInt(sql) ;
	}
	/**
	 * 查询客户统一视图数据日期
	 */
	public int getData(){
		String sql="select DATE_VALUE from  MK_VGOP.TB_CUV_CUST_VIEW_SHOW_DATE where DATE_TYPE='日'";
		return (int)getJdbcTemplate().queryForInt(sql) ;
	}
	
	
	/**
	 * 分割字符串
	 * @param str
	 * @param counts
	 */
	public void splitStr(String id, String tagName ,String str, int counts ,boolean flag, int sum){
		String[] tempArr1=str.split("\\|");	
			for (int i=0;i<tempArr1.length;i++){
				 counts=0; 
				String [] tempArr2=tempArr1[i].split(",");				
					String sql="insert into MK_VGOP.TB_CUST_CREATE_TAG_INFO (tag_id,tag_name,attr_form,form_attr_value_type,form_attr_value_betn1,form_attr_value1,form_attr_value_betn2,form_attr_value2)"
							+" values (?,?,?,?,?,?,?,?)";
					if (tempArr2.length==2){
						try{
							Object[] objectnew=new Object[]{id,tagName,"",tempArr2[0],tempArr2[1],"0.0","","0.0"};
							this.getJdbcTemplate().update(sql, objectnew)	;	
							counts++;
						}catch(Exception e){
							flag=false;
							e.printStackTrace();
						}
					}else if (tempArr2.length==3){
						try{
							Object[] objectnew=new Object[]{id,tagName,tempArr2[0],tempArr2[1],tempArr2[2],"0.0","","0.0"};
							this.getJdbcTemplate().update(sql, objectnew)	;	
							counts++;
						}catch(Exception e){
							flag=false;
							e.printStackTrace();
						}
					}else{
						try{
							Object[] objectnew=new Object[]{id,tagName,tempArr2[0],tempArr2[1],tempArr2[2],Float.parseFloat(tempArr2[3]),tempArr2[4],Float.parseFloat(tempArr2[5])};
							this.getJdbcTemplate().update(sql, objectnew)	;	
							counts++;
						}catch(Exception e){
							flag=false;
							e.printStackTrace();
						}
					}	
			sum=sum+counts;
		}
	}
	
	/**
	 * 通过id删除记录
	 * @param id
	 * @return
	 */
	public boolean delByid(String id){
		try{
			  String sql="delete MK_VGOP.TB_CUST_CREATE_TAG_INFO where  TAG_ID='"+id+"' ";
			  this.getJdbcTemplate().update(sql);
			  return true;
		}catch(Exception e){
			e.printStackTrace();
		}
        return false;
	}

	/**
	 * 获取标签属性列名和值
	 * @param id
	 * @return
	 */
	public List<CustTagAttrInfo> getCustTagAttrInfoById(String id){
		    List list=null;
		    String sql="select b.ATTR_NAME,a.TAG_ID,a.TAG_NAME,a.attr_form,a.FORM_ATTR_VALUE_TYPE,a.FORM_ATTR_VALUE_BETN1,a.FORM_ATTR_VALUE1,a.FORM_ATTR_VALUE_BETN2,a.FORM_ATTR_VALUE2"
	                        +" from  MK_VGOP.TB_CUST_CREATE_TAG_INFO as a , MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC b"
	                        +" where a.FORM_ATTR_VALUE_TYPE=b.Attr_Desc and a.TAG_ID='"+id+"' order by a.attr_form asc,b.ATTR_NAME asc";
		    List<Map <String,Object>> listAttr=getJdbcTemplate().queryForList(sql);
		    ArrayList<CustTagAttrInfo> custTagAttrList=new ArrayList<CustTagAttrInfo>();
		    for (Map<String,Object> rows:listAttr){
		    	CustTagAttrInfo custTagAttrInfo=new CustTagAttrInfo();
		    	custTagAttrInfo.setAttr_name((String)rows.get("ATTR_NAME"));
		    	custTagAttrInfo.setTag_id((String)rows.get("TAG_ID"));
		    	custTagAttrInfo.setTag_name((String)rows.get("TAG_NAME"));
		    	custTagAttrInfo.setTag_form_attr((String)rows.get("attr_form"));
		    	custTagAttrInfo.setForm_attr_value_type((String)rows.get("FORM_ATTR_VALUE_TYPE"));
		    	custTagAttrInfo.setForm_attr_value_betn1((String)rows.get("FORM_ATTR_VALUE_BETN1"));
		    	custTagAttrInfo.setForm_attr_value1((BigDecimal )rows.get("FORM_ATTR_VALUE1"));
		    	custTagAttrInfo.setForm_attr_value_betn2((String)rows.get("FORM_ATTR_VALUE_BETN2"));
		    	custTagAttrInfo.setForm_attr_value2((BigDecimal )rows.get("FORM_ATTR_VALUE2"));
		    	custTagAttrList.add(custTagAttrInfo);
		    }
		    custTagAttrList.trimToSize();
		    return custTagAttrList;
	}
	/**
	 * 组合获取详细信息sql语句
	 * @param id
	 * @return
	 */
	public String combinSql(String id){
		StringBuffer sqlStringwhere=new StringBuffer();
		sqlStringwhere.append("");
		List<CustTagAttrInfo>  list=getCustTagAttrInfoById(id);
		for (CustTagAttrInfo custAttr:list){
			 if (custAttr.getTag_form_attr().equals("")){
				 if (sqlStringwhere.equals("") || sqlStringwhere.length()<=0){
					 sqlStringwhere.append(custAttr.getAttr_name()+"='"+ custAttr.getForm_attr_value_betn1()+"' ");
				 }else{
					 sqlStringwhere.append(" and "+custAttr.getAttr_name()+"='"+ custAttr.getForm_attr_value_betn1()+"' ");
				 }
				 
			 }else if(custAttr.getTag_form_attr().equals("连续型")){
				 sqlStringwhere.append(" and "+custAttr.getAttr_name()+" "+ custAttr.getForm_attr_value_betn1()+" "+custAttr.getForm_attr_value1()+" and "+custAttr.getAttr_name()+" "+ custAttr.getForm_attr_value_betn2()+" "+custAttr.getForm_attr_value2());
			 }else{
				 sqlStringwhere.append(" and "+custAttr.getAttr_name()+"='"+ custAttr.getForm_attr_value_betn1()+"' ");
			 }
		}
		String sqlStr="select  PHONE_NO,BRAND_ID,CITY_ID,COUNTY_ID,PRODUCT_CD,CHECKIN_CHNL_TYPE,LAST_MON_CONSM  from MK_VGOP.CUST_UNIT_VIEW_"+yyyyMM+" where "+sqlStringwhere;		
		return sqlStr;
	}
	/**
	 * 组合获取详细信息数量sql语句
	 * @param id
	 * @return
	 */
	public String combinSqlCounts(String id){
		StringBuffer sqlString=new StringBuffer();
		StringBuffer sqlStringwhere=new StringBuffer();		
		sqlStringwhere.append("");
		List<CustTagAttrInfo>  list=getCustTagAttrInfoById(id);
		for (CustTagAttrInfo custAttr:list){			
			 if (custAttr.getTag_form_attr().equals("")){
				 if (sqlStringwhere.equals("") || sqlStringwhere.length()<=0){
					 sqlStringwhere.append(custAttr.getAttr_name()+"='"+ custAttr.getForm_attr_value_betn1()+"' ");
				 }else{
					 sqlStringwhere.append(" and "+custAttr.getAttr_name()+"='"+ custAttr.getForm_attr_value_betn1()+"' ");
				 }
				 
			 }else if(custAttr.getTag_form_attr().equals("连续型")){
				 sqlStringwhere.append(" and "+custAttr.getAttr_name()+" "+ custAttr.getForm_attr_value_betn1()+" "+custAttr.getForm_attr_value1()+" and "+custAttr.getAttr_name()+" "+ custAttr.getForm_attr_value_betn2()+" "+custAttr.getForm_attr_value2());
			 }else{
				 sqlStringwhere.append(" and "+custAttr.getAttr_name()+"='"+ custAttr.getForm_attr_value_betn1()+"' ");
			 }
		}		
		sqlString.append("select count(BRAND_ID) from MK_VGOP.CUST_UNIT_VIEW_"+yyyyMM+" where ");
		return sqlString.append(sqlStringwhere).toString();	
	}
	/**
	 * 获取标签用户数量
	 * @param id
	 * @return
	 */
	public int getUserTagConts(String attrsql,String data){
//		String date="201306";
		try{
			String sql="select count(1) from MK_VGOP.TB_CUST_UNIT_VIEW_"+data+"  a  where "+attrsql+" with ur";	
			return this.getJdbcTemplate().queryForInt(sql);
		}catch(Exception e){			
			e.printStackTrace();
			return -1;
			
		}
		//String sql="select count(1) from MK_VGOP.TB_CUST_UNIT_VIEW_"+data+"  a  where "+attrsql;	
		//return this.getJdbcTemplate().queryForInt(sql);
	}
	
	public List<ExportUserInfo> getTagList (String id ) {
		String sql=combinSql(id);
		List<Map<String,Object>>  listObject=this.getJdbcTemplate().queryForList(sql);		
		ArrayList<ExportUserInfo>  arrayList=new ArrayList<ExportUserInfo>();
		for(Map<String,Object> rows :listObject){
			ExportUserInfo eUserInfo=new ExportUserInfo();
			eUserInfo.setBrand_id((String)rows.get("PHONE_NO"));
			eUserInfo.setCheckin_chnl_type((String)rows.get("CHECKIN_CHNL_TYPE"));
			eUserInfo.setCity_id((String)rows.get("CITY_ID"));
			eUserInfo.setCounty_id((String)rows.get("COUNTY_ID"));
			eUserInfo.setLast_mon_consm((String)rows.get("LAST_MON_CONSM"));
			eUserInfo.setPhone_no((String)rows.get("PHONE_NO"));
			eUserInfo.setProduct_cd((String)rows.get("PRODUCT_CD"));
			arrayList.add(eUserInfo);
		}		
		return arrayList;		
	}
    

	
}
