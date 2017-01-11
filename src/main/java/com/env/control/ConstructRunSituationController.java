package com.env.control;

import com.env.entity.ConstructRunSituation;
import com.env.service.IConstructRunSituationManager;
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
 * 防治污染设施的建设和运行情况
 *
 * @author hbj403
 */
@Controller
public class ConstructRunSituationController {

    @Resource(name = "entUserManager")
    private IEntUserManager entUserManager;

    @Resource(name = "entpriseManager")
    private IEntpriseManager entpriseManager;

    @Resource(name = "constructRunSituationManager")
    private IConstructRunSituationManager constructRunSituationManager;

    /**
     * 初始化加载运行设备情况信息
     *
     * @param request
     * @param response
     */
    @RequestMapping("/jsonfindAllconstructRunSituationByEntUserId")
    private void jsonfindAllconstructRunSituationByEntUserId(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        JSONObject datas = null;
        try {
            datas = constructRunSituationManager.getJSON(entUserId);
            PrintWriter out = response.getWriter();
            out.write(datas.toString());
            System.out.println("污染物设施情况:" + datas.toString());
            out.flush();
            out.close();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/addConstructRunSituation")
    private void addConstructRunSituation(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        String facilityClass = request.getParameter("facilityClass");
        String facilityName = request.getParameter("facilityName");
        String handleAbulity = request.getParameter("handleAbulity");
        String operatorUnit = request.getParameter("operatorUnit");
        String runStation = request.getParameter("runStation");
        String runTime = request.getParameter("runTime");

        ConstructRunSituation constructRunSituation = new ConstructRunSituation();
        constructRunSituation.setEntUserId(entUserId);
        constructRunSituation.setFacilityClass(facilityClass);
        constructRunSituation.setFacilityName(facilityName);
        constructRunSituation.setHandleAbulity(handleAbulity);
        constructRunSituation.setOperatorUnit(operatorUnit);
        constructRunSituation.setRunStation(runStation);
        constructRunSituation.setRunTime(runTime);

        if (null != constructRunSituation) {
            constructRunSituationManager.addConstructRunSituation(constructRunSituation);
        }
        responseMessage(response);
    }

    @RequestMapping("/getConstructRunSituationBycrunSid")
    private void getConstructRunSituationBycrunSid(HttpServletRequest request, HttpServletResponse response) {
        String crunSid = request.getParameter("crunSid");
        try {
            if (null != crunSid) {
                ConstructRunSituation constructRunSituation = constructRunSituationManager.getConstructRunSituationByCrun(crunSid);
                request.setAttribute("constructRunSituation", constructRunSituation);
                request.getRequestDispatcher("admin_updatefacility.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateConstructRunSituation")
    public void updateConstructRunSituation(HttpServletRequest request, HttpServletResponse response) {
        String crunSid = request.getParameter("crunSid");
        String facilityClass = request.getParameter("facilityClass");
        String facilityName = request.getParameter("facilityName");
        String handleAbulity = request.getParameter("handleAbulity");
        String operatorUnit = request.getParameter("operatorUnit");
        String runStation = request.getParameter("runStation");
        String runTime = request.getParameter("runTime");

        ConstructRunSituation constructRunSituation = constructRunSituationManager.getConstructRunSituationByCrun(crunSid);
        if (null != constructRunSituation) {
            constructRunSituation.setCrunSid(crunSid);
            constructRunSituation.setFacilityClass(facilityClass);
            constructRunSituation.setFacilityName(facilityName);
            constructRunSituation.setHandleAbulity(handleAbulity);
            constructRunSituation.setOperatorUnit(operatorUnit);
            constructRunSituation.setRunStation(runStation);
            constructRunSituation.setRunTime(runTime);
            constructRunSituationManager.updateConstructRunSituation(constructRunSituation);
        }
        responseMessage(response);
    }

    @RequestMapping("/watchConstructRunSituation")
    private void watchConstructRunSituation(HttpServletRequest request, HttpServletResponse response) {
        String crunSid = request.getParameter("crunSid");
        try {
            if (null != crunSid) {
                ConstructRunSituation constructRunSituation = constructRunSituationManager.getConstructRunSituationByCrun(crunSid);
                request.setAttribute("constructRunSituation", constructRunSituation);
                request.getRequestDispatcher("admin_watchfacility.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteConstructRunSituationBycrunSid")
    private void deleteConstructRunSituationBycrunSid(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String crunSid = request.getParameter("crunSid");
        String data = "";
        try {
            System.out.println("要删除的记录crunSid:" + crunSid);
            if (constructRunSituationManager.delConstructRunSituation(crunSid)) {//删除数据
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
