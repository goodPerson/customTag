package module;

public class MainTag {
	
	
	private String tag_id;             //标签标识
	private String tag_name;           //标签名称
	private String tag_type;           //标签类型
	private String tag_serv_type;      //标签业务类型
	private String tag_class;          //标签二类型 
	private String create_time;        //标签创建时间
	private String end_time;           //标签结束时间
	private String profile;            //标签简介  
	private int  count_subs;           //标签统计人数
	private String tag_statement;      //标签口径 
	private String tag_creator;        //标签创建人
	private String tag_region;         //标签地市
	private String is_share;           //是否共享 
	private String tag_status;         //标签状态
	private String tag_url;              //标签下载地址
	private String is_used;            //是否可用
	/**
	 * 20130801 ywz
	 * @return
	 */
	private Integer subsCnt;     //标签统计人数
	private String regionName;//地域名称
	private String parentRegionId;//父地域Id
	private String regionId; //地域Id
	
	
	public String getTag_url() {
		return tag_url;
	}
	public void setTag_url(String tag_url) {
		this.tag_url = tag_url;
	}
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
	public String getTag_type() {
		return tag_type;
	}
	public void setTag_type(String tag_type) {
		this.tag_type = tag_type;
	}
	public String getTag_serv_type() {
		return tag_serv_type;
	}
	public void setTag_serv_type(String tag_serv_type) {
		this.tag_serv_type = tag_serv_type;
	}
	public String getTag_class() {
		return tag_class;
	}
	public void setTag_class(String tag_class) {
		this.tag_class = tag_class;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getCount_subs() {
		return count_subs;
	}
	public void setCount_subs(int count_subs) {
		this.count_subs = count_subs;
	}
	public String getTag_statement() {
		return tag_statement;
	}
	public void setTag_statement(String tag_statement) {
		this.tag_statement = tag_statement;
	}
	public String getTag_creator() {
		return tag_creator;
	}
	public void setTag_creator(String tag_creator) {
		this.tag_creator = tag_creator;
	}
	public String getTag_region() {
		return tag_region;
	}
	public void setTag_region(String tag_region) {
		this.tag_region = tag_region;
	}
	public String getIs_share() {
		return is_share;
	}
	public void setIs_share(String is_share) {
		this.is_share = is_share;
	}
	public String getTag_status() {
		return tag_status;
	}
	public void setTag_status(String tag_status) {
		this.tag_status = tag_status;
	}
	public String getIs_used() {
		return is_used;
	}
	public void setIs_used(String is_used) {
		this.is_used = is_used;
	}
	public Integer getSubsCnt() {
		return subsCnt;
	}
	public void setSubsCnt(Integer subsCnt) {
		this.subsCnt = subsCnt;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public String getParentRegionId() {
		return parentRegionId;
	}
	public void setParentRegionId(String parentRegionId) {
		this.parentRegionId = parentRegionId;
	}
	public String getRegionId() {
		return regionId;
	}
	public void setRegionId(String regionId) {
		this.regionId = regionId;
	}
		
}
