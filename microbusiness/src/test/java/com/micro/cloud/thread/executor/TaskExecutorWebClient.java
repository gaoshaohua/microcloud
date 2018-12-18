package com.micro.cloud.thread.executor;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class TaskExecutorWebClient {

	private final static String HOST = "192.168.0.104";
	private final static int PORT = 8000;

	public static void main(String[] args)
			throws UnknownHostException, IOException, InterruptedException {
		for (int i = 0; i < 1; i++) {
			Socket socket = new Socket(HOST, PORT);
			// 2、获取输出流，向服务器端发送信息
			OutputStream os = socket.getOutputStream();// 字节输出流
			PrintWriter pw = new PrintWriter(os);// 将输出流包装成打印流
			pw.write("我是客户端，编号：" + i);
			pw.flush();
			socket.shutdownOutput();
			// 3、获取输入流，并读取服务器端的响应信息
			InputStream is = socket.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is));
			String info = null;
			while ((info = br.readLine()) != null) {
				System.out.println("我是客户端，服务器说：" + info);
			}

			// 4、关闭资源
			br.close();
			is.close();
			pw.close();
			os.close();
			socket.close();
			// Thread.sleep(10 * 1000);
		}

	}

}
