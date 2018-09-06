package cn.lanqiao.service.impl;

import java.util.List;

import cn.lanqiao.model.TbCategory;
import cn.lanqiao.service.TbCategoryService;

public class TbCategoryImpl implements TbCategoryService {
	cn.lanqiao.dao.TbCategoryDao dao = new cn.lanqiao.dao.impl.TbCategoryDaoImpl();
	@Override
	public List<TbCategory> getAllTbCategory() {
		// TODO Auto-generated method stub
		return dao.getAllCategory();
		
	}

}
