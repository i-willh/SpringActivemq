package org.xdemo.example.SpringActivemq.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.util.StringUtils;

public class DateUtil {
	
	/**
	 * yyyyMMdd
	 */
	public static final String FORMAT_YYYYMMDD = "yyyyMMdd";
	
	/**
	 * yyyy-MM-dd
	 */
	public static final String dateFormat111 = "yyyy-MM-dd";
	
	/**
	 * yyyy/MM/dd
	 */
	public static final String dateFormat112 = "yyyy/MM/dd";
	
	/**
	 * yyyy-MM-dd HH:mm:ss
	 */
	public static final String dateFormat210 = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 获取当天日期字符串
	 * @return
	 */
	public static String getTodayStrDate(String format){
	    Date dt = new Date();  
	    SimpleDateFormat sdf = new SimpleDateFormat(format);  
	    return sdf.format(dt);  
	}
	
	/**
	 * 获取当天日期
	 * @return
	 */
	public static Date getTodayDate(String format){
	    Date dt = new Date();  
	    return dt;  
	}
	
	/**
	 * 字符串转换为指定格式的日期类型
	 * @param dateStr 原始日期字
	 * @param rex	新日期格试,如:yyyyMMdd
	 * @return
	 * @throws ParseException 
	 */
	public static Date string2date(String dateStr,String rex) throws ParseException {
		DateFormat df=new SimpleDateFormat(rex);
		if(StringUtils.isEmpty(dateStr)){
			return null;
		}else{
			Date date = df.parse(dateStr);
			return date;
		}
	}
	
	/**
	 * 日期转换为指定格式的字符串
	 * @param date
	 * @param rex
	 * @return
	 */
	public static String date2String(Date date, String rex) {
		SimpleDateFormat sdf = new SimpleDateFormat(rex);
		return sdf.format(date);
	}
	
	
	 /** 
     * 获得指定日期的前一天 ,格式yyyyMMdd
     *  
     * @param specifiedDay 
     * @return 
     * @throws Exception 
     */  
	public static String getDayBefore(String curDate) {//可以用new Date().toLocalString()传递参数  
        Calendar c = Calendar.getInstance();  
        Date date = null;  
        try {  
            date = new SimpleDateFormat(FORMAT_YYYYMMDD).parse(curDate);  
        } catch (ParseException e) {  
            e.printStackTrace();  
        }  
        c.setTime(date);  
        int day = c.get(Calendar.DATE);  
        c.set(Calendar.DATE, day - 1);  
  
        String dayBefore = new SimpleDateFormat(FORMAT_YYYYMMDD).format(c.getTime());  
        return dayBefore;  
    }  
  
    /** 
     * 获得指定日期的后一天 ,格式yyyyMMdd
     *  
     * @param specifiedDay 
     * @return 
     */  
    public static String getDayAfter(String curDate) {  
        Calendar c = Calendar.getInstance();  
        Date date = null;  
        try {  
            date = new SimpleDateFormat(FORMAT_YYYYMMDD).parse(curDate);  
        } catch (ParseException e) {  
            e.printStackTrace();  
        }  
        c.setTime(date);  
        int day = c.get(Calendar.DATE);  
        c.set(Calendar.DATE, day + 1);  
  
        String dayAfter = new SimpleDateFormat(FORMAT_YYYYMMDD)  .format(c.getTime());  
        return dayAfter;  
    }
}
