package com.lms.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OnlineFilter extends HttpServlet implements Filter
{
    private static final long serialVersionUID = 1L;
    public void init(FilterConfig filterConfig) throws ServletException
    {

    }
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException
    {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");//这里设置如果没有登陆将要转发到的页面
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(true);

        // 从session里取的用户信息
        //这里获取session，为了检查session里有没有保存用户信息，没有的话回转发到登陆页面
        Object admin = session.getAttribute("admin");
        Object worker = session.getAttribute("worker");
        Object reader = session.getAttribute("reader");
        if((admin != null) ^ (worker != null) ^ (reader != null)){  // 存在且仅存在一个角色则继续
            // 已经登陆,继续此次请求
            System.out.println("用户已经登陆，允许操作");

            chain.doFilter(request,response);
        }
        else // 判断如果没有取到用户信息,就跳转到登陆页面
        {
            // 跳转到登陆页面
            System.out.println("用户没有登陆，不允许操作");

            dispatcher.forward(request,response);
            res.setHeader("Cache-Control","no-store");
            res.setDateHeader("Expires",0);
            res.setHeader("Pragma","no-cache");
        }
    }
    public void destroy()
    {

    }
}
