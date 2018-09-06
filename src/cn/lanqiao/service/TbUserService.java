package cn.lanqiao.service;

import java.util.List;

import cn.lanqiao.model.TbUser;

public interface TbUserService {
	//判断用户名是否存在
	public boolean checkUser(String username);
	//增加用户
	public void insertUserreg(TbUser user);
	//更新用户
	public void updateUserreg(TbUser user);
	//根据id查找用户
	public TbUser getUserByUserId(String uid);
	//查找所有用户
	public List<TbUser> selectUser();
}
