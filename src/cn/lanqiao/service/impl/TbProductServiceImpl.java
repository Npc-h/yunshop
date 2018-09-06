package cn.lanqiao.service.impl;

import java.util.List;

import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbProduct;
import cn.lanqiao.service.TbProductService;

public class TbProductServiceImpl implements TbProductService {
	cn.lanqiao.dao.TbProductDao dao = new cn.lanqiao.dao.impl.TbProductDaoImpl();

	// 获得热门商品
	@Override
	public List<TbProduct> findHotProductList() {
		List<TbProduct> hotProductList = null;
		try {
			hotProductList = dao.findHotProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hotProductList;
	}

	// 获得最新商品
	@Override
	public List<TbProduct> findNewProductList() {
		List<TbProduct> newProductList = null;
		try {
			newProductList = dao.findNewProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newProductList;
	}

	// 获得分页数据
	@Override
	public Pager<TbProduct> goodsPager(Integer pagesize, Integer pageindex, String cid) {
		// TODO Auto-generated method stub
		return dao.goodsPager(pagesize, pageindex, cid);
	}

	// 根据ID获得商品
	@Override
	public TbProduct getAllProduct(String pid) {
		TbProduct product = null;
		TbProduct nowProduct = dao.getAllProduct(pid);
		if (nowProduct != null) {
			product = nowProduct;
		}
		return product;
	}

	@Override
	public List<TbProduct> searchProduct(String search) {
		return dao.searchProduct(search);
	}
}
