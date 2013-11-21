package module;
//权限表
public class Right {
	private String  moduleUrl;  //应用URL
	private String userId;   //用户Id
	private String belngApp;  //应用名称
	private String moduleId;  //模块Id
	private String moduleName; //模块名称
	public String getModuleUrl() {
		return moduleUrl;
	}
	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBelngApp() {
		return belngApp;
	}
	public void setBelngApp(String belngApp) {
		this.belngApp = belngApp;
	}
	public String getModuleId() {
		return moduleId;
	}
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	
}
