package module;

import java.util.List;

import javax.jws.WebService;

import module.UserInfo;
import module.TbAdmUserUnit;
 
@WebService
public interface SystemManager {
	public UserInfo getUserInfo(String userId);
	public List<TbAdmUserUnit> getUser(String parentUserId);
	public List<String> getUserId(String userName);
}
