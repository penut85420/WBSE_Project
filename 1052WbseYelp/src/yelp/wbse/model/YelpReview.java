package yelp.wbse.model;

import org.json.*;
import java.util.*;

public class YelpReview {
	String mURL, mReview, mUserName, mUserPicURL, mTime;
	Integer mRating;
	
	public static ArrayList<YelpReview> getReviewList(String s) throws Exception {
		ArrayList<YelpReview> reviewList = new ArrayList<>();
		JSONObject obj = new JSONObject(s);
		JSONArray arr = obj.getJSONArray("reviews");
		for (int i = 0; i < arr.length(); i++) {
			YelpReview review = new YelpReview(arr.getJSONObject(i));
			reviewList.add(review);
		}
		return reviewList;
	}
	
	public YelpReview(JSONObject obj) throws Exception {
		mURL = obj.getString("url");
		mReview = obj.getString("text");
		mRating = obj.getInt("rating");
		JSONObject user = obj.getJSONObject("user");
		mUserName = user.getString("name");
		mUserPicURL = user.getString("image_url");
		mTime = obj.getString("time_created");
	}

	public String getURL() { return mURL; }
	public String getReview() { return mReview; }
	public Integer getRating() { return mRating; }
	public String getUserName() { return mUserName; }
	public String getUserPicURL() { return mUserPicURL; }
	public String getTime() { return mTime; }
}
