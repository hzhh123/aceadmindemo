package cn.edu.service.impl;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import cn.edu.mapper.UserMapper;
import cn.edu.model.User;
import cn.edu.service.IUserService;

/**
 * <p>
 * 用户 服务实现类
 * </p>
 *
 * @author 何志华
 * @since 2017-10-29
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {
}
