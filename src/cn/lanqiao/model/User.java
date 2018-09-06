package cn.lanqiao.model;

public class User {
	private String uid;
	private String username;
	private String upassword;
	private String uname;
	private String uemail;
	private String utelephone;
	private String ubirthday;
	private String usex;
	private Integer ustate;
	public User() {
		super();
	}
	public User(String uid, String username, String upassword, String uname, String uemail, String utelephone,
			String ubirthday, String usex, Integer ustate) {
		super();
		this.uid = uid;
		this.username = username;
		this.upassword = upassword;
		this.uname = uname;
		this.uemail = uemail;
		this.utelephone = utelephone;
		this.ubirthday = ubirthday;
		this.usex = usex;
		this.ustate = ustate;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUtelephone() {
		return utelephone;
	}
	public void setUtelephone(String utelephone) {
		this.utelephone = utelephone;
	}
	public String getUbirthday() {
		return ubirthday;
	}
	public void setUbirthday(String ubirthday) {
		this.ubirthday = ubirthday;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public Integer getUstate() {
		return ustate;
	}
	public void setUstate(Integer ustate) {
		this.ustate = ustate;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", upassword=" + upassword + ", uname=" + uname
				+ ", uemail=" + uemail + ", utelephone=" + utelephone + ", ubirthday=" + ubirthday + ", usex=" + usex
				+ ", ustate=" + ustate + "]";
	}
	
}
