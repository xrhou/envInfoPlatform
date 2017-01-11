package com.env.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

/**
 * 
 * 数学精确计算工具类
 * 
 * @author xrhou 20150525
 *
 */
public class MathExtend {
	
	private MathExtend(){}

	// 默认除法运算精度
	private static final int DEF_DIV_SCALE = 10;
	
	/**
	 * 提供精确的加法运算
	 * 
	 * @param v1 被加数
	 * @param v2 加数
	 * @return 两个参数的和
	 */
	public static double add(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.add(b2).doubleValue();
	}

	/**
	 * 
	 * @param v1 被加数
	 * @param v2 加数
	 * @param scale 指定精度，以后的数字四舍五入
	 * @return 两个参数的和
	 */
	public static double add(double v1, double v2, int scale) {
		if(scale<0){
			return add(v1, v2);
		}
		return MathExtend.round(add(v1, v2),scale);
	}
	
	/**
	 * 提供精确的减法运算
	 * 
	 * @param v1 被减数
	 * @param v2 减数
	 * @return 两个参数的差
	 */
	public static double sub(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.subtract(b2).doubleValue();
	}

	/**
	 * 提供精确的减法运算
	 * @param v1 被减数
	 * @param v2 减数
	 * @param scale 指定精度，以后的数字四舍五入
	 * @return 两个参数的差
	 */
	public static double sub(double v1, double v2, int scale) {
	    if(scale<0){
	    	return sub(v1, v2);
	    }
		return round(sub(v1, v2), scale);
	}
	
	/**
	 * 提供精确的乘法运算
	 * 
	 * @param v1 被乘数
	 * @param v2 乘数
	 * @return 两个参数的积
	 */
	public static double mul(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.multiply(b2).doubleValue();
	}

	/**
	 *  提供精确的乘法运算
	 * @param v1 被乘数
	 * @param v2 乘数
	 * @param scale 指定精度，以后的数字四舍五入
	 * @return 两个参数的积
	 */
	public static double mul(double v1, double v2, int scale) {
		if(scale<0){
			return mul(v1, v2);
		}
		return round(mul(v1, v2), scale);
	}
	
	/**
	 * 提供（相对）精确的除法运算，当发生除不尽的情况时，精确到 小数点以后10位，以后的数字四舍五入
	 * 
	 * @param v1 被除数
	 * @param v2 除数
	 * @return 两个参数的商
	 */
	public static double div(double v1, double v2) {
		return div(v1, v2, DEF_DIV_SCALE);
	}

	/**
	 * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指 定精度，以后的数字四舍五入
	 * 
	 * @param v1 被除数
	 * @param v2 除数
	 * @param scale 表示表示需要精确到小数点以后几位
	 * @return 两个参数的商
	 */
	public static double div(double v1, double v2, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException("The scale must be a positive integer or zero!");
		}
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.divide(b2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 提供精确的小数位四舍五入处理
	 * 
	 * @param v 需要四舍五入的数字
	 * @param scale 小数点后保留几位
	 * @return 四舍五入后的结果
	 */
	public static double round1(double v, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException("The scale must be a positive integer or zero!");
		}
		BigDecimal b = new BigDecimal(Double.toString(v));
		BigDecimal one = new BigDecimal("1");
		return b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 提供精确的类型转换(Float)
	 * 
	 * @param v  需要被转换的数字
	 * @return 返回转换结果
	 */
	public static float convertsToFloat(double v) {
		BigDecimal b = new BigDecimal(v);
		return b.floatValue();
	}

	/**
	 * 提供精确的类型转换(Int)不进行四舍五入
	 * 
	 * @param v 需要被转换的数字
	 * @return 返回转换结果
	 */
	public static int convertsToInt(double v) {
		BigDecimal b = new BigDecimal(v);
		return b.intValue();
	}

	/**
	 * 提供精确的类型转换(Long)
	 * 
	 * @param v 需要被转换的数字
	 * @return 返回转换结果
	 */
	public static long convertsToLong(double v) {
		BigDecimal b = new BigDecimal(v);
		return b.longValue();
	}

	/**
	 * 返回两个数中大的一个值
	 * 
	 * @param v1 需要被对比的第一个数
	 * @param v2 需要被对比的第二个数
	 * @return 返回两个数中大的一个值
	 */
	public static double returnMax(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(v1);
		BigDecimal b2 = new BigDecimal(v2);
		return b1.max(b2).doubleValue();
	}

	/**
	 * 返回两个数中小的一个值
	 * 
	 * @param v1 需要被对比的第一个数
	 * @param v2 需要被对比的第二个数
	 * @return 返回两个数中小的一个值
	 */
	public static double returnMin(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(v1);
		BigDecimal b2 = new BigDecimal(v2);
		return b1.min(b2).doubleValue();
	}

	/**
	 * 精确比较两个数字
	 * 
	 * @param v1 需要被对比的第一个数
	 * @param v2 需要被对比的第二个数
	 * @return 如果两个数一样则返回0，如果第一个数比第二个数大则返回1，反之返回-1
	 */
	public static int compareTo(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(v1);
		BigDecimal b2 = new BigDecimal(v2);
		return b1.compareTo(b2);
	}
	
	/**
	 * 获取数字小数位数
	 * 
	 * @param number  数字
	 * 
	 * @return 小数位数
	 */
	public static int getDecimals(double number) {
		DecimalFormat decimalFormat = new DecimalFormat("#.####");
		String numberString = decimalFormat.format(number);
		if (numberString.indexOf(".") > 0) {
			return numberString.length() - String.valueOf(number).indexOf(".") - 1;
		} else {
			return 0;
		}
	}
	
	/**
	 * 获取数字小数位数
	 * 
	 * @param number 数字
	 * 
	 * @return 小数位数
	 */
	public static int getDecimals(float number) {
		DecimalFormat decimalFormat = new DecimalFormat("#.####");
		String numberString = decimalFormat.format(number);
		if (numberString.indexOf(".") > 0) {
			return numberString.length() - String.valueOf(number).indexOf(".") - 1;
		} else {
			return 0;
		}
	}
	
	/**
	 * 对浮点数保留几位小数（四舍五入）
	 * @param v 浮点数
	 * @param scale 表示需要精确到小数点以后几位
	 * @return 保留小数四舍五入后的值
	 */
	public static double round(double v, int scale) {
		return round(v, scale, BigDecimal.ROUND_HALF_UP);
	}
	
	/**
	 *  对浮点数保留几位小数
	 * @param v 浮点数
	 * @param scale 表示需要精确到小数点以后几位
	 * @param round_mode 舍入模式（可以调用本类的常量）
	 * @return 保留小数后的值
	 */
	public static double round(double v, int scale, int round_mode) {
		if (scale < 0) {
			throw new IllegalArgumentException("The scale must be a positive integer or zero");
		}
		BigDecimal b = new BigDecimal(Double.toString(v));
		return b.setScale(scale, round_mode).doubleValue();
	}
	    
	/**
	 * formatdata 格式化data，保留两位小数
	 * @param data 需要格式化的数据
	 * @return 返回格式化后的数据
	 */
	public static String formatdata(Double data){
		try {
			double runrate=Double.valueOf(data);
			return new DecimalFormat("#0.00").format(runrate);
		} catch (NumberFormatException e) {
			return String.valueOf(data);
		}
	}
	
	/**
	 * formatdata 格式化data为千分位，保留两位小数
	 * @param data 需要格式化的数据
	 * @return 返回格式化后的数据 如:123456789.67567 格式化后：123,456,789.68
	 */
	public static String formatdataThousandth(Double data){
		try {
			double runrate=Double.valueOf(data);
			return new DecimalFormat("#,##0.00").format(runrate);
		} catch (NumberFormatException e) {
			return String.valueOf(data);
		}
	}
	
	/**
	 * 数字的金额表达式
	 * @param num
	 * @return
	 */
	public static String convertNumToMoney(int num){
		NumberFormat formatc = NumberFormat.getCurrencyInstance(Locale.CHINA);
		String strcurr = formatc.format(num);
		//num = NumberFormat.getInstance().setParseIntegerOnly(true));
		return strcurr;
	}
	
	/**
	 * 数字的金额表达式
	 * @param num
	 * @return
	 */
	public static String convertNumToMoney(Double num){
		NumberFormat formatc = NumberFormat.getCurrencyInstance(Locale.CHINA);
		String strcurr = formatc.format(num);
		return strcurr;
	}
	
	
	
	/**
	 * 提供（为解决科学计数法问题）精确的除法运算。
	 * 
	 * @param v1 被除数
	 * @param v2 除数
	 * @return 两个参数的商
	 */
	public static String divForString(String v1, String v2) {
		
		BigDecimal b1 = new BigDecimal(v1);
		BigDecimal b2 = new BigDecimal(v2);
		return b1.divide(b2, 10, BigDecimal.ROUND_HALF_UP).stripTrailingZeros().toPlainString();
	}
	
	public static void main(String[] args) {
		/*double d= MathExtend.round(3*1.0/13, 2);
		System.out.println("---------"+d);*/
		
		System.out.println(convertNumToMoney(12345));
	}
}
