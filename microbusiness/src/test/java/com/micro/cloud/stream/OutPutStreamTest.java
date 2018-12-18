package com.micro.cloud.stream;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;

public class OutPutStreamTest {

	public static void main(String[] args) throws Exception {

		File file = new File("d:/1.txt");
		// OutputStream out = new FileOutputStream(file);
		// byte[] bytes = new String("123456高").getBytes();
		// out.write(bytes, 0, bytes.length);
		// out.flush();
		// out.close();

		InputStream in = new FileInputStream(file);
		BufferedReader read = new BufferedReader(new InputStreamReader(in));
		byte[] result = new byte[(int) file.length()];
		String res = null;
		while ((res = read.readLine()) != null)
			System.out.println(read.readLine());
		in.close();
	}

}
