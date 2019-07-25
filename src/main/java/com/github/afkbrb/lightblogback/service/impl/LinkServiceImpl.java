package com.github.afkbrb.lightblogback.service.impl;

import com.github.afkbrb.lightblogback.dao.LinkMapper;
import com.github.afkbrb.lightblogback.model.Link;
import com.github.afkbrb.lightblogback.service.LinkService;
import com.github.afkbrb.lightblogback.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/07/07.
 */
@Service
@Transactional
public class LinkServiceImpl extends AbstractService<Link> implements LinkService {
    @Resource
    private LinkMapper linkMapper;

}
