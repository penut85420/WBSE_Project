package yelpAPI;

import java.net.URLEncoder;
import java.util.*;

import YelpObject.*;
import http.Conn;

public class YelpSearch {
	public static final String searchUrl = "https://api.yelp.com/v3/businesses/search?";
	public static final String reviewsUrl = "https://api.yelp.com/v3/businesses/%s/reviews";

	public static String getBusinesses(YelpParameter y) {
		try {
			return Conn.get(searchUrl + y.getParam());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String getReview(String id) {
		try {
			return Conn.get(String.format(reviewsUrl, URLEncoder.encode(id, "UTF-8")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<YelpBusiness> getBusiness_(YelpParameter y) {
		try {
			return YelpBusiness.getBusinessList(getBusinesses(y));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) throws Exception {
		YelpParameter y = new YelpParameter();
		y.setParam("term", "food");
		y.setParam("location", "taipei");

		ArrayList<YelpBusiness> barr = getBusiness_(y);
		System.out.println("what");
		for (YelpBusiness b: barr) {
			System.out.println(b.getReview().get(0).getReview());
		}
	}
}
