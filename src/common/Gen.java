package common;

import java.lang.reflect.ParameterizedType;

import module.CustTagAndGroupMonitorD;
import module.CustTagAndGroupMonitorM;
import module.CustTagCountyD;
import module.CustTagCountyM;
import module.TagSubsDayDetail;
import module.TagSubsMonthDetail;

public class Gen<T> {
	private T t;
	/*
	private CustTagAndGroupMonitorM regioncm;     //地区月统计
	private CustTagAndGroupMonitorD  regioncd;		//地区日统计
	private TagSubsDayDetail                   tsddetail;      //明细日统计
	private TagSubsMonthDetail              tsmdetail;     //明细月统计
	*/
	public Gen(T t){
		this.t=t;
	}
	
	public Object[]  showTypeName(){
		if (t instanceof CustTagAndGroupMonitorM ){ //泛型实例为地区月统计实例
			Object[]	obj={((CustTagAndGroupMonitorM) t).getStatisMonth(),((CustTagAndGroupMonitorM) t).getRegionName(),((CustTagAndGroupMonitorM) t).getAccessSubsCnt(),
									((CustTagAndGroupMonitorM) t).getAccessCnt(),((CustTagAndGroupMonitorM) t).getCustlistDwlnSubsCnt(),((CustTagAndGroupMonitorM) t).getCustlistDwlnCnt(),
									((CustTagAndGroupMonitorM) t).getCustgroupCreateSubsCnt(),((CustTagAndGroupMonitorM) t).getCustgroupCreateCnt(),
									((CustTagAndGroupMonitorM) t).getCusttagCreateSubsCnt(),((CustTagAndGroupMonitorM) t).getCusttagCreateCnt()};
			
			return obj;
		}else if (t instanceof CustTagAndGroupMonitorD ){ //泛型实例为地区日统计实例
			Object[]	obj={((CustTagAndGroupMonitorD) t).getStatisDate(),((CustTagAndGroupMonitorD) t).getRegionName(),((CustTagAndGroupMonitorD) t).getAccessSubsCnt(),
					                ((CustTagAndGroupMonitorD) t).getAccessCnt(),((CustTagAndGroupMonitorD) t).getCustlistDwlnSubsCnt(),((CustTagAndGroupMonitorD) t).getCustlistDwlnCnt(),
					                ((CustTagAndGroupMonitorD) t).getCustgroupCreateSubsCnt(),((CustTagAndGroupMonitorD) t).getCustgroupCreateCnt(),
					                ((CustTagAndGroupMonitorD) t).getCusttagCreateSubsCnt(),((CustTagAndGroupMonitorD) t).getCusttagCreateCnt()};
			return obj;
		}else if (t instanceof TagSubsDayDetail){//泛型实例为明细日统计实例
			Object[]	obj={((TagSubsDayDetail) t).getStatisDate(),((TagSubsDayDetail) t).getUserName(),((TagSubsDayDetail) t).getRegionName(),
									((TagSubsDayDetail) t).getCountryName(),((TagSubsDayDetail) t).getAccessCnt(),((TagSubsDayDetail) t).getDownloadCnt(),
									((TagSubsDayDetail) t).getGroupCreateCnt(),((TagSubsDayDetail) t).getTagCreateCnt()};
			return obj;
		}else if (t instanceof TagSubsMonthDetail){//泛型实例为明细月统计实例
			Object[]	obj={((TagSubsMonthDetail) t).getStatisMonth(),((TagSubsMonthDetail) t).getUserName(),((TagSubsMonthDetail) t).getRegionName(),
									((TagSubsMonthDetail) t).getCountryName(),((TagSubsMonthDetail) t).getAccessCnt(),((TagSubsMonthDetail) t).getDownloadCnt(),
									((TagSubsMonthDetail) t).getGroupCreateCnt(),((TagSubsMonthDetail) t).getTagCreateCnt()};
			return obj;
		}else if(t instanceof CustTagCountyM){ //泛型实例为区县月统计
			Object[]	obj={((CustTagCountyM) t).getStatisMonth(),((CustTagCountyM) t).getRegionName(),((CustTagCountyM) t).getCountryName(),((CustTagCountyM) t).getAccessSubsCnt(),((CustTagCountyM) t).getAccessCnt(),
					                 ((CustTagCountyM) t).getCustlistDwlnSubsCnt(),((CustTagCountyM) t).getCustlistDwlnCnt(),
									((CustTagCountyM) t).getCustgroupCreateSubsCnt(),((CustTagCountyM) t).getCustgroupCreateCnt(),
									((CustTagCountyM) t).getCusttagCreateSubsCnt(),((CustTagCountyM) t).getCusttagCreateCnt()};
			return obj;
		}else if (t instanceof CustTagCountyD){//泛型实例为区县月统计
			Object[]	obj={((CustTagCountyD) t).getStatisDate(),((CustTagCountyD) t).getRegionName(),((CustTagCountyD) t).getCountryName(),((CustTagCountyD) t).getAccessSubsCnt(),((CustTagCountyD) t).getAccessCnt(),
	                 ((CustTagCountyD) t).getCustlistDwlnSubsCnt(),((CustTagCountyD) t).getCustlistDwlnCnt(),
					((CustTagCountyD) t).getCustgroupCreateSubsCnt(),((CustTagCountyD) t).getCustgroupCreateCnt(),
					((CustTagCountyD) t).getCusttagCreateSubsCnt(),((CustTagCountyD) t).getCusttagCreateCnt()};
			return obj;
		}else {
			return null;
		}
		
		
	}

	public static void main(String[] args){
		
		CustTagAndGroupMonitorM ctagm=new CustTagAndGroupMonitorM();
		ctagm.setAccessCnt(25);
		Gen<CustTagAndGroupMonitorM> g=new Gen<CustTagAndGroupMonitorM>(ctagm);
		System.out.println(g.showTypeName().clone()[2]);
		 
	}
}
