package cn.lanqiao.service;

import java.util.List;
import java.util.Map;

import cn.lanqiao.model.TbOrders;
import cn.lanqiao.model.TbOrdersAdmin;

public interface TbOrdersService {
	// 提交订单 将订单的数据和订单项的数据存储到数据库中
	public void submitOrder(TbOrders order);

	// 更新收货人信息
	public void updateOrderAdrr(TbOrders order);

	// 更新订单状态
	public void updateOrderState(String r6_Order);

	// 获取所有订单
	public List<TbOrdersAdmin> findAllOrders();

	// 根据编号查找商品信息
	public List<Map<String, Object>> findOrderInfoByOid(String oid);
}
