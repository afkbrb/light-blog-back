package com.github.afkbrb.lightblogback.web;
import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Link;
import com.github.afkbrb.lightblogback.service.LinkService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by CodeGenerator on 2019/07/07.
 */
@RestController
@RequestMapping("/link")
public class LinkController {

    @Resource
    private LinkService linkService;


    @GetMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        Link link = linkService.findById(id);
        return ResultGenerator.genSuccessResult(link);
    }

    @GetMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        PageHelper.startPage(page, size, "link_order asc");
        List<Link> list = linkService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
