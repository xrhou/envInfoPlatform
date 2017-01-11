package com.env.control;

import com.env.entity.EntProduct;
import com.env.entity.EntUser;
import com.env.entity.Entprise;
import com.env.entity.OperationLog;
import com.env.service.IEntProductManager;
import com.env.service.IEntUserManager;
import com.env.service.IEntpriseManager;
import com.env.service.IOperationLogManager;
import com.env.utils.DateTimeUtils;
import com.env.utils.Myutils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 企业用户登陆信息
 *
 * @author hbj403
 */
@Controller
public class EntUserController {

    @Resource(name = "entUserManager")
    private IEntUserManager entUserManager;

    @Resource(name = "entpriseManager")
    private IEntpriseManager entpriseManager;

    @Resource(name = "entProductManager")
    private IEntProductManager entProductManager;

    @Resource(name = "operationLogManager")
    private IOperationLogManager operationLogManager;

    @RequestMapping("/addEntUser")
    public String addEntUser(EntUser entUser) {
        entUserManager.addEntUser(entUser);
        return "redirect:/success";
    }

    @RequestMapping("/updateEntUser")
    public String updateEntUser(String entUserId, HttpServletRequest request) {
        EntUser entUser = entUserManager.getEntUser(entUserId);
        Entprise entprise = entpriseManager.getEntprise(entUserId);
        request.setAttribute("entUser", entUser);
        request.setAttribute("entprise", entprise);
        return "/admin_updateUser";
    }

    @RequestMapping("/reloadData")
    @ResponseBody
    public String reloadData(HttpServletRequest request, HttpServletResponse response) {
        String reply = "";
        //清除session
        request.getSession().removeAttribute("entId");
        request.getSession().removeAttribute("entUser");
        request.getSession().removeAttribute("entprise");
        request.getSession().removeAttribute("entproduct");
        //session赋给新值
        String entUserId = request.getParameter("entUserId");
        EntUser entUser = entUserManager.getEntUser(entUserId);
        if (null != entUser) {
            Entprise entprise = entpriseManager.getEntprise(entUser.getEntUserId());
            EntProduct entproduct = entProductManager.getEntProduct(entUser.getEntUserId());
            request.getSession().setAttribute("entId", entUser.getEntId());
            request.getSession().setAttribute("entUser", entUser);
            request.getSession().setAttribute("entprise", entprise);
            request.getSession().setAttribute("entproduct", entproduct);
            reply = "success";
        } else {
            reply = "wrong";
        }
        return reply;
    }

    @RequestMapping("/BaseInfoUpdate")
    @ResponseBody
    public String BaseInfoUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String entUserId = request.getParameter("entUserId");
        String entName = request.getParameter("entName");
        String entUsercode = request.getParameter("entUsercode");

        String entZone = request.getParameter("entZone");
        String entReperson = request.getParameter("entReperson");
        String entPhone = request.getParameter("entPhone");
        String entPhoneName = request.getParameter("entPhoneName");
        String entAddress = request.getParameter("entAddress");
        String entproductCycle = request.getParameter("entproductCycle");
        String entTypeValues = request.getParameter("entTypeValues");
        String entBusiness = request.getParameter("entBusiness");
        //String createDate =request.getParameter("createDate");
        String entScale = request.getParameter("entScale");
        String entControl = request.getParameter("entControl");
        //String pollutionMethod =request.getParameter("pollutionMethod");
        String entProductAndManage = request.getParameter("entProductAndManage");

        String entProduct01 = request.getParameter("entProduct01");
        String entProduct02 = request.getParameter("entProduct02");
        String entProduct03 = request.getParameter("entProduct03");
        String entProduct04 = request.getParameter("entProduct04");
        String entProduct05 = request.getParameter("entProduct05");
        String entProduct06 = request.getParameter("entProduct06");
        String entProduct07 = request.getParameter("entProduct07");
        String entProduct08 = request.getParameter("entProduct08");
        String entProduct09 = request.getParameter("entProduct09");
        String entProduct10 = request.getParameter("entProduct10");
        String entScale01 = request.getParameter("entScale01");
        String entScale02 = request.getParameter("entScale02");
        String entScale03 = request.getParameter("entScale03");
        String entScale04 = request.getParameter("entScale04");
        String entScale05 = request.getParameter("entScale05");
        String entScale06 = request.getParameter("entScale06");
        String entScale07 = request.getParameter("entScale07");
        String entScale08 = request.getParameter("entScale08");
        String entScale09 = request.getParameter("entScale09");
        String entScale10 = request.getParameter("entScale10");

        String entOtherInfo = request.getParameter("entOtherInfo");

        System.out.println("entUserId: " + entUserId);
        String reply = "";
        try {
            EntUser entUser = entUserManager.getEntUser(entUserId);
            entUser.setEntName(entName);
            entUser.setEntId(entUsercode);
            entUser.setEntOrganizationCode(entUsercode);
            boolean flag = entUserManager.updateEntUser(entUser);
            System.out.println("entUser 更新OK");

            Entprise entprise = entpriseManager.getEntprise(entUserId);
            entprise.setEntUsercode(entUsercode);
            entprise.setEntName(entName);
            entprise.setEntZone(entZone);
            entprise.setEntReperson(entReperson);
            entprise.setEntPhone(entPhone);
            entprise.setEntPhoneName(entPhoneName);
            entprise.setEntAddress(entAddress);
            entprise.setEntproductCycle(entproductCycle);
            entprise.setEntType(entTypeValues);
            entprise.setEntBusiness(entBusiness);
            entprise.setCreateDate(DateTimeUtils.getNowDate());//企业创建时间 为默认不现实的值
            entprise.setEntProductAndManage(entProductAndManage);
            entprise.setEntScale(entScale);
            entprise.setEntControl(entControl);
            entprise.setPollutionMethod("");//企业排放方式 设置为空值
            entprise.setEntOtherInfo(entOtherInfo);
            entpriseManager.updateEntprise(entprise);
            System.out.println("entprise 更新OK");

            EntProduct entProduct = entProductManager.getEntProduct(entUserId);
            if (null == entProduct) {
                entProduct.setEntUserId(entUserId);
                entProduct.setEntProduct01(entProduct01);
                entProduct.setEntProduct02(entProduct02);
                entProduct.setEntProduct03(entProduct03);
                entProduct.setEntProduct04(entProduct04);
                entProduct.setEntProduct05(entProduct05);
                entProduct.setEntProduct06(entProduct06);
                entProduct.setEntProduct07(entProduct07);
                entProduct.setEntProduct08(entProduct08);
                entProduct.setEntProduct09(entProduct09);
                entProduct.setEntProduct10(entProduct10);
                entProduct.setEntScale01(entScale01);
                entProduct.setEntScale02(entScale02);
                entProduct.setEntScale03(entScale03);
                entProduct.setEntScale04(entScale04);
                entProduct.setEntScale05(entScale05);
                entProduct.setEntScale06(entScale06);
                entProduct.setEntScale07(entScale07);
                entProduct.setEntScale08(entScale08);
                entProduct.setEntScale09(entScale09);
                entProduct.setEntScale10(entScale10);
                entProductManager.addEntProduct(entProduct);
            } else {
                entProduct.setEntProduct01(entProduct01);
                entProduct.setEntProduct02(entProduct02);
                entProduct.setEntProduct03(entProduct03);
                entProduct.setEntProduct04(entProduct04);
                entProduct.setEntProduct05(entProduct05);
                entProduct.setEntProduct06(entProduct06);
                entProduct.setEntProduct07(entProduct07);
                entProduct.setEntProduct08(entProduct08);
                entProduct.setEntProduct09(entProduct09);
                entProduct.setEntProduct10(entProduct10);
                entProduct.setEntScale01(entScale01);
                entProduct.setEntScale02(entScale02);
                entProduct.setEntScale03(entScale03);
                entProduct.setEntScale04(entScale04);
                entProduct.setEntScale05(entScale05);
                entProduct.setEntScale06(entScale06);
                entProduct.setEntScale07(entScale07);
                entProduct.setEntScale08(entScale08);
                entProduct.setEntScale09(entScale09);
                entProduct.setEntScale10(entScale10);
                entProductManager.updateEntProduct(entProduct);
            }
            System.out.println("entProduct 更新OK");
            if (flag) {
                /** 日志记录 Begin**/
                OperationLog operationLog = null;
                String ent_Id = entUsercode; // 操作员编号
                String deal_IP = Myutils.getIpAddr(request);// 计算机IP
                String deal_date = DateTimeUtils.getDateTime(); // 操作日期
                String deal_type = "modify_info"; // 操作类型
                String description = "单位基本信息修"; // 日志描述（记录每一个操作）
                operationLog = new OperationLog(ent_Id, deal_IP, deal_date, deal_type, description);
                operationLogManager.addOperationLog(operationLog);
                /** 日志记录 End**/
                reply = "success";
            } else {
                reply = "wrong";
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/index.jsp");//回退登陆页面
        }
        return reply;
    }


    @RequestMapping("/UserPWDUpdate")
    @ResponseBody
    public String UserPWDUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String entId = request.getParameter("entId");
        String entUserId = request.getParameter("entUserId");
        String userpassword = request.getParameter("userpassword");
        if (entId != null) {
            entId = entId.trim();
        }
        if (entUserId != null) {
            entUserId = entUserId.trim();
        }
        if (userpassword != null) {
            userpassword = userpassword.trim();
        }
        System.out.println("entUserId: " + entUserId);
        System.out.println("userpassword: " + userpassword);
        String reply = "";
        try {
            boolean flag = entUserManager.updateEntUserPWD(entUserId, userpassword);
            if (flag) {
                /** 日志记录 Begin**/
                OperationLog operationLog = null;
                String ent_Id = entId; // 操作员编号
                String deal_IP = Myutils.getIpAddr(request);// 计算机IP
                String deal_date = DateTimeUtils.getDateTime(); // 操作日期
                String deal_type = "update_user_password"; // 操作类型
                String description = "用户修改密码"; // 日志描述（记录每一个操作）
                operationLog = new OperationLog(ent_Id, deal_IP, deal_date, deal_type, description);
                operationLogManager.addOperationLog(operationLog);
                /** 日志记录 End**/
                reply = "success";
            } else {
                reply = "wrong";
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/index.jsp");//回退登陆页面
        }
        return reply;
    }

    @RequestMapping("/entUserlogin")
    @ResponseBody
    public String entUserlogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Into entUserlogin...");
        String entId = request.getParameter("entId");
        String userpassword = request.getParameter("password");
        if (entId != null) {
            entId = entId.trim();
        }
        if (userpassword != null) {
            userpassword = userpassword.trim();
        }
        System.out.println("entId: " + entId);
        System.out.println("userpassword: " + userpassword);
        String reply = "";
        try {
            EntUser entUser = entUserManager.entUserlogin(entId, userpassword);
            if (null != entUser) {
                Entprise entprise = entpriseManager.getEntprise(entUser.getEntUserId());
                EntProduct entproduct = entProductManager.getEntProduct(entUser.getEntUserId());
                request.getSession().setAttribute("entId", entId);
                request.getSession().setAttribute("entUser", entUser);
                request.getSession().setAttribute("entprise", entprise);
                request.getSession().setAttribute("entproduct", entproduct);
                /** 日志记录 Begin**/
                OperationLog operationLog = null;
                String ent_Id = entId; // 操作员编号
                String deal_IP = Myutils.getIpAddr(request);// 计算机IP
                String deal_date = DateTimeUtils.getDateTime(); // 操作日期
                String deal_type = "login"; // 操作类型
                String description = "登陆系统"; // 日志描述（记录每一个操作）
                operationLog = new OperationLog(ent_Id, deal_IP, deal_date, deal_type, description);
                operationLogManager.addOperationLog(operationLog);
                reply = "success";
                /** 日志记录 End**/
            } else {
                reply = "wrong";
            }
        } catch (Exception e) {
            Myutils.println("Into LoginServlet...登录不成功。");
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/index.jsp");//回退登陆页面
        }
        return reply;
    }

    @RequestMapping("/entUserlogout")
    @ResponseBody
    public String entUserlogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Into entUserlogout...");
        String reply = "";
        try {
            String entId = (String) request.getSession().getAttribute("entId");
            if (null != entId) {
                /** 日志记录 Begin**/
                OperationLog operationLog = null;
                String ent_Id = entId; // 操作员编号
                String deal_IP = Myutils.getIpAddr(request);// 计算机IP
                String deal_date = DateTimeUtils.getDateTime(); // 操作日期
                String deal_type = "logout"; // 操作类型
                String description = "用户退出系统"; // 日志描述（记录每一个操作）
                operationLog = new OperationLog(ent_Id, deal_IP, deal_date, deal_type, description);
                operationLogManager.addOperationLog(operationLog);
                reply = "success";
                /** 日志记录 End**/
                request.getSession().removeAttribute("entId");
                request.getSession().removeAttribute("entUser");
                request.getSession().removeAttribute("entprise");
                request.getSession().removeAttribute("entproduct");
            } else {
                reply = "wrong";
            }
        } catch (Exception e) {
            Myutils.println("Into LogoutServlet...用户退出的登陆。");
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/index.jsp");//回退登陆页面
        }
        return reply;
    }

}
