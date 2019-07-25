package com.github.afkbrb.lightblogback.web;

import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Admin;
import com.github.afkbrb.lightblogback.model.vo.AdminVO;
import com.github.afkbrb.lightblogback.service.AdminService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * Created by CodeGenerator on 2019/07/07.
 * <p>
 * 管理员是唯一的，所以没有提供add、delete之类的操作。
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Value("${blog.admin.id}")
    private Integer ADMIN_ID;

    @Resource
    private AdminService adminService;

    @GetMapping("/detail")
    public Result detail() {
        Admin admin = adminService.findById(ADMIN_ID);
        AdminVO result = new AdminVO();
        BeanUtils.copyProperties(admin, result);
        return ResultGenerator.genSuccessResult(result);
    }
}
