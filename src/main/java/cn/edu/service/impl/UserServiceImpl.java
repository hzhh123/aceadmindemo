package cn.edu.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import cn.edu.common.result.PageInfo;
import cn.edu.mapper.UserMapper;
import cn.edu.model.User;
import cn.edu.service.IUserService;
import cn.edu.utils.StringUtils;
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
	@Autowired
	private UserMapper userMapper;
	@Override
	public void page(PageInfo info) {
		Page<Map<String, Object>> page = new Page<Map<String, Object>>(info.getPage(), info.getLimit());
		if(StringUtils.isNotBlank(info.getSort())&&!info.getSort().equals("seq")) {
			page.setOrderByField(info.getSort());
		}
		if(StringUtils.isNotBlank(info.getOrder())) {
			page.setAsc(info.getOrder().equalsIgnoreCase("asc"));
		}
		List<Map<String, Object>> list = userMapper.page(page, info.getCondition());
		info.setData(list);
		info.setCount(page.getTotal());
		
	}

}
