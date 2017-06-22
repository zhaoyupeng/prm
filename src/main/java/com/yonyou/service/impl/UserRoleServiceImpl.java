package com.yonyou.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.yonyou.mapper.UserRoleMapper;
import com.yonyou.model.UserRole;
import com.yonyou.service.IUserRoleService;
import org.springframework.stereotype.Service;

/**
 *
 * UserRole 表数据服务层接口实现类
 *
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

}