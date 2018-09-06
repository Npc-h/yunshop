package cn.lanqiao.model;

public class TbCategory {
	private String cid;
	private String cname;
	private String cdesc;
	
	public TbCategory() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TbCategory(String cid, String cname, String cdesc) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.cdesc = cdesc;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCdesc() {
		return cdesc;
	}
	public void setCdesc(String cdesc) {
		this.cdesc = cdesc;
	}
	@Override
	public String toString() {
		return "TbCategory [cid=" + cid + ", cname=" + cname + ", cdesc=" + cdesc + "]";
	}
	
}
