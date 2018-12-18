package com.micro.cloud.netty.client;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;

import com.micro.cloud.netty.NettyResult;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioSocketChannel;

public class SimpleChatClient {
	public static ConcurrentHashMap<String, NettyResult> result = new ConcurrentHashMap<String, NettyResult>();

	public static void main(String[] args) throws Exception {
		new SimpleChatClient("localhost", 8000).run();
	}

	private final String host;
	private final int port;

	public SimpleChatClient(String host, int port) {
		this.host = host;
		this.port = port;
	}

	public void run() throws Exception {
		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap bootstrap = new Bootstrap().group(group)
					.channel(NioSocketChannel.class)
					.handler(new SimpleChatClientInitializer(
							new NettyClientListener() {

								@Override
								public void channelRead(String msg) {
									System.out.println("服务器返回后回调：" + msg);
									NettyResult nettyResult = result.get(msg);
									nettyResult.setRtnMsg(msg);
									nettyResult.getLatch().countDown();
								}
							}));
			Channel channel = bootstrap.connect(host, port).sync().channel();
			BufferedReader in = new BufferedReader(
					new InputStreamReader(System.in));
			// while (true) {
			//
			// String msg = in.readLine();
			// NettyResult nettyResult = new NettyResult();
			// CountDownLatch latch = new CountDownLatch(1);
			// nettyResult.setLatch(latch);
			// result.put(msg, nettyResult);
			// System.out.println("准备发送消息");
			// channel.writeAndFlush(msg + "\r\n");
			// System.out.println("发送完消息,等待服务器响应");
			// try {
			// latch.await();
			// } catch (InterruptedException e) {
			// e.printStackTrace();
			// }
			// System.out.println("等待结束，继续执行");
			// }

			for (int i = 0; i < 10; i++) {
				sendMsg(channel, (i + 1) + "");
			}
			String msg = in.readLine();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			group.shutdownGracefully();
		}

	}

	public void sendMsg(Channel channel, String msg) {
		new Thread(new Runnable() {

			@Override
			public void run() {
				NettyResult nettyResult = new NettyResult();
				CountDownLatch latch = new CountDownLatch(1);
				nettyResult.setLatch(latch);
				result.put(msg, nettyResult);
				System.out.println("准备发送消息:" + msg);
				channel.writeAndFlush(msg + "\r\n");
				System.out.println("发送完消息,等待服务器响应");
				try {
					latch.await();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				System.out.println(
						msg + ":等待结束，服务器返回结果：" + result.get(msg).getRtnMsg());
			}
		}).start();
	}

}
