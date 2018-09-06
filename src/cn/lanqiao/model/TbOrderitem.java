package cn.lanqiao.model;

public class TbOrderitem {
	private String itemid;//订单项的id
	private int count;//订单项内商品的购买数量
	private double subtotal;//订单项小计
	private TbProduct product;//订单项内部的商品
	private TbOrders order;//该订单项属于哪个订单
	
	
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public TbProduct getProduct() {
		return product;
	}
	public void setProduct(TbProduct product) {
		this.product = product;
	}
	public TbOrders getOrder() {
		return order;
	}
	public void setOrder(TbOrders order) {
		this.order = order;
	}
	
	
	
	
}
