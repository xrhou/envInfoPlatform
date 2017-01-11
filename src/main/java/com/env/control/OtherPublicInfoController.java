package com.env.control;

import com.env.entity.OtherPublicInfo;
import com.env.service.IEntUserManager;
import com.env.service.IEntpriseManager;
import com.env.service.IOtherPublicInfoManager;
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
 * 企业其他监测信息
 *
 * @author hbj403
 */
@Controller
public class OtherPublicInfoController {
    @Resource(name = "entUserManager")
    private IEntUserManager entUserManager;

    @Resource(name = "entpriseManager")
    private IEntpriseManager entpriseManager;

    @Resource(name = "otherPublicInfoManager")
    private IOtherPublicInfoManager otherPublicInfoManager;

    @RequestMapping("/addOtherPublicInfo")
    private void addOtherPublicInfo(HttpServletRequest request, HttpServletResponse response) {
        String otherPollutionName = request.getParameter("otherPollutionName");
        String otherTime = request.getParameter("otherTime");
        String entUserId = request.getParameter("entUserId");
        String otherPollutionDetail = request.getParameter("otherPollutionDetail");
        OtherPublicInfo otherPublicInfo = new OtherPublicInfo();
        otherPublicInfo.setEntUserId(entUserId);
        otherPublicInfo.setOtherTime(otherTime);
        otherPublicInfo.setOtherPollutionName(otherPollutionName);
        otherPublicInfo.setOtherPollutionDetail(otherPollutionDetail);
        if (null != otherPublicInfo) {
            otherPublicInfoManager.addOtherPublicInfo(otherPublicInfo);
        }
        responseMessage(response);
    }

    @RequestMapping("/updateOtherPublicInfo")
    private void updateOtherPublicInfo(HttpServletRequest request, HttpServletResponse response) {
        String otherInfoId = request.getParameter("otherInfoId");
        String otherPollutionName = request.getParameter("otherPollutionName");
        String otherTime = request.getParameter("otherTime");
        String otherPollutionDetail = request.getParameter("otherPollutionDetail");

        OtherPublicInfo otherPublicInfo = otherPublicInfoManager.getOtherPublicInfo(otherInfoId);
        if (null != otherPublicInfo) {
            otherPublicInfo.setOtherTime(otherTime);
            otherPublicInfo.setOtherPollutionName(otherPollutionName);
            otherPublicInfo.setOtherPollutionDetail(otherPollutionDetail);
            otherPublicInfoManager.updateOtherPublicInfo(otherPublicInfo);

        }
        responseMessage(response);
    }

    /**
     * 初始化加载企业其他监测信息
     *
     * @param request
     * @param response
     */
    @RequestMapping("/jsonfindOtherPublicInfoByEntUserId")
    private void jsonfindOtherPublicInfoByEntUserId(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        System.out.println("jsonfindEmergencyPlanByEntUserId---:" + entUserId);
        JSONObject datas = null;
        try {
            datas = otherPublicInfoManager.getJSON(entUserId);
            System.out.println("企业其他监测信息jsonfindByEntUserId---:" + datas.toString());
            PrintWriter out = response.getWriter();
            out.write(datas.toString());
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/getOtherPublicInfo")
    public void getOtherPublicInfo(HttpServletRequest request, HttpServletResponse response) {
        String otherInfoId = request.getParameter("otherInfoId");
        System.out.println("=============OtherInfoId===============" + otherInfoId);
        try {
            if (null != otherInfoId) {
                OtherPublicInfo otherPublicInfo = otherPublicInfoManager.getOtherPublicInfo(otherInfoId);
                request.setAttribute("otherPublicInfo", otherPublicInfo);
                ;
                request.getRequestDispatcher("detailOtherInfo.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/watchOtherPublicInfo")
    public void watchOtherPublicInfo(HttpServletRequest request, HttpServletResponse response) {
        String otherInfoId = request.getParameter("otherInfoId");
        System.out.println("=============OtherInfoId===============" + otherInfoId);
        try {
            if (null != otherInfoId) {
                OtherPublicInfo otherPublicInfo = otherPublicInfoManager.getOtherPublicInfo(otherInfoId);
                request.setAttribute("otherPublicInfo", otherPublicInfo);
                ;
                request.getRequestDispatcher("admin_watchOtherInfo.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteOtherPublicInfoByOtherInfoId")
    private void deleteOtherPublicInfoByOtherInfoId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String otherInfoId = request.getParameter("otherInfoId");
        String data = "";
        try {
            System.out.println("要删除的记录otherInfoId:" + otherInfoId);
            if (otherPublicInfoManager.delOtherPublicInfo(otherInfoId)) {//删除数据
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
