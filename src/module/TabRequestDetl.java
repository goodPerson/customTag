package module;
/**
 * 标签申请详细信息表
 * @author ywz
 *
 */
public class TabRequestDetl {
	 private String req_id;//	       varchar(32)	not null          --申请表标识                       
	 private String req_name;//	     varchar(64)                    --申请表名称
	 private String req_resons;//      varchar(32)                    --申请理由
	 private String req_scope;//      varchar(32)                    --申请范围
	 private String req_time_limit;//       varchar(32)               --活动期限
	 private String cus_need_counts;//   varchar(24)                              --客户需求量
	 private String req_target;//	    varchar(24)                    --目标市场
	 private String cus_brand;//       varchar(24)                      --客户品牌
	 private String req_getdata_type;//      varchar(24)             --提取数据的方式  
	 private String screen_condition;//       varchar(500)         --筛选条件
	 private String remark;//    varchar(500)                        --备注
	 private String req_reson;// varchar(50)                      --申请人
	 private String req_time;//   varchar(50)                     --申请时间  
	 private String verify;//                                            --审批人
	public String getReq_id() {
		return req_id;
	}
	public void setReq_id(String req_id) {
		this.req_id = req_id;
	}
	public String getReq_name() {
		return req_name;
	}
	public void setReq_name(String req_name) {
		this.req_name = req_name;
	}
	public String getReq_resons() {
		return req_resons;
	}
	public void setReq_resons(String req_resons) {
		this.req_resons = req_resons;
	}
	public String getReq_scope() {
		return req_scope;
	}
	public void setReq_scope(String req_scope) {
		this.req_scope = req_scope;
	}
	public String getReq_time_limit() {
		return req_time_limit;
	}
	public void setReq_time_limit(String req_time_limit) {
		this.req_time_limit = req_time_limit;
	}
	public String getCus_need_counts() {
		return cus_need_counts;
	}
	public void setCus_need_counts(String cus_need_counts) {
		this.cus_need_counts = cus_need_counts;
	}
	public String getReq_target() {
		return req_target;
	}
	public void setReq_target(String req_target) {
		this.req_target = req_target;
	}
	public String getCus_brand() {
		return cus_brand;
	}
	public void setCus_brand(String cus_brand) {
		this.cus_brand = cus_brand;
	}
	public String getReq_getdata_type() {
		return req_getdata_type;
	}
	public void setReq_getdata_type(String req_getdata_type) {
		this.req_getdata_type = req_getdata_type;
	}
	public String getScreen_condition() {
		return screen_condition;
	}
	public void setScreen_condition(String screen_condition) {
		this.screen_condition = screen_condition;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getReq_reson() {
		return req_reson;
	}
	public void setReq_reson(String req_reson) {
		this.req_reson = req_reson;
	}
	public String getReq_time() {
		return req_time;
	}
	public void setReq_time(String req_time) {
		this.req_time = req_time;
	}
	public String getVerify() {
		return verify;
	}
	public void setVerify(String verify) {
		this.verify = verify;
	} 	 
}
