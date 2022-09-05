package com.yurim.www.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcContextConfiguration implements WebMvcConfigurer {

    @Value("${spring.profiles.active}")
    private String mode;

    @Value("${file.imagePath}")
    private String imagePath;

    @Value("${file.filePath}")
    private String filePath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        WebMvcConfigurer.super.addResourceHandlers(registry);

        if ("prod".equals(mode)) {
            registry.addResourceHandler("/images/**").addResourceLocations("file://" + imagePath);
            registry.addResourceHandler("/fileUpload/**").addResourceLocations("file://" + filePath);
        }
    }
}
