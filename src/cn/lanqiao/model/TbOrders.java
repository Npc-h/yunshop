package cn.lanqiao.model;

import java.util.ArrayList;
import java.util.List;

public class TbOrders {
	private String oid;// 该订单的订单号
	private String ordertime;// 下单时间
	private int state;// 订单支付状态 1代表已付款 0代表未付款

	public TbOrders() {
		super();
		// TODO Auto-generated constructor stub
	}

	private double total;// 该订单的总金额

	private String address;// 收货地址
	private String name;// 收货人
	private String telephone;// 收货人电话

	private User user;// 该订单属于哪个用户

	// 该订单中有多少订单项
	List<TbOrderitem> orderItems = new ArrayList<TbOrderitem>();

	public TbOrders(String oid, String ordertime, int state, double total, String address, String name,
			String telephone, User user, List<TbOrderitem> orderItems) {
		super();
		this.oid = oid;
		this.ordertime = ordertime;
		this.state = state;
		this.total = total;
		this.address = address;
		this.name = name;
		this.telephone = telephone;
		this.user = user;
		this.orderItems = orderItems;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(String ordertime) {
		this.ordertime = ordertime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<TbOrderitem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<TbOrderitem> orderItems) {
		this.orderItems = orderItems;
	}

	@Override
	public String toString() {
		return "TbOrders [oid=" + oid + ", ordertime=" + ordertime + ", state=" + state + ", total=" + total
				+ ", address=" + address + ", name=" + name + ", telephone=" + telephone + ", user=" + user
				+ ", orderItems=" + orderItems + "]";
	}

}