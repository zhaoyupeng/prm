package com.yonyou.service;

import com.baomidou.mybatisplus.service.IService;
import com.yonyou.commons.result.PageInfo;
import com.yonyou.model.SysLog;

/**
 *
 * SysLog 表数据服务层接口
 *
 */
public interface ISysLogService extends IService<SysLog> {

    void selectDataGrid(PageInfo pageInfo);

}