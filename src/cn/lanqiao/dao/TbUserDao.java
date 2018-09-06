package cn.lanqiao.dao;

import java.util.List;

import cn.lanqiao.model.TbUser;

public interface TbUserDao {
	//查询用户名是否存在
	public Long checkuser(String username);
	//增加用户
	public void insert(TbUser user);
	//更新用户
	public void update(TbUser user);
	//根据ID查找用户
	public TbUser get(String uid);
	//查找所有用户
	public List<TbUser> selectUser();
}
