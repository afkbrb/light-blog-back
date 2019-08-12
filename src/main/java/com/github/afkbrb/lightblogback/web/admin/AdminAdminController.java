package com.github.afkbrb.lightblogback.web.admin;
import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.model.Admin;
import com.github.afkbrb.lightblogback.service.AdminService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by CodeGenerator on 2019/07/07.
 *
 * 管理员是唯一的，所以没有提供add、delete之类的操作。
 */
@RestController
@RequestMapping("/admin/admin")
public class AdminAdminController {

    @Value("${blog.admin.id}")
    private Integer ADMIN_ID;

    @Resource
    private AdminService adminService;

    @PostMapping("/update")
    public Result update(Admin admin) {
        admin.setId(ADMIN_ID);
        adminService.update(admin);
        return ResultGenerator.genSuccessResult();
    }

    @GetMapping("/detail")
    public Result detail() {
        Admin admin = adminService.findById(ADMIN_ID);
        return ResultGenerator.genSuccessResult(admin);
    }

    @PostMapping("/login")
    public Result login(String username, String password, HttpServletRequest request) {
        Admin admin = adminService.findAll().get(0);
        if(admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
            request.getSession().setAttribute("admin", admin.getUsername());
            Map<String, String> tokenMap = new HashMap<>();
            String token = getToken(admin);
            tokenMap.put("token", token);
            request.getSession().setAttribute("token", token);
            return ResultGenerator.genSuccessResult(tokenMap);
        }
        return ResultGenerator.genFailResult("用户名或密码错误！");
    }

    @PostMapping("/logout")
    public Result logout(HttpServletRequest request) {
        if(request.getSession().getAttribute("admin") == null) {
            return ResultGenerator.genFailResult("注销失败，当前并没有用户登录！");
        }
        request.getSession().setAttribute("admin", null);
        return ResultGenerator.genSuccessResult("注销成功！");
    }

    private String getToken(Admin admin) {
        return UUID.randomUUID().toString();
    }
}
