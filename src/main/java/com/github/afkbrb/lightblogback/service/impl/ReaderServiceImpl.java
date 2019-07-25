package com.github.afkbrb.lightblogback.service.impl;

import com.github.afkbrb.lightblogback.dao.ReaderMapper;
import com.github.afkbrb.lightblogback.model.Reader;
import com.github.afkbrb.lightblogback.service.ReaderService;
import com.github.afkbrb.lightblogback.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/07/07.
 */
@Service
@Transactional
public class ReaderServiceImpl extends AbstractService<Reader> implements ReaderService {
    @Resource
    private ReaderMapper readerMapper;

    @Override
    public Integer saveAndGetId(Reader reader) {
        readerMapper.insert(reader);
        return reader.getId();
    }
}
