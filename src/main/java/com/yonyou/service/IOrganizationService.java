package com.yonyou.service;

import com.baomidou.mybatisplus.service.IService;
import com.yonyou.commons.result.Tree;
import com.yonyou.model.Organization;

import java.util.List;

/**
 *
 * Organization 表数据服务层接口
 *
 */
public interface IOrganizationService extends IService<Organization> {

    List<Tree> selectTree();

    List<Organization> selectTreeGrid();

}