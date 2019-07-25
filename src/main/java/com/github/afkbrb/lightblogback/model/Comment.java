package com.github.afkbrb.lightblogback.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

public class Comment {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 对应的博客
     */
    @Column(name = "blog_id")
    private Integer blogId;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 评论日期
     */
    @Column(name = "comment_date")
    private Date commentDate;

    /**
     * 读者/评论者
     */
    @Column(name = "reader_id")
    private Integer readerId;

    /**
     * 回复的评论，空表示评论博客
     */
    @Column(name = "reply_comment_id")
    private Integer replyCommentId;

    /**
     * 获取主键
     *
     * @return id - 主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键
     *
     * @param id 主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取对应的博客
     *
     * @return blog_id - 对应的博客
     */
    public Integer getBlogId() {
        return blogId;
    }

    /**
     * 设置对应的博客
     *
     * @param blogId 对应的博客
     */
    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    /**
     * 获取评论内容
     *
     * @return content - 评论内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置评论内容
     *
     * @param content 评论内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取评论日期
     *
     * @return comment_date - 评论日期
     */
    public Date getCommentDate() {
        return commentDate;
    }

    /**
     * 设置评论日期
     *
     * @param commentDate 评论日期
     */
    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    /**
     * 获取读者/评论者
     *
     * @return reader_id - 读者/评论者
     */
    public Integer getReaderId() {
        return readerId;
    }

    /**
     * 设置读者/评论者
     *
     * @param readerId 读者/评论者
     */
    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    /**
     * 获取回复的评论，空表示评论博客
     *
     * @return reply_comment_id - 回复的评论，空表示评论博客
     */
    public Integer getReplyCommentId() {
        return replyCommentId;
    }

    /**
     * 设置回复的评论，空表示评论博客
     *
     * @param replyCommentId 回复的评论，空表示评论博客
     */
    public void setReplyCommentId(Integer replyCommentId) {
        this.replyCommentId = replyCommentId;
    }
}
