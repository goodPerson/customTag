package module;
/**
 * 创建区县月统计目标表
 * @author ywz
 *
 */
// 目标表 MK_VGOP.TB_CUST_TAG_COUNTY_M
public class CustTagCountyM {
	 private Integer statisMonth                 ;//            integer                  --月份               
	 private String regionName                   ;//           varchar(10)              --地域名称           
	 private String countryName                  ;//           varchar(70)              --县区名称           
	 private Integer accessSubsCnt               ;//           integer                   --访问人数、         
	 private Integer accessCnt                   ;//    integer                  --访问次数、         
	 private Integer custlistDwlnSubsCnt         ;//      integer                    --客户清单下载人数、 
	 private Integer custlistDwlnCnt             ;//  integer                   --客户清单下载次数、 
	 private Integer custgroupCreateSubsCnt     ;//   integer                   --客户分群创建人数、 
	 private Integer custgroupCreateCnt          ;//  integer                   --客户分群创建个数、 
	 private Integer custtagCreateSubsCnt       ;//   integer                   --标签新增创建人数、 
	 private Integer custtagCreateCnt            ;//   integer                   --标签新增创建个数。  
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
