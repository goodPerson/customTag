package common.push;

public class RegionFormat {
	
	public static String ToPinyin(String regionName){
		String region="";
		if("999".equals(regionName)){
			region="HB";
		}else if("312".equals(regionName)){
			region="HB.BD";
		}else if("314".equals(regionName)){
			region="HB.CD";
		}else if("317".equals(regionName)){
			region="HB.CZ";
		}else if("310".equals(regionName)){
			region="HB.HD";
		}else if("318".equals(regionName)){
			region="HB.HS";
		}else if("316".equals(regionName)){
			region="HB.LF";
		}else if("335".equals(regionName)){
			region="HB.QH";
		}else if("311".equals(regionName)){
			region="HB.SJ";
		}else if("315".equals(regionName)){
			region="HB.TS";
		}else if("319".equals(regionName)){
			region="HB.XT";
		}else if("313".equals(regionName)){
			region="HB.ZJ";
		}
		return region;
	}
	
	public static String ToPinyinRegionName(String regionName){
		String region="";
		if("999".equals(regionName)){
			region="河北省";
		}else if("312".equals(regionName)){
			region="保定";
		}else if("314".equals(regionName)){
			region="承德";
		}else if("317".equals(regionName)){
			region="沧州";
		}else if("310".equals(regionName)){
			region="邯郸";
		}else if("318".equals(regionName)){
			region="衡水";
		}else if("316".equals(regionName)){
			region="廊坊";
		}else if("335".equals(regionName)){
			region="秦皇岛";
		}else if("311".equals(regionName)){
			region="石家庄";
		}else if("315".equals(regionName)){
			region="唐山";
		}else if("319".equals(regionName)){
			region="邢台";
		}else if("313".equals(regionName)){
			region="张家口";
		}
		return region;
	}

}
