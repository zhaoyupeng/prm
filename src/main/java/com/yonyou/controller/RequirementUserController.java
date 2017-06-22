package com.yonyou.controller;

import javax.validation.Valid;

import java.util.List;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.yonyou.commons.result.PageInfo;
import com.yonyou.model.RequirementUser;
import com.yonyou.service.IRequirementUserService;
import com.yonyou.commons.base.BaseController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author shidl
 * @since 2017-06-13
 */
@Controller
@RequestMapping("/requirementUser")
public class RequirementUserController extends BaseController {

    @Autowired private IRequirementUserService requirementUserService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/requirementUser/requirementUserList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(RequirementUser requirementUser, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<RequirementUser> ew = new EntityWrapper<RequirementUser>(requirementUser);
        Page<RequirementUser> pages = getPage(pageInfo);
        pages = requirementUserService.selectPage(pages, ew);
        pageInfo.setRows(pages.getRecords());
        pageInfo.setTotal(pages.getTotal());
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/requirementUser/requirementUserAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid RequirementUser requirementUser) {
        requirementUser.setCreateTime(new Date());
        requirementUser.setUpdateTime(new Date());
        requirementUser.setDeleteFlag(0);
        boolean b = requirementUserService.insert(requirementUser);
        if (b) {
            return renderSuccess("添加成功！");
        } else {
            return renderError("添加失败！");
        }
    }
    
    /**
     * 删除
     * @param id
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        RequirementUser requirementUser = new RequirementUser();
        requirementUser.setId(id);
        requirementUser.setUpdateTime(new Date());
        requirementUser.setDeleteFlag(1);
        boolean b = requirementUserService.updateById(requirementUser);
        if (b) {
            return renderSuccess("删除成功！");
        } else {
            return renderError("删除失败！");
        }
    }
    
    /**
     * 编辑
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long id) {
        RequirementUser requirementUser = requirementUserService.selectById(id);
        model.addAttribute("requirementUser", requirementUser);
        return "admin/requirementUser/requirementUserEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid RequirementUser requirementUser) {
        requirementUser.setUpdateTime(new Date());
        boolean b = requirementUserService.updateById(requirementUser);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
}
