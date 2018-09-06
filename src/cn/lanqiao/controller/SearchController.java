package cn.lanqiao.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cn.lanqiao.model.TbProduct;

/**
 * Servlet implementation class HotProductController
 */
@WebServlet("/search.do")
public class SearchController extends HttpServlet {
	cn.lanqiao.service.TbProductService productService = new cn.lanqiao.service.impl.TbProductServiceImpl();
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String search = new String(request.getParameter("search").getBytes("ISO-8859-1"),"utf-8");
		List<TbProduct> searchProduct = productService.searchProduct(search);
		request.setAttribute("searchProduct", searchProduct);
		request.getRequestDispatcher("/WEB-INF/search.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
