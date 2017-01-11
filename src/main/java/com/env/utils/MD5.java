package com.env.utils;

import org.apache.commons.codec.digest.DigestUtils;


/**
 * 加密工具
 *
 * @author xrhou
 * @date 2014-11-27 09:40
 */
public class MD5 {

    /**
     * 加密为MD5
     *
     * @param str
     * @return
     */
    public static String toMD5(String str) {
        return DigestUtils.md5Hex(str);
    }

    private static String byte2Hex(byte[] b) {
        StringBuffer sb = new StringBuffer();
        String tmp = "";
        for (int i = 0; i < b.length; i++) {
            tmp = Integer.toHexString(b[i] & 0XFF);
            if (tmp.length() == 1)
                sb.append("0");
            sb.append(tmp);
        }
        return sb.toString().toUpperCase();
    }

    /**
     * MD5加密
     *
     * @param str
     * @return MD5String
     */
    public static String md5(String str) {
        return DigestUtils.md5Hex(str);
    }

    public void test() {
        String sss = MD5.md5("123456");
        System.out.println(sss);
        System.out.println(md5("123456hxr"));
        System.out.println(md5("侯秀荣"));
        System.out.println(md5("ASDEFADSF"));
        //System.out.println(sss.substring(0,sss.length()-2 ));
        //System.out.println(MD5.md5("123456").lastIndexOf("="));
        //System.out.println(MD5.md5("09012326"));
        //String s2=MD5.md5("09012326");
        //	System.out.println(s2.substring(0, s2.length()-2));
        System.out.println(MD5.toMD5("123456"));
    }
}
