package com.github.afkbrb.lightblogback.web;

import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Admin;
import com.github.afkbrb.lightblogback.model.Blog;
import com.github.afkbrb.lightblogback.model.Comment;
import com.github.afkbrb.lightblogback.model.Reader;
import com.github.afkbrb.lightblogback.model.dto.CommentReaderDTO;
import com.github.afkbrb.lightblogback.model.vo.CommentVO;
import com.github.afkbrb.lightblogback.service.AdminService;
import com.github.afkbrb.lightblogback.service.BlogService;
import com.github.afkbrb.lightblogback.service.CommentService;
import com.github.afkbrb.lightblogback.service.ReaderService;
import com.github.afkbrb.lightblogback.util.AvatarGenerator;
import com.github.afkbrb.lightblogback.util.IpAddressUtil;
import com.github.afkbrb.lightblogback.util.MailUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by CodeGenerator on 2019/07/07.
 */
@RestController
@RequestMapping("/comment")
public class CommentController {

    @Value("${blog.domain}")
    private String DOMAIN;

    @Value("${blog.domain.front}")
    private String DOMAIN_FRONT;

    @Value("${blog.upload.dir}")
    private String UPLOAD_DIR;

    @Value(("${blog.upload.url}"))
    private String UPLOAD_URL;

    @Value("${server.servlet.context-path}")
    private String CONTEXT_PATH;

    @Value("${blog.admin.id}")
    private Integer ADMIN_ID;

    @Resource
    private CommentService commentService;

    @Resource
    private ReaderService readerService;

    @Resource
    private BlogService blogService;

    @Resource
    private AdminService adminService;

    @PostMapping("/add")
    public Result add(CommentReaderDTO commentReaderDTO, HttpServletRequest request) {

        if (StringUtils.isEmpty(commentReaderDTO.getName())) return ResultGenerator.genFailResult("评论者名称不能为空！");
        if (StringUtils.isEmpty(commentReaderDTO.getContent())) return ResultGenerator.genFailResult("评论内容不能为空！");

        Integer blogId = commentReaderDTO.getBlogId();
        if (blogId == null) return ResultGenerator.genFailResult("blogId不能为空！");
        Blog blog = blogService.findById(blogId);
        if (blog == null) {
            return ResultGenerator.genFailResult("不存在id为" + blogId + "的博客！");
        }

        Reader receiver = null;
        Integer replyCommentId = commentReaderDTO.getReplyCommentId();
        if (replyCommentId != null) {
            Comment replyComment = commentService.findById(replyCommentId);
            if (replyComment == null) {
                return ResultGenerator.genFailResult("不存在id为" + replyCommentId + "的评论");
            }

            Integer receiverId = replyComment.getReaderId();
            receiver = readerService.findById(receiverId);
            if (receiver == null) {
                return ResultGenerator.genFailResult("不存在id为" + receiverId + "的读者");
            }
        }


        // 插入读者
        Reader reader = new Reader();
        reader.setEmail(commentReaderDTO.getEmail());
        reader.setName(commentReaderDTO.getName());
        reader.setIp(IpAddressUtil.getIpAdrress(request));

        // 是否接收邮件
        if (commentReaderDTO.getInform() == null || commentReaderDTO.getInform() != 0) {
            reader.setInform(1);
        } else {
            // 当且仅当设置为0时不接受邮件
            reader.setInform(0);
        }

        // 添加读者头像
        if(StringUtils.isBlank(commentReaderDTO.getAvatar())) {
            if(StringUtils.isBlank(CONTEXT_PATH) || CONTEXT_PATH.equals("/") || CONTEXT_PATH.equals("\\")) {
                CONTEXT_PATH = "";
            }
            String urlPrefix = DOMAIN + CONTEXT_PATH + UPLOAD_URL;
            String avatar = AvatarGenerator.generatorAvatar(UPLOAD_DIR, urlPrefix);
            reader.setAvatar(avatar);
        }else {
            reader.setAvatar(commentReaderDTO.getAvatar());
        }

        int readerId = readerService.saveAndGetId(reader);

        // 插入评论
        Comment comment = new Comment();
        comment.setBlogId(commentReaderDTO.getBlogId());
        comment.setCommentDate(new Date());
        comment.setContent(commentReaderDTO.getContent());
        comment.setReaderId(readerId);
        comment.setReplyCommentId(commentReaderDTO.getReplyCommentId());
        commentService.save(comment);

        // 更新评论数
        blog.setCommentCount(blog.getCommentCount() + 1);
        blogService.update(blog);

        // 发送邮件通知管理员和被回复者
        Admin admin = adminService.findById(ADMIN_ID);
        if (receiver == null) { // 仅发给管理员
            String content = commentReaderDTO.getName() + "在《" + blog.getTitle() + "》下回复\n" + commentReaderDTO.getContent();
            MailUtil.sendMailAsynchronously("light blog评论", content, admin.getEmail());
        } else {
            // 通知admin
            String content = commentReaderDTO.getName() + "在《" + blog.getTitle() + "》下回复了" + receiver.getName() + "\n" + commentReaderDTO.getContent();
            MailUtil.sendMailAsynchronously("light blog评论", content, admin.getEmail());
            // 通知被回复者
            // 仅当receiver开启了接受邮件并且填写了邮箱时发送邮件
            if ((receiver.getInform() == 1) && StringUtils.isNotBlank(receiver.getEmail())) {
                content = commentReaderDTO.getName() + "在《" + blog.getTitle() + "》下回复了你:\n" + commentReaderDTO.getContent();
                MailUtil.sendMailAsynchronously("light blog评论回复通知", content, receiver.getEmail());
            }
        }

        return ResultGenerator.genSuccessResult(reader.getAvatar());
    }


    @GetMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        Comment comment = commentService.findById(id);
        if (comment == null) return ResultGenerator.genFailResult("不存在id为" + id + "的评论！");
        CommentVO commentVO = getCommentVo(comment);
        return ResultGenerator.genSuccessResult(commentVO);
    }

    @GetMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        PageHelper.startPage(page, size, "comment_date desc");
        List<Comment> list = commentService.findAll();
        List<CommentVO> result = new ArrayList<>();
        for (Comment comment : list) {
            result.add(getCommentVo(comment));
        }

        // 给前端的是VO，但需要分页
        PageInfo pageInfo = new PageInfo(list);
        pageInfo.setList(result);
        return ResultGenerator.genSuccessResult(pageInfo);
    }

    @GetMapping("/list/blog")
    public Result listByBlogId(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size, Integer blogId) {
        if (blogId == null) return ResultGenerator.genFailResult("blogId不能为空！");
        if (blogService.findById(blogId) == null) return ResultGenerator.genFailResult("不存在id为" + blogId + "的博客！");

        PageHelper.startPage(page, size, "comment_date desc");
        List<Comment> list = commentService.findAllByBlogId(blogId);
        List<CommentVO> result = new ArrayList<>();
        for (Comment comment : list) {
            result.add(getCommentVo(comment));
        }

        // 给前端的是VO，但需要分页
        PageInfo pageInfo = new PageInfo(list);
        pageInfo.setList(result);
        return ResultGenerator.genSuccessResult(pageInfo);
    }

    private CommentVO getCommentVo(Comment comment) {

        CommentVO commentVO = new CommentVO();
        commentVO.setId(comment.getId());
        commentVO.setBlogId(comment.getBlogId());
        commentVO.setCommentDate(comment.getCommentDate());
        commentVO.setContent(comment.getContent());

        Reader reader = readerService.findById(comment.getReaderId());
        commentVO.setReaderAvatar(reader.getAvatar());
        commentVO.setReaderName(reader.getName());

        Integer replyCommentId = comment.getReplyCommentId();
        if (replyCommentId != null) {
            Comment replyComment = commentService.findById(replyCommentId);
            commentVO.setReceiverDate(replyComment.getCommentDate());
            commentVO.setReceiverContent(replyComment.getContent());

            Reader receiver = readerService.findById(replyComment.getReaderId());
            commentVO.setReceiverName(receiver.getName());
            commentVO.setReceiverAvatar(receiver.getAvatar());
        }

        return commentVO;
    }
}
