package com.github.afkbrb.lightblogback.configurer;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * 允许跨域请求
 */
@Configuration
public class CorsConfigurer {

    @Value("${blog.domain.admin}")
    private String adminDomain;

    @Value("${blog.domain.front}")
    private String frontDomain;

    @Value("${spring.profiles.active}")
    private String ENV;//当前激活的配置文件

    private CorsConfiguration buildConfigPublic() {
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.addAllowedOrigin("*"); // 需要认证时，不能允许任何域名使用，需要指定
        corsConfiguration.addAllowedHeader("*"); // 允许任何头
        corsConfiguration.addAllowedMethod("*"); // 允许任何方法（post、get等）
        return corsConfiguration;
    }

    private CorsConfiguration buildConfig() {
        CorsConfiguration corsConfiguration = new CorsConfiguration();
        corsConfiguration.setAllowCredentials(true); // 允许session
        corsConfiguration.addAllowedOrigin(adminDomain); // 需要认证时，不能允许任何域名使用，需要指定
        corsConfiguration.addAllowedOrigin(frontDomain);
        corsConfiguration.addAllowedHeader("*"); // 允许任何头
        corsConfiguration.addAllowedMethod("*"); // 允许任何方法（post、get等）
        return corsConfiguration;
    }

    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", buildConfig()); // 对接口配置跨域设置
        source.registerCorsConfiguration("/upload", buildConfigPublic());
        return new CorsFilter(source);
    }
}
