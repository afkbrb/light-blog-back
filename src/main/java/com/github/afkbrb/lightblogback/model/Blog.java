package com.github.afkbrb.lightblogback.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

public class Blog {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 概览
     */
    private String summary;

    /**
     * 创建日期
     */
    @Column(name = "create_date")
    private Date createDate;

    /**
     * 更新日期
     */
    @Column(name = "update_date")
    private Date updateDate;

    /**
     * 点击数
     */
    @Column(name = "click_count")
    private Integer clickCount;

    /**
     * 评论数
     */
    @Column(name = "comment_count")
    private Integer commentCount;

    /**
     * 喜欢数
     */
    @Column(name = "like_count")
    private Integer likeCount;

    /**
     * 博客标签(如1,2,3表示具有三种标签)
     */
    private String tag;

    /**
     * 博客图片
     */
    @Column(name = "blog_image")
    private String blogImage;

    /**
     * 原文地址（如果非原创）
     */
    @Column(name = "original_url")
    private String originalUrl;

    /**
     * 0原创/1转载/2翻译
     */
    private Integer type;

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
     * 获取标题
     *
     * @return title - 标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     *
     * @param title 标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取概览
     *
     * @return summary - 概览
     */
    public String getSummary() {
        return summary;
    }

    /**
     * 设置概览
     *
     * @param summary 概览
     */
    public void setSummary(String summary) {
        this.summary = summary;
    }

    /**
     * 获取创建日期
     *
     * @return create_date - 创建日期
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置创建日期
     *
     * @param createDate 创建日期
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * 获取更新日期
     *
     * @return update_date - 更新日期
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * 设置更新日期
     *
     * @param updateDate 更新日期
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * 获取点击数
     *
     * @return click_count - 点击数
     */
    public Integer getClickCount() {
        return clickCount;
    }

    /**
     * 设置点击数
     *
     * @param clickCount 点击数
     */
    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    /**
     * 获取评论数
     *
     * @return comment_count - 评论数
     */
    public Integer getCommentCount() {
        return commentCount;
    }

    /**
     * 设置评论数
     *
     * @param commentCount 评论数
     */
    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    /**
     * 获取喜欢数
     *
     * @return like_count - 喜欢数
     */
    public Integer getLikeCount() {
        return likeCount;
    }

    /**
     * 设置喜欢数
     *
     * @param likeCount 喜欢数
     */
    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    /**
     * 获取博客标签(如1,2,3表示具有三种标签)
     *
     * @return tag - 博客标签(如1,2,3表示具有三种标签)
     */
    public String getTag() {
        return tag;
    }

    /**
     * 设置博客标签(如1,2,3表示具有三种标签)
     *
     * @param tag 博客标签(如1,2,3表示具有三种标签)
     */
    public void setTag(String tag) {
        this.tag = tag;
    }

    /**
     * 获取博客图片
     *
     * @return blog_image - 博客图片
     */
    public String getBlogImage() {
        return blogImage;
    }

    /**
     * 设置博客图片
     *
     * @param blogImage 博客图片
     */
    public void setBlogImage(String blogImage) {
        this.blogImage = blogImage;
    }

    /**
     * 获取原文地址（如果非原创）
     *
     * @return original_url - 原文地址（如果非原创）
     */
    public String getOriginalUrl() {
        return originalUrl;
    }

    /**
     * 设置原文地址（如果非原创）
     *
     * @param originalUrl 原文地址（如果非原创）
     */
    public void setOriginalUrl(String originalUrl) {
        this.originalUrl = originalUrl;
    }

    /**
     * 获取0原创/1转载/2翻译
     *
     * @return type - 0原创/1转载/2翻译
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置0原创/1转载/2翻译
     *
     * @param type 0原创/1转载/2翻译
     */
    public void setType(Integer type) {
        this.type = type;
    }
}
