package cn.lanqiao.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cn.lanqiao.dao.impl.TbCategoryDaoImpl;
import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbCategory;
import cn.lanqiao.model.TbProduct;
import cn.lanqiao.service.AdminProductService;
import cn.lanqiao.service.TbCategoryService;
import cn.lanqiao.service.impl.AdminProductServiceImpl;
import cn.lanqiao.service.impl.TbCategoryImpl;

/**
 * Servlet implementation class AdminProductController
 */
@WebServlet("/adminproduct.do")
public class AdminProductPagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminProductPagerController() {
        super();
   }

    AdminProductService service = new AdminProductServiceImpl
    		();
    TbCategoryService category = new TbCategoryImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//拿到请求数据
		String pindex = request.getParameter("pageindex");
		if(pindex==null){ //第1页;
			pindex ="1";
		}
		Integer pageindex = Integer.parseInt(pindex);
		Integer pagesize = 5;
		Pager<TbProduct> pageinfo =service.goodsPager(pagesize, pageindex, "8");
		request.getSession().setAttribute("pageinfo",pageinfo);
		System.out.println(pageinfo.getPagecount());
		response.sendRedirect("/lanqiaoshop/admin/inventory.jsp");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
