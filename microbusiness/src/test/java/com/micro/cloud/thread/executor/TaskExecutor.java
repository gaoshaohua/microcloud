package com.micro.cloud.thread.executor;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * 线程池测试
 * 
 * @Description
 * @author gsh
 * @date 2018年9月5日 下午4:44:14
 */
public class TaskExecutor {

	static Executor exec = Executors.newFixedThreadPool(100);

	public static void main(String[] args) {
		exec.execute(new Runnable() {

			@Override
			public void run() {
				// TODO Auto-generated method stub

			}
		});
	}

	public void execu(String tenantid) {
		// Lock lock=
	}

	public class TaskThread implements Runnable {

		@Override
		public void run() {
			// TODO Auto-generated method stub

		}
	}
}
