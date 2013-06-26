package module;
/**
 * 地狱维表
 * @author ywz
 *@date  20130523
 */
public class Region {
	private String  region_id; //地狱编号
	private String order_num; //排序编号
	private String region_parent_id;// 父Id
	private String lvl_id; //级别Id
	private String region_name; //区域名称
	private String region_desc;//区域描述
	private String begin_date; //开始日期
	private String end_date;//结束日期
	
	public String getRegion_id() {
		return region_id;
	}
	public void setRegion_id(String region_id) {
		this.region_id = region_id;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getRegion_parent_id() {
		return region_parent_id;
	}
	public void setRegion_parent_id(String region_parent_id) {
		this.region_parent_id = region_parent_id;
	}
	public String getLvl_id() {
		return lvl_id;
	}
	public void setLvl_id(String lvl_id) {
		this.lvl_id = lvl_id;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	public String getRegion_desc() {
		return region_desc;
	}
	public void setRegion_desc(String region_desc) {
		this.region_desc = region_desc;
	}
	public String getBegin_date() {
		return begin_date;
	}
	public void setBegin_date(String begin_date) {
		this.begin_date = begin_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}   
}
