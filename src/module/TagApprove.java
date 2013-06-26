package module;
/**
 * 申请标签信息表
 * @author ywz
 *
 */
public class TagApprove {
	  private String tag_id;//	        varchar(32)	not null           --申请标识                       
	  private String tag_name;//		      varchar(64)               --申请名称
	  private String tag_applyer;//	    varchar(32)                    --申请人
	  private String tag_applyer_id;//	 varchar(32)                    --申请人id
	  private String create_time;//		  varchar(24)                    --标签创建时间
	  private String tag_examiner;//	   varchar(32)                    --审批人
	  private String tag_examiner_id;//	  varchar(32)                  --审批id
	  private String tag_treater;//	     varchar(32)                    --处理人
	  private String tag_treater_id;//	  varchar(32)                   --处理人id
	  private String tag_state;//	      varchar(4)                     --处理状态
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
	public String getTag_applyer() {
		return tag_applyer;
	}
	public void setTag_applyer(String tag_applyer) {
		this.tag_applyer = tag_applyer;
	}
	public String getTag_applyer_id() {
		return tag_applyer_id;
	}
	public void setTag_applyer_id(String tag_applyer_id) {
		this.tag_applyer_id = tag_applyer_id;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	public String getTag_examiner() {
		return tag_examiner;
	}
	public void setTag_examiner(String tag_examiner) {
		this.tag_examiner = tag_examiner;
	}
	public String getTag_examiner_id() {
		return tag_examiner_id;
	}
	public void setTag_examiner_id(String tag_examiner_id) {
		this.tag_examiner_id = tag_examiner_id;
	}
	public String getTag_treater() {
		return tag_treater;
	}
	public void setTag_treater(String tag_treater) {
		this.tag_treater = tag_treater;
	}
	public String getTag_treater_id() {
		return tag_treater_id;
	}
	public void setTag_treater_id(String tag_treater_id) {
		this.tag_treater_id = tag_treater_id;
	}
	public String getTag_state() {
		return tag_state;
	}
	public void setTag_state(String tag_state) {
		this.tag_state = tag_state;
	}	  
}
