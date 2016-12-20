/**
 * 
 */
package com.sysoa.util;

/**
 * 
 * @author zhai
 * 
 * 2016-10-23 下午9:26:35
 */
public class QStringUtil {

	/**
	 * URL截取
	 * @param s "/asd/asd/asd"
	 * @return  "/asd"
	 */
	public static String subStringUrl(String s) {

		int count = countStr(s, "/");

		return count > 1 ? s.substring(0, s.indexOf("/", s.indexOf("/") + 1))
				: s;

	}

	/**
	 * 字符串s2在s1中的个数
	 * 
	 * @param str1
	 * @param str2
	 * @return
	 */

	public static int countStr(String str1, String str2) {
		int counter = 0;
		if (str1.indexOf(str2) == -1) {
			return 0;
		}
		while (str1.indexOf(str2) != -1) {
			counter++;
			str1 = str1.substring(str1.indexOf(str2) + str2.length());
		}
		return counter;
	}

	public static void main(String[] args) {

		String str = "/aasd/asdasd";
		String str1 = "M:\\WORKSPACE\\eclipse_neon\\sysoa\\WebRoot\\swf\\20161208145304.swf";
		
	
	
		System.out.println(subStringUrl(str));
		System.out.println(str1.substring(str1.indexOf("swf"), str1.length()));

	}
}
