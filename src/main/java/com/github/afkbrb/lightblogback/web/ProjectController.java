package com.github.afkbrb.lightblogback.web;
import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Project;
import com.github.afkbrb.lightblogback.service.ProjectService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by CodeGenerator on 2019/07/07.
 */
@RestController
@RequestMapping("/project")
public class ProjectController {

    @Resource
    private ProjectService projectService;


    @GetMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        Project project = projectService.findById(id);
        if (project == null) return ResultGenerator.genFailResult("不存在id为" + id + "的项目！");
        return ResultGenerator.genSuccessResult(project);
    }

    @GetMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        PageHelper.startPage(page, size, "project_order asc");
        List<Project> list = projectService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
