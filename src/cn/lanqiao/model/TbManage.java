package cn.lanqiao.model;

public class TbManage {
	private int mid;
	private String mname;
	private String mpassword;
	
	public TbManage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TbManage(int mid, String mname, String mpassword) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.mpassword = mpassword;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	@Override
	public String toString() {
		return "TbManage [mid=" + mid + ", mname=" + mname + ", mpassword=" + mpassword + "]";
	}
	
}
