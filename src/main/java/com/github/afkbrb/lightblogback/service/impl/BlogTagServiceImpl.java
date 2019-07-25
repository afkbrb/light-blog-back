package com.github.afkbrb.lightblogback.service.impl;

import com.github.afkbrb.lightblogback.core.AbstractService;
import com.github.afkbrb.lightblogback.dao.BlogTagMapper;
import com.github.afkbrb.lightblogback.model.BlogTag;
import com.github.afkbrb.lightblogback.service.BlogTagService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/07/08.
 */
@Service
@Transactional
public class BlogTagServiceImpl extends AbstractService<BlogTag> implements BlogTagService {
    @Resource
    private BlogTagMapper tagNameMapper;

}
