package com.github.afkbrb.lightblogback.service.impl;

import com.github.afkbrb.lightblogback.core.AbstractService;
import com.github.afkbrb.lightblogback.dao.CarouselMapper;
import com.github.afkbrb.lightblogback.model.Carousel;
import com.github.afkbrb.lightblogback.service.CarouselService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019/07/07.
 */
@Service
@Transactional
public class CarouselServiceImpl extends AbstractService<Carousel> implements CarouselService {
    @Resource
    private CarouselMapper carouselMapper;

}
