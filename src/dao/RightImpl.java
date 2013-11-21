package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.support.JdbcDaoSupport;

import module.Right;
import dao.Idao.IRight;

public class RightImpl extends JdbcDaoSupport  implements IRight {

	public List<Right> listRight(Right right) {
		// TODO Auto-generated method stub		
		String sql = "select module.MODULE_ID,module.module_name,module.MODULE_URL,module.BELNG_APP " +
		" from BASS_NP.TRE_ADM_USER_ROLE_RLT_NEW  user_role join BASS_NP.TRE_ADM_ROLE_MENU_RLT_new  role_menu on " +
		" user_role.role_id = role_menu.role_id join BASS_NP.TB_ADM_MODULE_NEW  module on module.MODULE_ID = role_menu.module_id where user_role.user_id_accounts = '"+ right.getUserId() +"' and module.BELNG_APP ='customTag' " +
		" union select module.MODULE_ID,module.module_name,module.MODULE_URL,module.BELNG_APP  from BASS_NP.TRE_ADM_USER_MODULE_new user_module join BASS_NP.TB_ADM_MODULE_NEW  module on module.MODULE_ID = user_module.module_id" + 
		" where user_module.user_id_accounts = '"+ right.getUserId() +"' and module.BELNG_APP ='customTag' with ur";
        List<Map<String, Object>> list=this.getJdbcTemplate().queryForList(sql);
        List<Right>    listRight=new ArrayList<Right>();
        for(Map<String,Object> obj: list){
        	Right rights=new Right();
        	//rights.setUserId((String)obj.get("user_id_accounts"));
        	rights.setModuleUrl((String)obj.get("MODULE_URL"));
        	//rights.setModuleName((String)obj.get("module_name"));
        	//rights.setModuleId((String)obj.get("MODULE_ID"));
        	//rights.setBelngApp((String)obj.get("BELNG_APP"));
        	listRight.add(rights);
        }
		return listRight;
	}

}
