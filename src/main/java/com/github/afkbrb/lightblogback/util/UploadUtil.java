package com.github.afkbrb.lightblogback.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class UploadUtil {

    /**
     * @param uploadPath 上传路径，如E:/upload
     * @param file       上传的文件
     * @param urlPrefix  上传的文件访问url前缀，如http://www.image.com/upload/image
     * @return 文件访问url
     * @throws Exception
     */
    public static String uploadFile(String uploadPath, MultipartFile file, String urlPrefix) throws NullPointerException, IOException {
        if (file == null) {
            throw new NullPointerException("上传的文件不能为空！");
        }

        String realName = UUID.randomUUID().toString() + "." + file.getOriginalFilename().split("\\.")[1];
        Date date = new Date();
        String datePath = new SimpleDateFormat("yyyy/MM/dd").format(date);
        String path = uploadPath + "/" + datePath;

        File f = new File(path);
        if (!f.exists()) {
            f.mkdirs();
        }

        String filename = path + "/" + realName;
        file.transferTo(new File(filename));

        return urlPrefix + "/" + datePath + "/" + realName;
    }

}
