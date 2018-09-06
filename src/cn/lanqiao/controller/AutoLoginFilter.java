package cn.lanqiao.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.lanqiao.model.User;
@WebFilter(filterName="autologin",urlPatterns="*.jsp")

public class AutoLoginFilter implements Filter {
	cn.lanqiao.service.UserServie us = new cn.lanqiao.service.impl.UserServiceImpl();
    public AutoLoginFilter() {
    	
    }
	public void destroy() {
		
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String cook_name = null;
		String cook_pwd = null;
		//获得cookie
		Cookie[] cookies = req.getCookies();
		if(cookies!=null){
			for(Cookie cookie : cookies){
				//获得名字是cookie_username和cookie_password
				if("username".equals(cookie.getName())){
					cook_name = cookie.getValue();
				}
				if("upassword".equals(cookie.getName())){
					cook_pwd = cookie.getValue();
				}
			}
		}
		if(cook_name!=null&&cook_pwd!=null){
			//登录的代码
			cn.lanqiao.service.UserServie us = new cn.lanqiao.service.impl.UserServiceImpl();
			User user = null;
			user = us.getUserByLoginId(cook_name, cook_pwd);
			//将登录的用户的user对象存到session中
			session.setAttribute("user", user);
		}
		
			chain.doFilter(request, response);
		}
			//

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
