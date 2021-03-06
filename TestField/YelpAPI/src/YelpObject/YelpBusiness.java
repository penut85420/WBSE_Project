package YelpObject;

import java.util.ArrayList;

import org.json.*;

import yelpAPI.YelpSearch;

public class YelpBusiness {
	String mBussinessID, mName, mImageURL, mURL, mPrice, mPhone, mDisplayPhone;
	Double mRating, mLatitude, mLongitude, mDistance;
	Integer mReviewCount;
	Boolean mIsClosed;
	
	ArrayList<String> mCategories;
	YelpLocation mLocation;
	ArrayList<YelpReview> mReview;
	JSONObject mJObject;
	
	public static ArrayList<YelpBusiness> getBusinessList(String s) throws Exception {
		ArrayList<YelpBusiness> businessList = new ArrayList<>();
		JSONObject jObj = new JSONObject(s);
		JSONArray arr = jObj.getJSONArray("businesses");
		
		for (int i = 0; i < arr.length(); i++) {
			YelpBusiness yb = new YelpBusiness();
			JSONObject obj = arr.getJSONObject(i);
			yb.mJObject = obj;
			yb.mBussinessID = obj.getString("id");
			yb.mName = obj.getString("name");
			yb.mImageURL = obj.getString("image_url");
			yb.mIsClosed = obj.getBoolean("is_closed");
			yb.mURL = obj.getString("url");
			yb.mReviewCount = obj.getInt("review_count");
			JSONArray category = obj.getJSONArray("categories");
			yb.mCategories = new ArrayList<>();
			for (int j = 0; j < category.length(); j++)
				yb.mCategories.add(category.getJSONObject(j).getString("title"));
			yb.mRating = obj.getDouble("rating");
			yb.mLatitude = obj.getJSONObject("coordinates").getDouble("latitude");
			yb.mLongitude = obj.getJSONObject("coordinates").getDouble("longitude");
			yb.mPrice = obj.optString("price");
			yb.mLocation = new YelpLocation(obj.getJSONObject("location"));
			yb.mPhone = obj.getString("phone");
			yb.mDisplayPhone = obj.getString("display_phone");
			yb.mDistance = obj.getDouble("distance");
			yb.mReview = YelpReview.getReviewList(YelpSearch.getReview(yb.mBussinessID));
			businessList.add(yb);
		}
		
		return businessList;
	}
	
	public String getBusinessID() { return mBussinessID; }
	public String getName() { return mName; }
	public String getImageURL() { return mImageURL; }
	public Boolean getIsClosed() { return mIsClosed; }
	public Double getRating() { return mRating; }
	public String getURL() { return mURL; }
	public Integer getReviewCount() { return mReviewCount; }
	public ArrayList<String> getCategories() { return mCategories; }
	public Double getLatitude() { return mLatitude; }
	public Double getLongitude() { return mLongitude; }
	public String getPrice() { return mPrice; }
	public YelpLocation getLocation() { return mLocation; }
	public String getPhone() { return mPhone; }
	public String getDisplayPhone() { return mDisplayPhone; }
	public Double getDistance() { return mDistance; }
	public ArrayList<YelpReview> getReview() { return mReview; }

	public String toString() {
		return String.format("ID: %s, Rating: %f", mBussinessID, mRating);
	}
}
