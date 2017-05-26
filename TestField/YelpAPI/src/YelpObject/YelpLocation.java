package YelpObject;

import org.json.*;

public class YelpLocation {
	String mAddr1;
	String mAddr2;
	String mAddr3;
	String mCity;
	String mZipCode;
	String mCountry;
	String mState;
	String mDisplayAddress;
	
	public YelpLocation(JSONObject obj) {
		try {
			if (obj.get("address1") == null) mAddr1 = "";
			else mAddr1 = obj.getString("address1");
			if (obj.get("address2") == null) mAddr2 = "";
			else mAddr2 = obj.getString("address2");
			if (obj.get("address3") == null) mAddr3 = "";
			else mAddr3 = obj.getString("address3");
			mCity = obj.getString("city");
			mZipCode = obj.getString("zip_code");
			mCountry = obj.getString("country");
			mState = obj.getString("state");
			JSONArray arr = obj.getJSONArray("display_address");
			mDisplayAddress = "";
			for (int i = 0; i < arr.length(); i++)
				mDisplayAddress += arr.getString(i) + "\n";
		} catch (JSONException e) {
			
		}
	}
}
