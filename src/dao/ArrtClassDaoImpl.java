package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
public class ArrtClassDaoImpl extends JdbcDaoSupport{
/**
 * 获取第三级属性
 * @param name
 * @return
 */
	public List getListByName(String secName){
		String sql="select distinct ATTR_CLASSIFY_TWO from MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC where ATTR_CLASSIFY_ONE='"+secName+"'";  //test
//		String sql="select attr_son3_sort from TB_DIM_CUST_VIEW_GENDER_D where attr_son1_sort='状态属性'";
		List<Map <String,Object>> listThreeClassName=getJdbcTemplate().queryForList(sql);
		List listThreeName=new ArrayList();
		for(Map<String,Object> rows: listThreeClassName){			
			String threeNameNew=(String)rows.get("ATTR_CLASSIFY_TWO");
			listThreeName.add(threeNameNew);
		}
		return  listThreeName;
	}
  /**
   * 获取第二级属性
   * @param secName
   * @return
   */
	public List getListSecName(String oneName){
		String sql="select  ATTR_CLASSIFY_ONE from MK_VGOP.TB_DIM_CUSTATTR_TYPE_ORDER_INFO where ATTR_CLASSIFY='"+oneName+"' order by num_order";
		List<Map <String,Object>> listSecClassName=getJdbcTemplate().queryForList(sql);
		List listSecName=new ArrayList();
		for(Map<String,Object> rows:listSecClassName){
			String secNameNew=(String) rows.get("ATTR_CLASSIFY_ONE");
			listSecName.add(secNameNew);
		}
		return listSecName;
	}
/**
 * 获取大类属性	
 * @param oneName
 * @return
 */
	public List getListbigName(String oneName){
		String sql="select  ATTR_CLASSIFY,min(NUM_ORDER) as maxorder from TB_DIM_CUST_VIEW_ATTR_DESC group by ATTR_CLASSIFY order by maxorder";
		List<Map <String,Object>> listSecClassName=getJdbcTemplate().queryForList(sql);
		List listGigName=new ArrayList();
		for(Map<String,Object> rows:listSecClassName){
			String bitgNameNew=(String) rows.get("ATTR_CLASSIFY");
			listGigName.add(bitgNameNew);
		}
		return listGigName;
	}
	
	/**
	 * 获取用户属性路径	
	 * @param attrName
	 * @return
	 */
	public String getAttrPaht(String attrName){
		String attrPath="";
		String sql="select ATTR_CLASSIFY,ATTR_CLASSIFY_ONE from MK_VGOP.TB_DIM_CUST_VIEW_ATTR_DESC where ATTR_DESC='"+attrName+"'";
		List<Map<String,Object>> listTmp=this.getJdbcTemplate().queryForList(sql);	
		int counts=listTmp.size();
		if(counts>0){
			attrPath=(String)listTmp.get(0).get("ATTR_CLASSIFY")+"/"+(String)listTmp.get(0).get("ATTR_CLASSIFY_ONE");		
		}
		 
		return attrPath;
	}
	
}
