package module;
/**
 * MK_VGOP.TB_CUST_TAG_SUBS_USING_DETAIL_D IS '客户标签系统用户使用明细日表'
 * @author ywz
 *
 */
public class TagSubsDayDetail {
	  private Integer statisDate;  //         int                          '统计日期'         
	   private String userId;  //              varchar(50)                  '经分工号'         
	   private String userName;  //            varchar(50)                  '用户姓名'         
	   private String regionName;  //          varchar(50)                  '地市名称'         
	   private String countryName;  //         varchar(70)                 '县区名称'         
	   private Integer accessCnt;  //           int                         '访问次数'         
	   private Integer downloadCnt;  //         int                         '客户清单下载次数' 
	   private Integer groupCreateCnt;  //     int                          '客户分群创建个数' 
	   private Integer tagCreateCnt;  //       int                          '标签新增创建个数' 
	public Integer getStatisDate() {
		return statisDate;
	}
	public void setStatisDate(Integer statisDate) {
		this.statisDate = statisDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public Integer getAccessCnt() {
		return accessCnt;
	}
	public void setAccessCnt(Integer accessCnt) {
		this.accessCnt = accessCnt;
	}
	public Integer getDownloadCnt() {
		return downloadCnt;
	}
	public void setDownloadCnt(Integer downloadCnt) {
		this.downloadCnt = downloadCnt;
	}
	public Integer getGroupCreateCnt() {
		return groupCreateCnt;
	}
	public void setGroupCreateCnt(Integer groupCreateCnt) {
		this.groupCreateCnt = groupCreateCnt;
	}
	public Integer getTagCreateCnt() {
		return tagCreateCnt;
	}
	public void setTagCreateCnt(Integer tagCreateCnt) {
		this.tagCreateCnt = tagCreateCnt;
	}

}
