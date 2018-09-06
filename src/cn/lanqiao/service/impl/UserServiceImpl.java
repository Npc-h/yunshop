package cn.lanqiao.service.impl;

import cn.lanqiao.model.User;
import cn.lanqiao.service.UserServie;

public class UserServiceImpl implements UserServie{
	cn.lanqiao.dao.UserDao dao = new cn.lanqiao.dao.impl.UserDaoImpl();
	@Override
	public User getUserByLoginId(String loginid, String loginpassword) {
		User user = null;
		User currentUser = dao.getUserByLoginId(loginid);
		if(currentUser!=null){
			if(currentUser.getUpassword().equals(loginpassword)) {
				user = currentUser;
			}
		}
		return user;
	}
	@Override
	public void addInformation(String uid, String uname, String utelephone, String ubirthday, String usex) {
		dao.addInformation(uid, uname, utelephone, ubirthday, usex);
	}
	
}
