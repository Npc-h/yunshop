package cn.lanqiao.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import cn.lanqiao.dao.TbOrdersDao;
import cn.lanqiao.model.TbOrderitem;
import cn.lanqiao.model.TbOrders;
import cn.lanqiao.model.TbOrdersAdmin;
import cn.lanqiao.util.JdbcUtil;

public class TbOrdersDaoImpl implements TbOrdersDao {

	// 向TbOrders表插入数据
	@Override
	public void addOrders(TbOrders order) {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into t_orders values(?,?,?,?,?,?,?,?)";
		Connection conn = null;
		try {
			conn = JdbcUtil.getConnection();
			runner.update(conn, sql, order.getOid(), order.getOrdertime(),  order.getState(),order.getTotal(),
					order.getAddress(), order.getName(), order.getTelephone(), order.getUser().getUid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 更新收货人信息
	@Override
	public void updateOrderAdrr(TbOrders order) {
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "update t_orders set oaddress=?,oname=?,otelephone=? where oid=?";
		try {
			runner.update(sql, order.getAddress(), order.getName(), order.getTelephone(), order.getOid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 更新支付状态
	@Override
	public void updateOrderState(String r6_Order) {
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "update t_orders set ostate=? where oid=?";
		try {
			runner.update(sql, 1, r6_Order);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 向orderitem表插入数据
	@Override
	public void addOrderItem(TbOrders order) {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into t_orderitem values(?,?,?,?,?)";
		Connection conn = null;
		List<TbOrderitem> orderItems = order.getOrderItems();
		try {
			conn = JdbcUtil.getConnection();
			for (TbOrderitem item : orderItems) {
				runner.update(conn, sql, item.getItemid(), item.getCount(), item.getSubtotal(),
						item.getProduct().getPid(), item.getOrder().getOid());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 获取所有订单
	@Override
	public List<TbOrdersAdmin> findAllOrder() {
		QueryRunner runner = new QueryRunner();
		String sql = "select * from t_orders";
		Connection conn = null;
		List<TbOrdersAdmin> list = null;
		try {
			conn = JdbcUtil.getConnection();
			list = runner.query(conn, sql, new BeanListHandler<TbOrdersAdmin>(TbOrdersAdmin.class));
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	// 根据id查找订单信息
	@Override
	public List<Map<String, Object>> findOrderInfoByOid(String oid) {
		QueryRunner runner = new QueryRunner(JdbcUtil.getDataSource());
		String sql = "select p.pimage,p.pname,p.pshop_price,i.icount,i.isubtotal from t_orderitem i,t_product p where i.pid=p.pid and i.oid=?";
		List<Map<String, Object>> list = null;
		try {
			list = runner.query(sql, new MapListHandler(), oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}
}
