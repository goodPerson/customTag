package module;
/**
 * 客户标签和群的监控月表
 * @author ywz
 *@date 20130717
 */
//客户标签和群的监控月表   TB_CUST_TAG_AND_GROUP_MONITOR_M
public class CustTagAndGroupMonitorM {

	 private Integer statisMonth                  ;//月份                                               
	 private String regionName                   ;//地域名称                                          
	 private Integer accessSubsCnt               ;//访问人数                                        
	 private Integer accessCnt                    ;//访问次数                                        
	 private Integer custlistDwlnSubsCnt        ;//客户清单下载人数                                
	 private Integer custlistDwlnCnt             ;//客户清单下载次数                                
	 private Integer custgroupCreateSubsCnt     ;//客户分群创建人数                                
	 private Integer custgroupCreateCnt          ;//客户分群创建个数                                
	 private Integer custtagCreateSubsCnt       ;//标签新增创建人数                                
	 private Integer custtagCreateCnt            ;//标签新增创建个数
	public Integer getStatisMonth() {
		return statisMonth;
	}
	public void setStatisMonth(Integer statisMonth) {
		this.statisMonth = statisMonth;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public Integer getAccessSubsCnt() {
		return accessSubsCnt;
	}
	public void setAccessSubsCnt(Integer accessSubsCnt) {
		this.accessSubsCnt = accessSubsCnt;
	}
	public Integer getAccessCnt() {
		return accessCnt;
	}
	public void setAccessCnt(Integer accessCnt) {
		this.accessCnt = accessCnt;
	}
	public Integer getCustlistDwlnSubsCnt() {
		return custlistDwlnSubsCnt;
	}
	public void setCustlistDwlnSubsCnt(Integer custlistDwlnSubsCnt) {
		this.custlistDwlnSubsCnt = custlistDwlnSubsCnt;
	}
	public Integer getCustlistDwlnCnt() {
		return custlistDwlnCnt;
	}
	public void setCustlistDwlnCnt(Integer custlistDwlnCnt) {
		this.custlistDwlnCnt = custlistDwlnCnt;
	}
	public Integer getCustgroupCreateSubsCnt() {
		return custgroupCreateSubsCnt;
	}
	public void setCustgroupCreateSubsCnt(Integer custgroupCreateSubsCnt) {
		this.custgroupCreateSubsCnt = custgroupCreateSubsCnt;
	}
	public Integer getCustgroupCreateCnt() {
		return custgroupCreateCnt;
	}
	public void setCustgroupCreateCnt(Integer custgroupCreateCnt) {
		this.custgroupCreateCnt = custgroupCreateCnt;
	}
	public Integer getCusttagCreateSubsCnt() {
		return custtagCreateSubsCnt;
	}
	public void setCusttagCreateSubsCnt(Integer custtagCreateSubsCnt) {
		this.custtagCreateSubsCnt = custtagCreateSubsCnt;
	}
	public Integer getCusttagCreateCnt() {
		return custtagCreateCnt;
	}
	public void setCusttagCreateCnt(Integer custtagCreateCnt) {
		this.custtagCreateCnt = custtagCreateCnt;
	}
	 
}
