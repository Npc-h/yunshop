package cn.lanqiao.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/userexit.do")
public class UserExitController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			HttpSession session = request.getSession();
			//去除session
			session.removeAttribute("user");
			//如果记住登陆状态还需要去除cookie
			Cookie cook_name = new Cookie("username","");
			Cookie cook_pwd = new Cookie("upassword","");
			cook_name.setMaxAge(0);
			cook_pwd.setMaxAge(0);
			response.addCookie(cook_name);
			response.addCookie(	cook_pwd);
			
			response.sendRedirect("/lanqiaoshop/index.jsp");
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
