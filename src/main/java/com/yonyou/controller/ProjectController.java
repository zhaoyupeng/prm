package com.yonyou.controller;

import javax.validation.Valid;

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
import com.yonyou.model.Project;
import com.yonyou.service.IProjectService;
import com.yonyou.commons.base.BaseController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author shidl
 * @since 2017-06-13
 */
@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

    @Autowired
    private IProjectService projectService;

    @GetMapping("/manager")
    public String manager() {
        return "admin/project/projectList";
    }

    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(Project project, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<Project> ew = new EntityWrapper<Project>(project);
        Page<Project> pages = getPage(pageInfo);
        pages = projectService.selectPage(pages, ew);
        pageInfo.setRows(pages.getRecords());
        pageInfo.setTotal(pages.getTotal());
        return pageInfo;
    }

    /**
     * 添加页面
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/project/projectAdd";
    }

    /**
     * 添加
     *
     * @param
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid Project project) {
        project.setCreateTime(new Date());
        project.setUpdateTime(new Date());
        project.setDeleteFlag(0);
        boolean b = projectService.insert(project);
        if (b) {
            return renderSuccess("添加成功！");
        } else {
            return renderError("添加失败！");
        }
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        Project project = new Project();
        project.setId(id);
        project.setUpdateTime(new Date());
        project.setDeleteFlag(1);
        boolean b = projectService.updateById(project);
        if (b) {
            return renderSuccess("删除成功！");
        } else {
            return renderError("删除失败！");
        }
    }

    /**
     * 编辑
     *
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long id) {
        Project project = projectService.selectById(id);
        model.addAttribute("project", project);
        return "admin/project/projectEdit";
    }

    /**
     * 编辑
     *
     * @param
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid Project project) {
        project.setUpdateTime(new Date());
        boolean b = projectService.updateById(project);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

    @PostMapping("/tree")
    @ResponseBody
    public Object tree() {
        return projectService.selectTree();
    }

    @GetMapping("/proplan")
    public String proplan() {
        return "admin/project/proplan";
    }
}
