package com.github.afkbrb.lightblogback.web.admin;

import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Link;
import com.github.afkbrb.lightblogback.service.LinkService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by CodeGenerator on 2019/07/07.
 */
@RestController
@RequestMapping("/admin/link")
public class AdminLinkController {
    @Resource
    private LinkService linkService;

    @PostMapping("/add")
    public Result add(Link link) {
        if (StringUtils.isBlank(link.getLinkName())) return ResultGenerator.genFailResult("链接的名称不能为空！");
        if (StringUtils.isBlank(link.getLinkUrl())) return ResultGenerator.genFailResult("链接的url不能为空");
        if (link.getLinkOrder() == null) return ResultGenerator.genFailResult("链接的次序不能为空！");
        linkService.save(link);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        linkService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/update")
    public Result update(Link link) {
        Integer linkId = link.getId();
        if (linkId == null) return ResultGenerator.genFailResult("链接的id不能为空！");
        if (linkService.findById(linkId) == null) return ResultGenerator.genFailResult("不存在id为" + linkId + "的链接！");

        Link newLink = new Link();
        newLink.setId(linkId);
        if (StringUtils.isNotBlank(link.getLinkUrl())) newLink.setLinkUrl(link.getLinkUrl());
        if (StringUtils.isNotBlank(link.getLinkName())) newLink.setLinkName(link.getLinkName());
        if (link.getLinkOrder() != null) new Link().setLinkOrder(link.getLinkOrder());
        linkService.update(link);
        return ResultGenerator.genSuccessResult();
    }

    @GetMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        Link link = linkService.findById(id);
        return ResultGenerator.genSuccessResult(link);
    }

    @GetMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        PageHelper.startPage(page, size);
        List<Link> list = linkService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
