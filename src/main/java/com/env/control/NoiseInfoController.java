package com.env.control;

import com.env.entity.NoiseInfo;
import com.env.service.IEntpriseManager;
import com.env.service.INoiseInfoManager;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

/**
 * 固体废物信息
 *
 * @author hbj403
 */
@Controller
public class NoiseInfoController {
    @Resource(name = "entpriseManager")
    private IEntpriseManager entpriseManager;

    @Resource(name = "noiseInfoManager")
    private INoiseInfoManager noiseInfoManager;

    /**
     * 初始化加载运行设备情况信息
     *
     * @param request
     * @param response
     */
    @RequestMapping("/jsonfindAllNoiseInfoByEntUserId")
    private void jsonfindAllNoiseInfoByEntUserId(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        JSONObject datas = null;
        try {
            datas = noiseInfoManager.getJSON(entUserId);
            PrintWriter out = response.getWriter();
            out.write(datas.toString());
            System.out.println("固体废物数据获取:" + datas.toString());
            out.flush();
            out.close();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/addNoiseInfoByNoiseInfoId")
    private void addNoiseInfoByNoiseInfoId(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        String location = request.getParameter("location");
        String dBValueDay = request.getParameter("dBValueDay");
        String dBValueNight = request.getParameter("dBValueNight");
        String noiseValueDay = request.getParameter("noiseValueDay");
        String noiseValueNight = request.getParameter("noiseValueNight");
        String overSituation = request.getParameter("overSituation");

        NoiseInfo noiseInfo = new NoiseInfo();
        noiseInfo.setEntUserId(entUserId);
        noiseInfo.setLocation(location);
        noiseInfo.setdBValueDay(dBValueDay);
        noiseInfo.setdBValueNight(dBValueNight);
        noiseInfo.setNoiseValueDay(noiseValueDay);
        noiseInfo.setNoiseValueNight(noiseValueNight);
        noiseInfo.setOverSituation(overSituation);

        if (null != noiseInfo) {
            noiseInfoManager.addNoiseInfo(noiseInfo);
            ;
        }
        responseMessage(response);
    }

    @RequestMapping("/getNoiseInfoByNoiseInfoId")
    private void getNoiseInfoByNoiseInfoId(HttpServletRequest request, HttpServletResponse response) {
        String noiseInfoId = request.getParameter("noiseInfoId");
        System.out.println("=============noiseInfoId===============" + noiseInfoId);
        try {
            if (null != noiseInfoId) {
                NoiseInfo noiseInfo = noiseInfoManager.getNoiseInfoByNoiseInfoId(noiseInfoId);
                request.setAttribute("noiseInfo", noiseInfo);
                request.getRequestDispatcher("admin_updateNoiseInfo.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateNoiseInfoByNoiseInfoId")
    public void updateNoiseInfoByNoiseInfoId(HttpServletRequest request, HttpServletResponse response) {
        String noiseInfoId = request.getParameter("noiseInfoId");

        String entUserId = request.getParameter("entUserId");
        String location = request.getParameter("location");
        String dBValueDay = request.getParameter("dBValueDay");
        String dBValueNight = request.getParameter("dBValueNight");
        String noiseValueDay = request.getParameter("noiseValueDay");
        String noiseValueNight = request.getParameter("noiseValueNight");
        String overSituation = request.getParameter("overSituation");

        NoiseInfo noiseInfo = noiseInfoManager.getNoiseInfoByNoiseInfoId(noiseInfoId);
        if (null != noiseInfo) {
            noiseInfo.setEntUserId(entUserId);
            noiseInfo.setLocation(location);
            noiseInfo.setdBValueDay(dBValueDay);
            noiseInfo.setdBValueNight(dBValueNight);
            noiseInfo.setNoiseValueDay(noiseValueDay);
            noiseInfo.setNoiseValueNight(noiseValueNight);
            noiseInfo.setOverSituation(overSituation);
            noiseInfoManager.updateNoiseInfoByNoiseInfoId(noiseInfo);
        }
        responseMessage(response);
    }

    @RequestMapping("/watchNoiseInfoByNoiseInfoId")
    private void watchNoiseInfoByNoiseInfoId(HttpServletRequest request, HttpServletResponse response) {
        String noiseInfoId = request.getParameter("noiseInfoId");
        System.out.println("=============noiseInfoId===============" + noiseInfoId);
        try {
            if (null != noiseInfoId) {
                NoiseInfo noiseInfo = noiseInfoManager.getNoiseInfoByNoiseInfoId(noiseInfoId);
                request.setAttribute("noiseInfo", noiseInfo);
                request.getRequestDispatcher("admin_watchNoiseInfo.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteNoiseInfoByNoiseInfoId")
    private void deleteNoiseInfoByNoiseInfoId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String noiseInfoId = request.getParameter("noiseInfoId");
        String data = "";
        try {
            System.out.println("要删除的记录noiseInfoId:" + noiseInfoId);
            if (noiseInfoManager.delNoiseInfoByNoiseInfoId(noiseInfoId)) {//删除数据
                data = "success";
            } else {
                data = "fail";
            }
        } catch (Exception e) {
            e.printStackTrace();
            data = "fail";
        }
        response.getWriter().write(data);
    }

    private void responseMessage(HttpServletResponse response) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=" + "utf-8");
        Writer writer = null;
        try {
            writer = response.getWriter();
            writer.write("success");
            writer.flush();
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                writer.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
