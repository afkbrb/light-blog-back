package com.github.afkbrb.lightblogback.web.admin;

import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Carousel;
import com.github.afkbrb.lightblogback.service.CarouselService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by CodeGenerator on 2019/07/07.
 */
@RestController
@RequestMapping("/admin/carousel")
public class AdminCarouselController {
    @Resource
    private CarouselService carouselService;

    @PostMapping("/add")
    public Result add(Carousel carousel) {

        if (carousel.getImageOrder() == null) return ResultGenerator.genFailResult("轮播的次序不能为空！");
        if (StringUtils.isBlank(carousel.getImage())) return ResultGenerator.genFailResult("轮播图片不能为空！");
        if (StringUtils.isBlank(carousel.getUrl())) carousel.setUrl(null);

        carouselService.save(carousel);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/update")
    public Result update(Carousel carousel) {
        Integer carouselId = carousel.getId();
        if (carouselId == null) return ResultGenerator.genFailResult("轮播的id不能为空！");
        if (carouselService.findById(carouselId) == null)
            return ResultGenerator.genFailResult("不存在id为" + carouselId + "的轮播！");

        if (StringUtils.isBlank(carousel.getUrl())) carousel.setUrl(null);
        if (StringUtils.isBlank(carousel.getImage())) carousel.setImage(null);

        carouselService.update(carousel);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        carouselService.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @GetMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        Carousel carousel = carouselService.findById(id);
        return ResultGenerator.genSuccessResult(carousel);
    }

    @GetMapping("/list")
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "10") Integer size) {
        PageHelper.startPage(page, size, "image_order asc");
        List<Carousel> list = carouselService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}
