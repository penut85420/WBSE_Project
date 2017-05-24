package com;

import java.io.*;
import java.net.*;

import org.json.JSONObject;

public class YelpAPI {

   public static String getHTML() throws Exception {
      StringBuilder result = new StringBuilder();
      URL url = new URL("https://api.yelp.com/v3/businesses/search?term=starbucks&latitude=37.786882&longitude=-122.399972");
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestProperty("Authorization", "Bearer NjTkv9DsFSTgRo3rPfQ-ID1llKXHOapEe6iGV7TDyDRoS-H0aZkwmWKcPfkF57PH83LfNIa4KlMqTPdW9aL_CJNXRWpC9Sk6Id79weuILaG53UumNIW_RxmkuhkkWXYx");
      conn.setRequestMethod("GET");
      BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
      String line;
      while ((line = rd.readLine()) != null) {
         result.append(line);
      }
      rd.close();
      return result.toString();
   }

   public static void main(String[] args) throws Exception {
     String s = getHTML();
     System.out.println(s);
     JSONObject j = new JSONObject(s);
     Object jsonOb = j.getJSONArray("businesses").getJSONObject(1).get("image_url");
     System.out.println(jsonOb);
   }
}