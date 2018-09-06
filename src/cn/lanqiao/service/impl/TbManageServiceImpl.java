package cn.lanqiao.service.impl;

import cn.lanqiao.model.TbManage;
import cn.lanqiao.service.TbManageService;

public class TbManageServiceImpl implements TbManageService {

	@Override
	public TbManage checkManage(String managename, String managepassword) {
		cn.lanqiao.dao.TbManageDao dao = new cn.lanqiao.dao.impl.TbManageDaoImpl();
		return dao.checkManage(managename, managepassword);
	}

}
