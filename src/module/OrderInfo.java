package module;
/**
 * 	Õ≥º∆≈≈––
 * @author ywz
 *  20130704
 */
public class OrderInfo {	
	private String sameDay;	
	private Integer sameDayCount;
	private String orderType;
	private String orderName;
	private Integer beforeDayCount;
	

	public String getSameDay() {
		return sameDay;
	}
	public void setSameDay(String sameDay) {
		this.sameDay = sameDay;
	}

	public Integer getSameDayCount() {
		return sameDayCount;
	}
	public void setSameDayCount(Integer sameDayCount) {
		this.sameDayCount = sameDayCount;
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
	public Integer getBeforeDayCount() {
		return beforeDayCount;
	}
	public void setBeforeDayCount(Integer beforeDayCount) {
		this.beforeDayCount = beforeDayCount;
	}	
	
}
