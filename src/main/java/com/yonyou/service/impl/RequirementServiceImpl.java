package com.yonyou.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.yonyou.commons.result.Tree;
import com.yonyou.model.Requirement;
import com.yonyou.mapper.RequirementMapper;
import com.yonyou.service.IRequirementService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author shidl
 * @since 2017-06-13
 */
@Service
public class RequirementServiceImpl extends ServiceImpl<RequirementMapper, Requirement> implements IRequirementService {

    @Override
    public Object selectTree() {
        List<Tree> trees = new ArrayList<Tree>();
        List<Requirement> list = this.selectAll();
        for (Requirement requirement : list) {
            Tree tree = new Tree();
            tree.setId(requirement.getId());
            tree.setText(requirement.getName());
            tree.setPid(requirement.getPkParent());
            trees.add(tree);
        }
        return trees;
    }

    @Override
    public List<Requirement> selectAll() {
        EntityWrapper<Requirement> wrapper = new EntityWrapper<Requirement>();
        return this.selectList(wrapper);
    }
}
