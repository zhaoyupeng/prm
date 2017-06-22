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
import com.yonyou.model.Buginfo;
import com.yonyou.service.IBuginfoService;
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
@RequestMapping("/buginfo")
public class BuginfoController extends BaseController {

    @Autowired private IBuginfoService buginfoService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/buginfo/buginfoList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(Buginfo buginfo, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<Buginfo> ew = new EntityWrapper<Buginfo>(buginfo);
        Page<Buginfo> pages = getPage(pageInfo);
        pages = buginfoService.selectPage(pages, ew);
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
        return "admin/buginfo/buginfoAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid Buginfo buginfo) {
        buginfo.setCreateTime(new Date());
        buginfo.setUpdateTime(new Date());
        buginfo.setDeleteFlag(0);
        boolean b = buginfoService.insert(buginfo);
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
        Buginfo buginfo = new Buginfo();
        buginfo.setId(id);
        buginfo.setUpdateTime(new Date());
        buginfo.setDeleteFlag(1);
        boolean b = buginfoService.updateById(buginfo);
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
        Buginfo buginfo = buginfoService.selectById(id);
        model.addAttribute("buginfo", buginfo);
        return "admin/buginfo/buginfoEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid Buginfo buginfo) {
        buginfo.setUpdateTime(new Date());
        boolean b = buginfoService.updateById(buginfo);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
}
