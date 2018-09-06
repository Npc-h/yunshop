package cn.lanqiao.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.lanqiao.model.TbUser;

@WebServlet("/active.do")
public class AcitveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cn.lanqiao.service.TbUserService us = new cn.lanqiao.service.impl.TbUserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String uid = request.getParameter("uid");
		
		TbUser user = us.getUserByUserId(uid);
		System.out.println(user);
		user.setUstate(1);  //激活
		System.out.println(user);
		us.updateUserreg(user);  
		response.getWriter().write("激活成功，请重新登录<a href='/lanqiaoshop/forward.do?type=login'>返回登录页</a>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
