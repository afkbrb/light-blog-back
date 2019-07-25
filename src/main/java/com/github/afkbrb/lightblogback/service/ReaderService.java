package com.github.afkbrb.lightblogback.service;
import com.github.afkbrb.lightblogback.model.Reader;
import com.github.afkbrb.lightblogback.core.Service;


/**
 * Created by CodeGenerator on 2019/07/07.
 */
public interface ReaderService extends Service<Reader> {
    // 持久化并返回id
    Integer saveAndGetId(Reader reader);
}
