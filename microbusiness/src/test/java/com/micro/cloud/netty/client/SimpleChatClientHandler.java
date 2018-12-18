package com.micro.cloud.netty.client;

import com.micro.cloud.netty.NettyResult;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;

public class SimpleChatClientHandler
		extends SimpleChannelInboundHandler<String> {

	private NettyClientListener nettyClientListener;

	public SimpleChatClientHandler(NettyClientListener nettyClientListener) {
		this.nettyClientListener = nettyClientListener;
	}

	@Override
	protected void channelRead0(ChannelHandlerContext ctx, String msg)
			throws Exception {
		System.out.println("接收服务端返回：" + msg);
		Thread.sleep(5000);
		NettyResult nettyResult = SimpleChatClient.result.get(msg);
		if (nettyResult != null) {
			nettyClientListener.channelRead(msg);
		}

	}
}
