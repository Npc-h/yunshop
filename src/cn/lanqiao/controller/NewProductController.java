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
 * Servlet implementation class NewProductController
 */
@WebServlet("/new.do")
public class NewProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cn.lanqiao.service.TbProductService product = new cn.lanqiao.service.impl.TbProductServiceImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<TbProduct> newProductList = product.findNewProductList();
		Gson gson = new Gson();
		response.setContentType("text/html;charset=UTF-8");
		String json = gson.toJson(newProductList);
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
