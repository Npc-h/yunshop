package cn.lanqiao.dao;

import java.util.List;
import java.util.Map;

import cn.lanqiao.model.TbOrders;
import cn.lanqiao.model.TbOrdersAdmin;

public interface TbOrdersDao {
	// 向TbOrders表插入数据
	public void addOrders(TbOrders order);

	// 更新收货人信息
	public void updateOrderAdrr(TbOrders order);

	// 更新支付状态
	public void updateOrderState(String r6_Order);

	// 向orderitem表插入数据
	public void addOrderItem(TbOrders order);

	// 获取所有订单
	public List<TbOrdersAdmin> findAllOrder();

	// 根据id查找订单信息
	public List<Map<String, Object>> findOrderInfoByOid(String oid);
}
