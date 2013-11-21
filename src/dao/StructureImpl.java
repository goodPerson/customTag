package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.Structure;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class StructureImpl extends JdbcDaoSupport {
	/**获得构建list*/
	public List<Structure> getListStructure(String regionId, String attrType,String attrName){
		String sql="	select a.ATTR_ID,a.ATTR_DIM_VALUE ,a.REGION_ID ,a.SUBS_CNT,b.ATTR_DESC,b.ATTR_DIM_DESC"
	                      +" from MK_VGOP.TB_CUST_TAG_FORM_ATTR_SUBS_CNT a ,MK_VGOP.TB_CUST_TAG_DIM_FORM_ATTR b" 
	                      +" where a.ATTR_ID=b.ATTR_ID and a.ATTR_DIM_VALUE=b.ATTR_DIM_VALUE and a.REGION_ID='"+ regionId +"' and Attr_Type='"+ attrType +"'  and  b.ATTR_DESC='"+ attrName +"' order by a.ATTR_DIM_VALUE ";
		List<Map<String, Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		
		List<Structure> listStru=new ArrayList<Structure>();
		for (Map<String,Object> obj: listTemp){
			Structure  stru=new Structure();
			stru.setAttrId((String)obj.get("ATTR_ID"));
			stru.setAttrDimValue((String)obj.get("ATTR_DIM_VALUE"));
			stru.setRegionId((String)obj.get("REGION_ID"));
			stru.setSubsCnt((Integer)obj.get("SUBS_CNT"));
			stru.setAttrDesc((String)obj.get("ATTR_DESC"));
			stru.setAttrDim_desc((String)obj.get("ATTR_DIM_DESC"));
//			stru.setAttrExtend1((String)obj.get("ATTR_EXTEND1"));
//			stru.setAttrExtend2((String)obj.get("ATTR_EXTEND2"));
			listStru.add(stru);
		}		
		return listStru;
	}

}
