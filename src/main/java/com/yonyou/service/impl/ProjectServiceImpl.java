package com.yonyou.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yonyou.commons.result.Tree;
import com.yonyou.model.Project;
import com.yonyou.mapper.ProjectMapper;
import com.yonyou.service.IProjectService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author shidl
 * @since 2017-06-13
 */
@Service
public class ProjectServiceImpl extends ServiceImpl<ProjectMapper, Project> implements IProjectService {

    @Override
    public Object selectTree() {
        List<Tree> trees = new ArrayList<Tree>();
        List<Project> list = this.selectAll();
        for (Project project:list){
            Tree tree = new Tree();
            tree.setId(project.getId());
            tree.setText(project.getName());
            tree.setPid(project.getPkParent());
            tree.setIconCls("fi-laptop");
            trees.add(tree);
        }
        return trees;
    }

    @Override
    public List<Project> selectAll() {
        EntityWrapper<Project> wrapper = new EntityWrapper<Project>();
        return this.selectList(wrapper);
    }
}
