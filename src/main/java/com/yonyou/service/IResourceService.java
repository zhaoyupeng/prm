package com.yonyou.service;

import com.baomidou.mybatisplus.service.IService;
import com.yonyou.commons.result.Tree;
import com.yonyou.commons.shiro.ShiroUser;
import com.yonyou.model.Resource;

import java.util.List;

/**
 *
 * Resource 表数据服务层接口
 *
 */
public interface IResourceService extends IService<Resource> {

    List<Resource> selectAll();

    List<Tree> selectAllMenu();

    List<Tree> selectAllTree();

    List<Tree> selectTree(ShiroUser shiroUser);

}