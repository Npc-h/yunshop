package cn.lanqiao.service.impl;

import java.util.List;

import cn.lanqiao.dao.AdminProductDao;
import cn.lanqiao.dao.impl.AdminProductDaoImpl;
import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbProduct;
import cn.lanqiao.service.AdminProductService;

public class AdminProductServiceImpl implements AdminProductService{
	AdminProductDao dao = new AdminProductDaoImpl();
	
	//获取所有商品+分页
	@Override
	public Pager<TbProduct> goodsPager1(Integer pagesize, Integer pageindex){
		return dao.goodsPager1(pagesize, pageindex);
	}

	//模糊查询商品+分页
	@Override
	public Pager<TbProduct> goodsPager(Integer pagesize, Integer pageindex, String pname) {
		return dao.goodsPager(pagesize, pageindex, pname);
	}
	
	//删除商品
	@Override
	public void deleteProduct(String pid) {
		dao.deleteProduct(pid);
	}
	
	//添加商品
	@Override
	public void insertProduct(TbProduct product) {
		dao.insertProduct(product);
	}
	
	//编辑商品
	@Override
	public void updateProduct(TbProduct product) {
		dao.updateProduct(product);
	}
	
	//模糊查询商品
	@Override
	public List<TbProduct> vagueProduct(String pname) {
		return dao.vagueProduct(pname);
	}
}
