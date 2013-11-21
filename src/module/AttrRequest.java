package module;
/**
 * 属性申请bean
 * 对应的表为："MK_VGOP"."TB_ATTR_REQUEST"
 * @author ywz
 *
 */
public class AttrRequest {
		private String 	attrRequestIid;                   //申请Id		
		private String 	attrRequestPersonId;         //  申请人Id 
		private String 	attrRequestName;             //申请人姓
		private Integer   attrRegionId;                     //申请人区域Id
		private String    attrRegionName;               //申请人区域名称
		 private String 	attrName;                           //属性名称	
		 private String 	attrReason;                        //  申请理由	
		 private String 	attrApporver;                     //    审批人		
		 private String 	attrRemark;                       //   备注		
		 private Integer attrState;
		 
		public String getAttrRequestIid() {
			return attrRequestIid;
		}
		public void setAttrRequestIid(String attrRequestIid) {
			this.attrRequestIid = attrRequestIid;
		}
		public String getAttrRequestPersonId() {
			return attrRequestPersonId;
		}
		public void setAttrRequestPersonId(String attrRequestPersonId) {
			this.attrRequestPersonId = attrRequestPersonId;
		}
		public String getAttrRequestName() {
			return attrRequestName;
		}
		public void setAttrRequestName(String attrRequestName) {
			this.attrRequestName = attrRequestName;
		}
		public Integer getAttrRegionId() {
			return attrRegionId;
		}
		public void setAttrRegionId(Integer attrRegionId) {
			this.attrRegionId = attrRegionId;
		}
		public String getAttrRegionName() {
			return attrRegionName;
		}
		public void setAttrRegionName(String attrRegionName) {
			this.attrRegionName = attrRegionName;
		}
		public String getAttrName() {
			return attrName;
		}
		public void setAttrName(String attrName) {
			this.attrName = attrName;
		}
		public String getAttrReason() {
			return attrReason;
		}
		public void setAttrReason(String attrReason) {
			this.attrReason = attrReason;
		}
		public String getAttrApporver() {
			return attrApporver;
		}
		public void setAttrApporver(String attrApporver) {
			this.attrApporver = attrApporver;
		}
		public String getAttrRemark() {
			return attrRemark;
		}
		public void setAttrRemark(String attrRemark) {
			this.attrRemark = attrRemark;
		}
		public Integer getAttrState() {
			return attrState;
		}
		public void setAttrState(Integer attrState) {
			this.attrState = attrState;
		}
		
}
