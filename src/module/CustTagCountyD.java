package module;
/**
 * 客户标签和群地市级别汇总使用情况月表
 * @author ywz
 *目标表：MK_VGOP.TB_CUST_TAG_COUNTY_D
 */
public class CustTagCountyD {
	private Integer statisDate                 ;//  integer        --日期                
	private String regionName                  ;// varchar(10)    --地域名称             
	private String countryName                 ;// varchar(70)    --县区名称             
	private Integer accessSubsCnt              ;// integer        --访问人数、           
	private Integer accessCnt                  ;//  integer        --访问次数、          
	private Integer custlistDwlnSubsCnt        ;// integer        --客户清单下载人数、   
	private Integer custlistDwlnCnt            ;// integer        --客户清单下载次数、   
	private Integer custgroupCreateSubsCnt     ;//integer        --客户分群创建人数、    
	private Integer custgroupCreateCnt         ;// integer        --客户分群创建个数、   
	private Integer custtagCreateSubsCnt       ;//integer        --标签新增创建人数、    
	private Integer custtagCreateCnt           ;// integer        --标签新增创建个数。   
	public Integer getStatisDate() {
		return statisDate;
	}
	public void setStatisDate(Integer statisDate) {
		this.statisDate = statisDate;
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
