package cn.lanqiao.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.taglibs.standard.tag.common.sql.DataSourceUtil;

import cn.lanqiao.dao.AdminProductDao;
import cn.lanqiao.model.Pager;
import cn.lanqiao.model.TbCategory;
import cn.lanqiao.model.TbProduct;
import cn.lanqiao.util.JdbcUtil;

public class AdminProductDaoImpl implements AdminProductDao{
	
	//获取所有商品+分页
	@Override
	public Pager<TbProduct> goodsPager1(Integer pagesize, Integer pageindex) {
		Connection conn = null;
		Pager<TbProduct> pager = new Pager<TbProduct>();
		try {
			conn = JdbcUtil.getConnection();
			QueryRunner runner = new QueryRunner();
			Integer startIndex = pagesize * (pageindex - 1) + 1;
			//获取所有商品
			String sql1 = "select * from t_product limit ?,?";
			List<TbProduct> list = runner.query(conn, sql1, new BeanListHandler<TbProduct>(TbProduct.class), startIndex-1, pagesize);
			//获取商品类型
			String sql2 = "select c.cid,c.cname,c.cdesc from t_product p,t_category c where p.cid=c.cid ";
			List<TbCategory> name = runner.query(conn, sql2, new BeanListHandler<TbCategory>(TbCategory.class));
			//将id => name
			for(int i=0;i<list.size();i++) {
				list.get(i).setCid(name.get(i).getCname());
			}
			String sql3 = "select count(*) from t_product";
			Long total = (Long) runner.query(conn, sql3, new ScalarHandler<>());
			pager.setDatas(list);
			// 分页参数;
			pager.setPageindex(pageindex);
			pager.setPagesize(pagesize);
			// 总记录数;
			Integer totalrecords = total.intValue();
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
	
	//模糊查询商品+分页
	@Override
	public Pager<TbProduct> goodsPager(Integer pagesize, Integer pageindex, String cid) {
		Connection conn = null;
		Pager<TbProduct> pager = new Pager<TbProduct>();
		try {
			conn = JdbcUtil.getConnection();
			QueryRunner runner = new QueryRunner();
			Integer startIndex = pagesize * (pageindex - 1) + 1;
			String sql1 = "select * from t_product where cid=? limit ?,?";
			List<TbProduct> list = runner.query(conn, sql1, new BeanListHandler<TbProduct>(TbProduct.class), cid, startIndex-1, pagesize);
			//获取商品类
			String sql2 = "select c.cid,c.cname,c.cdesc from t_product p,t_category c where p.cid=c.cid and p.cid = ?";
			List<TbCategory> name = runner.query(conn, sql2, new BeanListHandler<TbCategory>(TbCategory.class), cid);
			//将id => name
			for(int i=0;i<list.size();i++) {
				list.get(i).setCid(name.get(i).getCname());
			}
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
	
	//分类分页
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

	//删除商品
	@Override
	public void deleteProduct(String pid) {
		Connection conn = null;
		Long total = null;
		try {
			conn = JdbcUtil.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "delete from t_product where pid=?";
			runner.update(conn, sql, pid);
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
	}
	
	//添加商品
	@Override
	public void insertProduct(TbProduct product) {
		Connection conn = null;
		Long total = null;
		try {
			conn = JdbcUtil.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "insert into t_product values(?,?,?,?,?,?,?,?,?,?)";
			runner.update(conn, sql, product.getPid(),product.getPname(),product.getPmarket_price(),product.getPshop_price(),product.getPimage(),
					product.getPdate(),product.getPis_hot(),product.getPdesc(),product.getPflag(),product.getCid());
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
		
	}
	
	//编辑商品
	@Override
	public void updateProduct(TbProduct product) {
		Connection conn = null;
		Long total = null;
		try {
			conn = JdbcUtil.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "update t_product set pname=?,pmarket_price=?,pshop_price=?,pimage=?,pis_hot=?,pdesc=?,cid=? where pid=?";
			runner.update(conn, sql, product.getPname(),product.getPmarket_price(),product.getPshop_price(),product.getPimage(),
					product.getPis_hot(),product.getPdesc(),product.getCid(),product.getPid());
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
	}

	//模糊查询商品
	@Override
	public List<TbProduct>  vagueProduct(String pname) {
		Connection conn = null;
		List<TbProduct> list = null;
		try {
			conn = JdbcUtil.getConnection();
			QueryRunner runner = new QueryRunner();
			String sql = "select * from t_product where pname like ?";
			list = runner.query(conn, sql, new BeanListHandler<TbProduct>(TbProduct.class),"%"+pname+"%");
		} catch (Exception e) {
			
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
			
	}

	
	
}
