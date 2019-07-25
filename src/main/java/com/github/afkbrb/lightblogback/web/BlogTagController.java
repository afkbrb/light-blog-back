package com.github.afkbrb.lightblogback.web;
import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.BlogTag;
import com.github.afkbrb.lightblogback.service.BlogTagService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by CodeGenerator on 2019/07/08.
 */
@RestController
@RequestMapping("/blog/tag")
public class BlogTagController {

    @Resource
    private BlogTagService blogTagService;

    @GetMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        BlogTag blogTag = blogTagService.findById(id);
        return ResultGenerator.genSuccessResult(blogTag);
    }

    @GetMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        PageHelper.startPage(page, size);
        List<BlogTag> list = blogTagService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
