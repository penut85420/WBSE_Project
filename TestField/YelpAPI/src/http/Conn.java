package http;

import java.io.*;
import java.net.*;

public class Conn {
	public static final String Authorization = "Bearer NjTkv9DsFSTgRo3rPfQ-ID1llKXHOapEe6iGV7TDyDRoS-H0aZkwmWKcPfkF57PH83LfNIa4KlMqTPdW9aL_CJNXRWpC9Sk6Id79weuILaG53UumNIW_RxmkuhkkWXYx";
	
	public static String get(String httpUrl) throws Exception {
		URL url = new URL(httpUrl);
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
  
		conn.setRequestProperty("Authorization", Authorization);
		conn.setRequestProperty("Accept-Charset", "UTF-8"); 
		conn.setRequestMethod("GET");
		  
		StringBuilder result = new StringBuilder();
		String line;
		BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		while ((line = rd.readLine()) != null)
		   result.append(line);
		rd.close();
		
		return result.toString();
	}
}
