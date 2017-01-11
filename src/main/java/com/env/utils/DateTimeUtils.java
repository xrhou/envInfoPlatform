package com.env.utils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
/**
 * 
 * 日期时间工具类
 * 
 * @author Liz 二〇一二年十二月二十日 
 *
 */
public class DateTimeUtils {

	public static final String DATE_PATTERN = "yyyy-MM-dd"; 
	
	public static final String TIME_PATTERN = "yyyy-MM-dd HH:mm:ss"; 
	
	public static final String MILL_TIME_PATTERN = "yyyy-MM-dd HH:mm:ss.SSS"; 
	
	/**
	 * 得到当前日期的前几天
	 * @param span 间隔 (前几天就用负数，后几天用正数)
	 * @return
	 */
	public static String getNextDate(int span){
		Calendar date = Calendar.getInstance();
		date.set(Calendar.DAY_OF_MONTH,date.get(Calendar.DAY_OF_MONTH) + span);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		return sdf.format(date.getTime());
	}
	
	/**
	 * 得到给定日期的前几年
	 * @param span 间隔 (前几年就用负数，后几年用正数)
	 * @return
	 */
	public static String getNextYearDate(String date, int span){
		String[] dateArr=date.split("-");
		Calendar dateTemp = Calendar.getInstance();
		dateTemp.set(Integer.valueOf(dateArr[0]), Integer.valueOf(dateArr[1])-1, Integer.valueOf(dateArr[2]));
		dateTemp.set(Calendar.YEAR,dateTemp.get(Calendar.YEAR) + span);
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		return sdf.format(dateTemp.getTime());
	}
	
	/**
	 * 得到当前日期时间 yyyy-MM-dd
	 * @return
	 */
	public static String getDate(){
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		return sdf.format(new Date());
	}
	/**
	 * 获取固定的时间
	 * @return
	 */
	public static Date getNowDate(){
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date date=null;
		try {
			date = sdf.parse("2015-11-11");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	/**
	 * 得到当前时间 HH:mm:ss
	 * @return
	 */
	public static String getTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		return sdf.format(new Date());
	}
	
	/**
	*  
	* 得到当前日期时间
	* @return yyyy-MM-dd HH:mm:ss字符串
	*/
	public static String getDateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat(TIME_PATTERN); 
		return sdf.format(new Date()); 
	}
	
	/**   
	 * getMonthLastDay 得到本月的最后一天   
	 * @return   
	 */    
	public static String getMonthLastDay() {     
	    Calendar calendar = Calendar.getInstance();     
	    calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));     
	    return new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());     
	} 
	
	/**   
	 * getMonthFirstDay 得到本月的第一天   
	 * @return   
	 */    
	public static String getMonthFirstDay() {     
	    Calendar calendar = Calendar.getInstance();     
	    calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));     
	    return new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());     
	} 
	
	/**
	 * 得到指定年月的最后一天
	 * @param year
	 * @param month
	 * @return
	 * @throws Exception
	 */
	public static int getLastDayOfMonth(String year, String month)throws Exception {  
        Calendar cal = Calendar.getInstance();  
        cal.set(Calendar.YEAR, Integer.valueOf(year));  
        cal.set(Calendar.MONTH, Integer.valueOf(month)-1);  
        // 某年某月的最后一天  
        return cal.getActualMaximum(Calendar.DATE);  
    }
	
	/**
	 * 将yyyy-MM-dd格式日期转换成yyyy年MM月dd日
	 * @param date yyyy-MM-dd、yyyy-MM-dd HH:mm:ss格式日期字符串
	 * @return
	 */
	public static String formatDate(String date){
		if(date!=null&&!date.equals("")){
			return date.split("-")[0]+"年"+date.split("-")[1]+"月"+date.split("-")[2]+"日" ;
		}else{
			return "";
		}
	}
	
	/**
	*  
	* 将Date转换成相应的yyyy-MM-dd HH:mm:ss字符串
	* @return
	*/
	public static String dateToStr(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(TIME_PATTERN); 
		return sdf.format(date); 
	}

	/**
	*  
	* 将Date转换成相应的yyyyMMddHHmmSS字符串
	* @return
	*/
	public static String dateToStrID() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		return sdf.format(new Date()); 
	}

	 /**
	  * method 将字符串类型的日期转换为一个timestamp（时间戳记java.sql.Timestamp）
	  * dateString 需要转换为timestamp的字符串
	  * dataTime timestamp
	  */
	 public final static java.sql.Timestamp stringToTime(String dateString) throws java.text.ParseException {
	   DateFormat dateFormat;
	   dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss.SSS", Locale.ENGLISH);//设定格式
	   //dateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss", Locale.ENGLISH);
	   dateFormat.setLenient(false);
	   java.util.Date timeDate = dateFormat.parse(dateString);//util类型
	   Timestamp dateTime = new Timestamp(timeDate.getTime());//Timestamp类型,timeDate.getTime()返回一个long型
	   return dateTime;
	 }
	 
	 /**
	  * method 将字符串类型的日期转换为一个Date（java.sql.Date）
	  * dateString 需要转换为Date的字符串
	  * dataTime Date
	  */
	 public final static java.sql.Date stringToDate(String dateString) throws java.lang.Exception {
	   DateFormat dateFormat;
	   dateFormat = new SimpleDateFormat(DATE_PATTERN, Locale.ENGLISH);
	   dateFormat.setLenient(false);
	   java.util.Date timeDate = dateFormat.parse(dateString);//util类型
	   java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());//sql类型
	   return dateTime;
	 }
	 /**
	  * method 将字符串类型的日期转换为一个Date（java.sql.Date）
	  * dateString 需要转换为Date的字符串
	  * dataTime Date
	  */
	 public final static java.sql.Date stringToDateTime(String dateString) throws java.lang.Exception {
	   DateFormat dateFormat;
	   dateFormat = new SimpleDateFormat(TIME_PATTERN, Locale.ENGLISH);
	   dateFormat.setLenient(false);
	   java.util.Date timeDate = dateFormat.parse(dateString);//util类型
	   java.sql.Date dateTime = new java.sql.Date(timeDate.getTime());//sql类型
	   return dateTime;
	 }
	 
	 
	 /**
	  * 将日期字符串转化成yyyy-MM-dd HH:mm:ss格式的字符串
	  * @param dateString
	  * @return
	  * @throws java.lang.Exception
	  */
	 public final static String formatDateTimeStr(String dateString) throws java.lang.Exception {
		 String formatString="";
		 DateFormat dateFormat = new SimpleDateFormat(TIME_PATTERN);
		 Date date= dateFormat.parse(dateString);
		 formatString = dateToStr(date);
		 return formatString;
	 }
	 
	 /**
	  * 将Timestamp日期转化成yyyy-MM-dd HH:mm:ss格式的字符串,去除毫秒
	  * @param dateString
	  * @return
	  * @throws java.lang.Exception
	  */
	 public final static String formatDateTime(Timestamp dateTime) throws java.lang.Exception {
		if(dateTime==null){
			return "";
		}
		DateFormat dateFormat = new SimpleDateFormat(TIME_PATTERN);
		return dateFormat.format(dateTime);
	 }
	 
	 /**
	  * String转化成Timestamp 去除毫秒
	  * @param dateTimeStr
	  * @return
	  * @throws java.lang.Exception
	  */
	 public final static Timestamp StringToTimestamp(String dateTimeStr) throws java.lang.Exception {
		 SimpleDateFormat df = new SimpleDateFormat(MILL_TIME_PATTERN);
         java.util.Date date = df.parse(dateTimeStr);
         String time = df.format(date);
         Timestamp ts = Timestamp.valueOf(time);
         return ts;
	}
	 
	 /**
	  * TimestampString转化成 Date String去除时分秒毫秒
	  * @param dateTimeStr
	  * @return
	  * @throws java.lang.Exception
	  */
	 public final static String ToDateString(String dateTimeStr) throws java.lang.Exception {
		 String str  = "";
		 if(!StringUtils.isEmpty(dateTimeStr)) {
			 str= dateTimeStr.substring(0, 10);
		 }
         return str;
	} 
	 
	 /**
	  * 比较两个 日期字符串大小 大于零：BDate>EDate  小于零：BDate<EDate
	  * @param BDate
	  * @param EDate
	  * @return
	  * @throws ParseException
	  */
	public static long compareDateStr(String BDate, String EDate) throws ParseException {
		 SimpleDateFormat df = new SimpleDateFormat(DATE_PATTERN);
		 Date date1 = df.parse(BDate);
		 Date date2=df.parse(EDate);
		 return date1.getTime()-date2.getTime();
	}

	/**
	 * 获取两个 日期字符串相差的天数
	 * @param BDate
	 * @param EDate
	 * @return
	 * @throws ParseException
	 */
	public static long getDaysFromDateStr(String BDate, String EDate) throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat(DATE_PATTERN);
		Date date= df.parse(BDate);
		Date now=df.parse(EDate);
		long l=now.getTime()-date.getTime();
		long day=l/(24*60*60*1000);
		//long hour=(l/(60*60*1000)-day*24);
		//long min=((l/(60*1000))-day*24*60-hour*60);
		//long s=(l/1000-day*24*60*60-hour*60*60-min*60);
		//System.out.println(""+day+"天"+hour+"小时"+min+"分"+s+"秒");
		return day;
	}
	/**
	 * 给定一个日期MTime，算出它后面num个月之后的日期
	 * @param Mtime
	 * @param num
	 * @return
	 * @throws Exception 
	 */
	public static String getAddMTime(String Mtime, int num) throws Exception{
		SimpleDateFormat df = new SimpleDateFormat(DATE_PATTERN);
		Calendar nowTime = Calendar.getInstance();
		nowTime.setTime(stringToDate(Mtime));
		nowTime.add(Calendar.MONTH, num);//日期加num个月
		Date dt=nowTime.getTime();
		String reStr = df.format(dt);
		return reStr;
	}
	 /**
	  * 判断闰年
	  * @param year
	  * @return
	  */
	 public static boolean isLeapYear(int year) {
		  if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
		      return true;
		  } else {
			  return false;
		  }
	 }
	 //java获得两个日期之前相差的月份
	   
    public static int getMonth(String startStr, String endStr) throws Exception {
    	Date start = stringToDate(startStr);
    	Date end = stringToDate(endStr);
        /*if (start.after(end)) {
            Date t = start;
            start = end;
            end = t;
        }*/
        Calendar startCalendar = Calendar.getInstance();
        startCalendar.setTime(start);
        Calendar endCalendar = Calendar.getInstance();
        endCalendar.setTime(end);
        Calendar temp = Calendar.getInstance();
        temp.setTime(end);
        temp.add(Calendar.DATE, 1);

        int year = endCalendar.get(Calendar.YEAR)
                - startCalendar.get(Calendar.YEAR);
        int month = endCalendar.get(Calendar.MONTH)
                - startCalendar.get(Calendar.MONTH);

        if ((startCalendar.get(Calendar.DATE) == 1)
                && (temp.get(Calendar.DATE) == 1)) {
            return year * 12 + month + 1;
        } else if ((startCalendar.get(Calendar.DATE) != 1)
                && (temp.get(Calendar.DATE) == 1)) {
            return year * 12 + month;
        } else if ((startCalendar.get(Calendar.DATE) == 1)
                && (temp.get(Calendar.DATE) != 1)) {
            return year * 12 + month;
        } else {
            return (year * 12 + month - 1) < 0 ? 0 : (year * 12 + month);
        }
    }

	public static void main(String[] args) {
		System.out.println(new Date(DateTimeUtils.getDate()));
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		System.out.println("----"+sdf.format(new Date()));
	}
	
}

