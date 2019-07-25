package com.github.afkbrb.lightblogback;

import com.github.afkbrb.lightblogback.model.dto.BlogDTO;
import com.github.afkbrb.lightblogback.web.admin.AdminBlogController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class LightBlogBackApplicationTests {

    @Autowired
    private AdminBlogController adminBlogController;

    @Test
    public void contextLoads() {
        BlogDTO blogDTO = new BlogDTO();
        blogDTO.setBlogImage("");
        blogDTO.setTag("1,2,3");
        blogDTO.setContent("@Test\n" + "    public void testQueryOrg() throws Exception {\n" + "\n" + "\n" + "        String uri = \"/test/org/query\";\n" + "        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get(uri).accept(MediaType.APPLICATION_JSON))\n" + "                .andReturn();\n" + "        int status = mvcResult.getResponse().getStatus();\n" + "        String content = mvcResult.getResponse().getContentAsString();\n" + "        ResultBody resultBody = (ResultBody)JacksonJsonConverUtil.jsonToBean(content,ResultBody.class);\n" + "        Assert.assertTrue(\"成功\", resultBody.getCode().equals(\"0\"));\n" + "\n" + "\n" + "    }\n" + "--------------------- \n" + "作者：我家小宝_朱朱 \n" + "来源：CSDN \n" + "原文：https://blog.csdn.net/zhuchunyan_aijia/article/details/79430173 \n" + "版权声明：本文为博主原创文章，转载请附上博文链接！");
        blogDTO.setType(1);
        blogDTO.setTitle("测试");
        adminBlogController.add(blogDTO);
    }

}
