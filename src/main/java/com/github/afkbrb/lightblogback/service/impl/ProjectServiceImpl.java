package com.github.afkbrb.lightblogback.service.impl;

import com.github.afkbrb.lightblogback.core.AbstractService;
import com.github.afkbrb.lightblogback.dao.ProjectMapper;
import com.github.afkbrb.lightblogback.model.Project;
import com.github.afkbrb.lightblogback.service.ProjectService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/07/07.
 */
@Service
@Transactional
public class ProjectServiceImpl extends AbstractService<Project> implements ProjectService {
    @Resource
    private ProjectMapper projectMapper;

}
