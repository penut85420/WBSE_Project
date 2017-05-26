package yelp.wbse.model;

import org.json.*;

public class YelpLocation {
	String mAddr1, mAddr2, mAddr3;
	String mCity, mZipCode, mCountry, mState, mDisplayAddress;

	public YelpLocation(JSONObject obj) {
		try {
			mAddr1 = obj.optString("address1", "");
			mAddr2 = obj.optString("address2", "");
			mAddr3 = obj.optString("address3", "");
			mCity = obj.getString("city");
			mZipCode = obj.getString("zip_code");
			mCountry = obj.getString("country");
			mState = obj.getString("state");
			JSONArray arr = obj.getJSONArray("display_address");
			mDisplayAddress = "";
			for (int i = 0; i < arr.length(); i++)
				mDisplayAddress += arr.getString(i) + "\n";
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}
	
	public String getAddr1() { return mAddr1; }
	public String getAddr2() { return mAddr2; }
	public String getAddr3() { return mAddr3; }
	public String getCity() { return mCity; }
	public String getZipCode() { return mZipCode; }
	public String getCountry() { return mCountry; }
	public String getState() { return mState; }
	public String getDisplayAddress() { return mDisplayAddress; }
}
