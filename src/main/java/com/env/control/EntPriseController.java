package com.env.control;

import com.env.entity.EntProduct;
import com.env.entity.EntUser;
import com.env.entity.Entprise;
import com.env.service.IEntProductManager;
import com.env.service.IEntUserManager;
import com.env.service.IEntpriseManager;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class EntPriseController {

    @Resource(name = "entUserManager")
    private IEntUserManager entUserManager;

    @Resource(name = "entpriseManager")
    private IEntpriseManager entpriseManager;

    @Resource(name = "entProductManager")
    private IEntProductManager entProductManager;

    @RequestMapping("/toAddEntprise")
    public String toAddEntprise() {
        return "/addEntprise";
    }

    @RequestMapping("/addEntprise")
    public String addEntprise(Entprise entprise) {
        entpriseManager.addEntpriser(entprise);
        return "redirect:/getAllEntprise";
    }

    @RequestMapping("/getAllEntprise")
    public String getAllEntprise(HttpServletRequest request) throws UnsupportedEncodingException {
        String flag = request.getParameter("flag");
        String entName = new String(request.getParameter("entName").getBytes("ISO8859-1"), "UTF-8");
        List<Entprise> entprise = entpriseManager.getAllEntprise(flag, entName);
        request.setAttribute("entprise", entprise);
        return "/entpriseManager";
    }

    @RequestMapping("/delEntprise")
    public void delEntprise(String entUserId, HttpServletResponse response) {
        String result = "{\"result\":\"error\"}";
        if (entpriseManager.delEntprise(entUserId)) {
            result = "{\"result\":\"success\"}";
        }
        PrintWriter out = null;
        response.setContentType("application/json");

        try {
            out = response.getWriter();
            out.write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/getEntprise")
    public String getEntprise(String entUserId, HttpServletRequest request) {
        EntUser entUser = entUserManager.getEntUser(entUserId);
        Entprise entprise = entpriseManager.getEntprise(entUserId);
        EntProduct entproduct = entProductManager.getEntProduct(entUserId);
        if (entproduct != null) {
            System.out.println("============================" + entproduct.getEntUserId());
        }
        request.getSession().setAttribute("entUser", entUser);
        request.getSession().setAttribute("entprise", entprise);
        request.getSession().setAttribute("entproduct", entproduct);
        return "/list_detail";
    }

    @RequestMapping("/updateEntprise")
    public String updateEntprise(Entprise entprise, HttpServletRequest request) {
        if (entpriseManager.updateEntprise(entprise)) {
            /*user=userManager.getUser(user.getUid());
            request.setAttribute("user", user);*/
            return "redirect:/getAllEntprise";
        } else {
            return "/error";
        }
    }


    /**
     * 初始化加载所有企业
     *
     * @param request
     * @param response
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/jsonfindAllEntPrise")
    private void jsonfindAllEntPrise(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String flag = request.getParameter("flag");//页面分情况查找数据标志
        String entName = new String(request.getParameter("entName").getBytes("ISO8859-1"), "UTF-8"); //首页面导航栏 按照企业名称查找对应的企业信息
        JSONObject datas = null;
        try {
            datas = entpriseManager.getJSON(flag, entName);
            PrintWriter out = response.getWriter();
            out.write(datas.toString());
            out.flush();
            out.close();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
