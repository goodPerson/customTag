package module;
/**
 * 月排行
 * @author ywz
 *@date 20130716
 */
public class OrderInfoM {
	private String  sameMonth;// 当月	varchar(64),
	private Integer  sameMonthCount;// 当月统计数量	integer,
	private String  orderType; // 统计类型   地市 , 标签,访问用户，下载用户	varchar(50),
	private String  orderName;// 统计名称	varchar(50),
	private Integer  beforeMonthCount;// 上月统计 	integer
	
	public String getSameMonth() {
		return sameMonth;
	}
	public void setSameMonth(String sameMonth) {
		this.sameMonth = sameMonth;
	}
	public Integer getSameMonthCount() {
		return sameMonthCount;
	}
	public void setSameMonthCount(Integer sameMonthCount) {
		this.sameMonthCount = sameMonthCount;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public Integer getBeforeMonthCount() {
		return beforeMonthCount;
	}
	public void setBeforeMonthCount(Integer beforeMonthCount) {
		this.beforeMonthCount = beforeMonthCount;
	}
	
}
