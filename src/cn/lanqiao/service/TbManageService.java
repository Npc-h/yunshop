package cn.lanqiao.service;

import cn.lanqiao.model.TbManage;

public interface TbManageService {
		//校验管理者
	public TbManage checkManage(String managename,String managepassword);
}
