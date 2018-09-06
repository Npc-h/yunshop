package cn.lanqiao.service;

import java.util.List;

import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbProduct;

public interface AdminProductService {
	//获取所有商品+分页
	public Pager<TbProduct> goodsPager1(Integer pagesize, Integer pageindex);

	//模糊查询商品+分页
	public Pager<TbProduct> goodsPager(Integer pagesize, Integer pageindex, String pname);
	
	//删除商品
	public void deleteProduct(String pid);

	//添加商品
	public void insertProduct(TbProduct product);
	
	//编辑商品
	public void updateProduct(TbProduct product);
	
	//模糊查询商品
	public List<TbProduct> vagueProduct(String pname);
}
