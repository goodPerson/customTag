package module;
/**
 * 构成条件 
 * @author ywz
 *@date 20130826
 *@table TB_GROUP_CONDITION
 */
public class GroupCondition {
	private String groupId;          //群ID
	private String groupName;   //群名称
	private String operateFlag;   //操作符标志
	private String attrId;              //属性Id
	private String attrName;       //属性名称
	private String attrType;        //属性类型
	private String attrTable;       //表名
	private String operateSign;  //操作符号
	private String operateValue; //操作值
	private String orderId;           //属性排序
	
	public String getGroupId() {
		return groupId;
	}
	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getOperateFlag() {
		return operateFlag;
	}
	public void setOperateFlag(String operateFlag) {
		this.operateFlag = operateFlag;
	}
	public String getAttrId() {
		return attrId;
	}
	public void setAttrId(String attrId) {
		this.attrId = attrId;
	}
	public String getAttrName() {
		return attrName;
	}
	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}
	public String getAttrType() {
		return attrType;
	}
	public void setAttrType(String attrType) {
		this.attrType = attrType;
	}
	public String getAttrTable() {
		return attrTable;
	}
	public void setAttrTable(String attrTable) {
		this.attrTable = attrTable;
	}
	public String getOperateSign() {
		return operateSign;
	}
	public void setOperateSign(String operateSign) {
		this.operateSign = operateSign;
	}
	public String getOperateValue() {
		return operateValue;
	}
	public void setOperateValue(String operateValue) {
		this.operateValue = operateValue;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
}
