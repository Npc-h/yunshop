package cn.lanqiao.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.lanqiao.dao.TbCategoryDao;
import cn.lanqiao.model.TbCategory;
import cn.lanqiao.util.JdbcUtil;

public class TbCategoryDaoImpl implements TbCategoryDao {

	@Override
	public List<TbCategory> getAllCategory() {
		List<TbCategory> Category = null;
		Connection conn =null;
		QueryRunner qr = new QueryRunner();
		String sql = "select * from t_category";
		try {
			conn = JdbcUtil.getConnection();
			Category =qr.query(conn, sql, new BeanListHandler<TbCategory>(TbCategory.class));
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
		return Category;
		
	}

}
