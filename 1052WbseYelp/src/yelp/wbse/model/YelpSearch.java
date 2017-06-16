package yelp.wbse.model;

import java.net.URLEncoder;
import java.util.*;

import yelp.wbse.model.Conn;

public class YelpSearch {
	public static final String searchUrl = "https://api.yelp.com/v3/businesses/search?";
	public static final String businessUrl = "https://api.yelp.com/v3/businesses/";
	public static final String reviewsUrl = "https://api.yelp.com/v3/businesses/%s/reviews";

	public static String getBusinesses(YelpParameter y) {
		try {
			return Conn.get(searchUrl + y.getParam());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getBusinesses(String id) {
		try {
			return Conn.get(businessUrl + id);
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
//		YelpParameter y = new YelpParameter();
//		y.setParam("term", "food");
//		y.setParam("location", "taipei");
//
//		ArrayList<YelpBusiness> barr = getBusiness_(y);
//		System.out.println("what");
//		for (YelpBusiness b: barr) {
//			System.out.println(b.getReview().get(0).getReview());
//		}
		
		YelpBusiness bb = new YelpBusiness(getBusinesses("north-india-restaurant-san-francisco"));
		log(bb.mBussinessID.mBusinessID);
	}
	
	private static void log(Object obj) {
		System.out.println(obj.toString());
	}
}
