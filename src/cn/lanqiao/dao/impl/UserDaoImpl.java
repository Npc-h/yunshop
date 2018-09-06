package cn.lanqiao.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.lanqiao.dao.UserDao;
import cn.lanqiao.model.TbUser;
import cn.lanqiao.model.User;
import cn.lanqiao.util.JdbcUtil;

public class UserDaoImpl implements UserDao {

	@Override
	public User getUserByLoginId(String loginid) {
		User user = null;
		Connection conn =null;
		QueryRunner qr = new QueryRunner();
		String sql = "select * from t_user where username=?";
		try {
			conn = JdbcUtil.getConnection();
			user = qr.query(conn,sql, new BeanHandler<User>(User.class) ,loginid);
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
		
		return user;
	}
	//完善信息
	@Override
	public void addInformation(String uid,String uname,String utelephone,String ubirthday,String usex) {
		Connection conn =null;
		QueryRunner qr = new QueryRunner();
		String sql = "update t_user set uname=?,utelephone=?,ubirthday=?,usex=? where uid=?";
		try {
			conn = JdbcUtil.getConnection();
			qr.update(conn, sql, uname,utelephone,ubirthday,usex,uid);
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
	}
}
