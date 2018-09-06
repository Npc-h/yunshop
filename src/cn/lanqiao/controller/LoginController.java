package cn.lanqiao.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.lanqiao.model.User;
import cn.lanqiao.util.GeetestConfig;
import cn.lanqiao.util.GeetestLib;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cn.lanqiao.service.UserServie us = new cn.lanqiao.service.impl.UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GeetestLib gtSdk = new GeetestLib(GeetestConfig.getGeetest_id(), GeetestConfig.getGeetest_key());
		String challenge = request.getParameter(GeetestLib.fn_geetest_challenge);
		String validate = request.getParameter(GeetestLib.fn_geetest_validate);
		String seccode = request.getParameter(GeetestLib.fn_geetest_seccode);
		//从session中获取gt-server状态
		int gt_server_status_code = (Integer) request.getSession().getAttribute(gtSdk.gtServerStatusSessionKey);
		//从session中获取userid
		String userid = (String)request.getSession().getAttribute("userid");
		
		int gtResult = 0;

		if (gt_server_status_code == 1) {
			//gt-server正常，向gt-server进行二次验证
			gtResult = gtSdk.enhencedValidateRequest(challenge, validate, seccode, userid);
			
		} else {
			// gt-server非正常情况下，进行failback模式验证
			System.out.println("failback:use your own server captcha validate");
			gtResult = gtSdk.failbackValidateRequest(challenge, validate, seccode);
			System.out.println(gtResult);
		}
		if (gtResult == 1) {
			//成功登陆入口
			String username = request.getParameter("username");
			String upassword = request.getParameter("upassword");
			//加密
			//upassword = MD5Utils.md5(upassword);
			User user = us.getUserByLoginId(username, upassword);
			if(user!=null) {//存在该用户
				//request.getSession().setAttribute("user", user);
				if(request.getParameter("ck")!=null){ //记录密码;
					//Cookie autoCookie = new Cookie("autoUser",user.getUsername()+":"+user.getUpassword());
					//autoCookie.setMaxAge(60*60*24*7); 
					//response.addCookie(autoCookie);//为绑定用户存入自动登陆的cookie
					Cookie cook_name = new Cookie("username",username);
					Cookie cook_pwd = new Cookie("upassword",upassword);
					//设置cookie的携带路径
					cook_name.setPath(request.getContextPath());
					cook_pwd.setPath(request.getContextPath());
					cook_name.setMaxAge(60*60*24*7);
					cook_pwd.setMaxAge(60*60*24*7);
					response.addCookie(cook_name);
					response.addCookie(cook_pwd);
				}
				request.getSession().setAttribute("user", user);
				request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
			}else{//当直接访问该controller的时候并没有user所以要进登陆界面
				request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
			}
		
		}
		else {
			// 验证失败
			// 失败入口
				request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
		request.setAttribute("gtResult",gtResult);
		///------------------------------------------------------------------
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
