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
import com.yonyou.model.Document;
import com.yonyou.service.IDocumentService;
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
@RequestMapping("/document")
public class DocumentController extends BaseController {

    @Autowired private IDocumentService documentService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/document/documentList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(Document document, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<Document> ew = new EntityWrapper<Document>(document);
        Page<Document> pages = getPage(pageInfo);
        pages = documentService.selectPage(pages, ew);
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
        return "admin/document/documentAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid Document document) {
        document.setCreateTime(new Date());
        document.setUpdateTime(new Date());
        document.setDeleteFlag(0);
        boolean b = documentService.insert(document);
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
        Document document = new Document();
        document.setId(id);
        document.setUpdateTime(new Date());
        document.setDeleteFlag(1);
        boolean b = documentService.updateById(document);
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
        Document document = documentService.selectById(id);
        model.addAttribute("document", document);
        return "admin/document/documentEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid Document document) {
        document.setUpdateTime(new Date());
        boolean b = documentService.updateById(document);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
}
