package com.micro.cloud.netty;

import java.util.concurrent.CountDownLatch;

public class NettyResult {

	private CountDownLatch latch;

	private String rtnMsg;

	public CountDownLatch getLatch() {
		return latch;
	}

	public void setLatch(CountDownLatch latch) {
		this.latch = latch;
	}

	public String getRtnMsg() {
		return rtnMsg;
	}

	public void setRtnMsg(String rtnMsg) {
		this.rtnMsg = rtnMsg;
	}

}
