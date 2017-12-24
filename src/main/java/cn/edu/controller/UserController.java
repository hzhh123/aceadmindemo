package cn.edu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.edu.common.base.BaseController;
import cn.edu.common.result.PageInfo;
import cn.edu.model.User;
import cn.edu.service.IUserService;
import cn.edu.utils.StringUtils;

/**
 * <p>
 * 用户 前端控制器
 * </p>
 *
 * @author 何志华
 * @since 2017-10-29
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	@Autowired
	private IUserService userService;

	@RequestMapping("/form")
	public String form(Model model) {
		model.addAttribute("username", "admin");
		return "common/model/form";
	}

	@ResponseBody
	@RequestMapping("/page")
	public Object dataGrid(User user, Integer page, @RequestParam("pageSize")Integer limit, String sort, String order) {
		PageInfo info = new PageInfo(page, limit, sort, order);
		info.setMsg("加载成功！");
		Map<String, Object> condition = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(user.getUsername())) {
			condition.put("username", user.getUsername());
		}
		info.setCondition(condition);
		userService.page(info);
		return info;
	}
	
	@ResponseBody
	@RequestMapping(value="/page",method=RequestMethod.POST)
	public Object page(User user, Integer page, @RequestParam("pageSize")Integer limit, String sort, String order) {
		PageInfo info = new PageInfo(page, limit, sort, order);
		info.setMsg("加载成功！");
		Map<String, Object> condition = new HashMap<String, Object>();
		if (StringUtils.isNotBlank(user.getUsername())) {
			condition.put("username", user.getUsername());
		}
		info.setCondition(condition);
		userService.page(info);
		return info;
	}
}
