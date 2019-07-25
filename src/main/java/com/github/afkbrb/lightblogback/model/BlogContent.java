package com.github.afkbrb.lightblogback.model;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "blog_content")
public class BlogContent {
    /**
     * 主键，和对应博客一致
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 正文
     */
    private String content;

    /**
     * 获取主键，和对应博客一致
     *
     * @return id - 主键，和对应博客一致
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键，和对应博客一致
     *
     * @param id 主键，和对应博客一致
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取正文
     *
     * @return content - 正文
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置正文
     *
     * @param content 正文
     */
    public void setContent(String content) {
        this.content = content;
    }
}
