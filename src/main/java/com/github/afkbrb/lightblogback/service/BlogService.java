package com.github.afkbrb.lightblogback.service;
import com.github.afkbrb.lightblogback.model.Blog;
import com.github.afkbrb.lightblogback.core.Service;

import java.util.List;


/**
 * Created by CodeGenerator on 2019/07/07.
 */
public interface BlogService extends Service<Blog> {

    Integer saveAndGetId(Blog blog);

    List<Blog> findByKeyword(String keyword);

    List<Blog> findAllByTagId(Integer tagId);
}
