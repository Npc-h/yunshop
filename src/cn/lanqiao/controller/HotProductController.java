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
@WebServlet("/hot.do")
public class HotProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cn.lanqiao.service.TbProductService product = new cn.lanqiao.service.impl.TbProductServiceImpl();
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<TbProduct> hotProductList = product.findHotProductList();
		response.setContentType("text/html;charset=UTF-8");
		Gson gson = new Gson();
		String json = gson.toJson(hotProductList);
		response.getWriter().write(json);
		
		//设置图片的参数
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
