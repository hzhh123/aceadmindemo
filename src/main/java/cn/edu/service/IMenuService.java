package cn.edu.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

import cn.edu.model.Menu;
import cn.edu.utils.treeview.Tree;
/*
 * <p>
 * 菜单 服务类
 * </p>
 *
 * @author 何志华
 * @since 2017-12-19
 */
public interface IMenuService extends IService<Menu> {
	List<Tree>treeView();
}
