package module;

 
import java.util.List;

import module.TbDimRegion;

import module.TbAdmUserUnit;

public class UserInfo implements java.io.Serializable{
	
	private static final long serialVersionUID = -2365924456109070617L;
	
	//用户信息 
	private TbAdmUserUnit user;
	/*
	//角色信息
	private TbAdmRole role;
	//用户组信息
	private TbAdmUserGroup group;
	//用户公司
	private TbAdmUserGroup company;
	//用户职位
	private TbDimJob job;
	*/
	//用户工作地域
	private TbDimRegion region;
	//特殊权限
	private List special_role;
	//下属用户
	private List under;
	//上级用户
	private TbAdmUserUnit boss;
	
/*
	//用户信息 
	private TbAdmUserUnit user;
	//用户工作地域
	private TbDimRegion region;
  */
	public TbAdmUserUnit getUser() {
		return user;
	}
	public void setUser(TbAdmUserUnit user) {
		this.user = user;
	}
	public TbDimRegion getRegion() {
		return region;
	}
	public void setRegion(TbDimRegion region) {
		this.region = region;
	}
	
	 
}