package cn.edu.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import cn.edu.mapper.MenuMapper;
import cn.edu.model.Menu;
import cn.edu.service.IMenuService;
import cn.edu.utils.treeview.Tree;
import cn.edu.utils.treeview.TreeView;

/**
 * <p>
 * 菜单 服务实现类
 * </p>
 *
 * @author 何志华
 * @since 2017-12-19
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {
	@Override
	public List<Tree> treeView() {
		EntityWrapper<Menu>wrapper=new EntityWrapper<Menu>();
		List<Menu>menus=this.selectList(wrapper);
		List<Tree>trees=toTree(menus);
		return TreeView.tree(trees, "0");
	}

	private List<Tree> toTree(List<Menu> menus) {
		List<Tree>trees=new ArrayList<Tree>();
		for(Menu menu:menus) {
			Tree tree=new Tree();
			tree.setId(menu.getId().toString());
			tree.setPid(menu.getPid()==null?"0":menu.getPid().toString());
			tree.setIcon(menu.getIcon()==null?"ace-icon fa fa-file organge":menu.getIcon());
			tree.setText(menu.getName());
			tree.setIconClass("orange");
			trees.add(tree);
		}
		return trees;
	}
}
