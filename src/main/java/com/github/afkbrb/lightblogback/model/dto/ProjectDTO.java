package com.github.afkbrb.lightblogback.model.dto;

public class ProjectDTO {

    private Integer id;
    private String name;
    private String url;
    private Integer projectOrder;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getProjectOrder() {
        return projectOrder;
    }

    public void setProjectOrder(Integer projectOrder) {
        this.projectOrder = projectOrder;
    }
}
