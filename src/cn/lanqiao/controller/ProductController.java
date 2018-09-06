package cn.lanqiao.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.lanqiao.model.Cart;
import cn.lanqiao.model.CartItem;
import cn.lanqiao.model.TbOrderitem;
import cn.lanqiao.model.TbOrders;
import cn.lanqiao.model.TbProduct;
import cn.lanqiao.model.User;
import cn.lanqiao.service.TbProductService;
import cn.lanqiao.service.impl.TbProductServiceImpl;

@WebServlet("/product.do")
public class ProductController extends BaseServlet {
	private static final long serialVersionUID = 1L;

	// 确认订单---更新收获人信息
	public void confirmOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1、更新收货人信息
		cn.lanqiao.service.TbOrdersService service = new cn.lanqiao.service.impl.TbOrdersServiceImpl();
		String address = request.getParameter("address");
		String name = request.getParameter("name");
		String telephone = request.getParameter("telephone");
		String oid = request.getParameter("oid");
		TbOrders order = new TbOrders();
		order.setAddress(address);
		order.setName(name);
		order.setTelephone(telephone);
		order.setOid(oid);
		service.updateOrderAdrr(order);
		//修改支付状态
		service.updateOrderState(oid);
		request.getSession().setAttribute("oid1", oid);
		//response.sendRedirect("/lanqiaoshop/alipayindex.jsp");
		request.getRequestDispatcher("/alipayindex.jsp").forward(request, response);
	}

	// 提交订单
	public void submitOrder(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		// 判断用户是否已经登录 未登录下面代码不执行
		User user = (User) session.getAttribute("user");
		if (user == null) {
			// 没有登录
			// response.sendRedirect(request.getContextPath()+"/login.jsp");
			request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
			return;
		}

		// 目的：封装好一个Order对象 传递给service层
		TbOrders order = new TbOrders();

		// 1、private String oid;//该订单的订单号
		String oid = UUID.randomUUID().toString();
		order.setOid(oid);

		// 2、private Date ordertime;//下单时间
		order.setOrdertime(new Date() + "");

		// 3、private double total;//该订单的总金额
		// 获得session中的购物车
		Cart cart = (Cart) session.getAttribute("cart");
		double total = cart.getTotal();
		order.setTotal(total);

		// 4、private int state;//订单支付状态 1代表已付款 0代表未付款
		order.setState(0);

		// 5、private String address;//收货地址
		order.setAddress(null);

		// 6、private String name;//收货人
		order.setName(null);

		// 7、private String telephone;//收货人电话
		order.setTelephone(null);

		// 8、private User user;//该订单属于哪个用户
		order.setUser(user);

		// 9、该订单中有多少订单项List<OrderItem> orderItems = new ArrayList<OrderItem>();
		// 获得购物车中的购物项的集合map
		Map<String, CartItem> cartItems = cart.getCartItems();
		for (Map.Entry<String, CartItem> entry : cartItems.entrySet()) {
			// 取出每一个购物项
			CartItem cartItem = entry.getValue();
			// 创建新的订单项
			TbOrderitem orderItem = new TbOrderitem();
			// 1)private String itemid;//订单项的id
			orderItem.setItemid(UUID.randomUUID().toString());
			// 2)private int count;//订单项内商品的购买数量
			orderItem.setCount(cartItem.getBuyNum());
			// 3)private double subtotal;//订单项小计
			orderItem.setSubtotal(cartItem.getSubtotal());
			// 4)private Product product;//订单项内部的商品
			orderItem.setProduct(cartItem.getProduct());
			// 5)private Order order;//该订单项属于哪个订单
			orderItem.setOrder(order);

			// 将该订单项添加到订单的订单项集合中
			order.getOrderItems().add(orderItem);
		}

		// order对象封装完毕
		// 传递数据到service层
		// ProductService service = new ProductService();
		cn.lanqiao.service.TbOrdersService service = new cn.lanqiao.service.impl.TbOrdersServiceImpl();

		service.submitOrder(order);

		session.setAttribute("order", order);

		// 页面跳转
		// response.sendRedirect(request.getContextPath()+"/order_info.jsp");
		request.getRequestDispatcher("/my-add.jsp").forward(request, response);
	}

	// 清空购物车
	public void clearCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("cart");

		// 跳转回cart.jsp
		response.sendRedirect(request.getContextPath() + "/my-car.jsp");
		// request.getRequestDispatcher("/WEB-INF/my-car.jsp").forward(request,
		// response);
	}

	// 删除单一商品
	public void delProFromCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获得要删除的item的pid
		String pid = request.getParameter("pid");
		// 删除session中的购物车中的购物项集合中的item
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart != null) {
			Map<String, CartItem> cartItems = cart.getCartItems();
			// 需要修改总价
			double xcount = cart.getTotal() - cartItems.get(pid).getSubtotal();
			// 保留一位小数
			xcount = (double) Math.round(xcount * 100) / 100;
			cart.setTotal(xcount);
			// 删除
			cartItems.remove(pid);
			cart.setCartItems(cartItems);

		}

		session.setAttribute("cart", cart);

		// 跳转回cart.jsp
		response.sendRedirect(request.getContextPath() + "/my-car.jsp");
		// request.getRequestDispatcher("/WEB-INF/my-car.jsp").forward(request,
		// response);
	}

	// 将商品添加到购物车
	public void addProductToCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		TbProductService service = new TbProductServiceImpl();
		// 获得要放到购物车的商品的pid
		String pid = request.getParameter("pid");
		// 获得该商品的购买数量
		int buyNum = Integer.parseInt(request.getParameter("buyNum"));

		// 获得product对象
		TbProduct product = service.getAllProduct(pid);
		// 计算小计
		double subtotal = product.getPshop_price() * buyNum;
		// 保留一位小数
		subtotal = (double) Math.round(subtotal * 100) / 100;
		// 封装CartItem
		CartItem item = new CartItem();
		item.setProduct(product);
		item.setBuyNum(buyNum);
		item.setSubtotal(subtotal);

		// 获得购物车---判断是否在session中已经存在购物车
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
		}

		// 将购物项放到车中---key是pid
		// 先判断购物车中是否已将包含此购物项了 ----- 判断key是否已经存在
		// 如果购物车中已经存在该商品----将现在买的数量与原有的数量进行相加操作
		Map<String, CartItem> cartItems = cart.getCartItems();

		double newsubtotal = 0.0;

		if (cartItems.containsKey(pid)) {
			// 取出原有商品的数量
			CartItem cartItem = cartItems.get(pid);
			int oldBuyNum = cartItem.getBuyNum();
			oldBuyNum += buyNum;
			cartItem.setBuyNum(oldBuyNum);
			cart.setCartItems(cartItems);
			// 修改小计
			// 原来该商品的小计
			double oldsubtotal = cartItem.getSubtotal();
			// 新买的商品的小计
			newsubtotal = buyNum * product.getPshop_price();
			cartItem.setSubtotal(oldsubtotal + newsubtotal);

		} else {
			// 如果车中没有该商品
			cart.getCartItems().put(product.getPid(), item);
			newsubtotal = buyNum * product.getPshop_price();
		}

		// 计算总计
		double total = cart.getTotal() + newsubtotal;
		// 保留一位小数
		total = (double) Math.round(total * 100) / 100;
		cart.setTotal(total);

		// 将车再次访问session
		session.setAttribute("cart", cart);

		// 直接跳转到购物车页面
		response.sendRedirect(request.getContextPath() + "/my-car.jsp");
		// request.getRequestDispatcher("/WEB-INF/my-car.jsp").forward(request,
		// response);
	}

}
