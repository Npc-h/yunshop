package cn.lanqiao.test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class UserTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void test() {
		cn.lanqiao.service.UserServie user = new cn.lanqiao.service.impl.UserServiceImpl();
		System.out.println(user.getUserByLoginId("NPC", "12345"));
	}

}
