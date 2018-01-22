package com.etc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter{
	private static final String loginUrl="login.jsp";
	private static final String checkPwd="/Findadminpwd.do";
	private static final String checkName="/Findadminname.do";
	private static final String login="/admin_add.do";
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String url=request.getRequestURI();
		//System.out.println(url);
		int index=url.lastIndexOf("/"+"");
		System.out.println(url.substring(index));
		if(checkPwd.equals(url.substring(index))||checkName.equals(url.substring(index))||login.equals(url.substring(index))){
			System.out.println(12);
			return true;
		}
		if(request.getSession().getAttribute("adminname")!=null){
			//System.out.println(request.getSession().getAttribute("id"));
			return true;
		}
		response.sendRedirect(loginUrl);
		//request.getRequestDispatcher("client/login/login.jsp").forward(request, response);
		return false;
	}
}
