package cn.lanqiao.controller;

import java.io.IOException;
import java.net.URL;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import cn.lanqiao.model.TbUser;

@WebServlet("/reg.do")
public class RegesitController extends HttpServlet {
	cn.lanqiao.service.TbUserService us = new cn.lanqiao.service.impl.TbUserServiceImpl();
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setHeader("Content-Type", "text/html; charset=UTF-8");
		
		String uid = UUID.randomUUID().toString();
		String username = request.getParameter("username");
		String upassword = request.getParameter("password");
		String uemail = request.getParameter("email");
		//封装成 TbUser对象;
		TbUser user = new TbUser(uid, username, upassword, null, uemail, null, null, null, 0);
		us.insertUserreg(user);
		//创建一封邮件;
		HtmlEmail  email =new HtmlEmail();
		//设置邮件服务器;
		email.setHostName("smtp.qq.com");
		//设置SMTP端口;
		email.setSmtpPort(25);
		//设置账号与密码
		email.setAuthentication("1403322163", "dyrdkkhxzyfhggif");
		try {
			email.setCharset("UTF-8");
			//设置发件人邮箱
			email.setFrom("1403322163@qq.com", "奥特苏", "UTF-8");
			//设置邮件的主题
			email.setSubject("蓝桥邮件，请激活");
			URL url = new URL("http://localhost:8080/lanqiaoshop/active.do?uid="+uid);
			email.setHtmlMsg("<a href='"+ url +"'>激活</a>");
			email.addTo(uemail);
			//发邮件;
			email.send();
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/WEB-INF/secess.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
