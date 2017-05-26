package test;

import java.net.*;

public class Test {
   public static void main(String[] args) throws Exception {
	   String s = "н╣кл";
	   
	   System.out.println(URLEncoder.encode(s, "UTF-8"));
   }
}