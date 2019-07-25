package com.github.afkbrb.lightblogback.service;
import com.github.afkbrb.lightblogback.model.Comment;
import com.github.afkbrb.lightblogback.core.Service;

import java.util.List;


/**
 * Created by CodeGenerator on 2019/07/08.
 */
public interface CommentService extends Service<Comment> {

    List<Comment> findAllByBlogId(Integer blogId);
}
