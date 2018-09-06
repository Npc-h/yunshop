package cn.lanqiao.test;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.junit.Test;

import cn.lanqiao.model.TbProduct;
import cn.lanqiao.util.JdbcUtil;


public class JDBCTest {
	@Test
	public void testConnection() throws SQLException{
		cn.lanqiao.service.AdminProductService service = new cn.lanqiao.service.impl.AdminProductServiceImpl();
		List<TbProduct> findname = service.vagueProduct("vans");
		System.out.println(findname.size());
		
	}
}
