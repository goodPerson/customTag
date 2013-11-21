package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import module.Cycle;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class CycleImpl extends JdbcDaoSupport{
	
	public List<Cycle> getListAll(){
		String sql="select DATE_TYPE,DATE_VALUE from  MK_VGOP.TB_CUV_CUST_VIEW_SHOW_DATE  order by Date_TYPE ";
		List<Map<String , Object>> tempList=this.getJdbcTemplate().queryForList(sql);
		List<Cycle> listCycle=new ArrayList<Cycle>();
		for (Map<String, Object> obs: tempList){
			Cycle cycle=new Cycle();
			cycle.setDateType((String)obs.get("DATE_TYPE"));
			cycle.setDateValue((String)obs.get("DATE_VALUE"));
			listCycle.add(cycle);
		}
		return listCycle;
	}

}
