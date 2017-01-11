package com.env.utils;

/**
 * 字符串处理工具类
 * @author xrhou
 * 
 */
public class StringUtils {

	/**
	 *  统一字符串形式,将null变换成""
	 * @param str
	 * @return
	 */
	public static String ObjectToString (Object str) {
		if(str==null){return "";}
		return str.toString().trim();
	}
	
	/**
	 * 统一字符串形式
	 * @param str 将null以及"null"变换成""
	 * @return
	 */
	public static String killNull(String str) {
		if(str==null||"null".equalsIgnoreCase(str)){
			return "";
		}
		return str.trim();
	}
	
	/**
	 * 获取一个字符串的简明效果
	 * @return String 返回的字符串格式类似于"abcd***hijk"
	 */
	public static String getStringSimple(String data){
		return data.substring(0,4) + "***" + data.substring(data.length()-4);
	}
	
 
	/**
	 * 去掉字符串前后空格
	 * @param str
	 * @return
	 */
	public static String trim(String str) {
		return str != null ? str.trim() : str;
	}
	
	/**
	 * 判断一个字符串是否为空
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		if(str == null){
			return true;
		}
		return "".equals(str.trim());
	}
	/** 
     * 使用java正则表达式去掉字符串多余的.与0 
     * @param s 
     * @return  
     * add by yhj 2014/03/10
     */  
    public static String subZeroAndDot(String s){  
        if(s.indexOf(".") > 0){  
            s = s.replaceAll("0+?$", "");//去掉多余的0  
            s = s.replaceAll("[.]$", "");//如最后一位是.则去掉  
        }  
        return s;  
    } 
    
	public static String getStringSimpleShow(String data){
		return data.substring(0,7) + "....";
	}
	
	public static void main(String[] args) {
		String str="发展有限公司";
		System.out.println(getStringSimple(str));
		
	}
}
