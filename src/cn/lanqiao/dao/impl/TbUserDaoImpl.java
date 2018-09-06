package cn.lanqiao.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.lanqiao.dao.TbUserDao;
import cn.lanqiao.model.TbUser;
import cn.lanqiao.util.JdbcUtil;

public class TbUserDaoImpl implements TbUserDao {
	//查询用户
	@Override
	public Long checkuser(String username) {
		Connection conn = null;
		Long query = 0L;
		try {
			conn = JdbcUtil.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select count(*) from t_user where username=?";
			query = (Long) runner.query(conn,sql, new ScalarHandler(), username);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return query;
	}

	//增加用户
	@Override
	public void insert(TbUser user) {
		Connection conn = null;
		QueryRunner queryRunner = new QueryRunner();
		String insertSql="insert into t_user (uid,username,upassword,uname,uemail,utelephone,ubirthday,usex,ustate) values(?,?,?,?,?,?,?,?,?)";
		try {
			conn = JdbcUtil.getConnection();
			queryRunner.update(conn, insertSql,user.getUid(),user.getUsername(),user.getUpassword(),user.getUname(),user.getUemail(),user.getUtelephone(),user.getUbirthday(),user.getUsex(),user.getUstate());
		} catch (SQLException e) {
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

	//更新状态码(更新用户所以信息有空指针异常)
	@Override
	public void update(TbUser user) {
		Connection conn = null;
		QueryRunner queryRunner = new QueryRunner();
		//String updateSql="update t_user set uid=?,username=?,upassword=?,uname=?,uemail=?,utelephone=?,ubirthday=?,usex=?,ustate=? where uid=? ";
		String updateSql="update t_user set ustate=? where uid=? ";
		try {
			conn = JdbcUtil.getConnection();
			queryRunner.update(conn, updateSql,user.getUstate(),user.getUid());
		} catch (SQLException e) {
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
	//根据主键查找用户

	@Override
	public TbUser get(String uid) {
		Connection conn = null;
		TbUser user = null;
		QueryRunner queryRunner = new QueryRunner();
		String sql="select * from t_user where uid=?";
		try {
			conn = JdbcUtil.getConnection();
			user = queryRunner.query(conn, sql, new BeanHandler<TbUser>(TbUser.class), uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	//查找所有用户
		@Override
		public List<TbUser> selectUser() {
			QueryRunner queryRunner = new QueryRunner();
			String sql = "select * from t_user";
			Connection conn = null;
			List<TbUser> user = null;
			try {
				conn = JdbcUtil.getConnection();
				user = queryRunner.query(conn, sql, new BeanListHandler<TbUser>(TbUser.class));
			} catch (Exception e) {
				// TODO: handle exception
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
}
