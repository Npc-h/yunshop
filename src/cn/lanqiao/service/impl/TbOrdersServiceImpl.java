package cn.lanqiao.service.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cn.lanqiao.model.TbOrders;
import cn.lanqiao.model.TbOrdersAdmin;
import cn.lanqiao.service.TbOrdersService;
import cn.lanqiao.util.JdbcUtil;

public class TbOrdersServiceImpl implements TbOrdersService {
	cn.lanqiao.dao.TbOrdersDao dao = new cn.lanqiao.dao.impl.TbOrdersDaoImpl();
	//提交订单 将订单的数据和订单项的数据存储到数据库中
	@Override
	public void submitOrder(TbOrders order) {
		try {
			//1、开启事务
			JdbcUtil.startTransaction();
			//2、调用dao存储order表数据的方法
			dao.addOrders(order);
			//3、调用dao存储orderitem表数据的方法
			dao.addOrderItem(order);
			
		} catch (SQLException e) {
			try {
				JdbcUtil.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				JdbcUtil.commitAndRelease();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		

	}
	//更新收货人地址
	@Override
	public void updateOrderAdrr(TbOrders order) {
		dao.updateOrderAdrr(order);

	}
	//更新收货人状态
	@Override
	public void updateOrderState(String r6_Order) {
		dao.updateOrderState(r6_Order);

	}
	//获取所有订单
	@Override
	public List<TbOrdersAdmin> findAllOrders() {
		return dao.findAllOrder();
	}

	//根据编号获得订单信息
	@Override
	public List<Map<String, Object>> findOrderInfoByOid(String oid) {
		
		return dao.findOrderInfoByOid(oid);
	}
}