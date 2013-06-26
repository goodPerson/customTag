package dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
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
	public boolean addCustTag(){
		
		return true;
	}
	/**
	 * 修改客户标签
	 * @param id
	 * @param tagName
	 * @return
	 */
	public boolean updateGroupTag(String group_id, String tag_attrs, String stamt,String persons,String sql){
		String updateSql="update MK_VGOP.TB_CUSTOMGROUP_INFO set tag_statement='"+stamt+"' , tag_status='1',count_subs="+persons.replace("人", "")+", TAG_TEC_STAMT='"+sql+"'  where tag_id='"+group_id+"'";				
		System.out.print(updateSql);
		this.getJdbcTemplate().update(updateSql)	;	
		
        String deleteSql="delete from MK_VGOP.TB_GROUP_CREATE_TAG_INFO where  group_id='"+group_id+"'";
        this.getJdbcTemplate().update(deleteSql)	;		
		JSONArray array = JSONArray.fromObject(tag_attrs); 
		for(int i = 0; i < array.size(); i++){ 
		JSONObject jsonObject = array.getJSONObject(i);
		String attr1 = jsonObject.get("tag_id").toString();
		String attr2=jsonObject.get("tag_name").toString();
		String attr3=jsonObject.get("attr_id").toString();
		String attr4=jsonObject.get("attr_name").toString();
		String attr5=jsonObject.get("attr_from").toString();
		String attr6=jsonObject.get("attr_table").toString();
		String attr7=jsonObject.get("attr_lvl").toString();		
		String attr8=jsonObject.get("attr_type").toString();
		String attr9=jsonObject.get("attr_value_type1").toString();
		String attr10=jsonObject.get("attr_value1").toString();
		String attr11=jsonObject.get("attr_value_type2").toString();
		String attr12=jsonObject.get("attr_value2").toString();			
		String insertSql="insert into MK_VGOP.TB_GROUP_CREATE_TAG_INFO (GROUP_ID,GROUP_NAME,ATTR_ID,ATTR_NAME,ATTR_FORM,ATTR_TABLE,ATTR_LVL,FORM_ATTR_VALUE_TYPE,FORM_ATTR_VALUE_BETN1,FORM_ATTR_VALUE1,FORM_ATTR_VALUE_BETN2,FORM_ATTR_VALUE2)"
			+" values (?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] objectnew=new Object[]{attr1,attr2,attr3,attr4,attr5,attr6,attr7,attr8,attr9,attr10,attr11,attr12};    
        this.getJdbcTemplate().update(insertSql, objectnew)	;	
		}        
		return true;
	}
	
	/**
	 * 得到客户筛选属性
	 * @param id
	 * @return
	 */
	public List<GroupTagAttrInfo> getGroupTags(String group_id){
		String selectSql="select GROUP_ID,GROUP_NAME,ATTR_ID,ATTR_NAME,ATTR_FORM,ATTR_TABLE,ATTR_LVL,FORM_ATTR_VALUE_TYPE,FORM_ATTR_VALUE_BETN1,FORM_ATTR_VALUE1,FORM_ATTR_VALUE_BETN2,FORM_ATTR_VALUE2 from  MK_VGOP.TB_GROUP_CREATE_TAG_INFO  where GROUP_ID='"+group_id+"'";				
		List<Map <String,Object>> listGroupAttrs=getJdbcTemplate().queryForList(selectSql);
		List<GroupTagAttrInfo> groupTagList= new ArrayList<GroupTagAttrInfo>();
		for(Map<String,Object> row:listGroupAttrs){
			GroupTagAttrInfo attr= new GroupTagAttrInfo();
			attr.setTag_id((String)row.get("GROUP_ID"));
			attr.setTag_name((String)row.get("GROUP_NAME"));
			attr.setAttr_id((String)row.get("ATTR_ID"));
			attr.setAttr_name((String)row.get("ATTR_NAME"));
			attr.setAttr_from((String)row.get("ATTR_FORM"));
			attr.setAttr_table((String)row.get("ATTR_TABLE"));
			attr.setAttr_lvl((String)row.get("ATTR_LVL"));			
			attr.setAttr_type((String)row.get("FORM_ATTR_VALUE_TYPE"));
			attr.setAttr_value_type1((String)row.get("FORM_ATTR_VALUE_BETN1"));
			attr.setAttr_value1((String)row.get("FORM_ATTR_VALUE1"));
			attr.setAttr_value_type2((String)row.get("FORM_ATTR_VALUE_BETN2"));
			attr.setAttr_value2((String)row.get("FORM_ATTR_VALUE2"));
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
	public int getUserTagConts(String attrsql){
		String date="201306";
		String sql="select count(1) from MK_VGOP.TB_CUST_UNIT_VIEW_"+date+"  a  where "+attrsql;	
		return this.getJdbcTemplate().queryForInt(sql);
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
