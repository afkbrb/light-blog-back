package com.github.afkbrb.lightblogback.web.admin;

import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Blog;
import com.github.afkbrb.lightblogback.model.BlogContent;
import com.github.afkbrb.lightblogback.model.BlogTag;
import com.github.afkbrb.lightblogback.model.BlogType;
import com.github.afkbrb.lightblogback.model.dto.BlogDTO;
import com.github.afkbrb.lightblogback.model.vo.BlogVO;
import com.github.afkbrb.lightblogback.service.BlogContentService;
import com.github.afkbrb.lightblogback.service.BlogService;
import com.github.afkbrb.lightblogback.service.BlogTagService;
import com.github.afkbrb.lightblogback.service.BlogTypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by CodeGenerator on 2019/07/07.
 */
@RestController
@RequestMapping("/admin/blog")
public class AdminBlogController {

    private final Integer SUMMARY_MAX_LENGTH = 100;

    @Resource
    private BlogService blogService;

    @Resource
    private BlogContentService blogContentService;

    @Resource
    private BlogTagService blogTagService;

    @Resource
    private BlogTypeService blogTypeService;

    @PostMapping("/add")
    public Result add(BlogDTO blogDTO) {
        // 参数验证
        if (StringUtils.isBlank(blogDTO.getTitle())) return ResultGenerator.genFailResult("博客标题不能为空！");
        if (StringUtils.isBlank(blogDTO.getContent())) return ResultGenerator.genFailResult("博客内容不能为空！");
        // 博客类型（原创、转载、翻译）验证
        Integer blogType = blogDTO.getType();
        if (blogType == null) return ResultGenerator.genFailResult("博客类型不能为空！");
        if (blogTypeService.findById(blogType) == null)
            return ResultGenerator.genFailResult("不存在id为" + blogType + "的博客类型！");
        // 博客标签验证
        String tags = blogDTO.getTag();
        if (StringUtils.isBlank(tags)) return ResultGenerator.genFailResult("博客标签不能为空！");
        for (String tag : tags.split(",")) {
            if (blogTagService.findById(Integer.parseInt(tag)) == null) {
                return ResultGenerator.genFailResult("不存在id为" + tag + "的博客标签！");
            }
        }

        // 保存博客信息
        Blog blog = new Blog();
        blog.setTitle(blogDTO.getTitle());
        blog.setType(blogDTO.getType());

        // 保存标签
        blog.setTag(blogDTO.getTag());
        blog.setSummary(getSummary(blogDTO.getContent()));


        // 保存原文地址
        if (StringUtils.isBlank(blogDTO.getOriginalUrl())) {
            blog.setOriginalUrl(null);
        } else {
            blog.setOriginalUrl(blogDTO.getOriginalUrl());
        }

        // 保存图片url
        if (StringUtils.isBlank(blogDTO.getBlogImage())) {
            blog.setBlogImage(null);
        } else {
            blog.setBlogImage(blogDTO.getBlogImage());
        }

        blog.setOriginalUrl(blogDTO.getOriginalUrl());
        blog.setCommentCount(0);
        blog.setLikeCount(0);
        blog.setClickCount(0);
        blog.setCreateDate(new Date());
        blog.setUpdateDate(new Date());

        Integer blogId = blogService.saveAndGetId(blog);

        // 保存正文信息
        BlogContent blogContent = new BlogContent();
        blogContent.setId(blogId);
        blogContent.setContent(blogDTO.getContent());
        blogContentService.save(blogContent);

        return ResultGenerator.genSuccessResult();
    }


    @PostMapping("/update")
    public Result update(BlogDTO blogDTO) {
        // 参数验证
        Integer blogId = blogDTO.getId();
        if (blogId == null) return ResultGenerator.genFailResult("id不能为空！");
        if (blogService.findById(blogId) == null) return ResultGenerator.genFailResult("不存在id为" + blogId + "的博客！");

        if (StringUtils.isBlank(blogDTO.getTitle())) blogDTO.setTitle(null);
        if (StringUtils.isBlank(blogDTO.getContent())) blogDTO.setContent(null);
        if (StringUtils.isBlank(blogDTO.getBlogImage())) blogDTO.setBlogImage(null);

        Integer blogType = blogDTO.getType();
        if (blogType != null) {
            if (blogTypeService.findById(blogType) == null)
                return ResultGenerator.genFailResult("不存在id为" + blogType + "的博客类型！");
        }

        String tags = blogDTO.getTag();
        if (StringUtils.isBlank(tags)) {
            blogDTO.setTag(null);
        } else {
            for (String tag : tags.split(",")) {
                if (blogTagService.findById(Integer.parseInt(tag)) == null) {
                    return ResultGenerator.genFailResult("不存在id为" + tag + "的博客标签！");
                }
            }
        }

        // 更新博客
        Blog blog = new Blog();
        BeanUtils.copyProperties(blogDTO, blog);
        if (StringUtils.isNotBlank(blogDTO.getContent())) {
            blog.setSummary(getSummary(blogDTO.getContent()));
        }

        blog.setUpdateDate(new Date());
        blogService.update(blog);

        // 更新博客正文
        if (StringUtils.isNotBlank(blogDTO.getContent())) {
            BlogContent blogContent = new BlogContent();
            blogContent.setId(blogDTO.getId());
            blogContent.setContent(blogDTO.getContent());
            blogContentService.update(blogContent);
        }

        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        // 由于数据库设置的外键策略为CASCADE，会自动删除相应的content
        blogService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }


    @GetMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        Blog blog = blogService.findById(id);
        BlogContent blogContent = blogContentService.findById(id);
        BlogVO blogVO = new BlogVO();
        BeanUtils.copyProperties(blog, blogVO);
        blogVO.setContent(blogContent.getContent());

        // 设置博客标签
        List<BlogTag> tags = blogTagService.findByIds(blog.getTag());
        StringBuilder sb = new StringBuilder();
        for (BlogTag tag : tags) {
            sb.append(tag.getName() + ",");
        }
        String tagStr = sb.toString();
        if(StringUtils.isBlank(tagStr)) {
            blogVO.setTag("");
        }else {
            blogVO.setTag(tagStr.substring(0, tagStr.length() - 1));
        }

        // 设置博客类型
        BlogType blogType = blogTypeService.findById(blog.getType());
        blogVO.setTypeName(blogType.getName());

        return ResultGenerator.genSuccessResult(blogVO);
    }

    @GetMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        PageHelper.startPage(page, size, "create_date desc");
        List<Blog> list = blogService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }

    @GetMapping("/list/tag")
    public Result listByTag(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size, Integer tagId) {
        PageHelper.startPage(page, size, "create_date desc");
        List<Blog> list = blogService.findAllByTagId(tagId);
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }

    private String getSummary(String content) {
        // 不必从全文去找概览
        if(content.length() > 2 * SUMMARY_MAX_LENGTH) {
            content = content.substring(0, 2 * SUMMARY_MAX_LENGTH);
        }
        content = content.replaceAll("<.*>", ""); // 去除<>内容
        content = content.replaceAll("\\(.*\\)", ""); // 去除()内容
        content = content.replaceAll("\\[.*]", ""); // 去除[]内容
        content = content.replaceAll("\\{.*}", ""); // 去除{}内容
        content = content.replaceAll("<.*", ""); // 去除残损的标签
        content = content.replaceAll("\\s*", ""); // 去除空白
        content = content.replaceAll("\r\n|\n\r|\r|\n", ""); // 去除换行
        content = content.replaceAll("#|`|<|>", ""); //针对Markdown
        if(content.length() > SUMMARY_MAX_LENGTH) {
            return content.substring(0, SUMMARY_MAX_LENGTH);
        }
        return content;
    }
}
