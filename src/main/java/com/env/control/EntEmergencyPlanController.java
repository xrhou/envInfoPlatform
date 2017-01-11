package com.env.control;

import com.env.entity.EmergencyPlan;
import com.env.service.IEmergencyPlanManager;
import com.env.service.IEntUserManager;
import com.env.service.IEntpriseManager;
import com.env.service.IOperationLogManager;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Iterator;

/**
 * 环境突发应急预案
 *
 * @author hbj403
 */
@Controller
public class EntEmergencyPlanController {
    @Resource(name = "entUserManager")
    private IEntUserManager entUserManager;

    @Resource(name = "entpriseManager")
    private IEntpriseManager entpriseManager;

    @Resource(name = "emergencyPlanManager")
    private IEmergencyPlanManager emergencyPlanManager;

    @Resource(name = "operationLogManager")
    private IOperationLogManager operationLogManager;

    @RequestMapping("/getEmergencyPlanById")
    public void getEmergencyPlanById(HttpServletRequest request, HttpServletResponse response) {
        String emergencyPlanId = request.getParameter("emergencyPlanId");
        System.out.println("==================emergencyPlanId:" + emergencyPlanId);
        try {
            EmergencyPlan emergencyPlan = emergencyPlanManager.getEmergencyPlanId(emergencyPlanId);
            request.setAttribute("emergencyPlan", emergencyPlan);
            request.getRequestDispatcher("admin_updateSelfEmergencyPlan.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/watchEmergencyPlanByEmergencyPlanId")
    public void watchEmergencyPlanByEmergencyPlanId(HttpServletRequest request, HttpServletResponse response) {
        String emergencyPlanId = request.getParameter("emergencyPlanId");
        System.out.println("==================emergencyPlanId:" + emergencyPlanId);
        try {
            EmergencyPlan emergencyPlan = emergencyPlanManager.getEmergencyPlanId(emergencyPlanId);
            request.setAttribute("emergencyPlan", emergencyPlan);
            request.getRequestDispatcher("admin_showSelfEmergencyPlan.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/deleteEmergencyPlanByReportId")
    public void deleteEmergencyPlanByReportId(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("in to deleteEmergencyPlanByReportId...");
        String emergencyPlanId = (null == request.getParameter("emergencyPlanId") || "".equals(request.getParameter("emergencyPlanId"))) ? null : request.getParameter("emergencyPlanId");
        String data = "";
        try {
            //删除数据
            System.out.println("要删除的应急预案记录:" + emergencyPlanId);
            if (emergencyPlanManager.delEmergencyPlan(emergencyPlanId)) {
                data = "success";
            } else {
                data = "fail";
            }
        } catch (Exception e) {
            e.printStackTrace();
            data = "fail";
        }
        request.setAttribute("data", data);
        response.getWriter().write(data);
    }


    /**
     * 初始化加载企业自行监测报告
     *
     * @param request
     * @param response
     */
    @RequestMapping("/jsonfindEmergencyPlanByEntUserId")
    private void jsonfindEmergencyPlanByEntUserId(HttpServletRequest request, HttpServletResponse response) {
        String entUserId = request.getParameter("entUserId");
        System.out.println("突发应急预案jsonfindEmergencyPlanByEntUserId---:" + entUserId);
        JSONObject datas = null;
        try {
            datas = emergencyPlanManager.getJSONByentUserId(entUserId);
            System.out.println("突发应急预案jsonfindByEntUserId---:" + datas.toString());
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


    @RequestMapping("/addEmergencyPlan")
    public void addEmergencyPlan(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
        System.out.println("addEmergencyPlan start work.....");
        String realpath = request.getSession().getServletContext().getRealPath("uploads");
        System.out.println("realpath:---->" + realpath);
        //数据库存放路径
        String dataPath = "";
        String dataPath2 = "";
        String entUserId = request.getParameter("entUserId");
        String EmergencyPlanId = request.getParameter("EmergencyPlanId");
        String planDept = request.getParameter("planDept");
        String planTime = request.getParameter("planTime");
        String EmergencyPlanName = request.getParameter("EmergencyPlanName");
        String planContent = request.getParameter("planContent");
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 记录上传过程起始时的时间，用来计算上传时间
                int pre = (int) System.currentTimeMillis();
                // 取得上传文件
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null) {
                    // 取得当前上传文件的文件名称
                    String myFileName = file.getOriginalFilename();
                    // 如果名称不为"",说明该文件存在，否则说明该文件不存在
                    if (myFileName.trim() != "") {
                        System.out.println("myFileName:-->:" + myFileName);
                        // 重命名上传后的文件名
                        String fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
                        // 定义上传路径
                        dataPath = realpath + "/" + fileName;
                        dataPath2 = "uploads/" + fileName;
                        //dataPath2="D:/EnvironmentInfoPublicPlatform/uploads/"+fileName;
                        System.out.println("我的上传文件路径:" + dataPath);
                        File localFile = new File(dataPath);
                        if (!localFile.exists()) {
                            localFile.mkdir();
                        }
                        file.transferTo(localFile);
                    }
                }
                // 记录上传该文件后的时间
                int finaltime = (int) System.currentTimeMillis();
                System.out.println(finaltime - pre);
            }
            //记录文件上传路径到数据库
            EmergencyPlan emergencyPlan = new EmergencyPlan(EmergencyPlanId + System.currentTimeMillis(), entUserId, planDept, planTime, EmergencyPlanName, planContent, dataPath2);
            emergencyPlanManager.addEmergencyPlan(emergencyPlan);
            System.out.println("记录文件上传路径到数据库ok");
        }
        responseMessage(response);
    }

    @RequestMapping("/updateEmergencyPlanByEmergencyPlanId")
    public void updateEmergencyPlanByEmergencyPlanId(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException {
        System.out.println("addEmergencyPlan start work.....");
        String realpath = request.getSession().getServletContext().getRealPath("uploads");
        System.out.println("realpath:---->" + realpath);
        //数据库存放路径
        String dataPath = "";
        String dataPath2 = "";
        String entUserId = request.getParameter("entUserId");
        String emergencyPlanId = request.getParameter("emergencyPlanId");
        String planDept = request.getParameter("planDept");
        String planTime = request.getParameter("planTime");
        String EmergencyPlanName = request.getParameter("EmergencyPlanName");
        String planContent = request.getParameter("planContent");
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 记录上传过程起始时的时间，用来计算上传时间
                int pre = (int) System.currentTimeMillis();
                // 取得上传文件
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null) {
                    // 取得当前上传文件的文件名称
                    String myFileName = file.getOriginalFilename();
                    // 如果名称不为"",说明该文件存在，否则说明该文件不存在
                    if (myFileName.trim() != "") {
                        System.out.println("myFileName:-->:" + myFileName);
                        // 重命名上传后的文件名
                        String fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
                        // 定义上传路径
                        dataPath = realpath + "/" + fileName;
                        dataPath2 = "uploads/" + fileName;
                        //dataPath2="D:/EnvironmentInfoPublicPlatform/uploads/"+fileName;
                        System.out.println("我的上传文件路径:" + dataPath);
                        File localFile = new File(dataPath);
                        if (!localFile.exists()) {
                            localFile.mkdir();
                        }
                        file.transferTo(localFile);
                    }
                }
                // 记录上传该文件后的时间
                int finaltime = (int) System.currentTimeMillis();
                System.out.println(finaltime - pre);
            }
            //记录文件上传路径到数据库
            EmergencyPlan emergencyPlan = emergencyPlanManager.getEmergencyPlanId(emergencyPlanId);
            if (null != emergencyPlan) {
                emergencyPlan.setEmergencyPlanId(emergencyPlanId);
                emergencyPlan.setEntUserId(entUserId);
                emergencyPlan.setPlanDept(planDept);
                emergencyPlan.setPlanTime(planTime);
                emergencyPlan.setEmergencyPlanName(EmergencyPlanName);
                emergencyPlan.setPlanContent(planContent);
                emergencyPlan.setPlanPath(dataPath2);
                emergencyPlanManager.updateEmergencyPlan(emergencyPlan);
            }
            System.out.println("记录文件上传路径到数据库ok----突发应急预案数据更新成功!");
        }
        responseMessage(response);
    }


    private void responseMessage(HttpServletResponse response) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html; charset=" + "utf-8");
        Writer writer = null;
        try {
            writer = response.getWriter();
            writer.write("{\"code\":" + 200 + ",\"message\":\"" + "文件处理成功" + "\"}");
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

    @RequestMapping("/getEmergencyDownFile")
    public void getEmergencyDownFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String realpath = request.getSession().getServletContext().getRealPath("/");
        request.setCharacterEncoding("UTF-8");
        InputStream stream;
        String emergencyPlanId = request.getParameter("emergencyPlanId");
        System.out.println("环境突发应急预案下载文件id:" + emergencyPlanId);
        EmergencyPlan emergencyPlan = emergencyPlanManager.getEmergencyPlanId(emergencyPlanId);
        //截取文件后缀
        String fileTail = emergencyPlan.getPlanPath().substring(emergencyPlan.getPlanPath().lastIndexOf("."));
        System.out.println("下载文件名称:" + emergencyPlan.getEmergencyPlanName() + fileTail);
        try {
            stream = new FileInputStream(realpath + emergencyPlan.getPlanPath()); //文件下载路径
            OutputStream os = null;
            response.setContentType("APPLICATION/DOWNLOAD");
            response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(emergencyPlan.getEmergencyPlanName() + fileTail, "UTF-8"));
            response.setContentLength(stream.available());
            os = response.getOutputStream();
            int iBytesRead = 0;
            byte[] buffer = new byte[10240000];
            while ((iBytesRead = stream.read(buffer, 0, 10240000)) != -1) {
                os.write(buffer, 0, iBytesRead);
            }
            os.close();
            stream.close();
            response.flushBuffer();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
