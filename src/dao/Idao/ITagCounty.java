package dao.Idao;

import java.util.List;

import module.CustTagCountyD;
import module.CustTagCountyM;

public interface ITagCounty {
	/**
	 * 展示区县日统计
	 * @param ctcd
	 * @return
	 */
	public List<CustTagCountyD> findCtcdList(String regionName,String startTime, String endTime ,CustTagCountyD ctcd,int pageNo,int pageSize);
	
	public List<CustTagCountyD> findCtcdList(String regionName,String startTime, String endTime ,CustTagCountyD ctcd);
	/**
	 * 展示区县日统计
	 * @param ctcm
	 * @return
	 */
	public List<CustTagCountyM> findCtcmList(String regionName,CustTagCountyM ctcm,int pageNo,int pageSize);
	
	public List<CustTagCountyM> findCtcmList(String regionName,CustTagCountyM ctcm);

}
