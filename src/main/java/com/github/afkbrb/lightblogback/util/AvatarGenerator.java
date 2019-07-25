package com.github.afkbrb.lightblogback.util;

import com.github.afkbrb.avatar.Avatar;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;


public class AvatarGenerator {

    private static final String SUFFIX = ".png";

    /**
     * 随机生成github风格头像
     *
     * @param uploadPath 上传路径，如E:/upload
     * @param urlPrefix  头像访问前缀，如http://www.image.com/upload/image
     * @return
     */
    public static String generatorAvatar(String uploadPath, String urlPrefix) {

        String realName = UUID.randomUUID().toString() + SUFFIX;
        Date date = new Date();
        String datePath = new SimpleDateFormat("yyyy/MM/dd").format(date);
        String path = uploadPath + "/" + datePath;
        File f = new File(path);
        if (!f.exists()) {
            f.mkdirs();
        }
        // 随机生成png图像到文件中
        new Avatar().saveAsPNG(path + "/" + realName);

        return urlPrefix + "/" + datePath + "/" + realName;
    }
}
