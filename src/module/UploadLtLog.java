package module;
/**
 * 上传名单记录
 * @author ywz
 *
 */
public class UploadLtLog {
	 private String tag_id;//	  标签Id      varchar(32)	       
	 private String tag_type;//   名单类型     varchar(16)                 
	 private String upload_path;//   上传路径      varchar(32)             
	 private String state;//	  状态  0已经上传  1 已经入库        varchar(32)
	 
	public String getTag_id() {
		return tag_id;
	}
	public void setTag_id(String tag_id) {
		this.tag_id = tag_id;
	}
	public String getTag_type() {
		return tag_type;
	}
	public void setTag_type(String tag_type) {
		this.tag_type = tag_type;
	}
	public String getUpload_path() {
		return upload_path;
	}
	public void setUpload_path(String upload_path) {
		this.upload_path = upload_path;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}	 
}
