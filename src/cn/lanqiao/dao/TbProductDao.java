package cn.lanqiao.dao;

import java.util.List;

import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbProduct;

public interface TbProductDao {
	// 获得热门商品
	public List<TbProduct> findHotProduct();

	// 获得最新商品
	public List<TbProduct> findNewProduct();

	// 获取分类数据
	public Pager<TbProduct> goodsPager(Integer pagesize, Integer pageindex, String cid);

	// 根据取商品
	public TbProduct getAllProduct(String pid);
	//模糊查询找商品
	public List<TbProduct> searchProduct(String search);
}
