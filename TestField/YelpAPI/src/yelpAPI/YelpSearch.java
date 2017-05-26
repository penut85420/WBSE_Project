package yelpAPI;

import java.net.URLEncoder;
import java.util.*;

import YelpObject.YelpBusiness;
import YelpObject.YelpReview;
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

	public static void main(String[] args) throws Exception {
		YelpParameter y = new YelpParameter();
		y.setParam("term", "food");
		y.setParam("location", "taipei");
		y.setParam("limit", "3");
		ArrayList<YelpBusiness> barr = YelpBusiness.getBusinessList(getBusinesses(y));
		for (YelpBusiness b : barr) {
			System.out.println(b.getBusinessID());
			ArrayList<YelpReview> rarr = YelpReview.getReviewList(getReview(b.getBusinessID()));
			for (YelpReview r: rarr)
				System.out.println("µû»ù¡G" + r.getRating() + ", " + r.getReview());
		}
	}
}
