package com.github.afkbrb.lightblogback.web;

import com.github.afkbrb.lightblogback.core.Result;
import com.github.afkbrb.lightblogback.core.ResultGenerator;
import com.github.afkbrb.lightblogback.util.UploadUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UploadController {

    @Value("${blog.domain}")
    private String DOMAIN;

    @Value("${blog.upload.dir}")
    private String UPLOAD_DIR;

    @Value(("${blog.upload.url}"))
    private String UPLOAD_URL;

    @Value("${server.servlet.context-path}")
    private String CONTEXT_PATH;

    @PostMapping("/upload")
    public Result upload(MultipartHttpServletRequest request) throws IOException {
        MultiValueMap<String, MultipartFile> multiFileMap = request.getMultiFileMap();
        if(multiFileMap == null) return ResultGenerator.genFailResult("文件不能为空！");
        Collection<List<MultipartFile>> values = multiFileMap.values();
        if(values == null) return ResultGenerator.genFailResult("文件不能为空！");
        MultipartFile file = values.iterator().next().get(0);
        if (file == null) return ResultGenerator.genFailResult("文件不能为空！");

        if(StringUtils.isBlank(CONTEXT_PATH) || CONTEXT_PATH.equals("/") || CONTEXT_PATH.equals("\\")) {
            CONTEXT_PATH = "";
        }
        String urlPrefix = DOMAIN + CONTEXT_PATH + UPLOAD_URL;
        String fileUrl = UploadUtil.uploadFile(UPLOAD_DIR, file, urlPrefix);
        Map<String, String> resultMap = new HashMap<>();
        resultMap.put("url", fileUrl);

        return ResultGenerator.genSuccessResult(resultMap);
    }

}
