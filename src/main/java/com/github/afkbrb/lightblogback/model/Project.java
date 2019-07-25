package com.github.afkbrb.lightblogback.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Project {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 名称
     */
    private String name;

    /**
     * 项目地址
     */
    private String url;

    /**
     * 项目图片
     */
    private String image;

    /**
     * 项目顺序
     */
    @Column(name = "project_order")
    private Integer projectOrder;

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
     * 获取名称
     *
     * @return name - 名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置名称
     *
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取项目地址
     *
     * @return url - 项目地址
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置项目地址
     *
     * @param url 项目地址
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 获取项目图片
     *
     * @return image - 项目图片
     */
    public String getImage() {
        return image;
    }

    /**
     * 设置项目图片
     *
     * @param image 项目图片
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * 获取项目顺序
     *
     * @return project_order - 项目顺序
     */
    public Integer getProjectOrder() {
        return projectOrder;
    }

    /**
     * 设置项目顺序
     *
     * @param projectOrder 项目顺序
     */
    public void setProjectOrder(Integer projectOrder) {
        this.projectOrder = projectOrder;
    }
}
