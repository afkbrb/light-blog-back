package com.github.afkbrb.lightblogback.model.dto;

public class BlogDTO {

    private Integer id;
    private String title;
    private String content;
    private String tag;
    private Integer type;
    private String originalUrl;
    private String blogImage;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getOriginalUrl() {
        return originalUrl;
    }

    public void setOriginalUrl(String originalUrl) {
        this.originalUrl = originalUrl;
    }

    public String getBlogImage() {
        return blogImage;
    }

    public void setBlogImage(String blogImage) {
        this.blogImage = blogImage;
    }

}
