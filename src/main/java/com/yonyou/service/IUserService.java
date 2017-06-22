package com.yonyou.service;

import com.baomidou.mybatisplus.service.IService;
import com.yonyou.commons.result.PageInfo;
import com.yonyou.model.User;
import com.yonyou.model.dto.UserVo;

import java.util.List;

/**
 *
 * User 表数据服务层接口
 *
 */
public interface IUserService extends IService<User> {

    List<User> selectByLoginName(UserVo userVo);

    void insertByVo(UserVo userVo);

    UserVo selectVoById(Long id);

    void updateByVo(UserVo userVo);

    void updatePwdByUserId(Long userId, String md5Hex);

    void selectDataGrid(PageInfo pageInfo);

    void deleteUserById(Long id);

    Object selectTree();

    List<User> selectAll();
}