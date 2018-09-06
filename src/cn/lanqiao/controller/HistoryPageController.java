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

import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbProduct;

/**
 * Servlet implementation class HistoryPageController
 */
@WebServlet("/historyPage.do")
public class HistoryPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cn.lanqiao.service.TbProductService productService = new cn.lanqiao.service.impl.TbProductServiceImpl();
	cn.lanqiao.dao.TbProductDao gs = new cn.lanqiao.dao.impl.TbProductDaoImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*测试历史纪录*/
		String pid= request.getParameter("pid");
		String cidHistory = request.getParameter("cidH");
		String cidH = request.getParameter("cidH");
		
		String currpage = request.getParameter("currpage");
		//获得当前用户的cook
		TbProduct historyProduct = productService.getAllProduct(pid);
		request.setAttribute("historyProduct", historyProduct);
		request.setAttribute("cidHistory", cidHistory);
		request.setAttribute("currpage", currpage);
		request.setAttribute("cidH", cidH);
		String pidCook = pid;
		Cookie cookies[] = request.getCookies();
		if(cookies!=null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("pidCook")) {
					pidCook = cookie.getValue();
					String split[] = pidCook.split("-");
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
					pidCook = sb.substring(0,sb.length());
					//创建cookie
					Cookie newCookie= new Cookie("pidCook", pidCook);
					response.addCookie(newCookie);
				}
			}
		}
		Cookie newCookie= new Cookie("pidCook", pidCook);
		response.addCookie(newCookie);
		request.setAttribute("newCookie", newCookie);
		
		Integer pagesize = 12;
		Integer currpagex = Integer.parseInt(currpage);
		Pager<TbProduct> pageinfo =gs.goodsPager(pagesize,currpagex , cidH);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/WEB-INF/my-all.jsp").forward(request, response);
		/*测试历史纪录*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
