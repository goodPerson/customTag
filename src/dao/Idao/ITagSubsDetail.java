package dao.Idao;

import java.util.List;
import java.util.Map;

import module.TagSubsDayDetail;
import module.TagSubsMonthDetail;

public interface ITagSubsDetail {
	/**
	 * 获取月用户使用明细和统计
	 * @param tsmd
	 * @return
	 */
	public List<TagSubsMonthDetail> getListTsmd(String regionName,TagSubsMonthDetail tsmd,int pageNo,int pageSize);
	
	public List<TagSubsMonthDetail> getListTsmd(String regionName,TagSubsMonthDetail tsmd);
	/**
	 * 获取日用户使用明细和统计
	 * @param tsdd
	 * @return
	 */
	public List<TagSubsDayDetail> getListTsdd(String regionName,String startTime, String endTime ,TagSubsDayDetail tsdd,int pageNo,int pageSize);
	
	public List<TagSubsDayDetail> getListTsdd(String regionName,String startTime, String endTime ,TagSubsDayDetail tsdd);
	
	/**
	 * 获取月用户名称
	 * @param regionName
	 * @return
	 */
	public List<Map<String, Object> >getUserName(String regionName);
	
	/**
	 * 获取月区县名称
	 * @param countyName
	 * @return
	 */
	public List<Map<String, Object>> getCountyName(String countyName);
	
	/**
	 * 获取日用户名称
	 * @param regionName
	 * @return
	 */
	public List<Map<String, Object> >getUserNameD(String regionName);
	
	/**
	 * 获取日区县名称
	 * @param countyName
	 * @return
	 */
	public List<Map<String, Object>> getCountyNameD(String countyName);

}
