package kh.petmily;

import kh.petmily.interceptor.AdminCheckInterceptor;
import kh.petmily.interceptor.LoginCheckInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginCheckInterceptor())
                .order(1)
                .addPathPatterns("/**/auth/**", "/**/admin/**")
                .excludePathPatterns("/admin/upload**");

        registry.addInterceptor(new AdminCheckInterceptor())
                .order(2)
                .addPathPatterns("/**/admin/**")
                .excludePathPatterns("/admin/upload**");
    }
}