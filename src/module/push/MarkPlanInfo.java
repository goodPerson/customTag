package module.push;

public class MarkPlanInfo {
	private String plan_id              ;//             VARCHAR(50)         --活动id                
	private String plan_name            ;//             VARCHAR(100)        --活动名称
	private String plan_region_id       ;//             VARCHAR(10)         --活动范围id
	private String plan_region_name     ;//             VARCHAR(10)         --活动范围名称
	private String start_time           ;//             VARCHAR(20)         --活动开始时间
	private String end_time             ;//             VARCHAR(20)         --活动结束时间
	private String push_time            ;//             VARCHAR(20)         --活动推送时间
	private String target_cust_id       ;//             VARCHAR(50)         --目标客户标识
	private String push_chanl_id        ;//             VARCHAR(20)         --推送渠道id
	private String product_type         ;//             VARCHAR(30)         --产品类型 product：产品、FAV:优惠、sp：sp业务
	private String product_id           ;//             VARCHAR(50)         --增值产品活动id
	private String sp_enterprise_id     ;//             VARCHAR(50)         --sp企业代码
	private String sp_serve_id          ;//             VARCHAR(50)         --sp业务代码                 
	private String fav_id               ;//             VARCHAR(50)         --优惠id
	private String creator_id           ;//             VARCHAR(20)         --创建人id 
	private String creator_name         ;//             VARCHAR(50)         --创建人
	private String creator_region_id    ;//             VARCHAR(10)         --创建人地域 
	private String paln_state           ;//             VARCHAR(10)         --活动状态 0：活动创建、1:目标客户生成、2:活动推送、3:活动评估
	private String plan_comment         ;//             VARCHAR(1024)       --推荐语
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
	public String getPlan_region_id() {
		return plan_region_id;
	}
	public void setPlan_region_id(String plan_region_id) {
		this.plan_region_id = plan_region_id;
	}
	public String getPlan_region_name() {
		return plan_region_name;
	}
	public void setPlan_region_name(String plan_region_name) {
		this.plan_region_name = plan_region_name;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getPush_time() {
		return push_time;
	}
	public void setPush_time(String push_time) {
		this.push_time = push_time;
	}
	public String getTarget_cust_id() {
		return target_cust_id;
	}
	public void setTarget_cust_id(String target_cust_id) {
		this.target_cust_id = target_cust_id;
	}
	public String getPush_chanl_id() {
		return push_chanl_id;
	}
	public void setPush_chanl_id(String push_chanl_id) {
		this.push_chanl_id = push_chanl_id;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getSp_enterprise_id() {
		return sp_enterprise_id;
	}
	public void setSp_enterprise_id(String sp_enterprise_id) {
		this.sp_enterprise_id = sp_enterprise_id;
	}
	public String getSp_serve_id() {
		return sp_serve_id;
	}
	public void setSp_serve_id(String sp_serve_id) {
		this.sp_serve_id = sp_serve_id;
	}
	public String getFav_id() {
		return fav_id;
	}
	public void setFav_id(String fav_id) {
		this.fav_id = fav_id;
	}
	public String getCreator_id() {
		return creator_id;
	}
	public void setCreator_id(String creator_id) {
		this.creator_id = creator_id;
	}
	public String getCreator_name() {
		return creator_name;
	}
	public void setCreator_name(String creator_name) {
		this.creator_name = creator_name;
	}
	public String getCreator_region_id() {
		return creator_region_id;
	}
	public void setCreator_region_id(String creator_region_id) {
		this.creator_region_id = creator_region_id;
	}
	public String getPaln_state() {
		return paln_state;
	}
	public void setPaln_state(String paln_state) {
		this.paln_state = paln_state;
	}
	public String getPlan_comment() {
		return plan_comment;
	}
	public void setPlan_comment(String plan_comment) {
		this.plan_comment = plan_comment;
	} 
}
