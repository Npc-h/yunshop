package cn.lanqiao.service;

import java.util.List;

import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbProduct;

public interface TbProductService {
	// 获得热门商品
	public List<TbProduct> findHotProductList();

	// 获得最新商品
	public List<TbProduct> findNewProductList();

	// 获取分页数据
	public Pager<TbProduct> goodsPager(Integer pagesize, Integer pageindex, String cid);

	// 根据取商品
	public TbProduct getAllProduct(String pid);
	
	// 模糊查询
	public List<TbProduct> searchProduct(String search);
}
