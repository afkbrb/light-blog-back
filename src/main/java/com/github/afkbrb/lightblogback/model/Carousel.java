package com.github.afkbrb.lightblogback.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Carousel {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 图片
     */
    private String image;

    /**
     * 顺序
     */
    @Column(name = "image_order")
    private Integer imageOrder;

    /**
     * 链接
     */
    private String url;

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
     * 获取图片
     *
     * @return image - 图片
     */
    public String getImage() {
        return image;
    }

    /**
     * 设置图片
     *
     * @param image 图片
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * 获取顺序
     *
     * @return image_order - 顺序
     */
    public Integer getImageOrder() {
        return imageOrder;
    }

    /**
     * 设置顺序
     *
     * @param imageOrder 顺序
     */
    public void setImageOrder(Integer imageOrder) {
        this.imageOrder = imageOrder;
    }

    /**
     * 获取链接
     *
     * @return url - 链接
     */
    public String getUrl() {
        return url;
    }

    /**
     * 设置链接
     *
     * @param url 链接
     */
    public void setUrl(String url) {
        this.url = url;
    }
}
