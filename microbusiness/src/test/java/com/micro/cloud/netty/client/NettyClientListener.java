package com.micro.cloud.netty.client;

public interface NettyClientListener {

	void channelRead(String msg);
}
