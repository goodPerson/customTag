package module;
/**
 * 导出用户详情
 * @author ywz
 *
 */
public class ExportUserInfo {
	 private String phone_no;//   手机号码
	 private String  brand_id;// 品牌
	 private String  city_id;// 地市标识
	 private String  county_id;// 区县标识 
	 private String  product_cd;// 主题产品 
	 private String  checkin_chnl_type;// 入网渠道 
	 private String  last_mon_consm;// 上月消费
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}
	public String getCity_id() {
		return city_id;
	}
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	public String getCounty_id() {
		return county_id;
	}
	public void setCounty_id(String county_id) {
		this.county_id = county_id;
	}
	public String getProduct_cd() {
		return product_cd;
	}
	public void setProduct_cd(String product_cd) {
		this.product_cd = product_cd;
	}
	public String getCheckin_chnl_type() {
		return checkin_chnl_type;
	}
	public void setCheckin_chnl_type(String checkin_chnl_type) {
		this.checkin_chnl_type = checkin_chnl_type;
	}
	public String getLast_mon_consm() {
		return last_mon_consm;
	}
	public void setLast_mon_consm(String last_mon_consm) {
		this.last_mon_consm = last_mon_consm;
	} 

}
