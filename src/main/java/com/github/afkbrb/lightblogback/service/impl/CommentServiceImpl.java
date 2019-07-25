package com.github.afkbrb.lightblogback.service.impl;

import com.github.afkbrb.lightblogback.dao.CommentMapper;
import com.github.afkbrb.lightblogback.model.Comment;
import com.github.afkbrb.lightblogback.service.CommentService;
import com.github.afkbrb.lightblogback.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by CodeGenerator on 2019/07/08.
 */
@Service
@Transactional
public class CommentServiceImpl extends AbstractService<Comment> implements CommentService {
    @Resource
    private CommentMapper commentMapper;

    @Override
    public List<Comment> findAllByBlogId(Integer blogId) {
        Condition condition = new Condition(Comment.class);
        Example.Criteria criteria = condition.createCriteria();
        criteria.andEqualTo("blogId", blogId);
        return commentMapper.selectByCondition(condition);
    }
}
