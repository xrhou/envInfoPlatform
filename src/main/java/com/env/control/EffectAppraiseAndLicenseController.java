package com.env.control;

import com.env.entity.EffectAppraiseAndLicense;
import com.env.service.IEffectAppraiseAndLicenseManager;
import com.env.service.IEntUserManager;
import com.env.service.IEntpriseManager;
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
 * 环境影响评价及其他环境保护行政许可情况
 *
 * @author hbj403
 */
@Controller
public class EffectAppraiseAndLicenseController {

    @Resource(name = "entUserManager")
    private IEntUserManager entUserManager;

    @Resource(name = "entpriseManager")
    private IEntpriseManager entpriseManager;

    @Resource(name = "effectAppraiseAndLicenseManager")
    private IEffectAppraiseAndLicenseManager effectAppraiseAndLicenseManager;

    /**
     * 初始化加载环境影响评价及其他环境保护行政许可情况
     *
     * @param request
     * @param response
     */
    @RequestMapping("/jsonfindffectAppraiseAndLicenseByEntUserId")
    private void jsonfindffectAppraiseAndLicenseByEntUserId(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        System.out.println("jsonfindffectAppraiseAndLicenseByEntUserId---:" + entUserId);
        JSONObject datas = null;
        try {
            datas = effectAppraiseAndLicenseManager.getJSON(entUserId);
            System.out.println("企业影响评价及其他环境保护行政许可情况jsonfindByEntUserId---:" + datas.toString());
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

    @RequestMapping("/getEffectAppraiseAndLicense")
    private void getEffectAppraiseAndLicense(HttpServletRequest request, HttpServletResponse response) {
        String effectLicenseId = request.getParameter("effectLicenseId");
        try {
            if (null != effectLicenseId) {
                EffectAppraiseAndLicense effectAppraiseAndLicense = effectAppraiseAndLicenseManager.getEffectAppraiseAndLicense(effectLicenseId);
                request.setAttribute("effectAppraiseAndLicense", effectAppraiseAndLicense);
                request.getRequestDispatcher("admin_updateEffectLicense.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateEffectAppraiseAndLicense")
    public void updateEffectAppraiseAndLicense(HttpServletRequest request, HttpServletResponse response) {
        String effectLicenseId = request.getParameter("effectLicenseId");
        String buildingName = request.getParameter("buildingName");
        String eiaUnits = request.getParameter("eiaUnits");
        String eiaDate = request.getParameter("eiaDate");
        String eiaDocNumber = request.getParameter("eiaDocNumber");
        String completedUnit = request.getParameter("completedUnit");
        String completedTime = request.getParameter("completedTime");
        String completedDocNumber = request.getParameter("completedDocNumber");
        String otherSituation = request.getParameter("otherSituation");

        EffectAppraiseAndLicense effectAppraiseAndLicense = effectAppraiseAndLicenseManager.getEffectAppraiseAndLicense(effectLicenseId);
        if (null != effectAppraiseAndLicense) {
            effectAppraiseAndLicense.setBuildingName(buildingName);
            effectAppraiseAndLicense.setEiaUnits(eiaUnits);
            effectAppraiseAndLicense.setEiaDate(eiaDate);
            effectAppraiseAndLicense.setEiaDocNumber(eiaDocNumber);
            effectAppraiseAndLicense.setCompletedUnit(completedUnit);
            effectAppraiseAndLicense.setCompletedTime(completedTime);
            effectAppraiseAndLicense.setCompletedDocNumber(completedDocNumber);
            effectAppraiseAndLicense.setOtherSituation(otherSituation);
            effectAppraiseAndLicenseManager.updateEffectAppraiseAndLicense(effectAppraiseAndLicense);
        }
        responseMessage(response);
    }


    @RequestMapping("/addEffectAppraiseAndLicense")
    private void addEffectAppraiseAndLicense(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        String BuildingName = request.getParameter("BuildingName");
        String EiaUnits = request.getParameter("EiaUnits");
        String EiaDate = request.getParameter("EiaDate");
        String EiaDocNumber = request.getParameter("EiaDocNumber");
        String CompletedUnit = request.getParameter("CompletedUnit");
        String CompletedTime = request.getParameter("CompletedTime");
        String CompletedDocNumber = request.getParameter("CompletedDocNumber");
        String otherSituation = request.getParameter("otherSituation");

        EffectAppraiseAndLicense effectAppraiseAndLicense = new EffectAppraiseAndLicense();
        effectAppraiseAndLicense.setEntUserId(entUserId);
        effectAppraiseAndLicense.setBuildingName(BuildingName);
        effectAppraiseAndLicense.setEiaUnits(EiaUnits);
        effectAppraiseAndLicense.setEiaDate(EiaDate);
        effectAppraiseAndLicense.setEiaDocNumber(EiaDocNumber);
        effectAppraiseAndLicense.setCompletedUnit(CompletedUnit);
        effectAppraiseAndLicense.setCompletedTime(CompletedTime);
        effectAppraiseAndLicense.setCompletedDocNumber(CompletedDocNumber);
        effectAppraiseAndLicense.setCompletedDocNumber(CompletedDocNumber);
        effectAppraiseAndLicense.setOtherSituation(otherSituation);

        if (null != effectAppraiseAndLicense) {
            effectAppraiseAndLicenseManager.addEffectAppraiseAndLicense(effectAppraiseAndLicense);
        }
        responseMessage(response);
    }

    @RequestMapping("/watchEffectAppraiseAndLicense")
    private void watchEffectAppraiseAndLicense(HttpServletRequest request, HttpServletResponse response) {
        String effectLicenseId = request.getParameter("effectLicenseId");
        try {
            if (null != effectLicenseId) {
                EffectAppraiseAndLicense effectAppraiseAndLicense = effectAppraiseAndLicenseManager.getEffectAppraiseAndLicense(effectLicenseId);
                request.setAttribute("effectAppraiseAndLicense", effectAppraiseAndLicense);
                request.getRequestDispatcher("admin_watchEffectLicense.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteEffectAppraiseAndLicenseByEffectLicenseId")
    private void deleteEffectAppraiseAndLicenseByEffectLicenseId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String effectLicenseId = request.getParameter("effectLicenseId");
        String data = "";
        try {
            System.out.println("要删除的记录effectLicenseId:" + effectLicenseId);
            if (effectAppraiseAndLicenseManager.delEffectAppraiseAndLicense(effectLicenseId)) {//删除数据
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
