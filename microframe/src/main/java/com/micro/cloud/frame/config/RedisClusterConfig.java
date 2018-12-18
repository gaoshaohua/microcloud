package com.micro.cloud.frame.config;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.cache.CacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisClusterConfiguration;
import org.springframework.data.redis.connection.RedisNode;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;

/**
 * 
 * @Description redis集群配置 必须自己实现RedisClusterConfiguration JedisConnectionFactory
 *              RedisTemplate CacheManager
 * @author gsh
 * @date 2017年10月19日 上午10:33:05
 */
// @Configuration
// @ConfigurationProperties(prefix = "spring.redis.cluster")
public class RedisClusterConfig {

	private List<String> nodes;

	@Bean
	public RedisClusterConfiguration getRedisClusterConfiguration() {

		Set<RedisNode> jedisClusterNodes = new HashSet<RedisNode>();

		for (String node : nodes) {
			String[] ipPort = node.split(":");
			RedisNode redisNode = new RedisNode(ipPort[0],
					Integer.parseInt(ipPort[1]));
			jedisClusterNodes.add(redisNode);
		}
		RedisClusterConfiguration redisClusterConfiguration = new RedisClusterConfiguration();
		redisClusterConfiguration.setClusterNodes(jedisClusterNodes);
		return redisClusterConfiguration;
	}

	@Bean
	public JedisConnectionFactory jedisConnectionFactory() {
		JedisConnectionFactory redisConnectionFactory = new JedisConnectionFactory(
				getRedisClusterConfiguration());
		return redisConnectionFactory;
	}

	@Bean
	public RedisTemplate<String, Object> redisTemplate() {
		RedisTemplate<String, Object> template = new RedisTemplate<String, Object>();
		template.setKeySerializer(new JdkSerializationRedisSerializer());
		template.setHashKeySerializer(new JdkSerializationRedisSerializer());
		template.setHashValueSerializer(new JdkSerializationRedisSerializer());
		template.setValueSerializer(new JdkSerializationRedisSerializer());
		template.setConnectionFactory(jedisConnectionFactory());
		template.afterPropertiesSet();
		return template;
	}

	@Bean
	public CacheManager redisCacheManager() {
		// String[] cacheNames = new String[] { "dicts", "sessions", "user" };
		// RedisCacheManager redisCacheManager = new RedisCacheManager(
		// redisTemplate(), Arrays.asList(cacheNames));

		return RedisCacheManager.create(jedisConnectionFactory());
	}

	@Bean
	public JedisCluster getJedisCluster() {
		Set<HostAndPort> sets = new HashSet<HostAndPort>();
		for (String node : nodes) {
			String[] ipPort = node.split(":");
			HostAndPort hostAndPort = new HostAndPort(ipPort[0],
					Integer.parseInt(ipPort[1]));
			sets.add(hostAndPort);
		}
		JedisCluster jedisCluster = new JedisCluster(sets);
		return jedisCluster;
	}

	public List<String> getNodes() {
		return nodes;
	}

	public void setNodes(List<String> nodes) {
		this.nodes = nodes;
	}

}
