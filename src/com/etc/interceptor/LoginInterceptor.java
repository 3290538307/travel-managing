package com.etc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
/**
 * 
 * Filename:    LoginInterceptor.java  
 * Description:   
 * Copyright:   Copyright (c) 2018-2019 All Rights Reserved.
 * Company:     chinasofti.com Inc.
 * @author:     sh qian 
 * @version:    1.0  
 * Create at:   2018年1月9日 下午1:49:40  
 *  
 * Modification History:  
 * Date         Author      Version     Description  
 * ------------------------------------------------------------------  
 * 2018年1月9日      sh qian      1.0         1.0 Version  
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String loginUrl="login.jsp";
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String url=request.getRequestURI();
		System.out.println(url);
		int index=url.lastIndexOf("/"+"");
		//System.out.println(url.substring(index));
		if(loginUrl.equals(url.substring(index))){
			System.out.println(12);
			return true;
		}
		if(request.getSession().getAttribute("name")!=null){
			System.out.println(request.getSession().getAttribute("name"));
			return true;
		}
		response.sendRedirect("../login/login.jsp");
		//request.getRequestDispatcher("client/login/login.jsp").forward(request, response);
		return false;
	}
}
