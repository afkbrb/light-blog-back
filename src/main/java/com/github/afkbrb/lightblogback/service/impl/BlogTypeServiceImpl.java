package com.github.afkbrb.lightblogback.service.impl;

import com.github.afkbrb.lightblogback.core.AbstractService;
import com.github.afkbrb.lightblogback.dao.BlogTypeMapper;
import com.github.afkbrb.lightblogback.model.BlogType;
import com.github.afkbrb.lightblogback.service.BlogTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/07/08.
 */
@Service
@Transactional
public class BlogTypeServiceImpl extends AbstractService<BlogType> implements BlogTypeService {
    @Resource
    private BlogTypeMapper typeNameMapper;

}
