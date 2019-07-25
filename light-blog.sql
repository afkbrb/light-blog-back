/*
 Navicat MySQL Data Transfer

 Source Server         : mydbs
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : lightblog

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 25/07/2019 12:49:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简介',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'afkbrb', '😄普通大学生，技术爱好者😄', 'http://localhost/api/upload/2019/07/23/9fd941d6-0090-4381-ba8c-193a3b920793.jpg', '123456', 'admin', '2428391347@qq.com');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `summary` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '概览',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `click_count` int(11) NOT NULL COMMENT '点击数',
  `comment_count` int(11) NOT NULL COMMENT '评论数',
  `like_count` int(11) NOT NULL COMMENT '喜欢数',
  `tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '博客标签(如1,2,3表示具有三种标签)',
  `blog_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '博客图片',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原文地址（如果非原创）',
  `type` int(1) UNSIGNED NOT NULL COMMENT '0原创/1转载/2翻译',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_id`(`tag`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type_name` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, '关于本博客', '简介LightBlog是一个前后端分离的轻量级个人博客系统，基于本人以前的同名项目。本博客系统由后台服务器系统三个子系统组成。其中，后台服务系统基于Sprin', '2019-07-23 20:13:13', '2019-07-25 12:47:20', 192, 16, 27, '11,13', 'http://localhost/api/upload/2019/07/17/a3182174-81e0-4d6f-b188-35201149ee6e.jpg', '', 1);
INSERT INTO `blog` VALUES (2, 'JAVA 对象的序列化', 'Mavon测试在给邮件发送URL链接找回密码时，会发送一个链接，像这样http://localhost:8080/resetpass?sid=c1b55b980db4eb74a4264a92d53cd', '2019-07-23 20:11:13', '2019-07-23 16:20:47', 151, 10, 18, '1', 'http://localhost/api/upload/2019/07/15/d86c6c38-3de7-4ed6-b6f7-b83f65318118.jpg', 'https://liuyanzhao.com/7649.html', 2);
INSERT INTO `blog` VALUES (10, '图解排序算法(四)之归并排序', '基本思想　　归并排序（MERGE-SORT）是利用归并的思想实现的排序方法，该算法采用经典的分治（divide-and-conquer）策略（分治法将问题分。分而治之!(http://localhos', '2019-07-16 19:51:27', '2019-07-25 10:02:53', 8, 2, 1, '1,10', 'http://localhost/api/upload/2019/07/23/688d855f-46b7-47c7-b661-c3c15482daa8.png', 'http://www.cnblogs.com/chengxiao/p/6194356.html', 2);
INSERT INTO `blog` VALUES (20, 'vue不使用vuex时创建响应式全局变量的方法', '问题描述Vuex适合于中大型项目，在小型项目中使用往往是杀鸡用牛刀。官方说明如下:如果您不打算开发大型单页应用，使用Vuex可能是繁琐冗余的。确实是如此——如果您的应用够简单，您最好不要使用Vuex。', '2019-07-23 20:13:13', '2019-07-23 10:26:52', 67, 17, 1, '12,6,4', 'http://localhost/api/upload/2019/07/19/f8e9e3dc-e509-4f42-9141-856b4ead8eeb.jpg', '', 1);
INSERT INTO `blog` VALUES (21, 'API测试', 'API分为前台和后台两部分文档中前端url请求路径前需要加上http://xx.com/api，后台url请求路径前需要加上http://xx.com/api/admin，其中xx.com需要根据实际', '2019-07-22 19:56:29', '2019-07-23 10:24:23', 5, 0, 1, '13', NULL, '', 1);
INSERT INTO `blog` VALUES (23, 'Github头像生成器', '项目介绍随机生成Github风格头像，可自定义颜色、大小、透明性等。成果展示!项目地址(https://github.c', '2019-07-23 09:52:28', '2019-07-23 09:52:28', 0, 0, 0, '1', 'http://localhost/api/upload/2019/07/23/0dbf95f3-4038-4201-9e9a-a2778a2421cc.png', '', 1);
INSERT INTO `blog` VALUES (24, 'Java并发编程笔记', '最近更新了一系列Java并发编程相关的笔记，不在此一篇篇发出来了，详情见笔记列表第一部分Java并发编程基础篇-(https://github.com/afkbrb/java-concurren', '2019-07-23 20:13:13', '2019-07-23 16:01:51', 0, 0, 0, '1,12', NULL, '', 1);
INSERT INTO `blog` VALUES (25, 'Vue阅读App', '项目背景最近学习Vue.js,想写个项目练练手，借助开发了一个阅读App项目功能-获取每日一文每天推荐文章、随', '2019-07-23 10:02:58', '2019-07-25 10:01:09', 3, 0, 1, '6,11', NULL, '', 1);
INSERT INTO `blog` VALUES (26, 'EasyUI分页的实现', '使用$.fn.pagination.defaults重写默认值对象该分页控件允许用户导航页面的数据。它支持页面导航和页面长度选择的选项设置。用户可以在分页控件上添加自定义按钮，以增强其功能。!**使用', '2019-07-23 10:09:44', '2019-07-23 10:24:09', 1, 0, 0, '4,5,14', NULL, '', 1);
INSERT INTO `blog` VALUES (27, 'Java之美[从菜鸟到高手演练]之Linux篇——Linux下比较重要的8个命令', '**摘要:**Linux里有很丰富的各种命令，有些是很难用的。然而，学会了前面说的这8个命令，你已经能处理大量的log分析任务了，完全不需要用脚本语言写程序来处理它们。每个程序员，在职业生涯的某个时刻', '2019-07-23 10:13:46', '2019-07-23 10:22:19', 0, 0, 0, '8', NULL, 'https://blog.csdn.net/zhangerqing/article/details/8545715', 2);
INSERT INTO `blog` VALUES (28, 'Java之美[从菜鸟到高手演练]之Linux篇——压缩及解压缩命令tar的使用', '这些命令使用很常见，我们需要长记在心，直接总结下吧：tar文件与目录....参数：-c：建立一个压缩文件的参数指令-x：解开一个压缩文件的参数指令-t：查看压缩文件里面的文件**特别注意：**c/x/', '2019-07-23 10:14:29', '2019-07-23 10:22:06', 0, 0, 0, '8', NULL, 'https://blog.csdn.net/zhangerqing/article/details/8609233', 2);
INSERT INTO `blog` VALUES (29, 'Java之美[从菜鸟到高手演练]之Linux篇——Linux下JDK、Ruby、Node.js等runtime的安装', '我们常常工作在Linux下，所以必须要学会安装这些常用的runtime，这些工作都是相通的，学会一种，其他的举一反三就OK了！一般来说，有三种方法：1.使用包管理器，像ruby的rvm（推荐）2.直接', '2019-07-23 10:15:00', '2019-07-23 10:21:54', 1, 0, 0, '8', NULL, 'https://blog.csdn.net/zhangerqing/article/details/8609178', 2);
INSERT INTO `blog` VALUES (30, 'Oracle约束(Constraint)详解', '概述　　约束是数据库用来确保数据满足业务规则的手段，不过在真正的企业开发中，除了主键约束这类具有强需求的约束，像外键约束，检查约束更多时候仅仅出现在数据库设计阶段，真实环境却很少应用，更多是放到程序逻', '2019-07-23 10:15:35', '2019-07-23 11:30:21', 3, 0, 0, '7', 'http://localhost/api/upload/2019/07/23/11600e75-bd0f-420e-9721-c1cea2ba6b97.png', 'https://www.cnblogs.com/chengxiao/p/6032183.html', 2);
INSERT INTO `blog` VALUES (31, 'JAVA 对象的序列化', '　　下面将介绍对象的序列化——一种将对象转成字节方便传送到别处或存储在硬盘上，并且再从转化成的字节重构对象的机制。　　序列化是分布式管理必备的工具，分布式处理中将对象从一个虚拟传到另一个虚拟机。序列化', '2019-07-23 10:16:43', '2019-07-23 10:16:43', 0, 0, 0, '1', NULL, 'https://liuyanzhao.com/7649.html', 2);
INSERT INTO `blog` VALUES (32, 'Java 之 BASE64 加密解密', '背景在给邮件发送URL链接找回密码时，会发送一个链接，像这样http://localhost:8080/resetpass?sid=c1b55b980db4eb74a4264a92d53cd953&a', '2019-07-23 10:17:59', '2019-07-23 15:54:39', 3, 1, 1, '1', NULL, 'https://liuyanzhao.com/7578.html', 2);

-- ----------------------------
-- Table structure for blog_content
-- ----------------------------
DROP TABLE IF EXISTS `blog_content`;
CREATE TABLE `blog_content`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键，和对应博客一致',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '正文',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `blog_content_ibfk_1` FOREIGN KEY (`id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_content
-- ----------------------------
INSERT INTO `blog_content` VALUES (1, '## 简介\n\nLight Blog是一个前后端分离的轻量级个人博客系统，基于本人以前的同名项目[LightBlog](https://github.com/afkbrb/LightBlog)。\n\n本博客系统由后台服务器系统(light-blog-back)、后台管理系统(light-blog-admin)、前端系统(light-blog-front)三个子系统组成。其中，后台服务系统基于SpringBoot，后台管理系统和前端系统均基于Vue。每个子系统的详细介绍可参看相应的Github地址。\n\n## 传送门\n\n- [后台服务系统(light-blog-back)](https://github.com/afkbrb/light-blog-back)\n- [后台管理系统(light-blog-admin)](https://github.com/afkbrb/light-blog-admin)\n- [前端系统(light-blog-front)](https://github.com/afkbrb/light-blog-front)\n- [API](https://www.showdoc.cc/lightblog?page_id=2428180430024349)\n\n## BlahBlah\n\n如果本项目对您学习Vue或SpringBoot等有所帮助的话，请帮忙点颗⭐哦😁！\n\n如果您对本项目有什么意见或建议，也欢迎批评指正。\n');
INSERT INTO `blog_content` VALUES (2, '# Mavon测试\n\n在给邮件发送 URL 链接找回密码时，会发送一个链接，像这样\n\n`http://localhost:8080/resetpass?sid=c1b55b980db4eb74a4264a92d53cd953&account=saysky`\n\n验证原理就是，当用户点击链接，然后请求 控制器里的 resetpass 方法，获得 sid(密钥) 和 account(用户名) 两个参数。根据用户名去数据库中的 “邮件找回密码” 表(mail_retrieve)里寻找记录，获得 mailRetrieve 对象，然后比较 参数中的 sid 和 mailRetrieve.getSid() 即可，当然也可以加一个outtimes 超时时间 字段。\n\n如上链接，sid 是经过 MD5 加密，并且无需解密，只需要比较参数dis和数据库sid是否相等，而account 用户名一定要传过去，目前是直接明文显示，感觉不是特别好，所以这里需要给 accout 也加密一下比较好。然后在 控制器里接受参数的时候，然后在解密即可。\n\n目标是，无需太复杂，肉眼无法识别即可，但求效率高。\n# BASE64 加密解码\n```java\npackage com.liuyanzhao.chuyun.util;\nimport sun.misc.BASE64Decoder;\nimport sun.misc.BASE64Encoder;\nimport java.io.UnsupportedEncodingException;\n/**\n * @author 言曌\n * @date 2018/2/24 上午11:45\n */\npublic class Base64Util {\n    /**\n     * 加密\n     * @param str\n     * @return\n     */\n    @SuppressWarnings(\"restriction\")\n    public static String encode(String str) {\n        byte[] b = null;\n        String s = null;\n        try {\n            b = str.getBytes(\"utf-8\");\n        } catch (UnsupportedEncodingException e) {\n            e.printStackTrace();\n        }\n        if (b != null) {\n            s = new BASE64Encoder().encode(b);\n        }\n        return s;\n    }\n    /**\n     * 解密\n     * @param s\n     * @return\n     */\n    @SuppressWarnings(\"restriction\")\n    public static String decode(String s) {\n        byte[] b = null;\n        String result = null;\n        if (s != null) {\n            BASE64Decoder decoder = new BASE64Decoder();\n            try {\n                b = decoder.decodeBuffer(s);\n                result = new String(b, \"utf-8\");\n            } catch (Exception e) {\n                e.printStackTrace();\n            }\n        }\n        return result;\n    }\n    public static void main(String args[]) {\n        Long startTime = System.currentTimeMillis();\n        String rawString = \"loveluoqi\";\n        String encodedString = encode(rawString);\n        String decodedString = decode(encodedString);\n        System.out.println(rawString);\n        System.out.println(encodedString);\n        System.out.println(decodedString);\n        Long endTime = System.currentTimeMillis();\n        System.out.println(\"总共耗时毫秒数：\" + (endTime - startTime));\n    }\n}\n```\n![氰化物01.jpg](http://localhost/api/upload/2019/07/15/5e9c2ec8-e8d1-4c7e-88b7-9dd892543379.jpg)');
INSERT INTO `blog_content` VALUES (10, '## 基本思想\n\n　　归并排序（MERGE-SORT）是利用归并的思想实现的排序方法，该算法采用经典的分治（divide-and-conquer）策略（分治法将问题分(divide)成一些小的问题然后递归求解，而治(conquer)的阶段则将分的阶段得到的各答案\"修补\"在一起，即分而治之)。\n  \n### 分而治之\n\n![](http://localhost/api/upload/2019/07/24/17da2791-65ca-49f1-a26e-f36f28f4a098.png)\n\n可以看到这种结构很像一棵完全二叉树，本文的归并排序我们采用递归去实现（也可采用迭代的方式去实现）。分阶段可以理解为就是递归拆分子序列的过程，递归深度为log2n。\n\n## 合并相邻有序子序列\n\n　　再来看看治阶段，我们需要将两个已经有序的子序列合并成一个有序序列，比如上图中的最后一次合并，要将[4,5,7,8]和[1,2,3,6]两个已经有序的子序列，合并为最终序列[1,2,3,4,5,6,7,8]，来看下实现步骤。\n  \n  ![](http://localhost/api/upload/2019/07/24/26f6b8ff-6d46-4578-b1c4-15df8ccf58df.png)\n  ![](http://localhost/api/upload/2019/07/24/8b75acaa-ef34-4566-a29c-7ac13fc58d98.png)\n  \n## 代码实现\n\n```java\npackage sortdemo;\n\nimport java.util.Arrays;\n\n/**\n * Created by chengxiao on 2016/12/8.\n */\npublic class MergeSort {\n    public static void main(String []args){\n        int []arr = {9,8,7,6,5,4,3,2,1};\n        sort(arr);\n        System.out.println(Arrays.toString(arr));\n    }\n    public static void sort(int []arr){\n        int []temp = new int[arr.length];//在排序前，先建好一个长度等于原数组长度的临时数组，避免递归中频繁开辟空间\n        sort(arr,0,arr.length-1,temp);\n    }\n    private static void sort(int[] arr,int left,int right,int []temp){\n        if(left<right){\n            int mid = (left+right)/2;\n            sort(arr,left,mid,temp);//左边归并排序，使得左子序列有序\n            sort(arr,mid+1,right,temp);//右边归并排序，使得右子序列有序\n            merge(arr,left,mid,right,temp);//将两个有序子数组合并操作\n        }\n    }\n    private static void merge(int[] arr,int left,int mid,int right,int[] temp){\n        int i = left;//左序列指针\n        int j = mid+1;//右序列指针\n        int t = 0;//临时数组指针\n        while (i<=mid && j<=right){\n            if(arr[i]<=arr[j]){\n                temp[t++] = arr[i++];\n            }else {\n                temp[t++] = arr[j++];\n            }\n        }\n        while(i<=mid){//将左边剩余元素填充进temp中\n            temp[t++] = arr[i++];\n        }\n        while(j<=right){//将右序列剩余元素填充进temp中\n            temp[t++] = arr[j++];\n        }\n        t = 0;\n        //将temp中的元素全部拷贝到原数组中\n        while(left <= right){\n            arr[left++] = temp[t++];\n        }\n    }\n}\n```\n执行结果\n>[1, 2, 3, 4, 5, 6, 7, 8, 9]\n\n## 最后\n\n　　归并排序是稳定排序，它也是一种十分高效的排序，能利用完全二叉树特性的排序一般性能都不会太差。java中Arrays.sort()采用了一种名为TimSort的排序算法，就是归并排序的优化版本。从上文的图中可看出，每次合并操作的平均时间复杂度为O(n)，而完全二叉树的深度为|log2n|。总的平均时间复杂度为O(nlogn)。而且，归并排序的最好，最坏，平均时间复杂度均为O(nlogn)。');
INSERT INTO `blog_content` VALUES (20, '## 问题描述\n\nVuex适合于中大型项目，在小型项目中使用往往是杀鸡用牛刀。\n\n官方说明如下:\n\n> 如果您不打算开发大型单页应用，使用 Vuex 可能是繁琐冗余的。确实是如此——如果您的应用够简单，您最好不要使用 Vuex。\n\n但最近使用自定义的全局变量时，却遇到了`computed`计算属性不能获取全局变量变更后的状态的问题。\n\n```js\n// src/state/index.js\nexport default {\n	state1: \'\',\n	state2: \'\'\n}\n\n// main.js\nimport state from \'./state\'\nVue.prototype.$state = state\n\n// demo.vue\ncomputed: {\n    state1() {\n        console.log(\'in computed...\')\n        return this.$state.state1\n    }\n},\nwatch: {\n    state1: function(newValue) {\n        console.log(\'newValue: \' + newValue)\n    }\n}    \n```\n\n\n\n当通过其他方式改变`state1`的值时，发现`computed`和`watch`的代码并没有执行，查阅了相关资料才发现这种方式创建的全局变量**是不可交互的**。\n\n## 解决方法\n\n```js\n// src/state/index.js\nexport default {\n	state1: \'\',\n	state2: \'\'\n}\n\n// main.js\nimport state from \'./state\'\nnew Vue({\n  el: \'#app\',\n  router,\n  components: { App },\n  template: \'<App/>\'\n  // 关键在此处，注意此处data不是函数形式\n  data: { // only place where data is not a function\n    state\n  },\n})\n\n// demo.vue\ncomputed: {\n    state1() {\n        console.log(\'in computed...\')\n        return this.$root.state.state1\n    }\n},\nwatch: {\n    state1: function(newValue) {\n        console.log(\'newValue: \' + newValue)\n    }\n}  \n```\n\n按上面写法就能成功创建可交互的全局变量了。\n\n\n\n## 参考\n\n[https://cn.vuejs.org/v2/guide/state-management.html#简单状态管理起步使用](https://cn.vuejs.org/v2/guide/state-management.html#简单状态管理起步使用)\n\n[https://stackoverflow.com/questions/51275301/how-to-react-to-a-global-variable-with-vue](https://stackoverflow.com/questions/51275301/how-to-react-to-a-global-variable-with-vue)');
INSERT INTO `blog_content` VALUES (21, 'API分为前台和后台两部分\n\n文档中前端url请求路径前需要加上`http://xx.com/api`，后台url请求路径前需要加上`http://xx.com/api/admin`，其中`xx.com`需要根据实际情况修改为相应域名。\n\n为增强接口安全性，要求每个请求都加上一个`sign`字段，其值由特定算法和后台密码决定，如`sign=19e907700db7ad91318424a97c54ed57`\n\n返回结构模板\n\n```\n{\n    \"code\": 200,\n    \"message\": \"SUCCESS\",\n    \"data\": {\n        \"nickname\": \"2w6f8c\",\n        \"profile\": \"普通大学生，技术爱好者\",\n        \"avatar\": \"http://2w6f8c.top/static/image/avatar.jpg\",\n        \"email\": \"2428391347@qq.com\"\n    }\n}\n```\n\n其中code表示状态码，message是返回的信息，data是请求得到的数据。\n\ncode对应表如下：\n\n|code|语义|\n|---|---|\n|200|成功|\n|400|失败|\n|401|未认证（签名错误|\n|404|接口不存在|\n|500|服务器内部错误|\n\n系统大量使用分页插件，返回数据形式如下：\n\n```\n{\n    \"code\": 200,\n    \"message\": \"SUCCESS\",\n    \"data\": {\n        \"pageNum\": 2,\n        \"pageSize\": 2,\n        \"size\": 2,\n        \"orderBy\": null,\n        \"startRow\": 3,\n        \"endRow\": 4,\n        \"total\": 12,\n        \"pages\": 6,\n        \"list\": [\n            {\n                \"id\": 80,\n                \"name\": \"wdnmd\",\n                \"ip\": \"0:0:0:0:0:0:0:1\",\n                \"avatar\": \"http://localhost/upload/2019/07/09/9289c81a-6b4e-4a77-854e-6b664161e19f.png\",\n                \"email\": \"2428391347@qq.com\",\n                \"inform\": 1\n            },\n            {\n                \"id\": 81,\n                \"name\": \"wdnmd\",\n                \"ip\": \"0:0:0:0:0:0:0:1\",\n                \"avatar\": \"http://localhost/upload/2019/07/09/843b7008-86eb-4406-9b37-05494553f23d.png\",\n                \"email\": \"2428391347@qq.com\",\n                \"inform\": 1\n            }\n        ],\n        \"prePage\": 1,\n        \"nextPage\": 3,\n        \"isFirstPage\": false,\n        \"isLastPage\": false,\n        \"hasPreviousPage\": true,\n        \"hasNextPage\": true,\n        \"navigatePages\": 8,\n        \"navigatepageNums\": [\n            1,\n            2,\n            3,\n            4,\n            5,\n            6\n        ],\n        \"navigateFirstPage\": 1,\n        \"navigateLastPage\": 6,\n        \"lastPage\": 6,\n        \"firstPage\": 1\n    }\n}\n```\n\n以下为分页插件的返回参数说明：\n\n|参数名|类型|说明|\n|:-----  |:-----|-----|\n|pageNum|int|当前页数|\n|pageSize|int|每页记录条数|\n|size|int|同pageSize|\n|orderBy|string|排序字段|\n|startRow|int|从第几条记录开始算|\n|endRow|int|第几条记录结束|\n|total|int|总记录条数|\n|pages|int|总页数|\n|list|list|数据列表|\n|prePage|int|前一页页码|\n|nextPage|int|后一页页码|\n|isFirstPage|bool|是否是第一页|\n|isLastPage|bool|是否是最后一页|\n|hasPreviousPage|bool|是否有前一页|\n|hasNextPage|bool|是否有下一页|\n|navigatePages|int|导航页数总数|\n|navigatepageNums|array|导航中的页码数组|\n|navigateFirstPage|int|导航中的第一页页码|\n|firstPage|int|同navigateFirstPage|\n|navigateLastPage|int|导航中的最后一页页码|\n|lastPage|int|同navigateLastPage|\n');
INSERT INTO `blog_content` VALUES (23, '### 项目介绍\n\n随机生成Github风格头像，可自定义颜色、大小、透明性等。\n\n### 成果展示\n\n![avatar.png](http://localhost/api/upload/2019/07/23/2b051052-86d9-4181-8593-6cb06cdfce04.png)\n\n### 项目地址\n\n[github-avatar-generator](https://github.com/afkbrb/github-avatar-generator)');
INSERT INTO `blog_content` VALUES (24, '最近更新了一系列Java并发编程相关的笔记，不在此一篇篇发出来了，详情见[java-concurrency-note](https://github.com/afkbrb/java-concurrency-note)\n\n### 笔记列表\n\n#### 第一部分 Java并发编程基础篇\n\n- [第1章 并发编程线程基础](https://github.com/afkbrb/java-concurrency-note/blob/master/01并发编程线程基础.md)\n\n- [第2章 并发编程的其他基础知识](https://github.com/afkbrb/java-concurrency-note/blob/master/02并发编程的其他基础知识.md)\n\n#### 第二部分 Java并发编程高级篇\n\n- [第3章 Java并发包中的ThreadLocalRandom类原理剖析](https://github.com/afkbrb/java-concurrency-note/blob/master/03Java并发包中的ThreadLocalRandom类原理剖析.md)\n\n- [第4章 Java并发包中原子操作类原理剖析](https://github.com/afkbrb/java-concurrency-note/blob/master/04Java并发包中原子操作类原理剖析.md)\n\n- [第5章 Java并发包中并发List源码剖析](https://github.com/afkbrb/java-concurrency-note/blob/master/05Java并发包中并发List源码剖析.md)\n\n- [第6章 Java并发包中锁原理剖析](https://github.com/afkbrb/java-concurrency-note/blob/master/06Java并发包中锁原理剖析.md)\n\n- [第7章 Java并发包中并发队列原理剖析](https://github.com/afkbrb/java-concurrency-note/blob/master/07Java并发包中并发队列原理剖析.md)\n\n- [第8章 Java并发包中线程池ThreadPoolExecutor原理探究](https://github.com/afkbrb/java-concurrency-note/blob/master/08Java并发包中线程池ThreadPoolExecutor原理探究.md)\n\n- [第9章 Java并发包中ScheduledThreadPoolExecutor原理探究](https://github.com/afkbrb/java-concurrency-note/blob/master/09Java并发包中ScheduledThreadPoolExecutor原理探究.md)\n\n- [第10章 Java并发包中线程同步器原理剖析](https://github.com/afkbrb/java-concurrency-note/blob/master/10Java并发包中线程同步器原理剖析.md)\n\n#### 第三部分 Java并发编程实践篇\n\n- [第11章 并发编程实践](https://github.com/afkbrb/java-concurrency-note/blob/master/11并发编程实践.md)');
INSERT INTO `blog_content` VALUES (25, '### 项目背景\n最近学习Vue.js,想写个项目练练手，借助[每日一文API](https://github.com/jokermonn/-Api/blob/master/OneArticle.md)的帮助，仿照[观止](https://www.wandoujia.com/apps/com.meiriyiwen.app)开发了一个阅读App\n\n### 项目功能\n\n- 获取每日一文每天推荐文章、随机文章、前后一天文章\n- 收藏文章\n- 阅读设置（颜色、字体、夜间模式）\n\n> 注：由于API支持不足，暂不支持文章分享功能\n\n###  阅览地址\n\n[点我预览](http://git.afkbrb.top/daily-read)\n> 注：有时由于每日一文服务器的原因，App数据请求可能失败，可换个时间重试；请尽量用手机端访问，或打开浏览器调试模式，选择手机视图进行预览\n\n### 项目截图\n\n<table><tr><td><img src=\"http://localhost/api/upload/2019/07/23/1e184cc1-c564-4dad-8027-a44a5f31b828.png\"/></td><td><img src=\"http://localhost/api/upload/2019/07/23/9788f6ee-18eb-45a3-984a-30b07c62e07a.png\"/></td></tr><tr><td><img src=\"http://localhost/api/upload/2019/07/23/f45d25b8-b66c-4efb-98cc-e864dad8ce94.png\"/></td><td><img src=\"http://localhost/api/upload/2019/07/23/7dc3cd76-8569-4166-a1f5-4244fe6a5cec.png\"/></td></tr><tr><td><img src=\"http://localhost/api/upload/2019/07/23/8b9c048b-51e8-433b-a4a9-5ed9af34d4fa.png\"/></td><td><img src=\"http://localhost/api/upload/2019/07/23/19f3c51d-bc05-47e8-aca7-e5338288ba32.png\"/></td></tr><tr><td><img src=\"http://localhost/api/upload/2019/07/23/cb3035ef-c29c-442d-a1d5-b5779f1e79bf.png\"/></td><td><img src=\"http://localhost/api/upload/2019/07/23/200a2651-b095-407a-9063-c7b28cf9c3d3.png\"/></td></tr></table>\n\n### 项目地址\n[daily-read](https://github.com/afkbrb/daily-read),欢迎star');
INSERT INTO `blog_content` VALUES (26, '使用$.fn.pagination.defaults重写默认值对象\n\n该分页控件允许用户导航页面的数据。它支持页面导航和页面长度选择的选项设置。用户可以在分页控件上添加自定义按钮，以增强其功能。\n\n![9.png](http://localhost/api/upload/2019/07/23/929d56bc-9204-4b73-8496-702aabc6e7a9.png)\n\n**使用案例**\n\n使用标签创建分页控件。\n\n```html\n<div id=\"pp\" class=\"easyui-pagination\" data-options=\"total:2000,pageSize:10\" style=\"background:#efefef;border:1px solid #ccc;\"></div> \n```\n\n使用Javascript创建分页控件\n\n```html\n<div id=\"pp\" style=\"background:#efefef;border:1px solid #ccc;\"></div> \n```\n\n```css\n$(\'#pp\').pagination({ \ntotal:2000, \npageSize:10 \n}); \n```\n让我们使用面板和分页插件来创建一个ajax分页。当用户选择一个新页面的时候，面板将显示指定页面的内容。\n\n```html\n<div id=\"content\" class=\"easyui-panel\" style=\"height:200px\" \ndata-options=\"href:\'show_content.php?page=1\'\"> \n</div> \n<div class=\"easyui-pagination\" style=\"border:1px solid #ccc;\" \n       data-options=\" \n    ).panel(\'refresh\', \'show_content.php?page=\'+pageNumber); \n}\"> \n</div> \n```\n\n面板上默认显示第一页的内容。当用户导航页面的时候，\'onSelectPage\'事件将被触发，将会根据一个新的URL参数获取对应页面的新内容，并通过\'refresh\'方法将内容刷新到内容面板上。\n\n**属性**\n\n![10.png](http://localhost/api/upload/2019/07/23/9f06f41f-ecd2-4ed5-ae48-68cc3e84c6d2.png)\n\n![11.png](http://localhost/api/upload/2019/07/23/adefb98a-2def-44da-bce8-e210a42bb41e.png)\n\n**事件**\n\n![12.png](http://localhost/api/upload/2019/07/23/362fca1c-b511-4b58-b0d3-4e007e327de2.png)\n\n**方法**\n\n![13.png](http://localhost/api/upload/2019/07/23/41adfda3-c529-4a26-9ac9-ae7edcfc1289.png)');
INSERT INTO `blog_content` VALUES (27, '>**摘要: **Linux里有很丰富的各种命令，有些是很难用的。然而，学会了前面说的这8个命令，你已经能处理大量的log分析任务了，完全不需要用脚本语言写程序来处理它们。\n\n每个程序员，在职业生涯的某个时刻，总会发现自己需要知道一些Linux方面的知识。我并不是说你应该成为一个Linux专家，我的意思是，当面对Linux命令行任务时，你应该能很熟练的完成。事实上，学会了下面8个命令，我基本上能完成任何需要完成的任务。\n\n注意：下面的每个命令都有十分丰富的文档说明。这篇文章并不是来详尽的展示每个命令的各种功用的。我在这里要讲的是这几个最常用的命令的最常见用法。如果你对linux命令并不是很了解，你想找一些这方面的资料学习，那这篇文章将会给你一个基本的指导。\n\n让我们从处理一些数据开始。假设我们有两个文件，分别记录的订单清单和订单处理结果。\n\n>order.out.log  \n  8:22:19 111, 1, Patterns of Enterprise Architecture, Kindle edition, 39.99 \n  8:23:45 112, 1, Joy of Clojure, Hardcover, 29.99  \n  8:24:19 113, -1, Patterns of Enterprise Architecture, Kindle edition, 39.99 \n  order.in.log  \n  8:22:20 111, Order Complete  \n  8:23:50 112, Order sent to fulfillment  \n  8:24:20 113, Refund sent to processing \n\n#### cat -- 连接文件，并输出结果\n\ncat 命令非常的简单，你从下面的例子可以看到。\n\n>jfields$ cat order.out.log   \n8:22:19 111, 1, Patterns of Enterprise Architecture, Kindle edition, 39.99  \n8:23:45 112, 1, Joy of Clojure, Hardcover, 29.99  \n8:24:19 113, -1, Patterns of Enterprise Architecture, Kindle edition, 39.99 \n\n就像它的说明描述的，你可以用它来连接多个文件。\n\n>jfields$ cat order.*   \n8:22:20 111, Order Complete  \n8:23:50 112, Order sent to fulfillment  \n8:24:20 113, Refund sent to processing  \n8:22:19 111, 1, Patterns of Enterprise Architecture, Kindle edition, 39.99  \n8:23:45 112, 1, Joy of Clojure, Hardcover, 29.99  \n8:24:19 113, -1, Patterns of Enterprise Architecture, Kindle edition, 39.99 \n\n如果你想看这些log文件的内容，你可以把它们连接起来并输出到标准输出上，就是上面的例子展示的。这很有用，但输出的内容可以更有逻辑些。\n\n#### sort – 文件里的文字按行排序\n\n此时sort命令显然是你最佳的选择。\n\n>jfields$ cat order.* | sort  \n8::22:19 111, 1, Patterns of Enterprise Architecture, Kindle edition, 39.99  \n8:22:20 111, Order Complete  \n8:23:45 112, 1, Joy of Clojure, Hardcover, 29.99  \n8:23:50 112, Order sent to fulfillment  \n8:24:19 113, -1, Patterns of Enterprise Architecture, Kindle edition, 39.99  \n8:24:20 113, Refund sent to processing \n\n就像上面例子显示的，文件里的数据已经经过排序。对于一些小文件，你可以读取整个文件来处理它们，然而，真正的log文件通常有大量的内容，你不能不考虑这个情况。此时你应该考虑过滤出某些内容，把cat、sort后的内容通过管道传递给过滤工具。\n\n#### grep, egrep, fgrep – 打印出匹配条件的文字行\n\n假设我们只对Patterns of Enterprise Architecture这本书的订单感兴趣。使用grep，我们能限制只输出含有Patterns字符的订单。\n\n>jfields$ cat order.* | sort | grep Patterns  \n8:22:19 111, 1, Patterns of Enterprise Architecture, Kindle edition, 39.99  \n8:24:19 113, -1, Patterns of Enterprise Architecture, Kindle edition, 39.99 \n\n假设退款订单113出了一些问题，你希望查看所有相关订单——你又需要使用grep了。\n\n>jfields$ cat order.* | sort | grep \":\\d\\d 113, \"  \n8:24:19 113, -1, Patterns of Enterprise Architecture, Kindle edition, 39.99  \n8:24:20 113, Refund sent to processing \n\n你会发现在grep上的匹配模式除了“113”外还有一些其它的东西。这是因为113还可以匹配上书目或价格，加上额外的字符后，我们可以精确的搜索到我们想要的东西。\n\n现在我们已经知道了退货的详细信息，我们还想知道日销售和退款总额。但我们只关心《Patterns of Enterprise Architecture》这本书的信息，而且只关心数量和价格。我现在要做到是切除我们不关心的任何信息。\n\n#### cut – 删除文件中字符行上的某些区域\n\n又要使用grep，我们用grep过滤出我们想要的行。有了我们想要的行信息，我们就可以把它们切成小段，删除不需要的部分数据。\n\n>jfields$ cat order.* | sort | grep Patterns  \n8:22:19 111, 1, Patterns of Enterprise Architecture, Kindle edition, 39.99  \n8:24:19 113, -1, Patterns of Enterprise Architecture, Kindle edition, 39.99  \n jfields$ cat order.* | sort | grep Patterns | cut -d\",\" -f2,5  \n 1, 39.99  \n -1, 39.99 \n \n 现在，我们把数据缩减为我们计算想要的形式，把这些数据粘贴到Excel里立刻就能得到结果了。\n\ncut是用来消减信息、简化任务的，但对于输出内容，我们通常会有更复杂的形式。假设我们还需要知道订单的ID，这样可以用来关联相关的其他信息。我们用cut可以获得ID信息，但我们希望把ID放到行的最后，用单引号包上。\n\n#### sed – 一个流编辑器。它是用来在输入流上执行基本的文本变换。\n\n下面的例子展示了如何用sed命令变换我们的文件行，之后我们在再用cut移除无用的信息。\n\n>jfields$ cat order.* | sort | grep Patterns \\  \n>| sed s/\"[0-9\\:]* [0−9]∗[0−9]∗\\, .∗.∗\"/\"\\2, \'\\1\'\"/  \n1, Patterns of Enterprise Architecture, Kindle edition, 39.99, \'111\'  \n-1, Patterns of Enterprise Architecture, Kindle edition, 39.99, \'113\'  \n lmp-jfields01:~ jfields$ cat order.* | sort | grep Patterns \\  \n>| sed s/\"[0-9\\:]* [0−9]∗[0−9]∗\\, .∗.∗\"/\"\\2, \'\\1\'\"/ | cut -d\",\" -f1,4,5  \n1, 39.99, \'111\'  \n-1, 39.99, \'113\' \n\n我们对例子中使用的正则表达式多说几句，不过也没有什么复杂的。正则表达式做了下面几种事情\n\n- 删除时间戳\n- 捕捉订单号\n- 删除订单号后的逗号和空格\n- 捕捉余下的行信息\n\n里面的引号和反斜杠有点乱，但使用命令行时必须要用到这些。\n\n一旦捕捉到了我们想要的数据，我们可以使用 \\1 & \\2 来存储它们，并把它们输出成我们想要的格式。我们还在其中加入了要求的单引号，为了保持格式统一，我们还加入了逗号。最后，用cut命令把不必要的数据删除。\n\n现在我们有麻烦了。我们上面已经演示了如何把log文件消减成更简洁的订单形式，但我们的财务部门需要知道订单里一共有哪些书。\n\n#### uniq – 删除重复的行\n\n下面的例子展示了如何过滤出跟书相关的交易，删除不需要的信息，获得一个不重复的信息。\n\n>jfields$ cat order.out.log | grep \"Kindle∥HardcoverKindle‖Hardcover\" | cut -d\",\" -f3 | sort | uniq -c  \n   1  Joy of Clojure  \n   2  Patterns of Enterprise Architecture \n\n看起来这是一个很简单的任务。\n\n这都是很好用的命令，但前提是你要能找到你想要的文件。有时候你会发现一些文件藏在很深的文件夹里，你根本不知道它们在哪。但如果你是知道你要寻找的文件的名字的话，这对你就不是个问题了。\n\n#### find – 在文件目录中搜索文件\n\n在上面的例子中我们处理了order.in.log和order.out.log这两个文件。这两个文件放在我的home目录里的。下面了例子将向大家展示如何在一个很深的目录结构里找到这样的文件。\n\n>jfields$ find /Users -name \"order*\"  \nUsers/jfields/order.in.log  \nUsers/jfields/order.out.log \n\nfind命令有很多其它的参数，但99%的时间里我只需要这一个就够了。\n\n简单的一行，你就能找到你想要的文件，然后你可以用cat查看它，用cut修剪它。但文件很小时，你用管道把它们输出到屏幕上是可以的，但当文件大到超出屏幕时，你也许应该用管道把它们输出给less命令。\n\n#### less – 在文件里向前或向后移动\n\n让我们再回到简单的 cat | sort 例子中来，下面的命令就是将经过合并、排序后的内容输出到less命令里。在 less 命令，使用“/”来执行向前搜索，使用“？”命令执行向后搜索。搜索条件是一个正则表达式。\n\n>jfields$ cat order* | sort | less \n\n如果你在 less 命令里使用 /113.*，所有113订单的信息都会高亮。你也可以试试?.*112，所有跟订单112相关的时间戳都会高亮。最后你可以用 ‘q’ 来退出less命令。\n\nLinux里有很丰富的各种命令，有些是很难用的。然而，学会了前面说的这8个命令，你已经能处理大量的log分析任务了，完全不需要用脚本语言写程序来处理它们。\n\n这篇文章是之前保存的网络上的一篇文章，遗憾的是已经不知道谁是作者了，所以，如果有侵权，请速与本人联系，定会协作妥善处理！');
INSERT INTO `blog_content` VALUES (28, '这些命令使用很常见，我们需要长记在心，直接总结下吧：\ntar [-cxtzjvfpPN] 文件与目录 ....\n\n参数：\n-c ：建立一个压缩文件的参数指令\n-x ：解开一个压缩文件的参数指令\n-t ：查看压缩文件里面的文件\n\n**特别注意：** c/x/t 同时只能存在一个，原因是我们不可能同时压缩与解压缩。\n\n-z ：是否同时具有 gzip 的属性？亦即是否需要用 gzip 压缩\n-j ：是否同时具有 bzip2 的属性？亦即是否需要用 bzip2 压缩\n-v ：压缩的过程中显示文件！这个常用，但不建议用在背景执行过程\n-f ： 使用档名，请留意，在 f 之后要立即接档名喔！不要再加参数\n　　　例如使用『 tar -zcvfP tfile sfile』就是错误的写法，要写成\n　　　『 tar -zcvPf tfile sfile』才对喔！\n-p ：使用原文件的原来属性（属性不会依据使用者而变）\n-P ：可以使用绝对路径来压缩！\n-N ：比后面接的日期(yyyy/mm/dd)还要新的才会被打包进新建的文件中！\n--exclude FILE：在压缩的过程中，不要将 FILE 打包！\n\n#### 范例：\n\n##### 范例一：将整个 /etc 目录下的文件全部打包成为 /tmp/etc.tar\n\n>[root@linux ~]# tar -cvf /tmp/etc.tar /etc<==仅打包，不压缩！\n[root@linux ~]# tar -zcvf /tmp/etc.tar.gz /etc<==打包后，以 gzip 压缩\n[root@linux ~]# tar -jcvf /tmp/etc.tar.bz2 /etc<==打包后，以 bzip2 压缩\n\n特别注意，在参数 f 之后的文件档名是自己取的，我们习惯上都用 .tar 来作为辨识。\n如果加 z 参数，则以 .tar.gz 或 .tgz 来代表 gzip 压缩过的 tar file ～\n如果加 j 参数，则以 .tar.bz2 来作为附档名啊～\n上述指令在执行的时候，会显示一个警告讯息：『tar: Removing leading \'/\" from member names』那是关於绝对路径的特殊设定。\n\n##### 范例二：查阅上述 /tmp/etc.tar.gz 文件内有哪些文件\n\n>[root@linux ~]# tar -ztvf /tmp/etc.tar.gz\n\n由於我们使用 gzip 压缩，所以要查阅该 tar file 内的文件时，就得要加上 z 这个参数了！这很重要的！\n\n##### 范例三：将 /tmp/etc.tar.gz 文件解压缩在 /usr/local/src 底下\n\n>[root@linux ~]# cd /usr/local/src\n[root@linux src]# tar -zxvf /tmp/etc.tar.gz\n\n在预设的情况下，我们可以将压缩档在任何地方解开的！\n以这个范例来说，我先将工作目录变换到 /usr/local/src 底下，\n并且解开 /tmp/etc.tar.gz ，则解开的目录会在 /usr/local/src/etc 呢！\n另外，如果您进入 /usr/local/src/etc则会发现，该目录下的文件属性与 /etc/ 可能会有所不同喔！\n\n##### 范例四：在 /tmp 底下，我只想要将 /tmp/etc.tar.gz 内的 etc/passwd 解开而已\n\n>[root@linux ~]# cd /tmp\n[root@linux tmp]# tar -zxvf /tmp/etc.tar.gz etc/passwd\n\n我可以透过 tar -ztvf 来查阅 tarfile 内的文件名称，\n如果单只要一个文件，就可以透过这个方式来下达！\n注意到！ etc.tar.gz 内的根目录 / 是被拿掉了！\n\n##### 范例五：将 /etc/ 内的所有文件备份下来，并且保存其权限！\n\n>[root@linux ~]# tar -zcvpf /tmp/etc.tar.gz /etc \n\n 这个 -p 的属性是很重要的，尤其是当您要保留原本文件的属性时！\n \n##### 范例六：在 /home 当中，比 2005/06/01 新的文件才备份\n\n>[root@linux ~]# tar -N \"2005/06/01\" -zcvf home.tar.gz /home\n\n##### 范例七：我要备份 /home, /etc ，但不要 /home/dmtsai\n\n>[root@linux ~]# tar --exclude /home/dmtsai -zcvf myfile.tar.gz /home/* /etc\n\n##### 范例八：将 /etc/ 打包后直接解开在 /tmp 底下，而不产生文件！\n\n>[root@linux ~]# cd /tmp\n[root@linux tmp]# tar -cvf - /etc | tar -xvf -\n\n这个动作有点像是 cp -r /etc /tmp 啦～依旧是有其有用途的！\n要注意的地方在於输出档变成 - 而输入档也变成 - ，又有一个 | 存在～\n这分别代表 standard output, standard input 与管线命令啦！\n这部分我们会在 Bash shell 时，再次提到这个指令跟大家再解释啰！\n\n#### 常用压缩解压缩命令：\n\n后缀 .tar\n解压命令: tar xvf InFile.tar\n压缩命令: tar cvf OutFile.tar InFile\n可压缩文件类型: 文件夹\n\n后缀 .tar.gz\n解压命令: tar zxvf InFile.tar.gz\n压缩命令: tar zcvf OutFile.tar.gz InFile\n可压缩文件类型: 文件夹\n\n后缀 .tar.bz2\n解压命令: tar jxvf InFile.tar.bz2\n压缩命令: tar jcvf OutFile.tar.bz2 InFile\n可压缩文件类型: 文件夹\n\n\n后缀 .tar.Z\n解压命令: tar Zxvf InFile.tar.Z\n压缩命令: tar Zcvf OutFile.tar.Z InFile\n可压缩文件类型: 文件夹\n\n\n后缀 .gz\n解压命令: gzip -d InFile.gz 或 gunzip InFile.gz\n压缩命令: gzip InFile\n可压缩文件类型: 普通文件/打包文件\n\n\n后缀 .zip\n解压命令: unzip InFile.zip\n压缩命令: zip OutFile.zip InFile\n可压缩文件类型: 普通文件列表/打包文件\n\n\n后缀 .bz2\n解压命令: bzip2 -d InFile.bz2 或 bunzip2 InFile.bz2\n压缩命令: bzip2 -z InFile\n可压缩文件类型: 普通文件/打包文件\n\n\n后缀 .Z\n解压命令: uncompress InFile.Z\n压缩命令: compress InFile\n可压缩文件类型: 打包文件\n\n\n后缀 .rar\n解压命令: rar x InFile.rar\n压缩命令: rar a InFile\n可压缩文件类型: 文件夹/普通文件列表/打包文件');
INSERT INTO `blog_content` VALUES (29, '我们常常工作在Linux下，所以必须要学会安装这些常用的runtime，这些工作都是相通的，学会一种，其他的举一反三就OK了！\n\n一般来说，有三种方法：\n1. 使用包管理器，像ruby的rvm（推荐）\n2. 直接安装二进制包\n3. 从源码包进行编译安装\n\n三种方法都比较简单，除了安装步骤外，还有一个重要的步骤就是在安装完后配置环境变量。下面我举例说明下：\n\n**Linux下安装Java**\n\nJava的安装不需要使用特定的包管理器，直接在Oracle官网上下载二进制包，形如：jdk-7u17-linux-x64.tar.gz解压后得到一个文件夹，将该文件夹拷贝到你要安装的目录下就可以了，接下来就是一点配置：（如我们将上述文件放在/opt下）\n\nroot权限打开/etc/profile文件，在末尾加上：\n\n>\nJAVA_HOME=/opt/jdk1.7.17\nPATH=$JAVA_HOME/bin:$PATH\nCLASSPATH=.:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar\nexport JAVA_HOME PATH CLASSPATH\n\n执行.  /etc/profile可使profile修改后立即生效。(注意.后面的空格)\n\n其实这段配置的目的就是设置PATH和CLASSPATH，与我们在windows下设置环境变量是一致的。之后用javac或者java -version测试下，看成功没有。\n\n**Linux下Ruby的安装：**\n\n1、采用包管理器(rvm)安装\n\n>Install curl using apt-get\nsudo apt-get install curl\nInstall rvm using curl\ncurl -L https://get.rvm.io | bash -s\nReload the .bash_profile in the current terminal\nsource ~/.bash_profile\nNote : To make sure bash is run as a login shell and rvm is loaded, please follow the steps in the doc Integrating RVM with gnome-terminal\nCheck the required dependencies for installing ruby\nrvm requirements\nInstall the required pre-reqs for installing ruby\nsudo /usr/bin/apt-get install build-essential bison openssl libreadline6 libreadline6-dev curl git-core zlib1g \\zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf \\ libc6-dev ncurses-dev\nInstall ruby 1.9.2 using rvm\nrvm install 1.9.2\nSet the ruby version to 1.9.2\nrvm use 1.9.2\nCheck that the correct version of ruby has been set\nruby -v\nInstall bundler gem\ngem install bundler\nInstall rake gem\ngem install rake\n\n**2、下载二进制包直接解压安装**\n\n和上文中Java的安装方法一样，下载形如ruby-1.9.3-p0.tar.gz，解压，配置环境变量就OK了。\n\n**3、源码编译安装**\n\n下载源码，解压后，进入目录，直接执行：\n\n>./configure –prefix=/usr/local/ruby  （=/usr/local/ruby  为将要安装ruby的目录）\nmake && make install');
INSERT INTO `blog_content` VALUES (30, '## 概述\n\n　　约束是数据库用来确保数据满足业务规则的手段，不过在真正的企业开发中，除了主键约束这类具有强需求的约束，像外键约束，检查约束更多时候仅仅出现在数据库设计阶段，真实环境却很少应用，更多是放到程序逻辑中去进行处理。这也比较容易理解，约束会一定程度上较低数据库性能，有些规则直接在程序逻辑中处理就可以了，同时，也有可能在面对业务变更或是系统扩展时，数据库约束会使得处理不够方便。不过在我看来，数据库约束是保证数据准确性的最后一道防线，对于设计合理的系统，处于性能考虑数据库约束自然可有可无；不过若是面对关联关系较为复杂的系统，且对系统而言，数据的准确性完整性要高于性能要求，那么这些约束还是有必要的（否则，就会出现各种相对业务规则来说莫名其妙的脏数据，本人可是深有体会的。。）。总之，对于约束的选择无所谓合不合理，需要根据业务系统对于准确性和性能要求的侧重度来决定。\n  \n  数据库约束有五种：\n  - 主键约束（PRIMARY KEY）\n  -  唯一性约束（UNIQUE)\n  -  非空约束（NOT NULL)\n  -  外键约束（FOREIGN KEY)\n  -  检查约束（CHECK)\n  \n下面我们就分别来看下这五类约束：\n\n## 数据库约束\n\n### 主键约束（PRIMARY KEY)\n\n　　主键是定位表中单个行的方式，可唯一确定表中的某一行，关系型数据库要求所有表都应该有主键，不过Oracle没有遵循此范例要求，Oracle中的表可以没有主键（这种情况不多见）。关于主键有几个需要注意的点：\n  \n  1. 键列必须必须具有唯一性，且不能为空，其实主键约束 相当于 UNIQUE+NOT NULL\n  2. 一个表只允许有一个主键\n  3. 主键所在列必须具有索引（主键的唯一约束通过索引来实现），如果不存在，将会在索引添加的时候自动创建\n \n\n　　添加主键（约束的添加可在建表时创建，也可如下所示在建表后添加，一般推荐建表后添加，灵活度更高一些，建表时添加某些约束会有限制）\n  \n>SQL> alter table emp add constraint emp_id_pk primary key(id);\n\n### 唯一性约束（UNIQUE)\n\n唯一性约束可作用在单列或多列上，对于这些列或列组合，唯一性约束保证每一行的唯一性。\nUNIQUE需要注意：\n1.  对于UNIQUE约束来讲，索引是必须的。如果不存在，就自动创建一个（UNIQUE的唯一性本质上是通过索引来保证的）\n2.  UNIQUE允许null值，UNIQUE约束的列可存在多个null。这是因为，Unique唯一性通过btree索引来实现，而btree索引中不包含null。当然，这也造成了在where语句中用null值进行过滤会造成全表扫描。\n\n添加唯一约束\n>SQL> alter table emp add constraint emp_code_uq unique(code);\n\n### 非空约束（NOT NULL)\n\n非空约束作用的列也叫强制列。顾名思义，强制键列中必须有值，当然建表时候若使用default关键字指定了默认值，则可不输入。\n\n添加非空约束，语法较特别\n>SQL> alter table emp modify ename not null;\n\n### 外键约束（FOREIGN KEY）\n\n　　外键约束定义在具有父子关系的子表中，外键约束使得子表中的列对应父表的主键列，用以维护数据库的完整性。不过出于性能和后期的业务系统的扩展的考虑，很多时候，外键约束仅出现在数据库的设计中，实际会放在业务程序中进行处理。外键约束注意以下几点：\n  \n1. 外键约束的子表中的列和对应父表中的列数据类型必须相同，列名可以不同\n2. 对应的父表列必须存在主键约束（PRIMARY KEY）或唯一约束（UNIQUE）\n3. 外键约束列允许NULL值，对应的行就成了孤行了\n\n　　其实很多时候不使用外键，很多人认为会让删除操作比较麻烦，比如要删除父表中的某条数据，但某个子表中又有对该条数据的引用，这时就会导致删除失败。我们有两种方式来优化这种场景：\n\n　　第一种方式简单粗暴，删除的时候，级联删除掉子表中的所有匹配行，在创建外键时，通过 on delete cascade 子句指定该外键列可级联删除：\n  \n>SQL> alter table emp add constraint emp_deptno_fk foreign key(deptno) references dept (deptno) on delete cascade;\n\n第二种方式，删除父表中的对应行，会将对应子表中的所有匹配行的外键约束列置为NULL，通过 on delete set null 子句实施：\n\n>SQL> alter table emp add constraint emp_deptno_fk foreign key(deptno) references dept(deptno) on delete set null;\n\n　　实际上，外键约束列和对应的父表列可以在同一张表中，常见的就是表的业务逻辑含义是一棵树，最简单的例子如下（id为主键id，fid为父id，fid存储对id的引用），这种结构的表根据业务要求可通过Oracle的递归查询来获取这种层级关系\n  \n  ![](http://localhost:8081/static/userImage/2018/12/11/7d820bdb-a8b1-49b6-9d17-153c564ea3cc.png)\n  \n ### 检查约束（CHECK)\n \n 检查约束可用来实施一些简单的规则，比如列值必须在某个范围内。检查的规则必须是一个结果为true或false 的表达式，比如：\n \n >SQL> alter table emp add constraint emp_sex_ck check(sex in(\'男\',\'女\'));\n \n ## 约束状态\n \n　　很多时候由于业务需要，比如我们有大量的历史数据，需要和现有数据合并，当前表存在数据库约束（如非空约束），而这些历史数据又包含违背非空约束的数据行，为了避免导入时由于违反约束而导入失败，我们通过调整约束状态来达到目的。\n  \n  数据库约束有两类状态\n  \n**启用/禁用**（*enable/disable*）：是否对新变更的数据启用约束验证\n\n**验证/非验证** (*validate/novalidate*) ：是否对表中已客观存在的数据进行约束验证\n\n这两类四种状态从语法角度讲可以随意组合，默认是 *enable validate*\n\n下面我们来看着四类组合会分别出现什么样的效果：\n\n- *enable validate* : 默认的约束组合状态，无法添加违反约束的数据行，数据表中也不能存在违反约束的数据行；\n- *enable novalidate* : 无法添加违反约束的数据行，但对已存在的违反约束的数据行不做验证；\n- *disable validate* : 可以添加违反约束的数据行，但对已存在的违反约束的数据行会做约束验证（从描述中可以看出来，这本来就是一种相互矛盾的约束组合，只不过是语法上支持这种组合罢了，造成的结果就是会导致DML失败）\n- *disable novalidate* : 可以添加违法约束的数据行，对已存在的违反约束的数据行也不做验证。\n\n拿上面的例子来说，我们需要上传大量违反非空约束的历史数据（从业务角度讲这些数据不会造成系统功能异常），可以临时将约束状态转为 disable novalidate，以保证这些不合要求的数据导入表中\n>SQL> alter table emp modify constraint emp_ename_nn disable novalidate;\n\n在数据导入完成之后，我们再将约束状态转为enable novalidate 以确保之后添加的数据不会再违反约束\n>SQL> alter table emp modify constraint emp_ename_nn enable novalidate;\n\n## 总结\n\n　　本文介绍了数据库中的五类约束，也提到了数据库约束的四种状态组合，当你由于业务需求或是系统扩展，在一个约束严苛的系统中由于约束限制频繁操作失败的时候，不同组合的约束状态或许能给你另一种处理方案。谢谢支持。');
INSERT INTO `blog_content` VALUES (31, '　　下面将介绍对象的序列化——一种将对象转成字节方便传送到别处或存储在硬盘上，并且再从转化成的字节重构对象的机制。\n\n　　序列化是分布式管理必备的工具，分布式处理中将对象从一个虚拟传到另一个虚拟机。序列化也被用于故障转移和负载均衡方面，序列化对象可以从一个服务器移到另一个服务器。如果你开发过服务器端软件，就会经常需要序列化。下面介绍如何序列化。(摘自 《Core Java》)\n  \n  ## 一、简单的一个例子\n  \n  Person.java\n  \n  ```java\nimport java.io.Serializable;\n\npublic class Person implements Serializable {\n    private String name;\n    private int age;\n    private String sex;\n    public Person(String name, int age, String sex) {\n        this.name = name;\n        this.age = age;\n        this.sex = sex;\n    }\n    @Override\n    public String toString() {\n        return \"Person{\" +\n                \"name=\'\" + name + \'\\\'\' +\n                \", age=\" + age +\n                \", sex=\'\" + sex + \'\\\'\' +\n                \'}\';\n    }\n}\n  ```\n  \n  TestObjSerializeAndDeserialize.java\n  \n  ```java\nimport java.io.*;\n\npublic class TestObjSerializeAndDeserialize {\n    public static void main(String[] args) throws Exception {\n        //1、序列化Person对象\n        SerializePerson();\n        //2、反序列Person对象\n        Person p = DeserializePerson();\n        System.out.println(p);\n    }\n    /**\n     * 序列化\n     * @throws FileNotFoundException\n     * @throws IOException\n     */\n    private static void SerializePerson() throws FileNotFoundException, IOException {\n        Person person = new Person(\"言曌\",18,\"男\");\n        // ObjectOutputStream 对象输出流，将Person对象存储到指定路径下的Person.txt文件中，完成对Person对象的序列化操作\n        ObjectOutputStream oo = new ObjectOutputStream(new FileOutputStream(new File(\"/Users/liuyanzhao/Desktop/temp/Person.txt\")));\n        oo.writeObject(person);\n        System.out.println(\"Person对象序列化成功！\");\n        oo.close();\n    }\n    /**\n     * 反序列化\n     * @return\n     * @throws Exception\n     * @throws IOException\n     */\n    private static Person DeserializePerson() throws Exception, IOException {\n        ObjectInputStream ois = new ObjectInputStream(new FileInputStream(new File(\"/Users/liuyanzhao/Desktop/temp/Person.txt\")));\n        Person person = (Person) ois.readObject();\n        System.out.println(\"Person对象反序列化成功！\");\n        return person;\n    }\n}\n  ```\n  \n  1、我们可以先注释掉 main 方法里的反序列化的那两行代码，先执行序列化。然后就可以在指定目录，看到一个刚才创建的 Person.txt 文件。\n  使用 Sublime 打开以下\n  \n  >   aced 0005 7372 0006 5065 7273 6f6e 6299\no  e8ea 3077 30c4 0200 0349 0003 6167 654c\no  0004 6e61 6d65 7400 124c 6a61 7661 2f6c\no  616e 672f 5374 7269 6e67 3b4c 0003 7365\no  7871 007e 0001 7870 0000 0012 7400 06e8\no  a880 e69b 8c74 0003 e794 b7\n一堆十六进制编码。\n\n2、然后注释掉序列化对象部分，运行反序列化部分。\n运行效果图如下\n![](http://localhost:8081/static/userImage/2018/12/11/97314255-f173-4891-b781-615be6434df1.png)\n\n## 二、为什么要手动设置 serialVersionUID\n\n通常我们有时候在 Person 类里不写\n\n>   private static final long serialVersionUID = 1L;\no\n也能正常序列化和反序列化。\n\n因为系统会自带帮我们创建一个 serialVersionUID。\n\n下面测试一个例子，不设置 serialVersionUID ，当对象信息改变的时候，会出现什么状况。\n\n \n\n1、先把序列化的那行注释掉，不进行序列化操作。使用刚才生成的 Person.txt\n\n2、在 Person 里添加一个属性 phone\n\n3、运行反序列化，会报一个异常\n\n> Exception in thread \"main\" java.io.InvalidClassException: Person; local class incompatible: stream classdesc serialVersionUID = 899743677678844260, local class serialVersionUID = -2823344428596659768\nat java.io.ObjectStreamClass.initNonProxy(ObjectStreamClass.java:616)\nat java.io.ObjectInputStream.readNonProxyDesc(ObjectInputStream.java:1843)\nat java.io.ObjectInputStream.readClassDesc(ObjectInputStream.java:1713)\nat java.io.ObjectInputStream.readOrdinaryObject(ObjectInputStream.java:2000)\nat java.io.ObjectInputStream.readObject0(ObjectInputStream.java:1535)\nat java.io.ObjectInputStream.readObject(ObjectInputStream.java:422)\nat TestObjSerializeAndDeserialize.DeserializePerson(TestObjSerializeAndDeserialize.java:43)\nat TestObjSerializeAndDeserialize.main(TestObjSerializeAndDeserialize.java:15)\n\n因为在序列化的时候，将对象写入文件的时候，会写入类名和所有实例变量的名称和值。\n\n其中 serialVersionUID 因为没有设置默认值，系统会自动根据哈希值生成一个。如果类的实现发生改变，那么 serialVersionUID 也会发生改变。\n\n \n\n相反，如果我们在序列化之前加上\n\n>private static final long serialVersioLnUID = 1L;\n\n \n\n然后序列化，然后给 Person 类加上一个 phone 字段。\n\n这时候就不会报异常了。\n\n![](http://localhost:8081/static/userImage/2018/12/11/0239be42-3cd8-47be-8eb5-7c3355ca26e3.png)\n\n至于 serialVersioLnUID 等于几并不重要，但是该属性的修饰和类型必须为 final long。\n\n## 三、使用 transient 标记不需要序列化的字段\n\n有些实例变量是不需要序列化的——例如当一个对象保留缓存值的时候，一般也不需要序列化该缓存值，重新计算缓存值而不是存储缓存值可能更好。\n\n为了实现某些实例变量不序列化，简单的方法就是给这个变量添加一个 transient 修饰符，打过 transient 标记的字段在序列化的时候就会背忽略。\n\nPerson.java\n\n```java\nimport java.io.Serializable;\n\npublic class Person implements Serializable {\n    private static final long serialVersioLnUID = 1L;\n    private String name;\n    private transient int age;\n    private  String sex;\n    private transient String phone;\n    public Person(String name, int age, String sex, String phone) {\n        this.name = name;\n        this.age = age;\n        this.sex = sex;\n        this.phone = phone;\n    }\n    @Override\n    public String toString() {\n        return \"Person{\" +\n                \"name=\'\" + name + \'\\\'\' +\n                \", age=\" + age +\n                \", sex=\'\" + sex + \'\\\'\' +\n                \", phone=\'\" + phone + \'\\\'\' +\n                \'}\';\n    }\n}\n```\n\n进行序列化和反序列化，效果图如下\n\n![14.png](http://localhost/api/upload/2019/07/23/ad9342d0-363c-4c26-8f66-cd14466c6614.png)\n\n其中 age 和 phone 是没有被序列化的，所有反序列化的时候也是没有值的。因为 age 是 int 类型，默认值是 0，而 phone 是 String 类型的，默认是 null。\n\n>  参考：《Core Java for the Impatient》');
INSERT INTO `blog_content` VALUES (32, '# 背景\n\n在给邮件发送 URL 链接找回密码时，会发送一个链接，像这样\n\n`http://localhost:8080/resetpass?sid=c1b55b980db4eb74a4264a92d53cd953&account=saysky`\n\n验证原理就是，当用户点击链接，然后请求 控制器里的 resetpass 方法，获得 sid(密钥) 和 account(用户名) 两个参数。根据用户名去数据库中的 “邮件找回密码” 表(mail_retrieve)里寻找记录，获得 mailRetrieve 对象，然后比较 参数中的 sid 和 mailRetrieve.getSid() 即可，当然也可以加一个outtimes 超时时间 字段。\n\n如上链接，sid 是经过 MD5 加密，并且无需解密，只需要比较参数dis和数据库sid是否相等，而account 用户名一定要传过去，目前是直接明文显示，感觉不是特别好，所以这里需要给 accout 也加密一下比较好。然后在 控制器里接受参数的时候，然后在解密即可。\n\n目标是，无需太复杂，肉眼无法识别即可，但求效率高。\n# BASE64 加密解码\n```java\npackage com.liuyanzhao.chuyun.util;\nimport sun.misc.BASE64Decoder;\nimport sun.misc.BASE64Encoder;\nimport java.io.UnsupportedEncodingException;\n/**\n * @author 言曌\n * @date 2018/2/24 上午11:45\n */\npublic class Base64Util {\n    /**\n     * 加密\n     * @param str\n     * @return\n     */\n    @SuppressWarnings(\"restriction\")\n    public static String encode(String str) {\n        byte[] b = null;\n        String s = null;\n        try {\n            b = str.getBytes(\"utf-8\");\n        } catch (UnsupportedEncodingException e) {\n            e.printStackTrace();\n        }\n        if (b != null) {\n            s = new BASE64Encoder().encode(b);\n        }\n        return s;\n    }\n    /**\n     * 解密\n     * @param s\n     * @return\n     */\n    @SuppressWarnings(\"restriction\")\n    public static String decode(String s) {\n        byte[] b = null;\n        String result = null;\n        if (s != null) {\n            BASE64Decoder decoder = new BASE64Decoder();\n            try {\n                b = decoder.decodeBuffer(s);\n                result = new String(b, \"utf-8\");\n            } catch (Exception e) {\n                e.printStackTrace();\n            }\n        }\n        return result;\n    }\n    public static void main(String args[]) {\n        Long startTime = System.currentTimeMillis();\n        String rawString = \"loveluoqi\";\n        String encodedString = encode(rawString);\n        String decodedString = decode(encodedString);\n        System.out.println(rawString);\n        System.out.println(encodedString);\n        System.out.println(decodedString);\n        Long endTime = System.currentTimeMillis();\n        System.out.println(\"总共耗时毫秒数：\" + (endTime - startTime));\n    }\n}\n```\n运行结果如下\n![15.png](http://localhost/api/upload/2019/07/23/8bbbd84e-bf9a-4e1a-b23b-95d65e1aae04.png)');

-- ----------------------------
-- Table structure for carousel
-- ----------------------------
DROP TABLE IF EXISTS `carousel`;
CREATE TABLE `carousel`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片',
  `image_order` int(10) NOT NULL COMMENT '顺序',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of carousel
-- ----------------------------
INSERT INTO `carousel` VALUES (1, 'http://localhost/api/upload/2019/07/23/87b17980-a303-4782-849a-f9a72ec1d68a.jpg', 1, '');
INSERT INTO `carousel` VALUES (3, 'http://localhost/api/upload/2019/07/23/980c4aa9-34c9-4e5b-b1c4-b2a98b8c8601.jpg', 3, '');
INSERT INTO `carousel` VALUES (4, 'http://localhost/api/upload/2019/07/23/6077ec99-5932-4ae7-a66e-919f179129ff.jpg', 1, '');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `blog_id` int(11) UNSIGNED NOT NULL COMMENT '对应的博客',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `comment_date` datetime NOT NULL COMMENT '评论日期',
  `reader_id` int(10) UNSIGNED NOT NULL COMMENT '读者/评论者',
  `reply_comment_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '回复的评论，空表示评论博客',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_ibfk_1`(`blog_id`) USING BTREE,
  INDEX `reader_id`(`reader_id`) USING BTREE,
  INDEX `reply_comment_id`(`reply_comment_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`reader_id`) REFERENCES `reader` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`reply_comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (52, 20, '测试评论', '2019-07-09 13:12:32', 87, NULL);
INSERT INTO `comment` VALUES (53, 20, '分:flushed:', '2019-07-21 10:53:03', 92, NULL);
INSERT INTO `comment` VALUES (56, 20, '@是兄弟就来砍我: 磨刀石', '2019-07-22 11:44:57', 93, NULL);
INSERT INTO `comment` VALUES (57, 20, '@馒头: :blush::anguished:', '2019-07-22 11:48:34', 94, 52);
INSERT INTO `comment` VALUES (58, 20, '分纷纷:satisfied:', '2019-07-22 12:11:54', 95, NULL);
INSERT INTO `comment` VALUES (59, 20, '@刷新测试: 滴滴嘟嘟', '2019-07-22 14:25:58', 96, 58);
INSERT INTO `comment` VALUES (62, 20, '@嘎嘎嘎: +1', '2019-07-22 15:55:38', 99, 59);
INSERT INTO `comment` VALUES (63, 1, ':laughing:', '2019-07-22 15:56:50', 100, NULL);
INSERT INTO `comment` VALUES (64, 1, '@狂笑: :smile::sleeping:', '2019-07-22 15:57:03', 101, 63);
INSERT INTO `comment` VALUES (65, 1, '@狂笑: :smile::sleeping:', '2019-07-22 15:57:29', 102, 63);
INSERT INTO `comment` VALUES (66, 1, '@狂笑: ', '2019-07-22 15:58:15', 103, 65);
INSERT INTO `comment` VALUES (78, 20, ':kissing_heart:', '2019-07-22 16:35:03', 115, NULL);
INSERT INTO `comment` VALUES (87, 20, '嘎嘎嘎', '2019-07-22 17:04:58', 124, NULL);
INSERT INTO `comment` VALUES (88, 20, 'ggg', '2019-07-22 17:06:46', 125, NULL);
INSERT INTO `comment` VALUES (89, 20, '斤斤计较', '2019-07-22 17:09:46', 126, NULL);
INSERT INTO `comment` VALUES (90, 20, '灌灌灌灌', '2019-07-22 17:10:33', 127, NULL);
INSERT INTO `comment` VALUES (93, 20, 'cookie', '2019-07-22 19:08:08', 130, NULL);
INSERT INTO `comment` VALUES (94, 32, ':sweet_potato:', '2019-07-23 10:53:05', 131, NULL);
INSERT INTO `comment` VALUES (95, 10, ':laughing:评论测试:smile:', '2019-07-23 14:19:23', 132, NULL);
INSERT INTO `comment` VALUES (96, 10, '@白给: 回复测试', '2019-07-23 14:20:02', 133, 95);
INSERT INTO `comment` VALUES (97, 1, '前排:trollface:', '2019-07-23 15:47:28', 134, NULL);
INSERT INTO `comment` VALUES (98, 1, ':smile:', '2019-07-23 16:24:29', 135, NULL);
INSERT INTO `comment` VALUES (99, 1, ':grin:', '2019-07-25 11:15:49', 136, NULL);

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `link_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接名称',
  `link_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `link_order` int(11) NOT NULL COMMENT '链接次序（小的在前）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, 'iconfont', 'http://www.iconfont.cn/', 4);
INSERT INTO `link` VALUES (2, 'github', 'https://github.com/', 3);
INSERT INTO `link` VALUES (4, 'daily-read', 'http://git.afkbrb.top/daily-read', 1);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '项目地址',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目图片',
  `project_order` int(10) UNSIGNED NOT NULL COMMENT '项目顺序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, '每日一读', 'http://git.afkbrb.top/daily-read', 'http://localhost/api/upload/2019/07/23/18b01c93-36c6-45e3-b1e0-c59ac007426b.jpg', 1);
INSERT INTO `project` VALUES (2, 'github-avatar-generator', 'https://github.com/afkbrb/github-avatar-generator', 'http://localhost/api/upload/2019/07/23/b8cf6146-54e4-49d2-9516-6b941632dd7e.jpg', 2);

-- ----------------------------
-- Table structure for reader
-- ----------------------------
DROP TABLE IF EXISTS `reader`;
CREATE TABLE `reader`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'ip地址',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `inform` int(1) NOT NULL COMMENT '收到回复时是否接收邮件',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reader
-- ----------------------------
INSERT INTO `reader` VALUES (87, '馒头', '0:0:0:0:0:0:0:1', 'http://localhost/api/upload/2019/07/09/496acea2-d545-4230-b7cb-819327bdf1a5.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (88, '西瓜', '0:0:0:0:0:0:0:1', 'http://localhost/api/upload/2019/07/09/a091e2b9-524c-49e7-b755-82354b3f37a9.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (89, '椰汁糕', '0:0:0:0:0:0:0:1', 'http://localhost/api/upload/2019/07/09/2a3da3b9-3ab9-4835-a142-f9bc1c13a9b4.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (90, '路人', '0:0:0:0:0:0:0:1', 'http://localhost/api/upload/2019/07/09/38904941-66d5-41cf-aab3-0a76a0e552e7.jpg', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (91, '上传更新了', '0:0:0:0:0:0:0:1', 'http://localhost/api/upload/2019/07/09/634d5662-af12-4996-aa90-231e60920df9.jpg', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (92, '哈哈哈哈', '127.0.0.1', 'http://localhost/api/upload/2019/07/09/634d5662-af12-4996-aa90-231e60920df9.jpg', '', 1);
INSERT INTO `reader` VALUES (93, '渣渣辉', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/ab2e88b4-db7d-477f-9084-c5afab24a091.jpg', '', 1);
INSERT INTO `reader` VALUES (94, 'GK', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/6ce86e2d-8c99-406f-a707-18fa9b871e97.jpg', ' 2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (95, '刷新测试', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/c91a296b-a759-4846-9b52-74821085a489.jpg', '', 1);
INSERT INTO `reader` VALUES (96, '嘎嘎嘎', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/7e409888-8b52-4a63-8079-1d724b822243.png', '', 1);
INSERT INTO `reader` VALUES (97, '哈哈哈', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/b7509925-25cb-49c2-ba5b-c39c055673aa.png', '', 1);
INSERT INTO `reader` VALUES (98, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', NULL, 1);
INSERT INTO `reader` VALUES (99, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (100, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (101, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (102, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (103, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (104, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (105, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (106, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (107, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (108, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/29dfba31-c795-4ae6-938f-a33aca3918cf.png', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (109, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (110, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (111, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (112, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (113, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (114, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (115, '狂笑', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (116, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (117, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (118, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (119, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (120, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (121, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (122, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (123, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (124, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (125, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (126, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (127, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (128, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '2428391347@qq.com', 1);
INSERT INTO `reader` VALUES (129, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/4050dcc7-9885-45c1-9b5d-689010111545.gif', '', 1);
INSERT INTO `reader` VALUES (130, 'Cookie测试', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/d70ac26b-4023-495e-b253-5209444cccd1.jpg', NULL, 1);
INSERT INTO `reader` VALUES (131, 'Cookie测试', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/d70ac26b-4023-495e-b253-5209444cccd1.jpg', NULL, 1);
INSERT INTO `reader` VALUES (132, '白给', '127.0.0.1', 'http://localhost/api/upload/2019/07/22/d70ac26b-4023-495e-b253-5209444cccd1.jpg', NULL, 1);
INSERT INTO `reader` VALUES (133, '磨刀石', '127.0.0.1', 'http://localhost/api/upload/2019/07/23/4ef03c80-f50c-413c-8c82-684f45d7f616.jpg', NULL, 1);
INSERT INTO `reader` VALUES (134, 'Tony', '127.0.0.1', 'http://localhost/api/upload/2019/07/23/95437120-1867-4409-bb66-c424b5cf405e.jpg', NULL, 1);
INSERT INTO `reader` VALUES (135, 'Tony', '127.0.0.1', 'http://localhost/api/upload/2019/07/23/95437120-1867-4409-bb66-c424b5cf405e.jpg', NULL, 1);
INSERT INTO `reader` VALUES (136, 'Tony', '127.0.0.1', 'http://localhost/api/upload/2019/07/23/f945ea9c-7168-4790-9a60-4353fc452899.jpg', NULL, 1);

-- ----------------------------
-- Table structure for tag_name
-- ----------------------------
DROP TABLE IF EXISTS `tag_name`;
CREATE TABLE `tag_name`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tag_name
-- ----------------------------
INSERT INTO `tag_name` VALUES (1, 'Java');
INSERT INTO `tag_name` VALUES (2, 'Spring');
INSERT INTO `tag_name` VALUES (4, 'JS');
INSERT INTO `tag_name` VALUES (5, 'HMTL');
INSERT INTO `tag_name` VALUES (6, 'Vue');
INSERT INTO `tag_name` VALUES (7, '数据库');
INSERT INTO `tag_name` VALUES (8, 'Linux');
INSERT INTO `tag_name` VALUES (9, '数据结构');
INSERT INTO `tag_name` VALUES (10, '算法');
INSERT INTO `tag_name` VALUES (11, '项目');
INSERT INTO `tag_name` VALUES (12, '笔记');
INSERT INTO `tag_name` VALUES (13, '其他');
INSERT INTO `tag_name` VALUES (14, 'CSS');

-- ----------------------------
-- Table structure for type_name
-- ----------------------------
DROP TABLE IF EXISTS `type_name`;
CREATE TABLE `type_name`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type_name
-- ----------------------------
INSERT INTO `type_name` VALUES (1, '原创');
INSERT INTO `type_name` VALUES (2, '转载');
INSERT INTO `type_name` VALUES (3, '翻译');

SET FOREIGN_KEY_CHECKS = 1;
