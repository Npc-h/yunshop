package cn.lanqiao.dao;

import cn.lanqiao.model.TbManage;

public interface TbManageDao {
	//校验管理员账号和密码
	public TbManage checkManage(String name,String password);
}
