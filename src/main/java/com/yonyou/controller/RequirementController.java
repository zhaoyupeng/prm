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
import com.yonyou.model.Requirement;
import com.yonyou.service.IRequirementService;
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
@RequestMapping("/requirement")
public class RequirementController extends BaseController {

    @Autowired private IRequirementService requirementService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/requirement/requirementList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(Requirement requirement, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<Requirement> ew = new EntityWrapper<Requirement>(requirement);
        Page<Requirement> pages = getPage(pageInfo);
        pages = requirementService.selectPage(pages, ew);
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
        return "admin/requirement/requirementAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid Requirement requirement) {
        requirement.setCreateTime(new Date());
        requirement.setUpdateTime(new Date());
        requirement.setDeleteFlag(0);
        boolean b = requirementService.insert(requirement);
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
        Requirement requirement = new Requirement();
        requirement.setId(id);
        requirement.setUpdateTime(new Date());
        requirement.setDeleteFlag(1);
        boolean b = requirementService.updateById(requirement);
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
        Requirement requirement = requirementService.selectById(id);
        model.addAttribute("requirement", requirement);
        return "admin/requirement/requirementEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid Requirement requirement) {
        requirement.setUpdateTime(new Date());
        boolean b = requirementService.updateById(requirement);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

    @PostMapping("/tree")
    @ResponseBody
    public Object tree() {
        return requirementService.selectTree();
    }
}
