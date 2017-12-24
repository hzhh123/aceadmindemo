package cn.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.common.base.BaseController;

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
	@RequestMapping("/form")
	public String form(Model model) {
		model.addAttribute("username", "admin");
		return "common/model/form";
	}
}
