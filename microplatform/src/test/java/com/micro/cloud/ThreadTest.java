package com.micro.cloud;

public class ThreadTest {

	public static void main(String[] args) {
		ThreadTest test = new ThreadTest();
		for (int i = 0; i < 10; i++) {
			new Thread(new Runnable() {
				@Override
				public void run() {
					Integer a = new Integer(1);
					test.test(a);
				}
			}).start();
		}
	}

	public void test(Integer a) {
		System.out.println(a.hashCode());
		synchronized (a) {
			System.out.println("进入同步代码块:" + a);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(Thread.currentThread().getName() + ":" + a);
		}

	}
}
