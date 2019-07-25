package com.github.afkbrb.lightblogback.util;

import com.github.afkbrb.lightblogback.configurer.WebMvcConfigurer;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 * 发送邮件
 * 相关属性需在resource/mail.properties中配置
 */
@Component
public class MailUtil {

    private static final Logger logger;

    // 静态变量不支持直接在值上通过@Value注入
    private static String on;
    private static String protocol;
    private static String host;
    private static String port;
    private static String from;
    private static String password;
    private static String debug;

    static {
        logger = LoggerFactory.getLogger(WebMvcConfigurer.class);
    }

    @Value("${blog.mail.on}")
    public void setOn(String on) {
        MailUtil.on = on;
    }

    @Value("${blog.mail.protocol}")
    public void setProtocol(String protocol) {
        MailUtil.protocol = protocol;
    }

    @Value("${blog.mail.host}")
    public void setHost(String host) {
        MailUtil.host = host;
    }

    @Value("${blog.mail.port}")
    public void setPort(String port) {
        MailUtil.port = port;
    }

    @Value("${blog.mail.from}")
    public void setFrom(String from) {
        MailUtil.from = from;
    }

    @Value("${blog.mail.password}")
    public void setPassword(String password) {
        MailUtil.password = password;
    }

    @Value("${blog.mail.debug}")
    public void setDebug(String debug) {
        MailUtil.debug = debug;
    }

    /**
     * 发送邮件（同步）
     *
     * @param subject 主题
     * @param content 内容
     * @throws MessagingException
     */
    public static void sendMail(String subject, String content, String to) throws MessagingException {

        // 检查是否关闭邮件服务
        if(!"true".equalsIgnoreCase(on)) {
            logger.warn("邮件服务已关闭！");
            return;
        }

        // debug未设置或设置错误，则默认为true
        if (StringUtils.isBlank(debug) || !("true".equals(debug) || "false".equals(debug))) {
            debug = "true";
        }

        Properties properties = new Properties();
        properties.put("mail.transport.protocol", protocol);// 连接协议
        properties.put("mail.smtp.host", host);// 主机名
        properties.put("mail.smtp.port", port);// 端口号
        properties.put("mail.debug", debug);// 设置是否显示debug信息 true 会在控制台显示相关信息
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
        // 得到回话对象
        Session session = Session.getInstance(properties);
        // 获取邮件对象
        Message message = new MimeMessage(session);
        // 设置发件人邮箱地址
        message.setFrom(new InternetAddress(from));
        // 设置收件人邮箱地址
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));//一个收件人
        // 设置邮件标题
        message.setSubject(subject);
        // 设置邮件内容
        message.setText(content);
        // 得到邮差对象
        Transport transport = session.getTransport();
        // 连接自己的邮箱账户
        transport.connect(from, password);// 密码为QQ邮箱开通的stmp服务后得到的客户端授权码
        // 发送邮件
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }

    /**
     * 发送邮件（异步），可用于提高请求响应速度
     *
     * @param subject 主题
     * @param content 内容
     */
    public static void sendMailAsynchronously(String subject, String content, String to) {
        // 检查是否关闭邮件服务
        if(!"true".equalsIgnoreCase(on)) {
            logger.warn("邮件服务已关闭！");
            return;
        }
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    sendMail(subject, content, to);
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

}
