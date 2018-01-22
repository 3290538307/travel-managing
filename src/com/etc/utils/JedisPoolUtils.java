package com.etc.utils;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class JedisPoolUtils {
	private static JedisPool jedisPool=null;
	public static JedisPool getPool(){
		if(jedisPool==null){
			JedisPoolConfig config=new JedisPoolConfig();
			//config.setMaxIdle(50);
			config.setMaxActive(50);
			config.setMaxIdle(5);
			jedisPool=new JedisPool("localhost");
		}
		return jedisPool;
	}
	/**
     * 返还到连接池
     * 
     * @param pool 
     * @param redis
     */
	public static void returnResource(JedisPool pool,Jedis jedis){
		if(jedis!=null){
			pool.returnResource(jedis);
		}
	}
}
