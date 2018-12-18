package com.micro.cloud.socket;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.Socket;

public class SocketClient {

	public static void main(String[] args) throws Exception {
		FileOutputStream fileOut = new FileOutputStream(
				new File("D://123.txt"));
		fileOut.write(new String("123123").getBytes());
		fileOut.flush();
		fileOut.close();
		// 1、创建客户端Socket，指定服务器地址和端口
		Socket socket = new Socket("192.168.4.1", 5000);
		// 2、获取输出流，向服务器端发送信息
		OutputStream os = socket.getOutputStream();// 字节输出流
		// OutputStreamWriter pw = new OutputStreamWriter(os);// 将输出流包装成打印流

		BufferedReader in = new BufferedReader(
				new InputStreamReader(System.in));
		// while (true) {
		if (socket.isConnected()) {
			if (!socket.isOutputShutdown()) {
				String msg = in.readLine();
				System.out.println("准备发送消息:" + msg);
				os.write(msg.getBytes("UTF-8"));
				// pw.flush();
				System.out.println("发送完消息,等待服务器响应");

				// 3、获取输入流，并读取服务器端的响应信息
				InputStream is = socket.getInputStream();
				BufferedReader br = new BufferedReader(
						new InputStreamReader(is));
				String info = null;
				while ((info = br.readLine()) != null) {
					System.out.println("我是客户端，服务器说：" + info);
				}

				// 4、关闭资源
				br.close();
				is.close();
			}
		}
		// }

		// pw.close();
		// os.close();
		// socket.close();

	}

}
