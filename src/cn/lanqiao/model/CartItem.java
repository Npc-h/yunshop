package cn.lanqiao.model;

public class CartItem {

	private TbProduct product;
	private int buyNum;
	private double subtotal;

	public TbProduct getProduct() {
		return product;
	}

	public void setProduct(TbProduct product) {
		this.product = product;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

}
