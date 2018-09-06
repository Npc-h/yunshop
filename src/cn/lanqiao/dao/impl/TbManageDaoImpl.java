package cn.lanqiao.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.lanqiao.dao.TbManageDao;
import cn.lanqiao.model.TbManage;
import cn.lanqiao.util.JdbcUtil;

public class TbManageDaoImpl implements TbManageDao {

	@Override
	public TbManage checkManage(String name, String password) {
		TbManage manage = null;
		Connection conn =null;
		QueryRunner qr = new QueryRunner();
		String sql = "select * from t_manage where mname=? && mpassword=?";
		try {
			conn = JdbcUtil.getConnection();
			manage = qr.query(conn,sql, new BeanHandler<TbManage>(TbManage.class) ,name,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return manage;
	}


	

}
