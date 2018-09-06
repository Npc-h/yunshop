package cn.lanqiao.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cn.lanqiao.model.TbProduct;

/**
 * Servlet implementation class MyLove
 */
@WebServlet("/love.do")
public class MyLoveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cn.lanqiao.service.TbProductService service = new cn.lanqiao.service.impl.TbProductServiceImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pid = request.getParameter("pid");
		TbProduct productLove = service.getAllProduct(pid);
		request.setAttribute("productLove", productLove);
		
		String pidloveCook = pid;
		Cookie cookies[] = request.getCookies();
		if(cookies!=null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("pidloveCook")) {
					pidloveCook = cookie.getValue();
					String split[] = pidloveCook.split("-");
					List<String> asList = Arrays.asList(split);
					LinkedList<String> list = new LinkedList<>(asList);
					if(list.contains(pid)) {
						list.remove(pid);
					}
						list.addFirst(pid);
						StringBuffer sb = new StringBuffer();
					for(int i=0;i<list.size();i++){
						sb.append(list.get(i));
						sb.append("-");
					}
					pidloveCook = sb.substring(0,sb.length());
					//创建cookie
					Cookie newCookie= new Cookie("pidloveCook", pidloveCook);
					response.addCookie(newCookie);
				}
			}
		}
		Cookie newCookie= new Cookie("pidloveCook", pidloveCook);
		response.addCookie(newCookie);
		request.setAttribute("newCookie", newCookie);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	/*	Gson gson = new Gson();
		response.setContentType("text/html;charset=UTF-8");
		String json = gson.toJson(productLove);
		response.getWriter().write(json);
		System.out.println(json);*/
		/*request.setAttribute("product", product);
		request.getRequestDispatcher("mylove.jsp").forward(request, response);*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
