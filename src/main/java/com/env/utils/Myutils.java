package com.env.utils;


import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.*;

/**
 * 其它常用工具类
 *
 * @author xrhou
 */
public class Myutils {

    /**
     * 从constant.properties文件中读取属性值
     *
     * @param propertyName 属性名称
     * @return
     */
    public static String getProperty(String propertyName) {
        String propertyValue = "";
        String propFileName = "constant.properties";
        //使用java.lang.ClassLoader类的getSystemResourceAsStream()静态方法
        //InputStream in = ClassLoader.getSystemResourceAsStream(propFileName);
        Properties p = new Properties();
        try {
            /*p.load(in);*/
            p.load(Thread.currentThread().getContextClassLoader().getResourceAsStream(propFileName));
            propertyValue = p.getProperty(propertyName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return propertyValue;
    }

    /**
     * 输出对象成员变量值
     *
     * @param obj
     * @return
     */
    public static String getObjectString(Object obj) {
        if (obj == null) {
            return null;
        }
        try {
            //Method[] methods = obj.getClass().getDeclaredMethods();
            Method[] methods = obj.getClass().getMethods();
            StringBuffer buf = new StringBuffer();
            for (int i = 0; i < methods.length; i++) {
                Method method = methods[i];
                if (method.getName().startsWith("get") && !method.getName().equals("getClass") || method.getName().startsWith("is")) {
                    try {
                        buf.append(method.getName()).append("=")
                                .append(method.invoke(obj, (Object[]) null))
                                .append(", ");
                    } catch (Exception e) {
                    }
                }
            }
            return buf.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 判断一个集合是否为空
     *
     * @param collection
     * @return
     */
    public static boolean isEmpty(Collection collection) {
        return collection == null || collection.isEmpty();
    }

    /**
     * 判断一个map是否为空
     *
     * @param map
     * @return
     */
    public static boolean isEmpty(Map map) {
        return map == null || map.isEmpty();
    }

    /**
     * 判断一个array是否为空
     *
     * @param array
     * @return
     */
    public static boolean isEmpty(Object[] array) {
        return array == null || array.length == 0;
    }

    /**
     * System.out.println输出相关信息
     *
     * @param msg
     */
    public static void println(String msg) {
        Boolean testFlag = new Boolean(Myutils.getProperty("TEST_FLAG"));
        if (testFlag) {
            System.out.println(msg);
        }
    }

    /**
     * 打印Map信息
     *
     * @param map
     */
    public static void printMap(Map map) {
        Myutils.println("Print Map");
        if (map != null) {
            Iterator iter = map.entrySet().iterator();
            while (iter.hasNext()) {
                Map.Entry entry = (Map.Entry) iter.next();
                try {
                    System.out.println(entry.getKey() + "="
                            + Arrays.toString((String[]) entry.getValue()));
                } catch (Exception e) {
                    System.out.println(entry.getKey() + "=" + entry.getValue());
                }
            }
        }
        Myutils.println("Print End");
    }

    /**
     * 打印集合信息
     *
     * @param col
     */
    public static void printCollection(Collection col) {
        Myutils.println("Print Colllection");
        if (col != null) {
            System.out.println(Arrays.toString(col.toArray()));
        }
        Myutils.println("Print End");
    }

    /**
     * 获取访问者IP
     * <p>
     * 在一般情况下使用Request.getRemoteAddr()即可，但是经过nginx等反向代理软件后，这个方法会失效。
     * <p>
     * 本方法先从Header中获取X-Real-IP，如果不存在再从X-Forwarded-For获得第一个IP(用,分割)，
     * 如果还不存在则调用Request .getRemoteAddr()。
     *
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("X-Real-IP");
        if (!StringUtils.isEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {
            return ip;
        }
        ip = request.getHeader("X-Forwarded-For");
        if (!StringUtils.isEmpty(ip) && !"unknown".equalsIgnoreCase(ip)) {
            // 多次反向代理后会有多个IP值，第一个为真实IP。
            int index = ip.indexOf(',');
            if (index != -1) {
                return ip.substring(0, index);
            } else {
                return ip;
            }
        } else {
            return request.getRemoteAddr();
        }
    }

}
