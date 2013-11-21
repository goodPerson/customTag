package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import module.BusClassTag;
import dao.Idao.IBusClassTag;

public class BusClassTagImpl extends JdbcDaoSupport implements IBusClassTag {

	public List<BusClassTag> listTags() {
		// TODO Auto-generated method stub
		String sql="select  YW_NAME ,YW_ORDER from MK_VGOP.TB_DIM_CUSTOMTAG_YW_2LVL order by YW_ORDER";
		List<Map<String, Object>> listTemp=this.getJdbcTemplate().queryForList(sql);
		List<BusClassTag> listBusTag=new ArrayList<BusClassTag>();
		for(Map<String,Object> obj: listTemp){
			BusClassTag bct=new BusClassTag();
			bct.setYwOrder((Integer)obj.get("YW_ORDER"));
			bct.setYwName((String)obj.get("YW_NAME"));
			listBusTag.add(bct);
		}
		return listBusTag;
	}

}
