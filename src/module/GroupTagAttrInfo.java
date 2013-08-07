package module;

import java.math.BigDecimal;


/**
 * 客户群标签属性信息
 * @author ywz
 *@date 20130528
 */
public class GroupTagAttrInfo {

	  private String tag_id;//	                          varchar(32)	not null           --标签标识                       
	  private String tag_name;//	                      varchar(64)                    --标签名称
	  private String group_id;
	  private String group_Name;
	  
	  
	  public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getGroup_Name() {
		return group_Name;
	}
	public void setGroup_Name(String group_Name) {
		this.group_Name = group_Name;
	}
	private String attr_tr_id;//           
	  public String getAttr_tr_id() {
		return attr_tr_id;
	}
	public void setAttr_tr_id(String attr_tr_id) {
		this.attr_tr_id = attr_tr_id;
	}
	private String attr_id;                                             //标签标识
	  private String attr_name;                                        //标签属性字段		  
	  private String attr_from;//                 varchar(64)                    --标签构成属性
	  private String attr_table;                                                     //  --属性表格
	  public String getAttr_table() {
		return attr_table;
	}
	public void setAttr_table(String attr_table) {
		this.attr_table = attr_table;
	}
	public String getAttr_lvl() {
		return attr_lvl;
	}
	public void setAttr_lvl(String attr_lvl) {
		this.attr_lvl = attr_lvl;
	}
	private String attr_lvl;                                                         //--属性上一级
	  private String attr_type;//                  varchar(4)                     --标签构成属性值类型（1码值、2连续型、3是否码值、4其他） 
	  private String attr_value_type1;//       varchar(10)                    --标签构成属性区间范围(>=,<=,=)
	  private String attr_value1;//               decimal(18,4)                  --标签构成属性值
	  	  
	  public String getTag_id() {
		return tag_id;
	}
	public void setTag_id(String tag_id) {
		this.tag_id = tag_id;
	}
	public String getTag_name() {
		return tag_name;
	}
	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}
	public String getAttr_id() {
		return attr_id;
	}
	public void setAttr_id(String attr_id) {
		this.attr_id = attr_id;
	}
	public String getAttr_name() {
		return attr_name;
	}
	public void setAttr_name(String attr_name) {
		this.attr_name = attr_name;
	}
	public String getAttr_from() {
		return attr_from;
	}
	public void setAttr_from(String attr_from) {
		this.attr_from = attr_from;
	}
	public String getAttr_type() {
		return attr_type;
	}
	public void setAttr_type(String attr_type) {
		this.attr_type = attr_type;
	}
	public String getAttr_value_type1() {
		return attr_value_type1;
	}
	public void setAttr_value_type1(String attr_value_type1) {
		this.attr_value_type1 = attr_value_type1;
	}
	public String getAttr_value1() {
		return attr_value1;
	}
	public void setAttr_value1(String attr_value1) {
		this.attr_value1 = attr_value1;
	}



	
}
