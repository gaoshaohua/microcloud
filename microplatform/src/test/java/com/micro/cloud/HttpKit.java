package com.micro.cloud;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

public class HttpKit {

	public static void main(String[] args) {
		String uri = "http://ssloc.ewidecloud.com:80/saasoc/oc/mobile/sys/login.do";
		useHttpURlConnection(uri);
		useHttpClient(uri);
	}

	public static void useHttpURlConnection(String uri) {
		HttpURLConnection conn = null;
		URL url = null;
		String result = "";
		try {
			url = new URL(uri);
			conn = (HttpURLConnection) url.openConnection();
			conn.setConnectTimeout(10000);
			conn.connect();

			InputStream urlStream = conn.getInputStream();
			BufferedReader reader = new BufferedReader(
					new InputStreamReader(urlStream));
			String s = "";
			while ((s = reader.readLine()) != null) {
				result += s;
			}
			System.out.println(result);
			reader.close();
			urlStream.close();
			conn.disconnect();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void useHttpClient(String uri) {
		HttpClient client = new HttpClient();
		GetMethod method = new GetMethod(uri);
		method.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
				new DefaultHttpMethodRetryHandler(3, false));
		try {
			int statusCode = client.executeMethod(method);

			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("Method failed: " + method.getStatusLine());
			}
			byte[] responseBody = method.getResponseBody();
			System.out.println(new String(responseBody));
		} catch (HttpException e) {
			System.err.println("Fatal protocol violation: " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("Fatal transport error: " + e.getMessage());
			e.printStackTrace();
		} finally {
			method.releaseConnection();
		}
	}
}
