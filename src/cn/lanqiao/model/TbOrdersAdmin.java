package cn.lanqiao.model;

import java.util.ArrayList;
import java.util.List;

public class TbOrdersAdmin {
	private String oid;// 该订单的订单号
	private String oordertime;// 下单时间
	private int ostate;// 订单支付状态 1代表已付款 0代表未付款
	private double ototal;// 该订单的总金额
	private String oaddress;// 收货地址
	private String oname;// 收货人
	private String otelephone;// 收货人电话
	private User user;// 该订单属于哪个用户
	// 该订单中有多少订单项
	List<TbOrderitem> orderItems = new ArrayList<TbOrderitem>();
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getOordertime() {
		return oordertime;
	}
	public void setOordertime(String oordertime) {
		this.oordertime = oordertime;
	}
	public int getOstate() {
		return ostate;
	}
	public void setOstate(int ostate) {
		this.ostate = ostate;
	}
	public double getOtotal() {
		return ototal;
	}
	public void setOtotal(double ototal) {
		this.ototal = ototal;
	}
	public String getOaddress() {
		return oaddress;
	}
	public void setOaddress(String oaddress) {
		this.oaddress = oaddress;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOtelephone() {
		return otelephone;
	}
	public void setOtelephone(String otelephone) {
		this.otelephone = otelephone;
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
	public TbOrdersAdmin(String oid, String oordertime, int ostate, double ototal, String oaddress, String oname,
			String otelephone, User user, List<TbOrderitem> orderItems) {
		super();
		this.oid = oid;
		this.oordertime = oordertime;
		this.ostate = ostate;
		this.ototal = ototal;
		this.oaddress = oaddress;
		this.oname = oname;
		this.otelephone = otelephone;
		this.user = user;
		this.orderItems = orderItems;
	}
	public TbOrdersAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "TbOrdersAdmin [oid=" + oid + ", oordertime=" + oordertime + ", ostate=" + ostate + ", ototal=" + ototal
				+ ", oaddress=" + oaddress + ", oname=" + oname + ", otelephone=" + otelephone + ", user=" + user
				+ ", orderItems=" + orderItems + "]";
	}
}
