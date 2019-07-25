package com.github.afkbrb.lightblogback.model.vo;

import java.util.Date;

public class CommentVO {

    private Integer id;
    private Integer blogId;
    private Date commentDate;
    private String readerName;
    private String readerAvatar;
    private String content;
    private Date receiverDate;
    private String receiverName;
    private String receiverAvatar;
    private String receiverContent;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getReaderName() {
        return readerName;
    }

    public void setReaderName(String readerName) {
        this.readerName = readerName;
    }

    public String getReaderAvatar() {
        return readerAvatar;
    }

    public void setReaderAvatar(String readerAvatar) {
        this.readerAvatar = readerAvatar;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getReceiverDate() {
        return receiverDate;
    }

    public void setReceiverDate(Date receiverDate) {
        this.receiverDate = receiverDate;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverAvatar() {
        return receiverAvatar;
    }

    public void setReceiverAvatar(String receiverAvatar) {
        this.receiverAvatar = receiverAvatar;
    }

    public String getReceiverContent() {
        return receiverContent;
    }

    public void setReceiverContent(String receiverContent) {
        this.receiverContent = receiverContent;
    }

}
