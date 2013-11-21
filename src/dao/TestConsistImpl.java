package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import module.ConsistList;
import module.CustomGroup;

import org.springframework.jdbc.core.support.JdbcDaoSupport;



public class TestConsistImpl extends JdbcDaoSupport{
   
	  public List<ConsistList> getStrut(){
		  
		  String sql="select m.dim_desc,m.dim_id,a.user_cont from MK_VGOP.TB_TAGS_STRUCT_ANALYZE_D as a "+
		             "left join MK_VGOP.TB_DIM_STRUCT_ANALYZE as m on a.attr_id=m.attr_id and a.dim_id=m.dim_id "+
				     "where a.tag_id='IS_5Y_CHEERING_PAK_POTT_USER' and a.attr_id='TOWN_SUBS_ID' order by m.dim_id ";
		  List<Map <String,Object>> liststruts=getJdbcTemplate().queryForList(sql);
		  List<ConsistList> ConList= new ArrayList<ConsistList>();
			List strut=new ArrayList();
			for(Map<String,Object> rows:liststruts){
				ConsistList con=new ConsistList();
				con.setName((String) rows.get("dim_desc"));
				con.setCount((Integer) rows.get("user_cont"));
				ConList.add(con);
				
			}
			return ConList;
		  
	  }
	  
}
