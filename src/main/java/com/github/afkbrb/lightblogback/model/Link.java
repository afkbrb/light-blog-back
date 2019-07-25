package com.github.afkbrb.lightblogback.model;

import javax.persistence.*;

public class Link {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 链接名称
     */
    @Column(name = "link_name")
    private String linkName;

    /**
     * 链接地址
     */
    @Column(name = "link_url")
    private String linkUrl;

    /**
     * 链接次序（小的在前）
     */
    @Column(name = "link_order")
    private Integer linkOrder;

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
     * 获取链接名称
     *
     * @return link_name - 链接名称
     */
    public String getLinkName() {
        return linkName;
    }

    /**
     * 设置链接名称
     *
     * @param linkName 链接名称
     */
    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    /**
     * 获取链接地址
     *
     * @return link_url - 链接地址
     */
    public String getLinkUrl() {
        return linkUrl;
    }

    /**
     * 设置链接地址
     *
     * @param linkUrl 链接地址
     */
    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    /**
     * 获取链接次序（小的在前）
     *
     * @return link_order - 链接次序（小的在前）
     */
    public Integer getLinkOrder() {
        return linkOrder;
    }

    /**
     * 设置链接次序（小的在前）
     *
     * @param linkOrder 链接次序（小的在前）
     */
    public void setLinkOrder(Integer linkOrder) {
        this.linkOrder = linkOrder;
    }
}