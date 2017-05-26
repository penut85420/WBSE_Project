package yelpAPI;

import java.util.*;

import YelpObject.YelpBusiness;
import http.Conn;

public class Search {
	public static final String searchUrl = "https://api.yelp.com/v3/businesses/search?";
	
	public static String getBusinesses(String term, String location) {
		try {
			String s = Conn.get(String.format("%sterm=%s&location=%s", searchUrl, term, location));
			return s;
		} catch (Exception e) { e.printStackTrace(); }
		return null;
	}
	
	public static void main(String[] args) throws Exception {
		ArrayList<YelpBusiness> barr = YelpBusiness.getBusinessList(getBusinesses("food", "taiwan"));
		for (YelpBusiness b: barr)
			System.out.println(b.getDisplayPhone());
	}
}
