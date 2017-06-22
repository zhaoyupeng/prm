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
import com.yonyou.model.ProjectUser;
import com.yonyou.service.IProjectUserService;
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
@RequestMapping("/projectUser")
public class ProjectUserController extends BaseController {

    @Autowired private IProjectUserService projectUserService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/projectUser/projectUserList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(ProjectUser projectUser, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<ProjectUser> ew = new EntityWrapper<ProjectUser>(projectUser);
        Page<ProjectUser> pages = getPage(pageInfo);
        pages = projectUserService.selectPage(pages, ew);
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
        return "admin/projectUser/projectUserAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid ProjectUser projectUser) {
        projectUser.setCreateTime(new Date());
        projectUser.setUpdateTime(new Date());
        projectUser.setDeleteFlag(0);
        boolean b = projectUserService.insert(projectUser);
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
        ProjectUser projectUser = new ProjectUser();
        projectUser.setId(id);
        projectUser.setUpdateTime(new Date());
        projectUser.setDeleteFlag(1);
        boolean b = projectUserService.updateById(projectUser);
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
        ProjectUser projectUser = projectUserService.selectById(id);
        model.addAttribute("projectUser", projectUser);
        return "admin/projectUser/projectUserEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid ProjectUser projectUser) {
        projectUser.setUpdateTime(new Date());
        boolean b = projectUserService.updateById(projectUser);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
}
