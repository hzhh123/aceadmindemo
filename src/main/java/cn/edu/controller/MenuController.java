package cn.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.common.base.BaseController;
import cn.edu.service.IMenuService;
/**
 * <p>
 * 菜单 用户 前端控制器
 * </p>
 *
 * @author何志华
 * @since 2017-12-19
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {

   @Autowired private IMenuService menuService;
    
    @RequestMapping("/manager")
    public String manager() {
        return "admin/menu/menuList";
    }
    @ResponseBody
    @RequestMapping("treeview")
    public Object treeview() {
    	return menuService.treeView();
    }
}
