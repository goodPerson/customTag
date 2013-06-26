package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import common.Pagination;

import module.AttrUnify;


public class TagAttrDaoImpl extends JdbcDaoSupport {
	private Pagination pageInfo;
	
	public List<AttrUnify> listAttr(String attr_classify,String attr_classify_one,String attr_classify_two,int pageNo, int pageSize){
		
		String sql="select ATTR_DESC,ATTR_CLASSIFY,ATTR_CLASSIFY_ONE,ATTR_CLASSIFY_TWO,STATIS_REQUMTS,NUM_ORDER,rownumber() over(ORDER BY NUM_ORDER ) AS rn from "+
		"MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC as a where a.ATTR_CLASSIFY like '%"+attr_classify+"' and VALUE(a.ATTR_CLASSIFY_ONE,'') "+
		"like '%"+attr_classify_one+"' and VALUE(a.ATTR_CLASSIFY_TWO,'') like '%"+attr_classify_two+"' order by a.NUM_ORDER ";
		pageInfo=new Pagination(sql.toString(),pageNo,pageSize,getJdbcTemplate());
		//List<Map<String,Object>> list= getJdbcTemplate().queryForList(sql);
		List<Map<String,Object>> list= pageInfo.getResultList();
		List<AttrUnify> AttrList= new ArrayList<AttrUnify>();
		for(Map<String,Object> row:list){
			AttrUnify attr= new AttrUnify();
			attr.setAttr_desc((String)row.get("ATTR_DESC"));
			attr.setAttr_classify((String)row.get("ATTR_CLASSIFY"));
			if(row.get("ATTR_CLASSIFY_ONE")==null){
				attr.setAttr_classify_one("--");
			}else{
			attr.setAttr_classify_one((String)row.get("ATTR_CLASSIFY_ONE"));
			}
			if("".equals((String)row.get("ATTR_CLASSIFY_TWO"))||row.get("ATTR_CLASSIFY_TWO")==null){
				attr.setAttr_classify_two("--");
			}else{
	//			System.out.print((String)row.get("ATTR_CLASSIFY_TWO"));
			attr.setAttr_classify_two((String)row.get("ATTR_CLASSIFY_TWO"));
		}
			if("".equals((String)row.get("STATIS_REQUMTS"))||row.get("STATIS_REQUMTS")==null){
				attr.setStatis_requmts("--");
			}else{
			attr.setStatis_requmts((String)row.get("STATIS_REQUMTS"));
			}
			attr.setNum_order((Integer)row.get("NUM_ORDER"));
			AttrList.add(attr);
		}
		return AttrList;
	}
	
	public List<AttrUnify> listattr(){
		
		String sql="select distinct ATTR_CLASSIFY from MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC ";
		List<Map <String,Object>> listattr=getJdbcTemplate().queryForList(sql);
		int listattrSize=listattr.size();
		ArrayList<AttrUnify> listattrName=new ArrayList<AttrUnify>();				
	//	for (Map<String,Object> rows: listCity){
		for (int i=0; i<listattrSize;i++){			
		 Map<String ,Object> rows=listattr.get(i);
		 AttrUnify attr=new AttrUnify();
		  attr.setAttr_classify((String)rows.get("ATTR_CLASSIFY"));
		  listattrName.add(attr);			
		}		
		listattrName.trimToSize();
		return listattrName;
	}
	
	public List<AttrUnify> listattr1(String attr_classify){
		String sql="select distinct ATTR_CLASSIFY_ONE from MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC as a where a.ATTR_CLASSIFY='"+attr_classify+"'";
		List<Map <String,Object>> listattr1=getJdbcTemplate().queryForList(sql);
		int listattr1Size=listattr1.size();
		ArrayList<AttrUnify> listattr1Name=new ArrayList<AttrUnify>();
		for (int i=0; i<listattr1Size;i++){			
			 Map<String ,Object> rows=listattr1.get(i);
			 AttrUnify attr1=new AttrUnify();
			  attr1.setAttr_classify_one((String)rows.get("ATTR_CLASSIFY_ONE"));
			  listattr1Name.add(attr1);			
			}		
		     listattr1Name.trimToSize();
			return listattr1Name;
		
	}
	
	public List<AttrUnify> listattr2(String attr_classify1){
		String sql="select distinct ATTR_CLASSIFY_TWO from MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC as a where a.ATTR_CLASSIFY_ONE='"+attr_classify1+"'";
		List<Map <String,Object>> listattr2=getJdbcTemplate().queryForList(sql);
		int listattr2Size=listattr2.size();
		ArrayList<AttrUnify> listattr2Name=new ArrayList<AttrUnify>();
		for (int i=0; i<listattr2Size;i++){			
			 Map<String ,Object> rows=listattr2.get(i);
			 AttrUnify attr2=new AttrUnify();
			  attr2.setAttr_classify_two((String)rows.get("ATTR_CLASSIFY_TWO"));
			  listattr2Name.add(attr2);			
			}		
		     listattr2Name.trimToSize();
			return listattr2Name;
	}
	
	public void renameAttr(String name, String num){
		String sql="update MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC set ATTR_DESC= ? where NUM_ORDER =? ";
		this.getJdbcTemplate().update(sql, new Object[]{name,num});
	}
	
	public void delAttr(String num){
		String sql="delete from MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC where NUM_ORDER=? ";
		this.getJdbcTemplate().update(sql, new Object[]{num});
	}
	
	public void addAttr(AttrUnify attr){
		String sql="insert into MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params= new Object[]{attr.getIs_importtant_attr(),attr.getNum_order(),attr.getAttr_classify(),attr.getAttr_classify_one(),attr.getAttr_classify_two(),attr.getAttr_name(),
				attr.getAttr_type(),attr.getAttr_desc(),attr.getUnit(),attr.getUpdate_cycle(),attr.getStatis_requmts(),attr.getVgop_gat_tab(),attr.getDim_tab(),attr.getValue_scope(),
				attr.getValue_type(),attr.getIs_goalcust_choose_condt(),attr.getRemark(),attr.getIs_show(),attr.getDay_mon(),attr.getIs_write_staits_requmts(),attr.getIs_new()};
		this.getJdbcTemplate().update(sql,params);
	}

	public Pagination getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(Pagination pageInfo) {
		this.pageInfo = pageInfo;
	}
	
}
