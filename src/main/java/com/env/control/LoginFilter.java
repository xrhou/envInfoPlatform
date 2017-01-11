package com.env.control;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 用户登陆过滤器
 *
 * @author hbj403
 */
public class LoginFilter implements Filter {

    public LoginFilter() {
    }


    public void destroy() {

    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession();
        req.setCharacterEncoding("UTF-8");
        // 获得用户请求的URI
        String path = req.getRequestURI();
        System.out.println(path);
        // 从session里取员工工号信息
        String entId = (String) session.getAttribute("entId");
        System.out.println("-----------session not exist" + entId);
        // 登陆页面无需过滤
        if (path.indexOf("/index.jsp") > -1) {
            chain.doFilter(req, res);
            return;
        }

        // 判断如果没有取到员工信息,就跳转到登陆页面
        if (entId == null || "".equals(entId)) {
            // 跳转到登陆页面
            res.sendRedirect(req.getContextPath() + "/index.jsp");
        } else {
            // 已经登陆,继续此次请求
            chain.doFilter(request, response);
        }
    }

    public void init(FilterConfig arg0) throws ServletException {

    }

}
