package module;

import java.util.Date;
public class CustomTag {
	
private String tag_id;             //标签标识
private String tag_name;           //标签名称
private String tag_type;           //标签类型
private String create_time;        //标签创建时间
private String end_time;           //标签结束时间
private String profile;            //标签简介  
private int  count_subs;         //标签统计人数
private String tag_statement;      //标签口径 
private String tag_creator;        //标签创建人
private String tag_region;         //标签地市
private String is_share;           //是否共享 
private String tag_status;         //标签状态
private String tag_serv_type;
private String tag_class;
public  String getTag_id() {
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
public String getCreate_time() {
	return create_time;
}
public String getTag_type() {
	return tag_type;
}
public void setTag_type(String tag_type) {
	this.tag_type = tag_type;
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

	

}
