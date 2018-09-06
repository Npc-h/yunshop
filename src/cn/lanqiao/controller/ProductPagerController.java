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

@WebServlet("/pager.do")
public class ProductPagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	cn.lanqiao.dao.TbProductDao gs = new cn.lanqiao.dao.impl.TbProductDaoImpl();
	cn.lanqiao.service.TbProductService productService = new cn.lanqiao.service.impl.TbProductServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pindex = request.getParameter("pageindex");
		if(pindex==null){ //第1页;
			pindex ="1";
		}
		Integer pagesize = 12;
		Integer pageindex = Integer.parseInt(pindex);
		String cid = request.getParameter("cid");
		if(cid==null){cid="1";}
		Pager<TbProduct> pageinfo =gs.goodsPager(pagesize, pageindex, cid);
		request.setAttribute("pageinfo", pageinfo);
		request.getRequestDispatcher("/WEB-INF/my-all.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}