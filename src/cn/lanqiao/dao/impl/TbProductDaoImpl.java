package cn.lanqiao.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.lanqiao.dao.TbProductDao;
import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbProduct;
import cn.lanqiao.util.JdbcUtil;

public class TbProductDaoImpl implements TbProductDao {

	// 获得热门商品
	@Override
	public List<TbProduct> findHotProduct() {
		List<TbProduct> pros = null;
		Connection conn = null;
		try {
			QueryRunner runner = new QueryRunner();
			conn = JdbcUtil.getConnection();
			String sql = "select * from t_product where pis_hot=? limit ?,?";
			pros = runner.query(conn, sql, new BeanListHandler<TbProduct>(TbProduct.class), 1, 0, 6);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return pros;
	}

	// 获得最新商品
	@Override
	public List<TbProduct> findNewProduct() {
		List<TbProduct> pros = null;
		Connection conn = null;
		try {
			QueryRunner runner = new QueryRunner();
			conn = JdbcUtil.getConnection();
			String sql = "select * from t_product order by pdate desc limit ?,?";
			pros = runner.query(conn, sql, new BeanListHandler<TbProduct>(TbProduct.class), 0, 10);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return pros;
	}

	@Override
	public Pager<TbProduct> goodsPager(Integer pagesize, Integer pageindex, String cid) {
		Connection conn = null;
		Pager<TbProduct> pager = new Pager<TbProduct>();
		try {
			conn = JdbcUtil.getConnection();
			QueryRunner runner = new QueryRunner();
			Integer startIndex = pagesize * (pageindex - 1) + 1;
			String sql = "select * from t_product where cid=? limit ?,?";
			List<TbProduct> list = runner.query(conn, sql, new BeanListHandler<TbProduct>(TbProduct.class), cid, startIndex-1,
					pagesize);
			//
			pager.setDatas(list);
			// 分页参数;
			pager.setPageindex(pageindex);
			pager.setPagesize(pagesize);
			// 总记录数;
			Integer totalrecords = pagerRecords(cid);
			pager.setTotalRecords(totalrecords);
			// 总页数;
			int pagecount = (totalrecords % pagesize == 0) ? totalrecords / pagesize : totalrecords / pagesize + 1;
			pager.setPagecount(pagecount);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return pager;
	}

	public Integer pagerRecords(String cid) {
		Connection conn = null;
		Long total = null;
		try {
			conn = JdbcUtil.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select count(*) from t_product where cid=?";
			total = (Long) runner.query(conn, sql, new ScalarHandler<>(), cid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return total.intValue();
	}
    
	//根据ID获得商品
	@Override
	public TbProduct getAllProduct(String pid) {
		TbProduct pros = null;
		Connection conn = null;
		try {
			QueryRunner runner = new QueryRunner();
			conn = JdbcUtil.getConnection();
			String sql = "select * from t_product where pid=?";
			pros = runner.query(conn,sql, new BeanHandler<TbProduct>(TbProduct.class),pid);
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
		return pros;
	}
	//模糊查询
	@Override
	public List<TbProduct> searchProduct(String search) {
		List<TbProduct> searchProduct = null;
		Connection conn = null;
		QueryRunner qr = new QueryRunner();
		//select DISTINCT(pname)  from t_product where pname like '%2%' or pdesc like '%4GB%';
		String sql  = "select * from t_product where pname like ? or pdesc like ? group by pname";
		try {
			conn = JdbcUtil.getConnection();
			searchProduct = qr.query(conn, sql, new BeanListHandler<TbProduct>(TbProduct.class), "%"+search+"%","%"+search+"%");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return searchProduct;
	}
}
