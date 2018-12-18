package com.micro.cloud.config;

import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.support.config.FastJsonConfig;
import com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter4;

/**
 * 
 * @Description spring-web配置
 * @author gsh
 * @date 2017年12月5日 上午10:46:48
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/login").setViewName("/sys/login");
		registry.addViewController("/index").setViewName("/sys/index");
	}

	/**
	 * 增加拦截器
	 * 
	 * @param registry
	 */
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// registry.addInterceptor(new
		// LoginInterceptor()).addPathPatterns("/**")
		// .excludePathPatterns("/", "/sys/login");
		// registry.addInterceptor(new PermissionInterceptor())
		// .addPathPatterns("/**")
		// .excludePathPatterns("/", "/index", "/sys/login");
		// super.addInterceptors(registry);
	}

	/**
	 * 过滤静态资源，使其能够直接访问 默认会过滤的目录:src/main/resources
	 * 
	 * @param registry
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		// registry.addResourceHandler("/view/**").addResourceLocations("/view/");
		// super.addResourceHandlers(registry);
	}

	@Override
	public void configureMessageConverters(
			List<HttpMessageConverter<?>> converters) {
		FastJsonHttpMessageConverter4 converter = new FastJsonHttpMessageConverter4();
		FastJsonConfig fastJsonConfig = new FastJsonConfig();
		fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat,
				SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullListAsEmpty,
				SerializerFeature.WriteNullStringAsEmpty,
				SerializerFeature.WriteNullBooleanAsFalse);
		fastJsonConfig.setDateFormat("yyyy-MM-dd HH:mm:ss");
		converter.setFastJsonConfig(fastJsonConfig);
		converters.add(converter);
	}
}
