package cn.edu.service;

import com.baomidou.mybatisplus.service.IService;

import cn.edu.common.result.PageInfo;
import cn.edu.model.User;


/**
 * <p>
 * 用户 服务类
 * </p>
 *
 * @author 何志华
 * @since 2017-10-29
 */
public interface IUserService extends IService<User> {
	void page(PageInfo info);
}
