package module;

import java.math.BigDecimal;

public class PlanAccess {
	
	private String date_stamp;
	private String plan_id;
	private String plan_name;
	private Integer commend_cnt;
	private Integer success_cnt;
	private BigDecimal success_rate;
	public String getDate_stamp() {
		return date_stamp;
	}
	public void setDate_stamp(String date_stamp) {
		this.date_stamp = date_stamp;
	}
	public String getPlan_id() {
		return plan_id;
	}
	public void setPlan_id(String plan_id) {
		this.plan_id = plan_id;
	}
	public String getPlan_name() {
		return plan_name;
	}
	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}
	public Integer getCommend_cnt() {
		return commend_cnt;
	}
	public void setCommend_cnt(Integer commend_cnt) {
		this.commend_cnt = commend_cnt;
	}
	public Integer getSuccess_cnt() {
		return success_cnt;
	}
	public void setSuccess_cnt(Integer success_cnt) {
		this.success_cnt = success_cnt;
	}
	public BigDecimal getSuccess_rate() {
		return success_rate;
	}
	public void setSuccess_rate(BigDecimal success_rate) {
		this.success_rate = success_rate;
	}
	
	

}
