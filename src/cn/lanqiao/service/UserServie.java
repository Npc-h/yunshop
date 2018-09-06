package cn.lanqiao.service;

import cn.lanqiao.model.User;

public interface UserServie {
	public User getUserByLoginId(String loginid,String loginpassword);
	public void addInformation(String uid,String uname,String utelephone,String ubirthday,String usex);
}
