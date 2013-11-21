package module;
/**
 * 
 * @author ywz
 *@date 20130729
 */
//MK_VGOP.TB_CUST_TAG_FORM_ATTR_SUBS_CNT    MK_VGOP.TB_CUST_TAG_DIM_FORM_ATTR
public class Structure {
	   private String attrId;//                                 --属性ID
	   private String attrDimValue;//                               --构成属性构成属性值
	   private String regionId;//                                  --地域id
	   private Integer subsCnt;//                                        --人数
	   private String attrDesc;//                                  --属性描述 
	   private String attrDim_desc;//                            --构成描述
//	   private String attrExtend1;//                                 --扩展1
//	   private String attrExtend2;//                                --扩展2
	   private String attrType;//                                      属性类型
	public String getAttrId() {
		return attrId;
	}
	public void setAttrId(String attrId) {
		this.attrId = attrId;
	}
	public String getAttrDimValue() {
		return attrDimValue;
	}
	public void setAttrDimValue(String attrDimValue) {
		this.attrDimValue = attrDimValue;
	}
	public String getRegionId() {
		return regionId;
	}
	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}
	public Integer getSubsCnt() {
		return subsCnt;
	}
	public void setSubsCnt(Integer subsCnt) {
		this.subsCnt = subsCnt;
	}
	public String getAttrDesc() {
		return attrDesc;
	}
	public void setAttrDesc(String attrDesc) {
		this.attrDesc = attrDesc;
	}
	public String getAttrDim_desc() {
		return attrDim_desc;
	}
	public void setAttrDim_desc(String attrDim_desc) {
		this.attrDim_desc = attrDim_desc;
	}
	/*
	public String getAttrExtend1() {
		return attrExtend1;
	}
	public void setAttrExtend1(String attrExtend1) {
		this.attrExtend1 = attrExtend1;
	}
	public String getAttrExtend2() {
		return attrExtend2;
	}
	public void setAttrExtend2(String attrExtend2) {
		this.attrExtend2 = attrExtend2;
	}
	*/
	public String getAttrType() {
		return attrType;
	}
	public void setAttrType(String attrType) {
		this.attrType = attrType;
	}	   
	   
}
