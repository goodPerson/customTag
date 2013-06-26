package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.AttrTable;
import module.Region;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class AttrTableDaoImpl extends JdbcDaoSupport {
	
	 /**
	   * 获取属性码表值
	   * @return
	   */
	
		public List<AttrTable> getAttrTableValue(String table_name){
			String sql="";
			if(table_name.equals("DIS.TDET_CHNL_BASE_INFO")){
				 sql="select   CHNL_ID as id,CHNL_NAME as value  from DIS.TDET_CHNL_BASE_INFO  order by VALUE ";
			}else if(table_name.equals("DIS.TD_SOLUTION_ONE_M")){
				 sql="select   PRIVID as id,PRIVNAME as value  from DIS.TD_SOLUTION_ONE_M  order by VALUE ";
			}else{
				 sql="select   t.id as id,t.value as value  from "+table_name+" t(id,value,order)  order by order DESC";
			}
			
			List<Map <String,Object>> listAttrTable=getJdbcTemplate().queryForList(sql);
			int listAttrSize=listAttrTable.size();
			ArrayList<AttrTable> listAttr=new ArrayList<AttrTable>();				
			for (int i=0; i<listAttrSize;i++){			
			 Map<String ,Object> rows=listAttrTable.get(i);
			 AttrTable attr=new AttrTable();
			 attr.setAttr_table_id((String)rows.get("id"));
			 attr.setAttr_table_text((String)rows.get("value"));
			  listAttr.add(attr);			
			}		
			listAttr.trimToSize();
			return listAttr;
		}

}
