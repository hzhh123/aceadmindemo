package cn.edu.mapper;


import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;

import cn.edu.model.User;

/**
 * <p>
  * 用户 Mapper 接口
 * </p>
 *
 * @author 何志华
 * @since 2017-10-29
 */
public interface UserMapper extends BaseMapper<User> {
	 List<Map<String, Object>> page(Page<Map<String, Object>> page, Map<String, Object> condition);

}