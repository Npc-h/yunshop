package cn.lanqiao.model;

public class TbProduct {
	private String pid;
	private String pname;
	private double pmarket_price;
	private double pshop_price;
	private String pimage;
	private String pdate;
	private int pis_hot;
	private String pdesc;
	private int pflag;
	private String cid;
	
	public TbProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TbProduct(String pid, String pname, double pmarket_price, double pshop_price, String pimage, String pdate,
			int pis_hot, String pdesc, int pflag, String cid) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pmarket_price = pmarket_price;
		this.pshop_price = pshop_price;
		this.pimage = pimage;
		this.pdate = pdate;
		this.pis_hot = pis_hot;
		this.pdesc = pdesc;
		this.pflag = pflag;
		this.cid = cid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getPmarket_price() {
		return pmarket_price;
	}
	public void setPmarket_price(double pmarket_price) {
		this.pmarket_price = pmarket_price;
	}
	public double getPshop_price() {
		return pshop_price;
	}
	public void setPshop_price(double pshop_price) {
		this.pshop_price = pshop_price;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public int getPis_hot() {
		return pis_hot;
	}
	public void setPis_hot(int pis_hot) {
		this.pis_hot = pis_hot;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public int getPflag() {
		return pflag;
	}
	public void setPflag(int pflag) {
		this.pflag = pflag;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	@Override
	public String toString() {
		return "TbProduct [pid=" + pid + ", pname=" + pname + ", pmarket_price=" + pmarket_price + ", pshop_price="
				+ pshop_price + ", pimage=" + pimage + ", pdate=" + pdate + ", pis_hot=" + pis_hot + ", pdesc=" + pdesc
				+ ", pflag=" + pflag + ", cid=" + cid + "]";
	}
}
