package com.micro.cloud.thread.executor;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

public class TaskExecutorWebServer {

	private final static int THREADNUM = 1000;
	private static ServerSocket serverSocket;

	public static void main(String[] args) throws Exception {
		Executor exec = Executors.newFixedThreadPool(THREADNUM);
		serverSocket = new ServerSocket(8000);
		while (true) {
			try {
				System.out.println("等待创建连接......");
				Socket socket = serverSocket.accept();
				System.out.println("创建连接......");
				Thread task = new Thread(new Runnable() {

					@Override
					public void run() {
						try {
							System.out.println(Thread.currentThread().getId()
									+ "：耗时线程处理......");
							// 4、获取输出流，响应客户端的请求
							OutputStream os = socket.getOutputStream();
							PrintWriter pw = new PrintWriter(os);
							// 3、获取输入流，并读取客户端信息
							InputStream is = socket.getInputStream();
							InputStreamReader isr = new InputStreamReader(is);
							BufferedReader br = new BufferedReader(isr);
							String info = null;
							while ((info = br.readLine()) != null) {
								System.out.println("我是服务器，客户端说：" + info);
								// 应答客户端指令
								pw.write("sunny" + System.lineSeparator());
								pw.flush();
							}
							socket.shutdownInput();
							pw.close();
							os.close();
							br.close();
							isr.close();
							is.close();
							socket.close();
							Thread.sleep(5 * 1000);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				});

				exec.execute(task);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
