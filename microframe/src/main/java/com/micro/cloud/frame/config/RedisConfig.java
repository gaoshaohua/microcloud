package com.micro.cloud.frame.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/******
 * 
 * @Description redis单机配置，重新实现redisTemplate/redisCacheManager对象
 *
 *
 *              不配置该类，springboot默认根据application.properties中的配置注入redisTemplate/redisCacheManager
 *              等对象
 * @author gsh
 * @date 2017年10月17日 下午2:59:13
 */
@Configuration
@ConfigurationProperties(prefix = "spring.redis")
public class RedisConfig extends CachingConfigurerSupport {
	/**
	 * redis服务器IP
	 */
	private String host;
	/**
	 * redis服务器端口
	 */
	private int port;
	/**
	 * redis连接密码
	 */
	private String password;
	/**
	 * redis连接超时时间
	 */
	private int timeout;

	@Value("${spring.redis.jedis.pool.max-active}")
	private int maxTotal;

	@Value("${spring.redis.jedis.pool.max-wait}")
	private int maxWait;

	@Bean
	public JedisPoolConfig getRedisConfig() {
		JedisPoolConfig config = new JedisPoolConfig();
		config.setMaxTotal(maxTotal);
		config.setMaxWaitMillis(maxWait);
		return config;
	}

	/**
	 * 重新实现JedisPool
	 * 
	 * @Description
	 * @author gsh
	 * @return
	 */
	@Bean
	public JedisPool getJedisPool() {
		JedisPoolConfig config = getRedisConfig();
		JedisPool jedisPool = new JedisPool(config, host, port, timeout,
				password);
		return jedisPool;
	}

	/**
	 * 重新实现RedisTemplate
	 * 
	 * @Description
	 * @author gsh
	 * @param jedisConnectionFactory
	 * @return
	 */
	@Bean
	public RedisTemplate redisTemplate(
			RedisConnectionFactory connectionFactory) {
		RedisTemplate template = new RedisTemplate();
		template.setKeySerializer(new JdkSerializationRedisSerializer());
		template.setHashKeySerializer(new JdkSerializationRedisSerializer());
		template.setHashValueSerializer(new JdkSerializationRedisSerializer());
		template.setValueSerializer(new JdkSerializationRedisSerializer());
		template.setConnectionFactory(connectionFactory);
		template.afterPropertiesSet();
		return template;
	}

	/**
	 * 重新实现CacheManager
	 * 
	 * @Description
	 * @author gsh
	 * @param redisTemplate
	 * @return
	 */
	@Bean
	public CacheManager redisCacheManager(
			RedisConnectionFactory connectionFactory) {
		// String[] cacheNames = new String[] { "dicts", "sessions", "user" };
		// RedisCacheManager redisCacheManager = new RedisCacheManager(
		// redisTemplate, Arrays.asList(cacheNames));
		return RedisCacheManager.builder(connectionFactory).build();
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getTimeout() {
		return timeout;
	}

	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	public int getMaxTotal() {
		return maxTotal;
	}

	public void setMaxTotal(int maxTotal) {
		this.maxTotal = maxTotal;
	}

}
