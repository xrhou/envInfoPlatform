package com.env.control;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EasyUIDataController {

    @RequestMapping("/getEasyUIData")
    public void getEasyUIData(HttpServletRequest request, HttpServletResponse response) {
        try {
            // JSON格式数据解析对象
            JSONObject jo = new JSONObject();

            // 下面构造两个map、一个list
            Map<String, String> map1 = new HashMap<String, String>();
            map1.put("firstname", "houxiurong1");
            map1.put("lastname", "xrhou1");
            map1.put("phone", "1231231");
            map1.put("email", "a123123@126.com");

            Map<String, String> map2 = new HashMap<String, String>();
            map2.put("firstname", "houxiurong2");
            map2.put("lastname", "xrhou2");
            map2.put("phone", "1231232");
            map2.put("email", "b123123@126.com");

            Map<String, String> map3 = new HashMap<String, String>();
            map3.put("firstname", "houxiurong3");
            map3.put("lastname", "xrhou3");
            map3.put("phone", "12312323");
            map3.put("email", "c123123@126.com");

            List<Map> list = new ArrayList<Map>();
            list.add(map1);
            list.add(map2);
            list.add(map3);

            // 将List转换为JSONArray数据
            JSONArray ja2 = JSONArray.fromObject(list);

            System.out.println("JSONArray对象数据格式：");
            System.out.println(ja2.toString());

            // 构造Json数据，包括一个map和一个Employee对象
            jo.put("total", 30);
            jo.put("rows", ja2);
            System.out.println("\n最终构造的JSON数据格式：");
            System.out.println(jo.toString());

            String datas = jo.toString();
            PrintWriter out = response.getWriter();
            out.write(datas);
            System.out.println("getEasyUIData:" + datas);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static void main(String[] args) {
        // JSON格式数据解析对象
        JSONObject jo = new JSONObject();

        // 下面构造两个map、一个list
        Map<String, String> map1 = new HashMap<String, String>();
        map1.put("firstname", "houxiurong1");
        map1.put("lastname", "xrhou1");
        map1.put("phone", "1231231");
        map1.put("email", "a123123@126.com");

        Map<String, String> map2 = new HashMap<String, String>();
        map2.put("firstname", "houxiurong2");
        map2.put("lastname", "xrhou2");
        map2.put("phone", "1231232");
        map2.put("email", "b123123@126.com");

        Map<String, String> map3 = new HashMap<String, String>();
        map3.put("firstname", "houxiurong3");
        map3.put("lastname", "xrhou3");
        map3.put("phone", "12312323");
        map3.put("email", "c123123@126.com");

        List<Map> list = new ArrayList<Map>();
        list.add(map1);
        list.add(map2);
        list.add(map3);

        // 将List转换为JSONArray数据
        JSONArray ja2 = JSONArray.fromObject(list);

        System.out.println("JSONArray对象数据格式：");
        System.out.println(ja2.toString());

        // 构造Json数据，包括一个map和一个Employee对象
        jo.put("total", 2);
        jo.put("rows", ja2);
        System.out.println("\n最终构造的JSON数据格式：");
        System.out.println(jo.toString());
    }
}
