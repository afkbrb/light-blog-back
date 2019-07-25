package com.github.afkbrb.lightblogback.service.impl;

import com.github.afkbrb.lightblogback.core.AbstractService;
import com.github.afkbrb.lightblogback.dao.BlogContentMapper;
import com.github.afkbrb.lightblogback.model.BlogContent;
import com.github.afkbrb.lightblogback.service.BlogContentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/07/08.
 */
@Service
@Transactional
public class BlogContentServiceImpl extends AbstractService<BlogContent> implements BlogContentService {
    @Resource
    private BlogContentMapper blogContentMapper;

}
