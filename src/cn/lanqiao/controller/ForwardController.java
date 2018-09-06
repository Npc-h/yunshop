package cn.lanqiao.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.sun.java_cup.internal.runtime.Symbol;

import cn.lanqiao.model.TbProduct;
import cn.lanqiao.model.TbUser;

/**
 * Servlet implementation class ForwardController
 */
@WebServlet("/forward.do")
public class ForwardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cn.lanqiao.service.TbProductService productService = new cn.lanqiao.service.impl.TbProductServiceImpl();
	cn.lanqiao.service.TbUserService userService = new cn.lanqiao.service.impl.TbUserServiceImpl();
	cn.lanqiao.service.UserServie userService2 = new cn.lanqiao.service.impl.UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		if(("login").equals(type)) {
			request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
		}
		if(("reg").equals(type)) {
			request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
		}
		if(("more").equals(type)) {
			String pid = request.getParameter("pid");
			TbProduct product = productService.getAllProduct(pid);
			request.setAttribute("product", product);
			String cidH = request.getParameter("cid");
			request.setAttribute("cidH", cidH);//cid
			String currpage = request.getParameter("currpage");
			request.setAttribute("currpage",currpage);//当前页
			request.getRequestDispatcher("/WEB-INF/page.jsp").forward(request, response);
		}
		if(("myself").equals(type)) {
			String uid = request.getParameter("uid");
			TbUser vip = userService.getUserByUserId(uid);
			//System.out.println(vip.getUsername());
			request.setAttribute("vip", vip);
			request.getRequestDispatcher("/WEB-INF/edituser.jsp").forward(request, response);
		}
		if(("info").equals(type)) {
			String uid =request.getParameter("uid");
			String uname = new String(request.getParameter("uname").getBytes("ISO-8859-1"),"utf-8");
			String utelephone = new String(request.getParameter("utel").getBytes("ISO-8859-1"),"utf-8");
			String ubirthday =  new String(request.getParameter("ubir").getBytes("ISO-8859-1"),"utf-8");
			String usex =  new String(request.getParameter("sex").getBytes("ISO-8859-1"),"utf-8");
			userService2.addInformation(uid, uname, utelephone, ubirthday, usex);
			request.getRequestDispatcher("/WEB-INF/mymsg.jsp").forward(request, response);
		}
		if(("myselfAll").equals(type)) {
			request.getRequestDispatcher("/WEB-INF/my-user.jsp").forward(request, response);
		}
		if(("mymsg").equals(type)) {
			String uid = request.getParameter("uid");
			TbUser user = userService.getUserByUserId(uid);
			request.setAttribute("user", user);
			request.getRequestDispatcher("/WEB-INF/mymsg.jsp").forward(request, response);
		}
		if(("morelike").equals(type)) {
			String pid = request.getParameter("pid");
			TbProduct product = productService.getAllProduct(pid);
			request.setAttribute("product", product);
			request.getRequestDispatcher("/WEB-INF/pagelike.jsp").forward(request, response);
		}
		if(("service").equals(type)){
			request.getRequestDispatcher("/WEB-INF/myservice.jsp").forward(request, response);
		}
		if(("mylove").equals(type)){
			//
			List<TbProduct> productLove = new ArrayList<>();
			Cookie[] cookiesOver = request.getCookies();
			if(cookiesOver!=null) {
				for(Cookie cookieOver : cookiesOver ) {
					if(cookieOver.getName().equals("pidloveCook")) {
						String pids = cookieOver.getValue();
						String[] split = pids.split("-");
						for(String pidOver :split) {
							TbProduct allProduct = productService.getAllProduct(pidOver);
							productLove.add(allProduct);
						}
					}
				}
			}
			request.setAttribute("productLove", productLove);
			//
			request.getRequestDispatcher("/WEB-INF/mylove.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
