package cn.lanqiao.service.impl;

import java.util.List;

import cn.lanqiao.model.TbUser;
import cn.lanqiao.service.TbUserService;

public class TbUserServiceImpl implements TbUserService {
	cn.lanqiao.dao.TbUserDao dao = new cn.lanqiao.dao.impl.TbUserDaoImpl();

	// 判断用户是否存在
	@Override
	public boolean checkUser(String username) {
		Long isExist = 0L;
		try {
			isExist = dao.checkuser(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isExist > 0 ? true : false;
	}

	// 插入用户
	@Override
	public void insertUserreg(TbUser user) {
		dao.insert(user);
	}

	// 更新用户信息
	@Override
	public void updateUserreg(TbUser user) {
		dao.update(user);

	}

	// 根据id查找用户
	@Override
	public TbUser getUserByUserId(String uid) {
		return dao.get(uid);
	}

	// 查找所有用户
	@Override
	public List<TbUser> selectUser() {
		cn.lanqiao.dao.TbUserDao dao = new cn.lanqiao.dao.impl.TbUserDaoImpl();
		return dao.selectUser();
	}

}
