package com.github.afkbrb.lightblogback.web.admin;
import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Project;
import com.github.afkbrb.lightblogback.model.dto.ProjectDTO;
import com.github.afkbrb.lightblogback.service.ProjectService;
import com.github.afkbrb.lightblogback.web.UploadController;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * Created by CodeGenerator on 2019/07/07.
 */
@RestController
@RequestMapping("/admin/project")
public class AdminProjectController {

    @Resource
    private ProjectService projectService;

    @Resource
    private UploadController uploadController;

    @PostMapping("/add")
    public Result add(Project project) {

        if(StringUtils.isBlank(project.getName())) return ResultGenerator.genFailResult("项目名称不能为空！");
        if(StringUtils.isBlank(project.getUrl())) return ResultGenerator.genFailResult("项目链接不能为空！");
        if(project.getProjectOrder() == null) return ResultGenerator.genFailResult("项目次序不能为空！");
        if(StringUtils.isBlank(project.getImage())) project.setImage(null);

        project.setId(null);

        projectService.save(project);
        return ResultGenerator.genSuccessResult();
    }


    @PostMapping("/update")
    public Result update(Project project) {

        Integer projectId = project.getId();
        if(projectId == null) return ResultGenerator.genFailResult("项目id不能为空！");
        if(projectService.findById(projectId) == null) return ResultGenerator.genFailResult("不存在id为" + projectId + "的项目！");

        //  防止保存空（但不是null，而是空格之类）信息
        if(StringUtils.isBlank(project.getUrl())) project.setUrl(null);
        if(StringUtils.isBlank(project.getName())) project.setName(null);
        if(StringUtils.isBlank(project.getImage())) project.setImage(null);

        projectService.update(project);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        projectService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

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
