package module;
/**
 * 	操作日志
 * @author ywz
 *  20130607
 */
public class OperateLog {
	private String userId;//  用户Id标识
	private String userName;//  用户名称
	private String regionId;//  地市id
	private String regionName;// 地市名称
	private String columnName;// 栏目名称
	private String operateType;//操作类型
	private String operateName;// 操作名称
	private String operatePara;//操作参数
	private String createTime;//   操作时间
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRegionId() {
		return regionId;
	}
	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getOperateName() {
		return operateName;
	}
	public void setOperateName(String operateName) {
		this.operateName = operateName;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getOperateType() {
		return operateType;
	}
	public void setOperateType(String operateType) {
		this.operateType = operateType;
	}
	public String getOperatePara() {
		return operatePara;
	}
	public void setOperatePara(String operatePara) {
		this.operatePara = operatePara;
	}
	
}
