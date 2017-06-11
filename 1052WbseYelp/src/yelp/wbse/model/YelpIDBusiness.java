package yelp.wbse.model;

import java.net.URLEncoder;
import java.util.*;

import org.json.*;

import yelp.wbse.model.YelpBusiness;
import yelp.wbse.model.YelpBusiness.BusinessID;
import yelp.wbse.model.Conn;

public class YelpIDBusiness {
	public static final String searchURL = "https://api.yelp.com/v3/businesses/";
	public static String getbusinesses(String y) {
		try {
			return Conn.get(searchURL + y);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static ArrayList<YelpBusiness> yelpcollect(JSONArray jarr) throws JSONException, Exception{
		ArrayList<YelpBusiness> arr = new ArrayList<YelpBusiness>();
		for(int i=0; i<jarr.length(); i++){
			YelpBusiness yb= new YelpBusiness();
			JSONObject obj = new JSONObject(getbusinesses(jarr.getString(i).toString()));
			yb.mJObject = obj;
			yb.mBussinessID = yb.new BusinessID(obj.getString("id"), yb);
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
			arr.add(yb);
		}
		return arr;
	}
}
