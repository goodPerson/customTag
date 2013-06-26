package module;
/**
 * 客户群信息表
 * @author ywz
 *
 */
public class CustomgroupInfo {
	private String  tag_id;// 客户群标识
	private String tag_name;//客户群名称
	private String tag_type;//客户群类型
	private String tag_serv_type;//客户群业务类型
	private String tag_class;//客户群小类
	private String create_time;//客户群创建时间
	private String end_time;//客户群结束时间
	private String profile;//客户群简介
	private String count_subs;//客户群统计人数
	private String tag_statement;//客户群口径
	private String tag_creator;//客户群创建人
	private String tag_region;//客户群地市
	private String is_share;//是否共享：1是，0否
	private String tag_status;//客户群状态：1新建，2故有，3编辑中
	private String download_path;//下载路径
	
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
	public String getCount_subs() {
		return count_subs;
	}
	public void setCount_subs(String count_subs) {
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
	public String getDownload_path() {
		return download_path;
	}
	public void setDownload_path(String download_path) {
		this.download_path = download_path;
	}	
	
}
