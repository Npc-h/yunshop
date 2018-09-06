package cn.lanqiao.dao;

import cn.lanqiao.model.User;

public interface UserDao {
	public User getUserByLoginId(String loginid);
	public void addInformation(String uid,String uname,String utelephone,String ubirthday,String usex);
}
