package com.env.control;

import com.env.entity.SolidWaste;
import com.env.service.IEntpriseManager;
import com.env.service.ISolidWasteManager;
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
public class SolidWasteController {
    @Resource(name = "entpriseManager")
    private IEntpriseManager entpriseManager;

    @Resource(name = "solidWasteManager")
    private ISolidWasteManager solidWasteManager;

    /**
     * 初始化加载运行设备情况信息
     *
     * @param request
     * @param response
     */
    @RequestMapping("/jsonfindAllSolidWasteByEntUserId")
    private void jsonfindAllSolidWasteByEntUserId(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        JSONObject datas = null;
        try {
            datas = solidWasteManager.getJSON(entUserId);
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

    @RequestMapping("/addSolidWasteBySolidWasteId")
    private void addSolidWasteBySolidWasteId(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        String wasteName = request.getParameter("wasteName");
        String isDanger = request.getParameter("isDanger");
        String handleType = request.getParameter("handleType");
        String handleNumber = request.getParameter("handleNumber");
        String handleDirection = request.getParameter("handleDirection");

        SolidWaste solidWaste = new SolidWaste();
        solidWaste.setEntUserId(entUserId);
        solidWaste.setWasteName(wasteName);
        solidWaste.setIsDanger(isDanger);
        solidWaste.setHandleType(handleType);
        solidWaste.setHandleNumber(handleNumber);
        solidWaste.setHandleDirection(handleDirection);

        if (null != solidWaste) {
            solidWasteManager.addSolidWaste(solidWaste);
        }
        responseMessage(response);
    }

    @RequestMapping("/getSolidWasteBySolidWasteId")
    private void getSolidWasteBySolidWasteId(HttpServletRequest request, HttpServletResponse response) {
        String solidWasteId = request.getParameter("solidWasteId");
        System.out.println("=============solidWasteId===============" + solidWasteId);
        try {
            if (null != solidWasteId) {
                SolidWaste solidWaste = solidWasteManager.getSolidWasteBysolidWasteId(solidWasteId);
                request.setAttribute("solidWaste", solidWaste);
                request.getRequestDispatcher("admin_updateSolidWaste.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/updateSolidWasteBySolidWasteId")
    public void updateSolidWasteBySolidWasteId(HttpServletRequest request, HttpServletResponse response) {
        String solidWasteId = request.getParameter("solidWasteId");

        String entUserId = request.getParameter("entUserId");
        String wasteName = request.getParameter("wasteName");
        String isDanger = request.getParameter("isDanger");
        String handleType = request.getParameter("handleType");
        String handleNumber = request.getParameter("handleNumber");
        String handleDirection = request.getParameter("handleDirection");

        SolidWaste solidWaste = solidWasteManager.getSolidWasteBysolidWasteId(solidWasteId);
        if (null != solidWaste) {
            solidWaste.setEntUserId(entUserId);
            ;
            solidWaste.setWasteName(wasteName);
            solidWaste.setIsDanger(isDanger);
            solidWaste.setHandleType(handleType);
            solidWaste.setHandleNumber(handleNumber);
            solidWaste.setHandleDirection(handleDirection);
            solidWasteManager.updateSolidWaste(solidWaste);
        }
        responseMessage(response);
    }

    @RequestMapping("/watchSolidWasteBySolidWasteId")
    private void watchSolidWasteBySolidWasteId(HttpServletRequest request, HttpServletResponse response) {
        String solidWasteId = request.getParameter("solidWasteId");
        System.out.println("=============solidWasteId===============" + solidWasteId);
        try {
            if (null != solidWasteId) {
                SolidWaste solidWaste = solidWasteManager.getSolidWasteBysolidWasteId(solidWasteId);
                request.setAttribute("solidWaste", solidWaste);
                request.getRequestDispatcher("admin_watchSolidWaste.jsp").forward(request, response);
            }
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteSolidWasteBySolidWasteId")
    private void deleteSolidWasteBySolidWasteId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String solidWasteId = request.getParameter("solidWasteId");
        String data = "";
        try {
            System.out.println("要删除的记录solidWasteId:" + solidWasteId);
            if (solidWasteManager.delSolidWasteBysolidWasteId(solidWasteId)) {//删除数据
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
