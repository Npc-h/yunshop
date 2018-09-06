package cn.lanqiao.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbCategory;
import cn.lanqiao.model.TbManage;
import cn.lanqiao.model.TbOrders;
import cn.lanqiao.model.TbOrdersAdmin;
import cn.lanqiao.model.TbProduct;
import cn.lanqiao.model.TbUser;
import cn.lanqiao.service.AdminProductService;
import cn.lanqiao.service.impl.AdminProductServiceImpl;

@WebServlet("/admin.do")
public class AdminController extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	//page
		public void pageimpl(HttpServletRequest request, HttpServletResponse response) {
			//拿到请求数据
					String pindex = request.getParameter("pageindex");
					if(pindex==null){ //第1页;
						pindex ="1";
					}
					Integer pageindex = Integer.parseInt(pindex);
					Integer pagesize = 5;
					//String cid = request.getParameter("cid");
					 AdminProductService service = new AdminProductServiceImpl();
					Pager<TbProduct> pageinfo =service.goodsPager(pagesize, pageindex, "8");
					Gson gson = new Gson();
					String json = gson.toJson(pageinfo);
					response.setContentType("text/html;charset=UTF-8");
					System.out.println(pageindex);
					System.out.println(json);
					//System.out.println(json);
					try {
						response.getWriter().write(json);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
						
		}
	
	// 获取所有分类
	public void findAllCategory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		cn.lanqiao.service.TbCategoryService service = new cn.lanqiao.service.impl.TbCategoryImpl();
		List<TbCategory> category = service.getAllTbCategory();
		request.getSession().setAttribute("allcategory", category);

		response.sendRedirect("/lanqiaoshop/admin/type.jsp");
	}

	// 获取所有用户
	public void findAllUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		cn.lanqiao.service.TbUserService service = new cn.lanqiao.service.impl.TbUserServiceImpl();
		List<TbUser> user = service.selectUser();
		request.getSession().setAttribute("selectuser", user);

		response.sendRedirect("/lanqiaoshop/admin/user.jsp");
	}

	// 校验管理员登陆
	public void checkManage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收用户输入的用户名和密码
		String managename = request.getParameter("managename");
		String managepassword = request.getParameter("managepassword");

		cn.lanqiao.service.TbManageService service = new cn.lanqiao.service.impl.TbManageServiceImpl();
		TbManage manage = service.checkManage(managename, managepassword);
		if (manage != null) {
			response.sendRedirect("/lanqiaoshop/admin/home.jsp");
		} else {
			response.sendRedirect("/lanqiaoshop/admin/login.jsp");
		}
	}

	// 根据订单id查询订单项和查询商品详细信息
	public void findOrderInfoByOid(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 睡眠几秒模拟加载
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		// 获得oid
		String oid = request.getParameter("oid");
		// 接入service层
		cn.lanqiao.service.TbOrdersService service = new cn.lanqiao.service.impl.TbOrdersServiceImpl();
		List<Map<String, Object>> findOrderInfoByOid = service.findOrderInfoByOid(oid);

		// 利用gson将数据转为json格式输出
		Gson gson = new Gson();
		String json = gson.toJson(findOrderInfoByOid);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json);
	}

	// 获取所有的订单
	public void findAllOrders(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		cn.lanqiao.service.TbOrdersService service = new cn.lanqiao.service.impl.TbOrdersServiceImpl();
		List<TbOrdersAdmin> orderList = service.findAllOrders();

		request.getSession().setAttribute("orderList", orderList);

		// request.getRequestDispatcher("/admin/outBoud.html").forward(request,
		// response);
		response.sendRedirect("/lanqiaoshop/admin/outboud.jsp");
	}

	//模糊查询指定商品
	public void findOrderInfoByName(HttpServletRequest request,HttpServletResponse response) throws IOException {
		// 获得orderName
		String orderName = request.getParameter("orderName");
		// 接入service层
		cn.lanqiao.service.AdminProductService service = new cn.lanqiao.service.impl.AdminProductServiceImpl();
		List<TbProduct> findname = service.vagueProduct(orderName);

		// 利用gson将数据转为json格式输出
		Gson gson = new Gson();
		String json = gson.toJson(findname);
		System.out.println(json);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json);
		
	}
}
