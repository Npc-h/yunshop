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

import cn.lanqiao.model.TbProduct;

/**
 * Servlet implementation class HistoryController
 */
@WebServlet("/history.do")
public class HistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cn.lanqiao.service.TbProductService productService = new cn.lanqiao.service.impl.TbProductServiceImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//绑定
		
		//记录历史信息的集合
		List<TbProduct> historyProductOver = new ArrayList<>();
		Cookie[] cookiesOver = request.getCookies();
		if(cookiesOver!=null) {
			for(Cookie cookieOver : cookiesOver ) {
				if(cookieOver.getName().equals("pidCook")) {
					String pids = cookieOver.getValue();
					String[] split = pids.split("-");
					for(String pidOver :split) {
						TbProduct allProduct = productService.getAllProduct(pidOver);
						historyProductOver.add(allProduct);
					}
				}
			}
		}
		request.setAttribute("historyProductOver", historyProductOver);
		request.getRequestDispatcher("/WEB-INF/my-history.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
