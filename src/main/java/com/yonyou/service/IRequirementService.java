package com.yonyou.service;

import com.yonyou.model.Requirement;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author shidl
 * @since 2017-06-13
 */
public interface IRequirementService extends IService<Requirement> {

    Object selectTree();

    List<Requirement> selectAll();
}
