package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	/** 
	    * 当前日期的前一天
	    * @param specifiedDay 
	    * @return 
	    * @throws Exception 
	    */  
	    public static String getSpecifiedDayBefore(String specifiedDay){  
	        //SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");  
	        Calendar c = Calendar.getInstance();  
	        Date date=null;  
	        try {  
	            date = new SimpleDateFormat("yyyyMMdd").parse(specifiedDay);  
	        } catch (ParseException e) {  
	            e.printStackTrace();  
	        }  
	        c.setTime(date);  
	        int day=c.get(Calendar.DATE);  
	        c.set(Calendar.DATE,day-1);  
	        
	        String dayBefore=new SimpleDateFormat("yyyyMMdd").format(c.getTime());  
	        return dayBefore;  
	    }  
	    /** 
	    * 当前日期的后一天 
	    * @param specifiedDay 
	    * @return 
	    */  
	    public static String getSpecifiedDayAfter(String specifiedDay){  
	        Calendar c = Calendar.getInstance();  
	        Date date=null;  
	        try {  
	            date = new SimpleDateFormat("yyyyMMdd").parse(specifiedDay);  
	        } catch (ParseException e) {  
	            e.printStackTrace();  
	        }  
	        c.setTime(date);  
	        int day=c.get(Calendar.DATE);  
	        c.set(Calendar.DATE,day+1);  
	  
	        String dayAfter=new SimpleDateFormat("yyyyMMdd").format(c.getTime());  
	        return dayAfter;  
	    } 
	    
		/**获取年月日*/
		public static String getYearMonthDay(){
			String sMonth;
			String dDay="";
			 Calendar cal = Calendar.getInstance();
			    int month = cal.get(Calendar.MONTH) + 1;
			    if (month<10){
			    	sMonth="0"+month;
			    }else{
			    	sMonth=""+month;
			    }
			    int year = cal.get(Calendar.YEAR);
			    int sDay=cal.get(Calendar.DATE);
			    if(sDay<10){
			    	dDay="0"+sDay;
			    }else{
			    	dDay=""+sDay;
			    }
			    return ""+year+sMonth+dDay;
		}
		
		/**获取当月天数*/
		public static int getCurrentMonthLastDay() {
			Calendar a = Calendar.getInstance();
			a.set(Calendar.DATE, 1);//把日期设置为当月第一天
			a.roll(Calendar.DATE, -1);//日期回滚一天，也就是最后一天
			int maxDate = a.get(Calendar.DATE);
			return maxDate;
		}
}
