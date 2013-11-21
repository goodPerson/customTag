package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import module.GroupCondition;
import dao.Idao.IGroupCondition;

public class GroupConditionImpl extends JdbcDaoSupport  implements IGroupCondition {

	public List<GroupCondition> getGroupConditionList(String groupId) {
		// TODO Auto-generated method stub
		String sql="select GROUP_ID,GROUP_NAME,OPERATE_FLAG,ATTR_ID,ATTR_NAME,ATTR_TYPE,ATTR_TABLE,OPERATE_SIGN,OPERATE_VALUE,ORDER_ID from MK_VGOP.TB_GROUP_CONDITION"
				            +" where GROUP_ID='"+ groupId +"' order by ORDER_ID ";
		List<Map <String, Object>>  tList=this.getJdbcTemplate().queryForList(sql);
		List<GroupCondition> listGroupCon=new ArrayList<GroupCondition>();
		for (Map<String, Object> row: tList){
			GroupCondition gc=new GroupCondition();
			gc.setGroupId((String)row.get("GROUP_ID"));
			gc.setGroupName((String)row.get("GROUP_NAME"));
			gc.setOperateFlag((String)row.get("OPERATE_FLAG"));
			gc.setAttrId((String)row.get("ATTR_ID"));
			gc.setAttrName((String)row.get("ATTR_NAME"));
			gc.setAttrType((String)row.get("ATTR_TYPE"));
			gc.setAttrTable((String)row.get("ATTR_TABLE"));
			gc.setOperateSign((String)row.get("OPERATE_SIGN"));
			gc.setOperateValue((String)row.get("OPERATE_VALUE"));
			gc.setOrderId((String)row.get("ORDER_ID"));
			listGroupCon.add(gc);			
		}
		return listGroupCon; 
	}

}
