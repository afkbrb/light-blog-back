package com.github.afkbrb.lightblogback.web.admin;

import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Blog;
import com.github.afkbrb.lightblogback.model.Comment;
import com.github.afkbrb.lightblogback.model.Reader;
import com.github.afkbrb.lightblogback.model.vo.AdminCommentVO;
import com.github.afkbrb.lightblogback.service.BlogService;
import com.github.afkbrb.lightblogback.service.CommentService;
import com.github.afkbrb.lightblogback.service.ReaderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by CodeGenerator on 2019/07/07.
 */
@RestController
@RequestMapping("/admin/comment")
public class AdminCommentController {

    @Resource
    private CommentService commentService;

    @Resource
    private ReaderService readerService;

    @Resource
    private BlogService blogService;


    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        // 减少相应文章的评论数
        Comment comment = commentService.findById(id);
        if(comment == null) return ResultGenerator.genFailResult("不存在id为" + id + "的评论！");
        Blog blog = blogService.findById(comment.getBlogId());
        if(blog == null) ResultGenerator.genFailResult("不存在id为" + comment.getBlogId() + "的博客！");
        blog.setCommentCount(blog.getCommentCount() - 1);
        blogService.update(blog);
        commentService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @GetMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        Comment comment = commentService.findById(id);
        if (comment == null) return ResultGenerator.genFailResult("不存在id为" + id + "的评论！");
        AdminCommentVO adminCommentVO = getCommentVo(comment);
        return ResultGenerator.genSuccessResult(adminCommentVO);
    }

    @GetMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        PageHelper.startPage(page, size, "comment_date desc");
        List<Comment> list = commentService.findAll();
        List<AdminCommentVO> result = new ArrayList<>();
        for (Comment comment : list) {
            result.add(getCommentVo(comment));
        }

        // 给前端的是VO，但需要分页
        PageInfo pageInfo = new PageInfo(list);
        pageInfo.setList(result);
        return ResultGenerator.genSuccessResult(pageInfo);
    }

    @GetMapping("/list/blog")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size, Integer blogId) {
        PageHelper.startPage(page, size, "comment_date desc");
        List<Comment> list = commentService.findAllByBlogId(blogId);
        List<AdminCommentVO> result = new ArrayList<>();
        for (Comment comment : list) {
            result.add(getCommentVo(comment));
        }

        // 给前端的是VO，但需要分页
        PageInfo pageInfo = new PageInfo(list);
        pageInfo.setList(result);
        return ResultGenerator.genSuccessResult(pageInfo);
    }

    private AdminCommentVO getCommentVo(Comment comment) {

        AdminCommentVO adminCommentVO = new AdminCommentVO();
        adminCommentVO.setId(comment.getId());
        adminCommentVO.setBlogId(comment.getBlogId());
        adminCommentVO.setCommentDate(comment.getCommentDate());
        adminCommentVO.setContent(comment.getContent());

        Integer blogId = comment.getBlogId();
        Blog blog = blogService.findById(blogId);
        adminCommentVO.setBlogTitle(blog.getTitle());

        Reader reader = readerService.findById(comment.getReaderId());
        adminCommentVO.setReaderAvatar(reader.getAvatar());
        adminCommentVO.setReaderName(reader.getName());
        adminCommentVO.setIp(reader.getIp());

        Integer replyCommentId = comment.getReplyCommentId();
        if (replyCommentId != null) {
            Comment replyComment = commentService.findById(replyCommentId);
            adminCommentVO.setReceiverDate(replyComment.getCommentDate());
            adminCommentVO.setReceiverContent(replyComment.getContent());

            Reader receiver = readerService.findById(replyComment.getReaderId());
            adminCommentVO.setReceiverName(receiver.getName());
            adminCommentVO.setReceiverAvatar(receiver.getAvatar());
        }

        return adminCommentVO;
    }
}
