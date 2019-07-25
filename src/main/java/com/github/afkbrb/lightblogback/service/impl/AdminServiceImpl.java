package com.github.afkbrb.lightblogback.service.impl;

import com.github.afkbrb.lightblogback.dao.AdminMapper;
import com.github.afkbrb.lightblogback.model.Admin;
import com.github.afkbrb.lightblogback.service.AdminService;
import com.github.afkbrb.lightblogback.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/07/08.
 */
@Service
@Transactional
public class AdminServiceImpl extends AbstractService<Admin> implements AdminService {
    @Resource
    private AdminMapper adminMapper;

}
