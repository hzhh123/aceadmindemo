package cn.edu.test;

import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import cn.edu.model.Menu;
import cn.edu.service.IMenuService;
import cn.edu.utils.treeview.Tree;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class Test1 {
	@Autowired
	private DataSource dataSource;
	@Autowired
	private IMenuService menuService;
	@Test
	public void test1() throws SQLException {
		System.out.println(dataSource.getConnection());
	}
	@Test
	public void test2() {
		System.out.println(System.getProperty("user.dir"));
	}
	@Test
	public void test3() {
		EntityWrapper<Menu>wrapper=new EntityWrapper<Menu>();
		List<Menu>menus=menuService.selectList(wrapper);
		System.out.println(menus.size());
	}
	@Test
	public void test4() {
		List<Tree>trees=menuService.treeView();
		System.out.println(trees.size());
	}
}
